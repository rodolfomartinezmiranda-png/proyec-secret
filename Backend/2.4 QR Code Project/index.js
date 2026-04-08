import inquirer from "inquirer";
import qr from "qr-image";
import fs from "fs";

inquirer
  .prompt([
    {
      type: "input",
      name: "url",
      message: "Enter a URL:",
    },
  ])
  .then((answers) => {
    const url = answers.url;

    // Generar QR
    const qr_svg = qr.image(url, { type: "png" });
    qr_svg.pipe(fs.createWriteStream("qr_img.png"));

    // Guardar URL en archivo
    fs.writeFile("URL.txt", url, (err) => {
      if (err) throw err;
      console.log("QR generado correctamente ✅");
      console.log("URL guardada correctamente ✅");
    });
  })
  .catch((error) => {
    console.error(error);
  });