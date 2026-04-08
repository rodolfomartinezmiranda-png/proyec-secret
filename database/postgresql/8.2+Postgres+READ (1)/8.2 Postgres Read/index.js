import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "world",
  password: "123456",
  port: 5432,
});
db.connect();

let totalCorrect = 0;
let currentQuestion = {};

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

async function getNextQuestion() {
  // Traemos un país al azar de tu tabla flags
  const res = await db.query("SELECT * FROM flags ORDER BY RANDOM() LIMIT 1");
  const question = res.rows[0];
  
  if (question) {
    // IMPORTANTE: Aquí corregimos el error. 
    // Forzamos a que el código de la bandera no tenga espacios y sea minúscula.
    question.flag = question.flag.trim().toLowerCase();
  }
  return question;
}

app.get("/", async (req, res) => {
  totalCorrect = 0;
  currentQuestion = await getNextQuestion();
  res.render("index.ejs", { question: currentQuestion, score: totalCorrect });
});

app.post("/submit", async (req, res) => {
  let answer = req.body.answer || "";
  
  if (currentQuestion && currentQuestion.name.toLowerCase() === answer.trim().toLowerCase()) {
    totalCorrect++;
  }
  
  currentQuestion = await getNextQuestion();
  res.render("index.ejs", { question: currentQuestion, score: totalCorrect });
});

app.listen(port, () => {
  console.log(`🚀 Servidor listo en http://localhost:${port}`);
});