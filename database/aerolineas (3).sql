-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2022 a las 20:42:30
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aerolineas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id_destino` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id_destino`, `nombre`, `imagen`) VALUES
(1, 'Cancun ', '0'),
(2, 'Rio De Janeiro', '0'),
(3, 'Islas Maldivas', '0'),
(4, 'Paris', '0'),
(5, 'Bariloche', '0'),
(6, 'Berlin', '0'),
(7, 'Roma', '0'),
(8, 'Madrid', '0'),
(9, 'Amsterdam', '0'),
(10, 'Nueva York', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasaje`
--

CREATE TABLE `pasaje` (
  `id_pasaje` int(11) NOT NULL,
  `fecha` decimal(20,0) NOT NULL,
  `ida` varchar(50) NOT NULL,
  `vuelta` varchar(50) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `precio` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pasaje`
--

INSERT INTO `pasaje` (`id_pasaje`, `fecha`, `ida`, `vuelta`, `id_destino`, `precio`, `nombre`) VALUES
(1, '2022', 'Buenos Aires-Cancun', 'Cancun-Buenos Aires ', 1, 2000, 'Cancun'),
(2, '2022', 'Buenos Aires - Rio D', 'Rio De Janeiro - Bue', 2, 700, 'Rio De Janeiro'),
(3, '2022', 'Buenos Aires - Islas', 'Islas Maldivas - Bue', 3, 5300, 'Islas Maldivas'),
(4, '2023', 'Buenos Aires - Paris', 'Paris - Buenos Aires', 4, 3500, 'Paris'),
(5, '2022', 'Buenos Aires - Baril', 'Bariloche - Buenos A', 5, 250, 'Bariloche'),
(6, '2023', 'Buenos Aires - Berli', 'Berlin - Buenos Aire', 6, 3500, 'Berlin'),
(7, '2023', 'Buenos Aires - Roma', 'Roma - Buenos Aires', 7, 3000, 'Roma'),
(8, '2023', 'Buenos Aires - Madri', 'Madrid - Buenos Aire', 8, 3750, 'Madrid'),
(9, '2023', 'Buenos Aires - Amste', 'Amsterdam - Buenos A', 9, 2960, 'Amsterdam'),
(10, '2022', 'Buenos Aires - Nueva', 'Nueva York - Buenos ', 10, 2430, 'Nueva York');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajesapi`
--

CREATE TABLE `pasajesapi` (
  `id_pasajeapi` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `ida` varchar(50) NOT NULL,
  `vuelta` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clase` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id_usuario`, `nombre`, `email`, `clave`) VALUES
(1, '', 'tomiich22@gmail.com', '$2y$10$EILz'),
(2, '', 'ferna29@hotmail.com', '$2y$10$b2OH'),
(3, '', 'tomiich22@gmail.com', '$2y$10$pTDj'),
(17, '', 'mununa@gmail.com', '$2y$10$dhoj'),
(18, '', 'luto@gmail.com', '$2y$10$S7yv'),
(19, '', 'ferna29@hotmail.com', '$2y$10$k1s9'),
(20, '', 'tomych10@hotmail.com', '$2y$10$UlGR'),
(21, '', 'mununi@gmail.com', '$2y$10$3YS0lHNkKbsD0vQrcsUBYOnkPAPbjWpY.Im2cG5yEJhDHXQsPBXW.'),
(22, '', 'lu@gmail.com', '$2y$10$QqhQHrhd39d5ipaTNNR3iuvW2XweBVldFeyMaWvWOCGMo4.rdy7.K');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `ida` varchar(50) NOT NULL,
  `vuelta` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clase` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `fecha`, `ida`, `vuelta`, `precio`, `usuario`, `clase`) VALUES
(2, '2023-08-20', 'Buenos aires - New York', 'New York - Buenos aires', 2000, 'Rogelio', 'Alta'),
(3, '2023-02-20', 'Buenos Aires - Amste', 'Amsterdam - Buenos A', 3200, 'Franco', 'Baja'),
(6, '2023-01-01', 'Buenos aires - Cancu', 'Cancun - Buenos Aire', 2000, 'Esteban', 'Baja'),
(10, '2023-01-01', 'Buenos aires - Cancun', 'Cancun - Buenos Aires ', 2000, 'Tomas', 'Alta'),
(11, '2023-02-20', 'Buenos Aires - Rio de Janeiro', 'Rio De Janeiro - Buenos Aires ', 600, 'Lucas', 'Media');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id_destino`);

--
-- Indices de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD PRIMARY KEY (`id_pasaje`),
  ADD UNIQUE KEY `FK_id_destino` (`id_destino`);

--
-- Indices de la tabla `pasajesapi`
--
ALTER TABLE `pasajesapi`
  ADD PRIMARY KEY (`id_pasajeapi`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id_destino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  MODIFY `id_pasaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pasajesapi`
--
ALTER TABLE `pasajesapi`
  MODIFY `id_pasajeapi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD CONSTRAINT `pasaje_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
