import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// Configuración de la base de datos ajustada a tu servidor Postgres-WSL
const db = new pg.Client({
  user: "arquimagic26", // El usuario que aparece en tu pgAdmin
  host: "localhost",    // "localhost" funciona porque el código y la DB están ambos en WSL
  database: "world",    // Asegúrate de haber restaurado la tabla 'capitals' aquí
  password: "198726", // Reemplaza con la contraseña de tu usuario en Postgres
  port: 5432,
});

db.connect();

let quiz = [];

// Cargar los datos de la base de datos al iniciar
db.query("SELECT * FROM capitals", (err, res) => {
  if (err) {
    console.error("Error al ejecutar la consulta", err.stack);
  } else {
    quiz = res.rows;
  }
  // No cerramos la conexión aquí para poder seguir consultando después
});

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let totalCorrect = 0;

// Configuración de la lógica del juego
app.get("/", async (req, res) => {
  totalCorrect = 0;
  await nextQuestion();
  console.log(currentQuestion);
  res.render("index.ejs", { question: currentQuestion });
});

let currentQuestion = {};

async function nextQuestion() {
  const randomCountry = quiz[Math.floor(Math.random() * quiz.length)];
  currentQuestion = randomCountry;
}

app.post("/submit", (req, res) => {
  let answer = req.body.answer.trim();
  let isCorrect = false;
  if (currentQuestion.capital.toLowerCase() === answer.toLowerCase()) {
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
  console.log(`Servidor corriendo en http://localhost:${port}`);
});