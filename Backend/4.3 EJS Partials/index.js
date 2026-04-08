import express from "express";
import bodyParser from "body-parser";

const app = express();
const port = 3000;

// Middleware para procesar los datos del formulario (necesario para req.body)
app.use(bodyParser.urlencoded({ extended: true }));

// Ruta GET: Carga la página inicial por primera vez
app.get("/", (req, res) => {
  res.render("index.ejs");
});

// Ruta POST: Se activa cuando el usuario hace clic en el botón "OK"
app.post("/submit", (req, res) => {
  // 1. Obtenemos la longitud del nombre y el apellido desde el cuerpo de la petición (req.body)
  // Asegúrate de que en tu index.ejs los inputs tengan name="fName" y name="lName"
  const numLetters = req.body["fName"].length + req.body["lName"].length;

  // 2. Volvemos a renderizar la misma página, pero le pasamos el resultado del conteo
  res.render("index.ejs", { 
    numberOfLetters: numLetters 
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
/* Write your code here:
Step 1: Render the home page "/" index.ejs
Step 2: Make sure that static files are linked to and the CSS shows up.
Step 3: Add the routes to handle the render of the about and contact pages.
  Hint: Check the nav bar in the header.ejs to see the button hrefs
Step 4: Add the partials to the about and contact pages to show the header and footer on those pages. */
