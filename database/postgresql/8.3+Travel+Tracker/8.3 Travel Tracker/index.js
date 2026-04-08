import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "world",
  password: "admin123", // Tu contraseña de Postgres
  port: 5432,
});
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// VITAL: Configura EJS como motor de vistas
app.set("view engine", "ejs");

let currentUserId = 3; // ID de Rodolfo

async function checkVisited() {
  const result = await db.query(
    "SELECT country_code, color FROM visited_countries JOIN users ON users.id = visited_countries.user_id"
  );
  return result.rows.map(row => ({ code: row.country_code, color: row.color }));
}

app.get("/", async (req, res) => {
  try {
    const countries = await checkVisited();
    const usersResult = await db.query("SELECT * FROM users");
    const currentUser = usersResult.rows.find((user) => user.id == currentUserId);

    res.render("index.ejs", {
      countries: countries,
      total: countries.length,
      users: usersResult.rows,
      color: currentUser ? currentUser.color : "yellow",
    });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error interno del servidor");
  }
});

app.post("/add", async (req, res) => {
  const input = req.body["country"];
  try {
    const result = await db.query(
      "SELECT country_code FROM countries WHERE LOWER(country_name) LIKE '%' || $1 || '%';",
      [input.toLowerCase()]
    );
    const countryCode = result.rows[0].country_code;
    await db.query(
      "INSERT INTO visited_countries (country_code, user_id) VALUES ($1, $2)",
      [countryCode, currentUserId]
    );
    res.redirect("/");
  } catch (err) {
    console.log("País no encontrado");
    res.redirect("/");
  }
});

app.post("/user", async (req, res) => {
  if (req.body.user) {
    currentUserId = req.body.user;
    res.redirect("/");
  }
});

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});