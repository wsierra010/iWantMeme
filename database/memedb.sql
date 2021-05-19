-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2021 a las 21:29:06
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `memedb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memephoto`
--

CREATE TABLE `memephoto` (
  `title` varchar(150) NOT NULL,
  `imageURL` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `public_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `memephoto`
--

INSERT INTO `memephoto` (`title`, `imageURL`, `user_id`, `description`, `public_id`) VALUES
('Gato1', 'http://res.cloudinary.com/dij18vn36/image/upload/v1621435068/ufiowx3zkr7qasbrkmaw.jpg', NULL, 'gatito Chiquito', 'ufiowx3zkr7qasbrkmaw'),
('Gatos', 'http://res.cloudinary.com/dij18vn36/image/upload/v1621435502/hdmgjvscgnopwmdgqvut.jpg', NULL, 'Muchos Gatos', 'hdmgjvscgnopwmdgqvut'),
('Otra Prueba', 'http://res.cloudinary.com/dij18vn36/image/upload/v1621436580/qcrtnqgsgdlflahalpcv.png', NULL, 'sad', 'qcrtnqgsgdlflahalpcv'),
('Don_Gato', 'http://res.cloudinary.com/dij18vn36/image/upload/v1621444497/qoqktrpt8tgy2qcanloo.jpg', NULL, 'gatito guay', 'qoqktrpt8tgy2qcanloo'),
('Don_Gato', 'http://res.cloudinary.com/dij18vn36/image/upload/v1621444545/tdbpbu3loxxvpjgfo20u.jpg', NULL, 'gatito guay', 'tdbpbu3loxxvpjgfo20u'),
('Pepes', 'http://res.cloudinary.com/dij18vn36/image/upload/v1621450652/lcvmxe7uqzmrldjnmnpk.jpg', NULL, 'papas', 'lcvmxe7uqzmrldjnmnpk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('JIihFfo2UrXz6ZcLdwaFyuWNBZB-woZ7', 1621538909, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` int(15) DEFAULT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone_number`, `first_name`, `last_name`) VALUES
(24, 'admin', '$2a$10$OSa4P8rfa7sCzlmYhTRwY.Ir/YaBXVLEToTDZfqNWVuHO2rIqAiiu', NULL, NULL, NULL, NULL),
(25, 'wilmer', '$2a$10$scDLakn1mA3di81aPiSmS.AY/xKg0VP9tqgHrSZxHgWqlkbOh4iK2', NULL, NULL, NULL, NULL),
(26, 'MrCheesey07', '$2a$10$bn1dicgCLM9wsVtsIfYEgu7vyCL4m4oI8S5FNkv3U9O6Gwl3ecWte', 'wsierra77@gmail.com', 676837645, 'Wilmer', 'Sierra Salgado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `memephoto`
--
ALTER TABLE `memephoto`
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `memephoto`
--
ALTER TABLE `memephoto`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
