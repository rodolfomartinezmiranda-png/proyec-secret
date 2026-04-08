import express from "express";

const app = express();
const port = 3000;

// IMPORTANTE: Middleware para leer JSON (sin esto POST y PUT no funcionan)
app.use(express.json());

/* =====================
   GET
===================== */

// Ruta principal
app.get("/", (req, res) => {
  res.send("<h1>Hello Maravilloso Genio</h1>");
});

// Obtener todos los usuarios (ejemplo)
app.get("/users", (req, res) => {
  res.json([
    { id: 1, name: "Angela" },
    { id: 2, name: "Juan" }
  ]);
});


/* =====================
   POST
===================== */

// Crear usuario
app.post("/users", (req, res) => {
  const newUser = req.body;

  console.log("Datos recibidos:", newUser);

  res.status(201).json({
    message: "Usuario creado correctamente",
    user: newUser
  });
});


/* =====================
   PUT
===================== */

// Actualizar usuario
app.put("/users/:id", (req, res) => {
  const id = req.params.id;
  const updatedData = req.body;

  res.json({
    message: `Usuario ${id} actualizado`,
    newData: updatedData
  });
});


/* =====================
   DELETE
===================== */

app.delete("/users/:id", (req, res) => {
  const id = req.params.id;

  res.json({
    message: `Usuario ${id} eliminado`
  });
});


/* =====================
   SERVER
===================== */

app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});