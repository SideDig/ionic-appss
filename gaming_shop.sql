-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2024 a las 04:31:43
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
(96, 'Minecraft', 'Crea y explora tu propio mundo donde el único límite es tu imaginación.', 599, 'https://image.api.playstation.com/vulcan/img/cfn/11307uYG0CXzRuA9aryByTHYrQLFz-HVQ3VVl7aAysxK15HMpqjkAIcC_R5vdfZt52hAXQNHoYhSuoSq_46_MT_tDBcLu49I.png', 2, 3),
(97, 'Elden Ring', 'Enfréntate a un mundo lleno de peligros y maravillas en el nuevo juego de FromSoftware.', 999, 'https://image.api.playstation.com/vulcan/ap/rnd/202110/2000/aGhopp3MHppi7kooGE2Dtt8C.png', 3, 2),
(98, 'God of War Ragnarök', 'Sigue la próxima etapa del viaje épico de Kratos y Atreus.', 60, 'https://cdn1.epicgames.com/offer/3ddd6a590da64e3686042d108968a6b2/EGS_GodofWar_SantaMonicaStudio_S2_1200x1600-fbdf3cbc2980749091d52751ffabb7b7_1200x1600-fbdf3cbc2980749091d52751ffabb7b7', 1, 4),
(99, 'Animal Crossing: New Horizons', 'Crea tu propio paraíso en una isla desierta.', 800, 'https://m.media-amazon.com/images/I/71EsARfsklS._AC_UF1000,1000_QL80_.jpg', 1, 1),
(100, 'Final Fantasy VII Remake', 'Redescubre el icónico RPG que redefinió el género, ahora totalmente reimaginado.', 200, 'https://image.api.playstation.com/vulcan/img/cfn/11307-dNapclgq_VqNtQ98Xp_LxovvAdjd5AknZhd_-k2Cckq9FPtKDXAHk-ODCfvDKChH6hkEO0VLtj7Vk4E-Z8G707oe0N.png', 1, 4),
(101, 'Cyberpunk 2077', 'Sumérgete en el mundo de Night City en este RPG de mundo abierto.', 600, 'https://store-images.s-microsoft.com/image/apps.47379.63407868131364914.bcaa868c-407e-42c2-baeb-48a3c9f29b54.89bb995b-b066-4a53-9fe4-0260ce07e894', 3, 2),
(102, 'Halo Infinite', 'Continúa la saga del Jefe Maestro en el más grande Halo hasta la fecha.', 700, 'https://m.media-amazon.com/images/I/81r6IF9GNNL._AC_UF1000,1000_QL80_.jpg', 1, 5),
(106, 'Assassin’s Creed Valhalla', 'Vive como un legendario vikingo en la búsqueda de gloria.', 800, 'https://static.posters.cz/image/1300/plakaty/assassin-s-creed-valhalla-eivor-i96339.jpg', 3, 2),
(107, 'Call of Duty: Warzone', 'Enfréntate en esta frenética batalla para sobrevivir.', 0, 'imagenCODWarzone.jpg', 4, 3),
(108, 'Resident Evil Village', 'Experimenta el terror de sobrevivencia en un nuevo nivel.', 900, 'https://image.api.playstation.com/vulcan/ap/rnd/202101/0812/FkzwjnJknkrFlozkTdeQBMub.png', 1, 3),
(109, 'Super Mario Odyssey', 'Embárcate en una gran aventura alrededor del mundo con Mario', 1300, 'https://m.media-amazon.com/images/I/91-VfRp-i0L._AC_UF1000,1000_QL80_.jpg', 5, 4),
(110, 'The Witcher 3: Wild Hunt', 'Explora un mundo abierto mágico y peligroso como el brujo Geralt', 1200, 'https://image.api.playstation.com/vulcan/ap/rnd/202211/0711/kh4MUIuMmHlktOHar3lVl6rY.png', 6, 1),
(111, 'Dark Souls III', 'Enfréntate a desafíos brutales en este oscuro juego de rol', 1500, 'https://image.api.playstation.com/cdn/EP0700/CUSA03365_00/gSJkkVfpqk8qEp3fQglGcu3OLbXeHJ1W.png', 7, 3),
(112, 'Persona 5', 'Vive una doble vida como estudiante de día y ladrón de corazones de noche', 1400, 'https://image.api.playstation.com/vulcan/img/cfn/11307XlqDFlHmHWGjBPndSappCDTnE9OmnP2P-dSzcvLX9i0pvH_okJOl6dP1AnZefxthD-2k3RrsdzYU_BqUy9K5_sv-Tnx.png', 8, 3),
(113, 'Metroid Dread', 'Ayuda a Samus a escapar de un planeta hostil en su última aventura', 1250, 'https://m.media-amazon.com/images/I/71LVHNX3vLS._AC_UF1000,1000_QL80_.jpg', 9, 4),
(114, 'Sekiro: Shadows Die Twice', 'Domina el arte del combate samurái en este título de acción', 1350, 'https://image.api.playstation.com/vulcan/img/rnd/202010/2723/knxU5uU5aKvQChKX5OvWtSGC.png', 10, 1),
(115, 'Mass Effect: Andromeda', 'Explora la galaxia de Andromeda en este juego de rol de ciencia ficción', 1100, 'https://m.media-amazon.com/images/I/71At6yCGUKL._AC_UF1000,1000_QL80_.jpg', 11, 4),
(116, 'Splatoon 2', 'Compite en batallas de tinta multijugador en el mundo de Splatoon', 990, 'https://m.media-amazon.com/images/I/81F9LrZ7YgL._AC_UF1000,1000_QL80_.jpg', 12, 4),
(117, 'Gears 5', 'Continúa la saga épica de Gears of War en este intenso shooter', 1080, 'https://store-images.s-microsoft.com/image/apps.9700.14591801423393397.e1044226-28d7-42f6-a357-7102f7d1a4b3.b11e46da-8c40-42d7-8a61-f98879101d4a', 13, 3),
(118, 'Nier: Automata', 'Descubre los misterios de un futuro distópico en este juego de acción y rol', 1350, 'https://image.api.playstation.com/cdn/UP0082/CUSA04551_00/WkgJ8OLvEkfoZmY65B8cudKYw8Aylp1y.png', 14, 1);

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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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
