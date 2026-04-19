import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import dotenv from "dotenv";

// 1. Carga de variables de entorno
dotenv.config();

const app = express();
const port = 3000;

// 2. Configuración de la base de datos
const db = new pg.Client({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});

db.connect()
  .then(() => console.log("Conectado a la base de datos de Capitales ✅"))
  .catch((err) => console.error("Error de conexión ❌", err.stack));

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// Variables globales para el juego
let totalScore = 0; 
let currentQuestion = {};

// Función asíncrona para obtener un país al azar
async function nextQuestion() {
  try {
    const res = await db.query("SELECT * FROM capitals ORDER BY RANDOM() LIMIT 1");
    currentQuestion = res.rows[0];
  } catch (err) {
    console.error("Error al obtener datos de la DB:", err);
  }
}

// RUTA PRINCIPAL (GET)
app.get("/", async (req, res) => {
  totalScore = 0; // Reiniciamos el puntaje al empezar de nuevo
  await nextQuestion();
  
  // Enviamos totalScore para evitar el error "is not defined" en el EJS
  res.render("index.ejs", { 
    question: currentQuestion, 
    totalScore: totalScore 
  });
});

// RUTA DE ENVÍO DE RESPUESTA (POST)
app.post("/submit", async (req, res) => {
  let answer = req.body.answer ? req.body.answer.trim() : "";
  let isCorrect = false;

  // Validación de la respuesta
  if (currentQuestion && currentQuestion.capital.toLowerCase() === answer.toLowerCase()) {
    totalScore++; 
    isCorrect = true;
  }

  // Obtenemos la siguiente pregunta antes de renderizar
  await nextQuestion();

  // Renderizamos con todas las variables necesarias para que la página no falle
  res.render("index.ejs", {
    question: currentQuestion,
    wasCorrect: isCorrect,
    totalScore: totalScore,
  });
});

app.listen(port, () => {
  console.log(`Servidor de Capitales activo en http://localhost:${port} 🚀`);
});