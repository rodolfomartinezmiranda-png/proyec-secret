import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// Configuración de la base de datos (Postgres en WSL)
import 'dotenv/config'; // Esto carga las variables al inicio

// ... luego en la configuración de la DB:
const db = new pg.Client({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});

// --- MIDDLEWARE ---
// CRUCIAL: Esto permite que 'req.body' capture los datos del formulario
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.set("view engine", "ejs");

// --- RUTAS ---

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
  // 1. Extraemos los datos del formulario
  const email = req.body.username; // Verifica si en tu EJS el name es "username" o "email"
  const password = req.body.password;

  try {
    // 2. Verificamos si el usuario ya existe
    const checkResult = await db.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    if (checkResult.rows.length > 0) {
      res.send("El correo ya está registrado. Intenta iniciar sesión.");
    } else {
      // 3. Insertamos el nuevo usuario
      // Usamos RETURNING * para que la DB nos devuelva el registro creado
      const result = await db.query(
        "INSERT INTO users (email, password) VALUES ($1, $2) RETURNING *",
        [email, password]
      );

      console.log("Usuario registrado con éxito:", result.rows[0]);
      res.render("secrets.ejs");
    }
  } catch (err) {
    console.error("Error detallado en el registro:", err);
    res.status(500).send("Ocurrió un error en el servidor.");
  }
});

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});