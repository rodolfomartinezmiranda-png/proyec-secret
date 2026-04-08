import express from "express";
import bodyParser from "body-parser";

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.render("index.ejs");
});

app.post("/submit", (req, res) => {
  // Sumamos la longitud del primer nombre y el apellido
  const numLetters = req.body["fName"].length + req.body["lName"].length;
  // Renderizamos de nuevo pasando el resultado
  res.render("index.ejs", { numberOfLetters: numLetters });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});