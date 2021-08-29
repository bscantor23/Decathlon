-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2021 a las 06:22:57
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `decathlon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(5, 'Botas'),
(4, 'Cascos'),
(1, 'Guantes'),
(2, 'Mallas'),
(3, 'Mochilas'),
(10, 'Pantalones'),
(6, 'Sudaderas'),
(9, 'Suspensorios'),
(7, 'Tenis'),
(8, 'Trajes especiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `fk_categoria` int(11) NOT NULL,
  `nombre` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `talla` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `fk_categoria`, `nombre`, `talla`, `precio`) VALUES
(1, 1, 'Guantes Ciclismo Carretera 500 burdeos', 'S', '37000.00'),
(2, 5, 'Botas impermeables Solognac Glenarm 500 Hombre Fuelle Lateral Ajustable Ver', '42', '149000.00'),
(3, 3, 'Mochila de senderismo montaña - MH500 40 L', 'L', '298000.00'),
(4, 6, 'Sudadera Domyos 100 Gimnasia Deportiva Bebé Azul ', '103-112cm 4-5A', '50000.00'),
(5, 6, 'Sudadera Fútbol Kipsta T500 adulto negro carbono', 'M', '99000.00'),
(6, 7, 'Tenis senderismo mujer FH 500 gris ', '39', '297000.00'),
(7, 8, 'Traje Buceo Subea SCD 100 Hombre Neopreno 3 mm Cierre Dorsal', 'S', '322000.00'),
(8, 5, 'Botas de nieve cálidas impermeables - SH100 X-WARM - Media caña', '39', '149.00'),
(9, 10, 'Leggins Niña transpirables S500 Gimnasia Rosa Estampado', '149-159cm ', '50000.00'),
(10, 2, 'Mallas Running Run Dry Hombre Negro', '2XL', '40000.00'),
(11, 10, 'Falda-Pantalón Trail Running Mujer Negro Bronce', 'L', '99000.00'),
(12, 7, 'Zapatos Hombre Areeta Negro ', '40', '106000.00'),
(13, 4, 'Casco Equitación Fouganza 120 Azul Osc /Azul Real ', 'S/52-55cm', '134000.00'),
(14, 8, 'Mono Fitness FJU 900 Mujer Negro', '44', '149000.00'),
(15, 8, 'Conjunto de esquí/trineo bebé warm rosado', '2A', '149000.00'),
(16, 3, 'Mochila Hidratación de 5L Trail Running Negro', 'UNIQUE', '99000.00'),
(17, 6, 'Chaqueta de senderismo | NH500 Híbrida Mujer Caqui ', 'L', '198000.00'),
(18, 10, 'Pantalón Training Hombre 560 gris ', 'S / W30 L33', '134000.00'),
(19, 4, 'CASCO ABIERTO BOXEO OUTSHOCK 900 ADULTO NEGRO', 'L/58-61cm', '173000.00'),
(20, 9, 'Suspensorios Casuales En Algodón Ultra Suave Hunk', 'M', '35000.00'),
(21, 1, 'GUANTES DE MTB VERANO ROCKRIDER ST 500 ROJOS', 'XL', '74000.00'),
(22, 5, 'Botas de Nieve y Apreski Bebé Lugik Warm Rosa', '20/21', '74000.00'),
(23, 6, 'Saco capucha caliente bolsillo crem GIMNASIA INFANTIL 500 niños rosado y ne', '123-130cm 7-8A', '84000.00'),
(24, 10, 'Pantalón snowboard y esquí, dreamscape SNB 100, impermeable, mujer, Burdeos', '42', '236000.00'),
(25, 3, 'Maleta de senderismo júnior MH500 40 Litros Azul ', 'Sans taille', '151000.00'),
(26, 5, 'BOTAS DE AGUA KATIUSKAS IMPERMEABLES NIÑOS BARCO VELA TRIBORD ROSA', '26/27', '55000.00'),
(27, 7, 'Tenis de Trail Running TR Mujer Rosa', '39', '193000.00'),
(28, 5, 'BOTAS DE NIEVE CÁLIDAS E IMPERMEABLES - SH100 WARM - NIÑOS', '34/35 ', '50000.00'),
(29, 5, 'Botas para Alpinismo y Alta Montaña Hombre Simond Alpinism Light Azul Liger', '43', '842000.00'),
(30, 4, 'CASCO PARA BARRANQUISMO CANYON GRIS AMARILLO', 'S/M', '124000.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`,`fk_categoria`),
  ADD KEY `fk_Producto_Categoria_idx` (`fk_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Producto_Categoria` FOREIGN KEY (`fk_categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
