import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import dotenv from "dotenv";

// 1. Configuración de variables de entorno (Solo una vez)
dotenv.config();

const app = express();
const port = 3000;

// 2. Configuración de la base de datos usando tu .env
const db = new pg.Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

db.connect()
  .then(() => console.log("✅ Conexión exitosa a la base de datos"))
  .catch((err) => console.error("❌ Error de conexión", err.stack));

// Middlewares
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let quiz = [];
let totalScore = 0;
let currentQuestion = {};

// 3. Carga inicial de datos
db.query("SELECT * FROM flags", (err, res) => {
  if (err) {
    console.error("Error al cargar banderas:", err.stack);
  } else {
    quiz = res.rows;
    console.log("🚩 Banderas cargadas correctamente.");
  }
});

// Función para obtener una pregunta aleatoria
function nextQuestion() {
  const randomIndex = Math.floor(Math.random() * quiz.length);
  currentQuestion = quiz[randomIndex];
}

// 4. RUTA PRINCIPAL (GET)
app.get("/", (req, res) => {
  totalScore = 0; // Reiniciamos puntaje al empezar
  nextQuestion();
  console.log(currentQuestion);
  res.render("index.ejs", { 
    question: currentQuestion, 
    totalScore: totalScore 
  });
});

// 5. RUTA DE ENVÍO (POST)
app.post("/submit", (req, res) => {
  let answer = req.body.answer.trim();
  let isCorrect = false;

  if (currentQuestion.name.toLowerCase() === answer.toLowerCase()) {
    totalScore++;
    isCorrect = true;
  }

  nextQuestion();

  // Renderizamos con todas las variables necesarias
  res.render("index.ejs", {
    question: currentQuestion,
    wasCorrect: isCorrect,
    totalScore: totalScore,
  });
});

// 6. Encendido del servidor
app.listen(port, () => {
  console.log(`🚀 Servidor activo en http://localhost:${port}`);
});