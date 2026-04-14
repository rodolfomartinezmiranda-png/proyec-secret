import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import dotenv from "dotenv";
import { dirname, join } from "path";
import { fileURLToPath } from "url";

// Configuración de rutas absolutas robusta
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

dotenv.config();

const app = express();
const port = 3000;

const db = new pg.Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

db.connect()
  .then(() => console.log("✅ Conexión a DB exitosa"))
  .catch((err) => console.error("❌ Error DB:", err.stack));

// --- CONFIGURACIÓN CRÍTICA DE VISTAS ---
app.set("view engine", "ejs");
// Usamos join para construir la ruta sin importar los espacios del nombre de la carpeta
app.set("views", join(__dirname, "views")); 

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(join(__dirname, "public")));

let totalScore = 0;

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
  const email = req.body.username;
  const password = req.body.password;
  try {
    const checkResult = await db.query("SELECT * FROM users WHERE email = $1", [email]);
    if (checkResult.rows.length > 0) {
      res.send("El correo ya existe.");
    } else {
      await db.query("INSERT INTO users (email, password) VALUES ($1, $2)", [email, password]);
      res.redirect("/quiz");
    }
  } catch (err) {
    res.status(500).send("Error en registro");
  }
});

app.post("/login", async (req, res) => {
  const email = req.body.username;
  const loginPassword = req.body.password;
  try {
    const result = await db.query("SELECT * FROM users WHERE email = $1", [email]);
    if (result.rows.length > 0) {
      if (loginPassword === result.rows[0].password) {
        res.redirect("/quiz");
      } else {
        res.send("Contraseña incorrecta");
      }
    } else {
      res.send("Usuario no encontrado");
    }
  } catch (err) {
    res.status(500).send("Error en login");
  }
});

app.get("/quiz", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM capitals ORDER BY RANDOM() LIMIT 1");
    res.render("index.ejs", { 
      country: result.rows[0].country,
      score: totalScore 
    });
  } catch (err) {
    res.status(500).send("Error al cargar juego");
  }
});

app.post("/submit", async (req, res) => {
  const answer = req.body.answer.trim();
  const country = req.body.country;
  try {
    const result = await db.query("SELECT capital FROM capitals WHERE country = $1", [country]);
    if (answer.toLowerCase() === result.rows[0].capital.toLowerCase()) {
      totalScore++;
      res.redirect("/quiz");
    } else {
      const correct = result.rows[0].capital;
      totalScore = 0;
      res.render("index.ejs", { country, score: 0, error: `¡Mal! Era ${correct}` });
    }
  } catch (err) {
    res.redirect("/quiz");
  }
});

app.listen(port, () => {
  console.log(`🚀 Servidor en http://localhost:${port}`);
});