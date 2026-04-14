import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// Configuración de la base de datos
const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "world",
  password: "123456", // <--- PON TU CLAVE AQUÍ
  port: 5432,
});

db.connect();

let quiz = [];
let currentQuestion = {};
let totalCorrect = 0;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// Carga inicial de datos
db.query("SELECT * FROM flags", (err, res) => {
  if (err) {
    console.error("Error al cargar datos:", err.stack);
  } else {
    quiz = res.rows;
    console.log(`¡Éxito! Base de datos cargada con ${quiz.length} países.`);
  }
});

function nextQuestion() {
  const randomCountry = quiz[Math.floor(Math.random() * quiz.length)];
  currentQuestion = randomCountry;
}

app.get("/", (req, res) => {
  totalCorrect = 0;
  if (quiz.length > 0) {
    nextQuestion();
    res.render("index.ejs", { 
      question: currentQuestion, 
      totalScore: totalCorrect 
    });
  } else {
    res.send("Cargando base de datos... Por favor refresca en 5 segundos.");
  }
});

app.post("/submit", (req, res) => {
  let answer = req.body.answer.trim();
  let isCorrect = false;

  // Validación ignorando mayúsculas/minúsculas
  if (currentQuestion.name.toLowerCase() === answer.toLowerCase()) {
    totalCorrect++;
    isCorrect = true;
  }

  nextQuestion();
  res.render("index.ejs", {
    question: currentQuestion,
    wasCorrect: isCorrect,
    totalScore: totalCorrect,
  });
});

app.listen(port, () => {
  console.log(`Servidor activo en http://localhost:${port}`);
});