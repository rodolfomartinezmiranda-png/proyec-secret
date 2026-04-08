// 1. Traemos la función específica para obtener un nombre al azar
import { randomSuperhero } from 'superheroes';

// 2. Usamos la función y guardamos el nombre en una cajita (variable)
const name = randomSuperhero();

// 3. ¡Lo mostramos en la pantalla!
console.log(`¡Hola! Mi nombre de superhéroe es: ${name}.`);