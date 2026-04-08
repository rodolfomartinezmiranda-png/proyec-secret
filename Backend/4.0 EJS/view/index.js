import express from "express";

const app = express();
const port = 3000;

app.get("/", (req, res) => {
  // 1. Obtenemos la fecha actual
  const today = new Date();
  // 2. Obtenemos el número del día (0-6, donde 0 es Domingo y 6 es Sábado)
  const day = today.getDay();

  // Variables por defecto
  let type = "a weekday";
  let adv = "it's time to work hard";

  // 3. Lógica para determinar si es fin de semana
  if (day === 0 || day === 6) {
    type = "the weekend";
    adv = "it's time to have some fun";
  }

  // 4. Renderizamos el archivo EJS y pasamos las variables
  res.render("solution.ejs", {
    dayType: type,
    advice: adv,
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}.`);
});