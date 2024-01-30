-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2024 a las 20:14:51
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

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
  `id` int(11) NOT NULL,
  `nombre_banner` varchar(150) NOT NULL,
  `link_banner` varchar(250) NOT NULL,
  `imagen_banner` varchar(400) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `nombre_banner`, `link_banner`, `imagen_banner`, `id_categoria`) VALUES
(70, 'GOW', '', '../banners/Banner-god-of-war-ragnarok.jpg', 1),
(71, 'DI2', '', '../banners/DI2.jpg', 1),
(72, 'FG', '', '../banners/Fallguys.jpg', 1),
(73, 'Farcry4', '', '../banners/far-cry-4.jpg', 2),
(74, 'Farcry6', '', '../banners/farcry6.jpg', 2),
(75, 'halo infinity', '', '../banners/halo_infinity.jpg', 2),
(76, 'HL', '', '../banners/HL.jpg', 3),
(77, 'GOW', '', '../banners/Banner-god-of-war-ragnarok.jpg', 3),
(78, 'OW', '', '../banners/OW.jpg', 3),
(79, 'TLOZBW', '', '../banners/TLOZBW.jpg', 4),
(80, 'The witcher', '', '../banners/Thewitcher.jpg', 4),
(83, 'Fallout 4', '', '../banners/fallout4.jpg', 1);

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
(1, 'inicio'),
(2, 'Xbox series X/S'),
(3, 'PS5'),
(4, 'Nintendo switch'),
(5, 'PC'),
(6, 'Antiguas generaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `descripcion_producto` varchar(500) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `imagen_producto` varchar(250) NOT NULL,
  `id_categorias` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `imagen_producto`, `id_categorias`) VALUES
(17, 'Red Dead Redemption 2', 'Videojuego', 1299, '../productos/ReddeadII.jpg', 4),
(18, 'Halo rrrsgsg', 'Videojuego', 700, '../productos/Haloinfinity.jpg', 1),
(21, 'Watch Dogs: Legion', 'Videojuego', 1119, '../productos/WatchDogs_Legion.jpg', 1),
(46, 'aaaaaaaaa', 'adasf', 11111, '', 1),
(47, 'Halo dafawava', 'sdhfbvn', 0, '../productos/GOW.jpg', 1);

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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `correo`, `contraseña`, `id_rol`) VALUES
(9, 'alfonso', 'tilin@gmail.com', '1234', 1),
(12, 'alfonso', 'alfonso@gmail.com', '12345', 1),
(14, 'admin', '', 'admin', 2),
(22, 'fsdfsdv', 'sfaff', 'qwer', 1),
(23, 'alfonso', 'tilin@gmail.com', '12345', 1),
(24, 'alfonso', 'side@gmail.com', '12345', 1),
(25, 'alfonso', 'side@gmail.com', '12345', 1),
(26, 'alfonso', 'side@gmail.com', 'asdf', 1),
(27, 'alfonso', 'side@gmail.com', 'asdf', 1),
(28, 'alfonso', 'side@gmail.com', 'asdf', 1),
(29, 'alfonso', 'side@gmail.com', 'asdf', 1),
(30, 'alfonso', 'ffaaf', '123456', 1),
(31, 'alfonso', 'sdasd', '', 1),
(32, 'dasf', 'feaf', '', 1),
(33, 'aawd', 'awdsdf', '', 1),
(34, 'asdawafa', 'fawffaf', '12345', 1),
(35, 'asdawafa', 'fawffaf', '12345', 1),
(36, 'asdasd', 'adad', 'qwer', 1),
(37, 'alfonso', 'tilin@gmail.com', 'alfonso', 1),
(38, 'alfonso', 'tilin@gmail.com', 'qwer', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_banners` (`id_categoria`) USING BTREE;

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_productos` (`id_categorias`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
