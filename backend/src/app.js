require('dotenv').config();
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');

const routes = require('./routes');

const app = express();

// Middlewares globales
app.use(cors());
app.use(helmet());
app.use(express.json());

// Rutas API bajo /api
//app.use('/api', routes);

// Middleware manejo errores (simplificado)
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: "Error interno del servidor" });
});

module.exports = app;
