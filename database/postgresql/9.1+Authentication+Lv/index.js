import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// Configuración de la base de datos
const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "secrets",
  password: "123456",
  port: 5432,
});

db.connect()
  .then(() => console.log("✅ Conectado a PostgreSQL exitosamente."))
  .catch((err) => console.error("❌ Error de conexión:", err.stack));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// --- RUTAS GET ---
app.get("/", (req, res) => { res.render("home.ejs"); });
app.get("/login", (req, res) => { res.render("login.ejs"); });
app.get("/register", (req, res) => { res.render("register.ejs"); });

// --- RUTA DE REGISTRO ---
app.post("/register", async (req, res) => {
  const email = req.body.username;
  const password = req.body.password;

  try {
    await db.query(
      "INSERT INTO users (email, password) VALUES ($1, $2)",
      [email, password]
    );
    res.render("secrets.ejs");
  } catch (err) {
    if (err.code === "23505") { // Email ya registrado
      res.send("<h1>El correo ya existe.</h1><a href='/login'>Inicia sesión aquí</a>");
    } else {
      console.log("Error en registro:", err.message);
      res.send("Error al registrar el usuario.");
    }
  }
});

// --- RUTA DE LOGIN ---
app.post("/login", async (req, res) => {
  const email = req.body.username;
  const loginPassword = req.body.password;

  try {
    const result = await db.query("SELECT * FROM users WHERE email = $1", [email]);
    if (result.rows.length > 0) {
      const user = result.rows[0];
      if (user.password === loginPassword) {
        res.render("secrets.ejs");
      } else {
        res.send("<h1>Contraseña incorrecta.</h1><a href='/login'>Reintentar</a>");
      }
    } else {
      res.send("<h1>Usuario no encontrado.</h1><a href='/register'>Regístrate aquí</a>");
    }
  } catch (err) {
    console.log("Error en login:", err.message);
    res.send("Error en el servidor.");
  }
});

// Cierre correcto de la función listen
app.listen(port, () => {
  console.log(`🚀 Servidor corriendo en http://localhost:${port}`);
});