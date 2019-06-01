-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2019 a las 21:55:13
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdhospedar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comodidades`
--

CREATE TABLE `comodidades` (
  `id_comodidades` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comodidades`
--

INSERT INTO `comodidades` (`id_comodidades`, `nombre`) VALUES
(1, 'cama'),
(2, 'comida'),
(3, 'sofa'),
(4, 'ducha'),
(5, 'tv'),
(6, 'terma'),
(7, 'Movilidad'),
(8, 'Silla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamentos` int(2) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamentos`, `nombre`) VALUES
(1, 'Lima'),
(2, 'Ayacucho'),
(3, 'Huancavelica'),
(4, 'Cuzco'),
(5, 'Ica'),
(6, 'Arequipa'),
(7, 'Junin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospedaje`
--

CREATE TABLE `hospedaje` (
  `id_hospedaje` int(8) NOT NULL,
  `id_usuario_host` int(8) NOT NULL,
  `fecha_estadia` date NOT NULL,
  `id_huesped` int(8) NOT NULL,
  `id_comodidades` int(8) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hospedaje`
--

INSERT INTO `hospedaje` (`id_hospedaje`, `id_usuario_host`, `fecha_estadia`, `id_huesped`, `id_comodidades`, `disponibilidad`) VALUES
(1, 1, '2019-06-27', 1, 123, 1),
(2, 1, '2019-06-26', 1, 234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(20) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `edad` int(3) NOT NULL,
  `phone` int(9) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_i` date NOT NULL,
  `fecha_f` date NOT NULL,
  `porque` varchar(300) NOT NULL,
  `valides` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `departamento`, `direccion`, `edad`, `phone`, `descripcion`, `fecha_i`, `fecha_f`, `porque`, `valides`) VALUES
(1, 'Mariana Gomez', 'Ayacucho', 'Av. 2 de mayo Ica', 23, 976583453, 'Sufro de cancer al pancreas mi tratamiento es delicado y especializado.En Ayacucho no hay centros especializados.', '2019-06-23', '2019-06-28', 'Soy una persona de bajos recursos y mis gastos medicos son caros', 1),
(2, 'Leonel Morales Canahualpa', 'Huancavelica', 'Av. Las Camelidas Psje.3 Smp,Lima', 65, 4874576, 'Tengo poliomilitis en grado degenerativo mi enfermedad es rara y se da en pocos casos.', '2019-06-25', '2019-06-28', 'Soy de una zona de extrema pobreza que no cuenta con equipos medicos para tratar mi enfermedad.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_host`
--

CREATE TABLE `usuario_host` (
  `id_usuario_host` int(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `dni` int(8) NOT NULL,
  `edad` int(3) NOT NULL,
  `phone` int(9) NOT NULL,
  `email` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `ayuda` varchar(100) NOT NULL,
  `tipo_hospedaje` varchar(100) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_host`
--

INSERT INTO `usuario_host` (`id_usuario_host`, `nombre`, `dni`, `edad`, `phone`, `email`, `direccion`, `ayuda`, `tipo_hospedaje`, `usuario`, `password`) VALUES
(1, 'Mariana Gomez', 70675647, 37, 996754763, 'mari.gomez@gmail.com', 'Av, Marisoles345 Huamanga Ayacucho', 'Tengo hospedaje', 'habitacion', 'mari123', 'user'),
(2, 'Jesus Gomez', 876564387, 67, 995487341, 'jesus23.go@hotmail.com', 'Calle . Pedro Remuzgo 237  Huancavlica', 'Tengo un albergue', 'casa', 'jesus23go', 'jesu1aA@');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comodidades`
--
ALTER TABLE `comodidades`
  ADD PRIMARY KEY (`id_comodidades`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamentos`);

--
-- Indices de la tabla `hospedaje`
--
ALTER TABLE `hospedaje`
  ADD PRIMARY KEY (`id_hospedaje`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario_host`
--
ALTER TABLE `usuario_host`
  ADD PRIMARY KEY (`id_usuario_host`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comodidades`
--
ALTER TABLE `comodidades`
  MODIFY `id_comodidades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamentos` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario_host`
--
ALTER TABLE `usuario_host`
  MODIFY `id_usuario_host` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
