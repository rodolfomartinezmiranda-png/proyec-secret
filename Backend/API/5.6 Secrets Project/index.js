import express from "express";
import axios from "axios";
import bodyParser from "body-parser";

const app = express();
const port = 3000;
const API_URL = "https://secrets-api.appbrewery.com";

// Middlewares
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// Función auxiliar para renderizar siempre con datos (evita el error de "not defined")
function renderPage(res, data = { secret: "Esperando...", username: "Usuario" }) {
  res.render("index.ejs", { 
    secret: data.secret || data.content || "Sin secreto", 
    user: data.username || "Anónimo" 
  });
}

// --- RUTAS ---

// 1. Carga inicial
app.get("/", (req, res) => {
  renderPage(res, { secret: "Presiona un botón para empezar", username: "Bienvenido" });
});

// 2. Obtener secreto (GET)
app.post("/get-secret", async (req, res) => {
  const searchId = req.body.id;
  try {
    const result = await axios.get(`${API_URL}/secrets/${searchId}`);
    renderPage(res, result.data);
  } catch (error) {
    renderPage(res, { secret: "ID no encontrado", username: "Error" });
  }
});

// 3. Crear (POST)
app.post("/post-secret", async (req, res) => {
  try {
    const result = await axios.post(`${API_URL}/secrets`, req.body);
    renderPage(res, result.data);
  } catch (error) {
    renderPage(res, { secret: "Error al crear", username: "Error" });
  }
});

// 4. Actualizar (PUT/PATCH) - Usando POST por el formulario
app.post("/put-secret", async (req, res) => {
  const searchId = req.body.id;
  try {
    const result = await axios.put(`${API_URL}/secrets/${searchId}`, req.body);
    renderPage(res, result.data);
  } catch (error) {
    renderPage(res, { secret: "Error al actualizar", username: "Error" });
  }
});

// 5. Borrar (DELETE)
app.post("/delete-secret", async (req, res) => {
  const searchId = req.body.id;
  try {
    await axios.delete(`${API_URL}/secrets/${searchId}`);
    renderPage(res, { secret: "Secreto eliminado con éxito", username: "Sistema" });
  } catch (error) {
    renderPage(res, { secret: "Error al eliminar", username: "Error" });
  }
});

app.listen(port, () => {
  console.log(`Servidor listo en http://localhost:${port}`);
});



// HINTS:
// 1. Import express and axios

// 2. Create an express app and set the port number.

// 3. Use the public folder for static files.

// 4. When the user goes to the home page it should render the index.ejs file.

// 5. Use axios to get a random secret and pass it to index.ejs to display the
// secret and the username of the secret.

// 6. Listen on your predefined port and start the server.
