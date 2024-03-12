-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2024 a las 05:44:12
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
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `descripcion_producto` varchar(500) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `imagen_producto` varchar(250) NOT NULL,
  `id_categorias` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `imagen_producto`, `id_categorias`) VALUES
(68, 'PRUEBAA', 'dafklafhjlakf', 1200, 'https://cdn.kobo.com/book-images/2293d52f-680c-49e7-a75c-9c3955e34768/353/569/90/False/call-of-duty-black-ops-ii-strategy-guide.jpg', 2);

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
(12, 'alfonso', 'alfonso@gmail.com', '12345', 1),
(14, 'admin', '', 'admin', 2),
(22, 'fsdfsdv', 'sfaff', 'qwer', 1),
(23, 'alfonso', 'tilin@gmail.com', '12345', 1),
(25, 'alfonso', 'side@gmail.com', '12345', 1),
(27, 'alfonso', 'side@gmail.com', 'asdf', 1),
(29, 'alfonso', 'side@gmail.com', 'asdf', 1),
(30, 'alfonso', 'ffaaf', '123456', 1),
(31, 'alfonso', 'sdasd', '', 1),
(32, 'dasf', 'feaf', '', 1),
(33, 'aawd', 'awdsdf', '', 1),
(34, 'asdawafa', 'fawffaf', '12345', 1),
(35, 'asdawafa', 'fawffaf', '12345', 1),
(36, 'asdasd', 'adad', 'qwer', 1),
(37, 'alfonso', 'tilin@gmail.com', 'alfonso', 1),
(38, 'alfonso', 'tilin@gmail.com', 'qwer', 1),
(39, 'ffsegse', 'papu@gmail.com', '1234567890', 1),
(40, 'prueba postman', 'postman@gmail.com', '$2y$10$vN8cQm4gMHCnLbWImUDRheV1wSFWosGA.bCLGSIDyx8oe7ra980zK', 1),
(41, 'prueba postman 2', 'postman123@gmail.com', '$2y$10$j02eL.YB4iE8Ap5tx5pKu.wCULDCcdfxJb5RQs7dFCy626RbkmpMy', 1),
(42, 'prueba postman 2', 'postman123@gmail.com', '$2y$10$dLMXivkjkOjEYRf13gC1BOeRzvgZvVIgqythalHVzW9iWb6YHrXe.', 1),
(43, 'alfonso', 'tilin@gmail.com', '$2y$10$TkeDvj6o2Eo/2gPR.lQW9u1xZjVyHV6lhZhb2bSsodrFpzwTlbo/2', 1),
(44, 'thhdrhdrh', 'as@gmail.com', '$2y$10$CYFm2aW25JLUY3cz0.DNl.eR6qQnY2scFBi9LO6c9qBQ1y7MuLA.q', 1),
(45, 'papuuu', 'nose@gmail.com', '$2y$10$S7fS2W.QCer80JdJd6kNTeXvFUI02RA3jpPZPz3loeEWOevpY1moK', 1),
(46, 'omg', 'lol@gmail.com', '$2y$10$gqCxEt3rWzpfmEklCT3zKe5enMgH4EikE4Ir885BeceGAjIcX2Z8S', 1),
(47, 'omg', 'lol31314@gmail.com', '$2y$10$ctM3FzPVBBJgVWFbCkzk0uk97DlbYG2tGqusqnnawQulm5oJ7vRJm', 1),
(48, 'omg', 'lol31314535235@gmail.com', '$2y$10$v5v/XJaD.bgrCfkzcqp0Ke8oJTQoRQeJLJoo3efuDbiErNCrdW3.O', 1),
(49, 'dafawfgawf', 'dafdawfawf@gmail.com', '$2y$10$dklLbLPDkb9kI79isLaYMe/9CrShKhqJ3ebY6NiOgoYCCD2cOwfHu', 1),
(50, 'dfsegseggse', 'efkwef@gmail.com', '$2y$10$8EjPVVoZmIXopiDL1dkgP.IjBc8bbYSif9fk3rTngwCSoWbSa6jWO', 1),
(51, 'noseee', 'jgkeg@gmail.com', '$2y$10$U11A4puCCUXF21q91OzFtuA6LSQZk8RjgzphDtxPotEguHMLH2IOi', 1),
(52, 'ffgegsegseg', '3fdafawf@gmail.com', '$2y$10$DIoIcdLDWjtQqJ60lO/YGeBTJDAlw9JeRflVbcBF9LUTo5SC9UaK6', 1),
(53, 'ghsdhgdxrhdr', 'awklfhawlkf@gmail.com', '$2y$10$W7hv7WHIfSBGeADBAW/wC.HysL9cHSJJxMnWszbfJSonzK4Gr0qrK', 1),
(54, 'awfasfsdgsdgs', 'egsdvxzcvbxbvxf@gmail.com', '$2y$10$6c8nJwkcJsGBuFSX17QBfOdMuL0Q4yPYrn3M5eDKczSsi14C9ZvJG', 1),
(55, 'awfasfsdgsdgs', 'egsdvxzcvbdxbvxf@gmail.com', '$2y$10$Mzsd.AJFyzuXmbzZzFzxTOpx2pnU2hOTge.dGwVyJQeXSO.BcZUAW', 1);

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
  ADD PRIMARY KEY (`id_producto`),
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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
