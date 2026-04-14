require('dotenv').config();
import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// Configuración de la conexión (Asegúrate que estos datos sean los tuyos)
const db = new pg.Client({
  user: "postgres",
  host: "127.0.0.1",
  database: "world",
  password: "123456", 
  port: 5432,
});
db.connect();

let totalCorrect = 0;
let currentQuestion = {};

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// ESTA ES LA CLAVE: Aquí le pedimos a la DB un país al azar
async function nextQuestion() {
  try {
    const res = await db.query("SELECT * FROM capitals ORDER BY RANDOM() LIMIT 1");
    currentQuestion = res.rows[0]; 
  } catch (err) {
    console.error("Error al traer datos de la DB:", err);
  }
}

app.get("/", async (req, res) => {
  totalCorrect = 0;
  await nextQuestion();
  res.render("index.ejs", { question: currentQuestion });
});

app.post("/submit", async (req, res) => {
  let answer = req.body.answer.trim();
  let isCorrect = false;

  if (currentQuestion.capital.toLowerCase() === answer.toLowerCase()) {
    totalCorrect++;
    isCorrect = true;
  }

  await nextQuestion();
  res.render("index.ejs", {
    question: currentQuestion,
    wasCorrect: isCorrect,
    totalScore: totalCorrect,
  });
});

app.listen(port, () => {
  console.log(`Servidor en http://localhost:${port}`);
});