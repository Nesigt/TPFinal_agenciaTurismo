-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 19-12-2021 a las 18:53:13
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpfinal_agenciaturismo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IDCLIENTE` int(11) NOT NULL,
  `APELLIDO` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IDCLIENTE`, `APELLIDO`, `CELULAR`, `DIRECCION`, `DNI`, `EMAIL`, `FECHANAC`, `NACIONALIDAD`, `NOMBRE`) VALUES
(3, 'Mehring', '3496419430', 'direccion1', 43644112, 'gianmehring@gmail.com', '2001-07-20', 'Argentina', 'Gian Carlos'),
(1001, '2', '2', '2', 2, '2@2.2', '2021-12-25', '2', '2'),
(1051, 'ads', '123', '23', 23, 'asd@gmail.com', '2021-12-02', 'asd', 'ads'),
(1052, '1', '1', '1', 1, '1@1.1', '1111-11-11', '1', '1'),
(1053, '1', '1', '1', 11, '', '1111-11-11', '1212', '1'),
(1151, 'asd', '9', 'asd', 9, 'asd@gmail.com', '1999-09-09', 'asd', 'asd'),
(1351, 'prueba', '123', 'prueba', 436441121, 'prueba@prueba.prueba', '2001-07-20', 'Argentina', 'prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDEMPLEADO` int(11) NOT NULL,
  `APELLIDO` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CARGO` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `SUELDO` double DEFAULT NULL,
  `USUARIO_IDUSU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`IDEMPLEADO`, `APELLIDO`, `CARGO`, `CELULAR`, `DIRECCION`, `DNI`, `EMAIL`, `FECHANAC`, `NACIONALIDAD`, `NOMBRE`, `SUELDO`, `USUARIO_IDUSU`) VALUES
(2, 'Mehring', 'Futuro Tecnico Universitario en Tecnologias de la Informacion', '3496419430', 'direccion1', 43644112, 'gianmehring@gmail.com', '2001-07-20', 'Argentina', 'Gian Carlos', 0, 1),
(1202, 'asd', 'asd', '123', 'asd', 99999, 'asd@asd.asd', '1111-11-11', 'asd', 'asd', 123, 1201),
(1402, 'prueba', 'Futuro Técnico Universitario en Tecnologías de la Información', '3496419430', 'prueba', 436441121, 'prueba@prueba.prueba', '2001-07-20', 'Argentina', 'prueba', 123, 1401),
(1452, 'prueba2', 'prueba2', '123', 'prueba2', 44321, 'prueba2@prueba2.prueba2', '2000-02-11', 'prueba2', 'prueba2', 123, 1451);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `CODIGOPAQUETE` int(11) NOT NULL,
  `COSTOPAQUETE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`CODIGOPAQUETE`, `COSTOPAQUETE`) VALUES
(6, 2123),
(451, 4291),
(558, 44),
(1102, 4124),
(1252, 2124);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_servicio`
--

CREATE TABLE `paquete_servicio` (
  `Paquete_CODIGOPAQUETE` int(11) NOT NULL,
  `listaServicio_CODIGOSERVICIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `paquete_servicio`
--

INSERT INTO `paquete_servicio` (`Paquete_CODIGOPAQUETE`, `listaServicio_CODIGOSERVICIO`) VALUES
(6, 4),
(6, 5),
(451, 4),
(451, 5),
(451, 556),
(451, 557),
(451, 559),
(451, 1101),
(451, 1251),
(558, 556),
(558, 557),
(1102, 5),
(1102, 559),
(1102, 1101),
(1252, 559),
(1252, 1101),
(1252, 1251);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '1500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `CODIGOSERVICIO` int(11) NOT NULL,
  `COSTOSERVICIO` double DEFAULT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `DESTINOSERVICIO` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FECHASERVICIO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`CODIGOSERVICIO`, `COSTOSERVICIO`, `DESCRIPCION`, `DESTINOSERVICIO`, `FECHASERVICIO`, `NOMBRE`) VALUES
(4, 0, 'volemos :)', 'cuando el avion quede sin combustible.', '2021-12-14', 'Pasajes de aviÃ³n'),
(5, 2123, 'Hotel 3 (***) estrellas con servicio al cuarto ', 'Miami Florida EE. UU.', '2021-12-14', 'Hotel por noche/s'),
(556, 22, 'asd', 'asd', '2021-12-16', 'Pasajes de aviÃ³n'),
(557, 22, 'qwe', 'qwe', '2021-12-16', 'Pasajes de aviÃ³n'),
(559, 1, 'q', 'q', '2021-12-16', 'Pasajes de avión'),
(1101, 2000, 'Ida, con Aerolí­neas Argentina. Aplica impuestos', 'Miami Florida EE. UU.', '2021-12-31', 'Pasajes de avión'),
(1251, 123, 'prueba', 'prueba', '2111-11-11', 'Hotel por noche/s');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSU` int(11) NOT NULL,
  `CONTRASENIAUSU` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `NOMBREUSU` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSU`, `CONTRASENIAUSU`, `NOMBREUSU`) VALUES
(1, 'gian', 'gian'),
(1201, 'asd', 'asdasd'),
(1401, 'gian', 'gian1'),
(1451, 'prueba2', 'prueba2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `NUMVENTA` int(11) NOT NULL,
  `FECHAVENTA` date DEFAULT NULL,
  `MEDIOPAGO` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CLIENTE_IDCLIENTE` int(11) DEFAULT NULL,
  `EMPLEADO_IDEMPLEADO` int(11) DEFAULT NULL,
  `PAQUETE_CODIGOPAQUETE` int(11) DEFAULT NULL,
  `SERVICIO_CODIGOSERVICIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`NUMVENTA`, `FECHAVENTA`, `MEDIOPAGO`, `CLIENTE_IDCLIENTE`, `EMPLEADO_IDEMPLEADO`, `PAQUETE_CODIGOPAQUETE`, `SERVICIO_CODIGOSERVICIO`) VALUES
(351, '2021-12-15', 'Tarjeta de crÃ©dito', 3, 2, NULL, 5),
(402, '2021-12-15', 'Tarjeta de crÃ©dito', 3, 2, 6, NULL),
(452, '2021-12-15', 'Tarjeta de crÃ©dito', 3, 2, 451, NULL),
(453, '2021-12-15', 'Efectivo', 3, 2, NULL, 4),
(501, '2021-12-16', 'Tarjeta de crÃ©dito', 3, 2, 451, NULL),
(603, '2021-12-17', 'Tarjeta de débito', 3, 2, NULL, 4),
(1104, '2021-12-17', 'Tarjeta de débito', 3, 2, 1102, NULL),
(1301, '2021-12-18', 'Efectivo', 1053, 2, 6, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IDCLIENTE`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `FK_EMPLEADO_USUARIO_IDUSU` (`USUARIO_IDUSU`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`CODIGOPAQUETE`);

--
-- Indices de la tabla `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD PRIMARY KEY (`Paquete_CODIGOPAQUETE`,`listaServicio_CODIGOSERVICIO`),
  ADD KEY `FK_PAQUETE_SERVICIO_listaServicio_CODIGOSERVICIO` (`listaServicio_CODIGOSERVICIO`);

--
-- Indices de la tabla `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`CODIGOSERVICIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSU`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`NUMVENTA`),
  ADD KEY `FK_VENTA_SERVICIO_CODIGOSERVICIO` (`SERVICIO_CODIGOSERVICIO`),
  ADD KEY `FK_VENTA_CLIENTE_IDCLIENTE` (`CLIENTE_IDCLIENTE`),
  ADD KEY `FK_VENTA_EMPLEADO_IDEMPLEADO` (`EMPLEADO_IDEMPLEADO`),
  ADD KEY `FK_VENTA_PAQUETE_CODIGOPAQUETE` (`PAQUETE_CODIGOPAQUETE`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USUARIO_IDUSU` FOREIGN KEY (`USUARIO_IDUSU`) REFERENCES `usuario` (`IDUSU`);

--
-- Filtros para la tabla `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD CONSTRAINT `FK_PAQUETE_SERVICIO_Paquete_CODIGOPAQUETE` FOREIGN KEY (`Paquete_CODIGOPAQUETE`) REFERENCES `paquete` (`CODIGOPAQUETE`),
  ADD CONSTRAINT `FK_PAQUETE_SERVICIO_listaServicio_CODIGOSERVICIO` FOREIGN KEY (`listaServicio_CODIGOSERVICIO`) REFERENCES `servicio` (`CODIGOSERVICIO`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_VENTA_CLIENTE_IDCLIENTE` FOREIGN KEY (`CLIENTE_IDCLIENTE`) REFERENCES `cliente` (`IDCLIENTE`),
  ADD CONSTRAINT `FK_VENTA_EMPLEADO_IDEMPLEADO` FOREIGN KEY (`EMPLEADO_IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`),
  ADD CONSTRAINT `FK_VENTA_PAQUETE_CODIGOPAQUETE` FOREIGN KEY (`PAQUETE_CODIGOPAQUETE`) REFERENCES `paquete` (`CODIGOPAQUETE`),
  ADD CONSTRAINT `FK_VENTA_SERVICIO_CODIGOSERVICIO` FOREIGN KEY (`SERVICIO_CODIGOSERVICIO`) REFERENCES `servicio` (`CODIGOSERVICIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
