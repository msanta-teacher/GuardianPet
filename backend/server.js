import dotenv from 'dotenv';
dotenv.config();
import { createServer } from 'http';
import app from './utils/app.js';


const port = process.env.PORT || 4000;
createServer(app).listen(port, () => {
console.log(`[guardianpet] API escuchando en http://localhost:${port}`);
});