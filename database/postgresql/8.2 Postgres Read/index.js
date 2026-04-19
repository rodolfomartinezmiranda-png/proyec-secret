import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import dotenv from "dotenv";

// 1. Configuración de variables de entorno (Debe ir al principio)
dotenv.config();

const app = express();
const port = 3000;

// 2. Configuración de la conexión a PostgreSQL
// Asegúrate de que tu archivo .env tenga los nombres correctos
const db = new pg.Client({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});

db.connect()
  .then(() => console.log("Conexión exitosa a la base de datos ✅"))
  .catch((err) => console.error("Error de conexión ❌", err.stack));

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let quiz = [];
let totalScore = 0; // Variable global para el puntaje
let currentQuestion = {};

// 3. Carga inicial de datos
db.query("SELECT * FROM flags", (err, res) => {
  if (err) {
    console.error("Error al cargar banderas:", err.stack);
  } else {
    quiz = res.rows;
    console.log("Banderas cargadas correctamente.");
  }
});

// Función para obtener una pregunta aleatoria
function nextQuestion() {
  const randomIndex = Math.floor(Math.random() * quiz.length);
  currentQuestion = quiz[randomIndex];
}

// RUTA PRINCIPAL (GET)
app.get("/", (req, res) => {
  totalScore = 0; // Reiniciamos al empezar de nuevo
  nextQuestion();
  
  // Enviamos totalScore para evitar el error "is not defined" en EJS
  res.render("index.ejs", { 
    question: currentQuestion,
    totalScore: totalScore 
  });
});

// RUTA DE ENVÍO (POST)
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

app.listen(port, () => {
  console.log(`Servidor activo en http://localhost:${port} 🚀`);
});