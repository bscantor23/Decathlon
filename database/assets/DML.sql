-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2021 a las 06:44:00
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
(30, 4, 'CASCO PARA BARRANQUISMO CANYON GRIS AMARILLO', 'S/M', '124000.00'),
(31, 4, 'CASCO DE RUGBY OFFLOAD R500 HOMBRE NEGRO ', 'M', '99000.00'),
(32, 4, 'CASCO DE CICLISMO MTB ROCKRIDER ST 100 BLANCO', 'M', '100000.00'),
(33, 4, 'CASCO PARA CICLISMO DE CIUDAD BOL 500 AZUL OSCURO', 'S', '100000.00'),
(34, 4, 'Casco para roller skateboard monopatín B100 rosado', 'S', '123000.00'),
(35, 4, 'CASCO PARA CICLISMO DE CIUDAD 100 NEGRO', 'L', '100000.00'),
(36, 4, 'CASCO PARA ESCALADA Y ALPINISMO - ROCK GRIS', 'L', '230000.00'),
(37, 4, 'CASCO CON PROTECCIÓN FACIAL INTEGRADA PARA BOXEO OUTSHOCK 100 ADULTO NEGRO ', 'S', '100000.00'),
(38, 4, 'GORRO PARA CASCO BICICLETA 500 SIN COSTURA NEGRO ', 'M', '34000.00'),
(39, 4, 'GORRO PARA CORRER NEGRO', 'S', '670000.00'),
(40, 4, 'GORRO CASCO 500 AQUAFREEZE BLANCO ', 'M', '100000.00'),
(41, 6, 'Sudadera Domyos 100 Gimnasia Deportiva Bébes 12 Meses - 6 Años Azul oscuro', '2A', '35000.00'),
(42, 6, 'Sudadera niño niña cálido gimnasia deportiva Domyos 100 Warmy Zip rosa gris', '28', '36000.00'),
(43, 6, 'Saco Gimnasia Domyos GWSV Bebé 12 Meses - 6 Años Azul / Gris', 'XS', '123000.00'),
(44, 6, 'Chaqueta de Montaña y Trekking Híbrida NH100 Hombre Caqui', 'S', '89000.00'),
(45, 6, 'Saco caliente GIMNASIA INFANTIL niña rosado', 'S', '123000.00'),
(46, 6, 'Sudadera senderismo naturaleza - NH100 Híbrida - Mujer ', 'M', '53000.00'),
(47, 6, 'Sudadera con cremallera y capucha Fitness negro ', 'L', '154000.00'),
(48, 6, 'Sudadera Fútbol Kipsta T500 adulto negro carbono', 'L', '85000.00'),
(49, 6, 'Sudadera Fútbol Kipsta T500 adulto negro carbono', 'L', '56000.00'),
(50, 6, 'Sudadera Running Kalenji Dry+ Feel Hombre Negro Capucha Transpirable', 'S', '98000.00'),
(51, 7, 'Botas de Montaña y Trekking Impermeables Niños Quechua MH500 Gris Verde', '29', '0.00'),
(52, 7, 'Botas de Nieve Apreski Impermeables Mujer Quechua SH520 X-Warm Negro Caña M', '42', '297000.00'),
(53, 7, 'Tenis de Trail Running TR Mujer Rosa', '36', '200000.00'),
(54, 7, 'Tenis para correr Trail Running TR Hombre Azul Noche', '35', '398000.00'),
(55, 7, 'Tenis de niños senderismo tira autoadh CROSSROCK impermeables verdes 28-34', '28', '492000.00'),
(56, 7, 'Tenis para correr niños At Flex Run Rosa Gris Tira Velcro', '39', '125000.00'),
(57, 7, 'Zapatos Hombre Areeta Negro', '25', '120000.00'),
(58, 7, 'Botas ligeras y flexibles de boxeo inglés 500 negro', '43', '320000.00'),
(59, 7, 'Tenis senderismo mujer FH 500 gris ', '30', '200000.00'),
(60, 7, 'Tenis de senderismo niños tira autoadherente MH100 azul y rosa 24 a 34', '40', '420000.00'),
(61, 6, 'Camiseta Polo de Tenis DRY 100 Hombre Azul Oscuro', 'L', '48998.00'),
(62, 1, 'Guantes Genéricos', 'S', '36000.00'),
(63, 8, 'Traje especial para natación Adidas', 'L', '290002.00'),
(64, 2, 'Malla Térmica para Deportistas', 'Grande', '59996.00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

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
