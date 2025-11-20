-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2025 a las 03:42:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guardianpet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario_id_fk` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `veterinario_id_fk` int(11) NOT NULL,
  `observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinica`
--

CREATE TABLE `clinica` (
  `id` int(11) NOT NULL,
  `tienda` varchar(255) NOT NULL,
  `dirección` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_enfermedad`
--

CREATE TABLE `det_enfermedad` (
  `id` int(11) NOT NULL,
  `historial_clinico_id_fk` int(11) NOT NULL,
  `enfermedad_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_operacion`
--

CREATE TABLE `det_operacion` (
  `id` int(11) NOT NULL,
  `historial_clinico_id_fk` int(11) NOT NULL,
  `operacion_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_vacuna`
--

CREATE TABLE `det_vacuna` (
  `id` int(11) NOT NULL,
  `historial_clinico_id_fk` int(11) NOT NULL,
  `vacuna_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `descripción` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` text NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `url_archivos` varchar(255) DEFAULT NULL,
  `veterinario_id_fk` int(11) NOT NULL,
  `mascota_id_fk` int(11) NOT NULL,
  `cita_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raza` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `usuario_id_fk` int(11) NOT NULL,
  `url_foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripción` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_fin` int(11) NOT NULL,
  `descripción` text NOT NULL,
  `enfermedad_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna`
--

CREATE TABLE `vacuna` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripción` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `id` int(11) NOT NULL,
  `nombre` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `matricula` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id_fk`),
  ADD UNIQUE KEY `usuario_id_fk` (`usuario_id_fk`),
  ADD UNIQUE KEY `veterinario_id_fk` (`veterinario_id_fk`);

--
-- Indices de la tabla `clinica`
--
ALTER TABLE `clinica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `det_enfermedad`
--
ALTER TABLE `det_enfermedad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `historial_clinico_id_fk` (`historial_clinico_id_fk`),
  ADD UNIQUE KEY `enfermedad_id_fk` (`enfermedad_id_fk`);

--
-- Indices de la tabla `det_operacion`
--
ALTER TABLE `det_operacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `historial_clinico_id_fk` (`historial_clinico_id_fk`),
  ADD UNIQUE KEY `operacion_id_fk` (`operacion_id_fk`);

--
-- Indices de la tabla `det_vacuna`
--
ALTER TABLE `det_vacuna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `historial_clinico_id_fk` (`historial_clinico_id_fk`),
  ADD UNIQUE KEY `vacuna_id_fk` (`vacuna_id_fk`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `veterinario_id_fk` (`veterinario_id_fk`),
  ADD UNIQUE KEY `mascota_id_fk` (`mascota_id_fk`),
  ADD UNIQUE KEY `cita_id_fk` (`cita_id_fk`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id_fk` (`usuario_id_fk`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enfermedad_id_fk` (`enfermedad_id_fk`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clinica`
--
ALTER TABLE `clinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`veterinario_id_fk`) REFERENCES `veterinario` (`id`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `det_enfermedad`
--
ALTER TABLE `det_enfermedad`
  ADD CONSTRAINT `det_enfermedad_ibfk_1` FOREIGN KEY (`historial_clinico_id_fk`) REFERENCES `historial_clinico` (`id`),
  ADD CONSTRAINT `det_enfermedad_ibfk_2` FOREIGN KEY (`enfermedad_id_fk`) REFERENCES `enfermedad` (`id`);

--
-- Filtros para la tabla `det_operacion`
--
ALTER TABLE `det_operacion`
  ADD CONSTRAINT `det_operacion_ibfk_1` FOREIGN KEY (`historial_clinico_id_fk`) REFERENCES `historial_clinico` (`id`),
  ADD CONSTRAINT `det_operacion_ibfk_2` FOREIGN KEY (`operacion_id_fk`) REFERENCES `operacion` (`id`);

--
-- Filtros para la tabla `det_vacuna`
--
ALTER TABLE `det_vacuna`
  ADD CONSTRAINT `det_vacuna_ibfk_1` FOREIGN KEY (`historial_clinico_id_fk`) REFERENCES `historial_clinico` (`id`),
  ADD CONSTRAINT `det_vacuna_ibfk_2` FOREIGN KEY (`vacuna_id_fk`) REFERENCES `vacuna` (`id`);

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`veterinario_id_fk`) REFERENCES `veterinario` (`id`),
  ADD CONSTRAINT `historial_clinico_ibfk_2` FOREIGN KEY (`mascota_id_fk`) REFERENCES `mascota` (`id`),
  ADD CONSTRAINT `historial_clinico_ibfk_3` FOREIGN KEY (`cita_id_fk`) REFERENCES `cita` (`id`);

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`usuario_id_fk`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
