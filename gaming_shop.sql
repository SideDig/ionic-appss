-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2024 a las 08:23:18
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gaming_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id_banner` int(11) NOT NULL,
  `nombre_banner` varchar(150) NOT NULL,
  `link_banner` varchar(250) NOT NULL,
  `imagen_banner` varchar(400) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id_banner`, `nombre_banner`, `link_banner`, `imagen_banner`, `id_categoria`) VALUES
(85, 'Pruebaaa', '', 'https://img.freepik.com/vector-gratis/portada-facebook-configuracion-juegos-neon-diseno-plano_23-2149833533.jpg', NULL),
(86, 'gsegawfasw', 'fawfawga', 'https://img.freepik.com/vector-gratis/plantilla-banner-contraccion-juegos-neon-plano_23-2149885763.jpg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(1, 'Acción'),
(2, 'Aventura'),
(3, 'Rol (RPG)'),
(4, 'Simulación'),
(5, 'Estrategia'),
(6, 'Deportes'),
(7, 'Carreras'),
(8, 'Lucha'),
(9, 'Horror de Supervivencia'),
(10, 'Puzzle'),
(11, 'MMO'),
(12, 'Plataformas'),
(13, 'Shooter'),
(14, 'Indie'),
(15, 'Sandbox');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformas`
--

CREATE TABLE `plataformas` (
  `id` int(11) NOT NULL,
  `plataforma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plataformas`
--

INSERT INTO `plataformas` (`id`, `plataforma`) VALUES
(1, 'PC'),
(2, 'PlayStation'),
(3, 'Xbox'),
(4, 'Nintendo Switch'),
(5, 'Antiguas generaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `descripcion_producto` varchar(500) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `imagen_producto` varchar(250) NOT NULL,
  `id_categorias` int(11) DEFAULT 1,
  `id_plataforma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `imagen_producto`, `id_categorias`, `id_plataforma`) VALUES
(94, 'The Legend of Zelda: Breath of the Wild', 'Explora el vasto mundo de Hyrule en esta aventura épica.', 60, 'imagenZelda.jpg', 1, 1),
(95, 'Super Mario Odyssey', 'Únete a Mario en un gigantesco viaje por el mundo.', 50, 'imagenMario.jpg', 1, 1),
(96, 'Minecraft', 'Crea y explora tu propio mundo donde el único límite es tu imaginación.', 27, 'imagenMinecraft.jpg', 2, 3),
(97, 'Elden Ring', 'Enfréntate a un mundo lleno de peligros y maravillas en el nuevo juego de FromSoftware.', 60, 'imagenEldenRing.jpg', 3, 2),
(98, 'God of War Ragnarök', 'Sigue la próxima etapa del viaje épico de Kratos y Atreus.', 60, 'imagenGodOfWar.jpg', 1, 4),
(99, 'Animal Crossing: New Horizons', 'Crea tu propio paraíso en una isla desierta.', 56, 'imagenAnimalCrossing.jpg', 1, 1),
(100, 'Final Fantasy VII Remake', 'Redescubre el icónico RPG que redefinió el género, ahora totalmente reimaginado.', 60, 'imagenFFVII.jpg', 1, 4),
(101, 'Cyberpunk 2077', 'Sumérgete en el mundo de Night City en este RPG de mundo abierto.', 50, 'imagenCyberpunk.jpg', 3, 2),
(102, 'Halo Infinite', 'Continúa la saga del Jefe Maestro en el más grande Halo hasta la fecha.', 60, 'imagenHalo.jpg', 1, 5),
(103, 'Genshin Impact', 'Explora el vasto mundo de Teyvat en esta experiencia de RPG de mundo abierto.', 0, 'imagenGenshin.jpg', 2, 3),
(104, 'The Witcher 3: Wild Hunt', 'Embárcate en una aventura épica en un mundo oscuro lleno de peligros.', 40, 'imagenWitcher3.jpg', 3, 2),
(105, 'Fortnite', 'Compite para ser el último en pie en el fenómeno del battle royale.', 0, 'imagenFortnite.jpg', 4, 3),
(106, 'Assassin’s Creed Valhalla', 'Vive como un legendario vikingo en la búsqueda de gloria.', 60, 'imagenACValhalla.jpg', 3, 2),
(107, 'Call of Duty: Warzone', 'Enfréntate en esta frenética batalla para sobrevivir.', 0, 'imagenCODWarzone.jpg', 4, 3),
(108, 'Resident Evil Village', 'Experimenta el terror de sobrevivencia en un nuevo nivel.', 60, 'imagenREVillage.jpg', 1, 4),
(111, 'pruebaa', 'pruebha', 12222, 'jfdlaf', 4, 4),
(112, 'Purebaaa', 'aadasafasfaf', 2323, 'fgg', 3, 5),
(113, 'pruebaa2', 'fjkjegksg', 31323, 'HFKSGSG', 2, 3),
(114, 'gsgsgs', 'egsegfsdgs', 222, 'sd', 5, 2),
(115, 'papu', 'papu', 123, 'sgsg', 2, 5),
(116, 'pepe', 'pepe', 1213, 'ppe', 3, 5),
(124, 'tilin', 'tiluun', 1212, 'fsgg', 13, 3),
(125, 'aaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaa', 1, 'aaaaaaaa', 3, 1),
(126, 'nnnnnnn', 'nnnnnn', 1, 'aaaaaaaa', 3, 1),
(127, 'noseeeee', 'noseeee', 1111, 'faaa', 14, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'Usuario'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `id_token` int(11) NOT NULL,
  `correo` varchar(255) COLLATE utf32_bin NOT NULL,
  `token` varchar(255) COLLATE utf32_bin NOT NULL,
  `estatus` enum('abierta','cerrada') COLLATE utf32_bin NOT NULL DEFAULT 'cerrada',
  `fecha_creacion` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`id_token`, `correo`, `token`, `estatus`, `fecha_creacion`) VALUES
(0, 'alfonso@gmail.com', '0a46e72362d42e6882a917ecc81fd27b', 'abierta', '2024-03-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `correo`, `contrasena`, `id_rol`) VALUES
(64, 'admin', 'admin12121@gmail.com', '$2y$10$AVCttvDcGVkA.UnIb8nAluxRq1IKRTQ3eFFRu/eLyyyKq8JjAquJa', 2),
(65, 'Alfonso', 'prueba1212@gmail.com', '$2y$10$h/xDcz9gRhTmZS2dsNdYSusJxnPhvB.jvDZLBVIFJW.WXvhCrCUgm', 1),
(66, 'no soy admin', 'noadmin@gmail.com', '$2y$10$Jl4IWZ/nHxmN9MWpjixSre4akczro4OXMFxQaGYIQTwb1irpyKgei', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id_banner`),
  ADD KEY `categorias_banners` (`id_categoria`) USING BTREE;

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plataformas`
--
ALTER TABLE `plataformas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categorias_productos` (`id_categorias`),
  ADD KEY `id_plataforma` (`id_plataforma`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataformas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- global.php para 000webhost

-- <?php

-- //definimos la codificaci贸n de los caracteres
-- define("DB_ENCODE","utf8mb4");

-- //Definimos una constante como nombre del proyecto
-- define("PRO_NOMBRE","cc");

-- //datos de producci贸n, descomentar para pasar
-- define("DB_HOST","localhost");

-- //Nombre de la base de datos pr
-- define("DB_NAME", "id21999006_gaming_shop");

-- //Usuario de la base de datos pr
-- define("DB_USERNAME", "id21999006_localhost");

-- //Contrase帽a del usuario de la base de datos
-- define("DB_PASSWORD", "Gamingshop123-");

-- ?>