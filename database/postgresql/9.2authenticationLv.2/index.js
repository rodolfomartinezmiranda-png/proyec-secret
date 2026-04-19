import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import bcrypt from "bcrypt"; // Asegúrate de haber hecho: npm install bcrypt

const app = express();
const port = 3000;
const saltRounds = 10;

// Configuración de la DB
const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "secrets",
  password: "1234", // <-- CAMBIA ESTO POR TU CLAVE DE PGADMIN
  port: 5432,
});
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.render("home.ejs");
});

app.get("/login", (req, res) => {
  res.render("login.ejs");
});

app.get("/register", (req, res) => {
  res.render("register.ejs");
});

app.post("/register", async (req, res) => {
  const email = req.body.username;
  const password = req.body.password;

  try {
    const checkResult = await db.query("SELECT * FROM users WHERE email = $1", [email]);

    if (checkResult.rows.length > 0) {
      res.send("Email already exists. Try logging in.");
    } else {
      // ENCRIPTACIÓN: Aquí ocurre la magia de seguridad
      bcrypt.hash(password, saltRounds, async (err, hash) => {
        if (err) {
          console.error("Error hashing password:", err);
        } else {
          const result = await db.query(
            "INSERT INTO users (email, password) VALUES ($1, $2) RETURNING *",
            [email, hash] // Guardamos el HASH, no la clave real
          );
          console.log("Usuario creado con hash:", result.rows[0]);
          res.render("secrets.ejs");
        }
      });
    }
  } catch (err) {
    console.log(err);
  }
});

app.post("/login", async (req, res) => {
  const email = req.body.username;
  const loginPassword = req.body.password;

  try {
    const result = await db.query("SELECT * FROM users WHERE email = $1", [email]);
    if (result.rows.length > 0) {
      const user = result.rows[0];
      const storedPassword = user.password;

      // COMPARACIÓN: Bcrypt compara la clave escrita con el hash de la DB
      bcrypt.compare(loginPassword, storedPassword, (err, isMatch) => {
        if (err) {
          console.error("Error comparing passwords:", err);
        } else {
          if (isMatch) {
            res.render("secrets.ejs");
          } else {
            res.send("Incorrect Password");
          }
        }
      });
    } else {
      res.send("User not found");
    }
  } catch (err) {
    console.log(err);
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});