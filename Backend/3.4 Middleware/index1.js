import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3000;

// Middleware para leer formularios
app.use(express.urlencoded({ extended: true }));

// Servir archivos estáticos
app.use(express.static("public"));

// Ruta POST
app.post("/submit", (req, res) => {
  console.log(req.body);

  const street = req.body.street;
  const pet = req.body.pet;

  res.send(`Your band name could be: ${street} ${pet}`);
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});