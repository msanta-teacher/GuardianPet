import { Router } from 'express';
import userRoutes from '../src/modules/usuario/userRoutes.js';
import clinicaRoutes from '../src/modules/clinica/clinicaRoutes.js';
import enfermedadRoutes from '../src/modules/enfermedad/enfermedadRoutes.js';
import historialRoutes from '../src/modules/historial-clinico/historialRoutes.js';
import mascotaRoutes from '../src/modules/mascota/mascotaRoutes.js';
import operacionRoutes from '../src/modules/operacion/operacionRoutes.js';
import tratamientoRoutes from '../src/modules/tratamiento/tratamientoRoutes.js';
import vacunaRoutes from '../src/modules/vacuna/vacunaRoutes.js';
import veterinarioRoutes from '../src/modules/veterinario/veterinarioRoutes.js';


const router = Router();


router.use('/usuarios', userRoutes);
router.use('/clinicas', clinicaRoutes);
router.use('/enfermedades', enfermedadRoutes);
router.use('/historial', historialRoutes);
router.use('/mascotas', mascotaRoutes);
router.use('/operaciones', operacionRoutes);
router.use('/tratamientos', tratamientoRoutes);
router.use('/vacunas', vacunaRoutes);
router.use('/veterinarios', veterinarioRoutes);


export default router;