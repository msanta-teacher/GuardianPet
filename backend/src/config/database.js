const mongoose = require('mongoose');
require('dotenv').config();

const mongoURI = process.env.DB_URI || 'mongodb://127.0.0.1:27017/guardianpet';

const connectDB = async () => {
  try {
    await mongoose.connect(mongoURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('Conexión a la base de datos MongoDB establecida');
  } catch (error) {
    console.error('Error al conectar a la base de datos:', error);
    process.exit(1); // Detiene la app si falla la conexión
  }
};

module.exports = connectDB;
