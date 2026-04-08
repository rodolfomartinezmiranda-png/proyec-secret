import express from "express";
import bodyParser from "body-parser";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));

let isAuthorized = false;

// Ruta principal
app.get("/", (req, res) => {
  if (isAuthorized) {
    res.sendFile(__dirname + "/secret.html");
  } else {
    res.sendFile(__dirname + "/index.html");
  }
});

// Verificar password
app.post("/check", (req, res) => {
  const password = req.body.password;

  if (password === "ILoveProgramming") {
    isAuthorized = true;
  } else {
    isAuthorized = false;
  }

  res.redirect("/");
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});