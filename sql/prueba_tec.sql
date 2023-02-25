-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2023 a las 03:18:45
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
-- Base de datos: `prueba_tec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `rut` varchar(10) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`rut`, `nombre`, `apellido`) VALUES
('18525356-2', 'Juan', 'Carvajal'),
('20524521-8', 'Fabián', 'Olate'),
('20919721-9', 'Ariel', 'Silva'),
('21144450-9', 'Jenniffer', 'Coñuel'),
('22521506-K', 'Rodrigo', 'Seguel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_region` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `id_region`, `nombre`) VALUES
(1, 1, 'Arica'),
(2, 1, 'Camarones'),
(3, 1, 'Putre'),
(4, 1, 'General Lagos'),
(5, 2, 'Iquique'),
(6, 2, 'Alto Hospicio'),
(7, 2, 'Pozo Almonte'),
(8, 2, 'Camiña'),
(9, 2, 'Colchane'),
(10, 2, 'Huara'),
(11, 2, 'Pica'),
(12, 3, 'Antofagasta'),
(13, 3, 'Mejillones'),
(14, 3, 'Sierra Gorda'),
(15, 3, 'Taltal'),
(16, 3, 'Calama'),
(17, 3, 'Ollagüe'),
(18, 3, 'San Pedro de Atacama'),
(19, 3, 'Tocopilla'),
(20, 3, 'María Elena'),
(21, 4, 'Copiapó'),
(22, 4, 'Caldera'),
(23, 4, 'Tierra Amarilla'),
(24, 4, 'Chañaral'),
(25, 4, 'Diego de Almagro'),
(26, 4, 'Vallenar'),
(27, 4, 'Alto del Carmen'),
(28, 4, 'Freirina'),
(29, 4, 'Huasco'),
(30, 5, 'La Serena'),
(31, 5, 'Coquimbo'),
(32, 5, 'Andacollo'),
(33, 5, 'La Higuera'),
(34, 5, 'Paihuano'),
(35, 5, 'Vicuña'),
(36, 5, 'Illapel'),
(37, 5, 'Canela'),
(38, 5, 'Los Vilos'),
(39, 5, 'Salamanca'),
(40, 5, 'Ovalle'),
(41, 5, 'Combarbalá'),
(42, 5, 'Monte Patria'),
(43, 5, 'Punitaqui'),
(44, 5, 'Río Hurtado'),
(45, 6, 'Valparaíso'),
(46, 6, 'Casablanca'),
(47, 6, 'Concón'),
(48, 6, 'Juan Fernández'),
(49, 6, 'Puchuncaví'),
(50, 6, 'Quintero'),
(51, 6, 'Viña del Mar'),
(52, 6, 'Isla de Pascua'),
(53, 6, 'Los Andes'),
(54, 6, 'Calle Larga'),
(55, 6, 'Rinconada'),
(56, 6, 'San Esteban'),
(57, 6, 'La Ligua'),
(58, 6, 'Cabildo'),
(59, 6, 'Papudo'),
(60, 6, 'Petorca'),
(61, 6, 'Zapallar'),
(62, 6, 'Quillota'),
(63, 6, 'La Calera'),
(64, 6, 'Hijuelas'),
(65, 6, 'La Cruz'),
(66, 6, 'Nogales'),
(67, 6, 'San Antonio'),
(68, 6, 'Algarrobo'),
(69, 6, 'Cartagena'),
(70, 6, 'El Quisco'),
(71, 6, 'El Tabo'),
(72, 6, 'Santo Domingo'),
(73, 6, 'San Felipe'),
(74, 6, 'Catemu'),
(75, 6, 'Llay-Llay'),
(76, 6, 'Panquehue'),
(77, 6, 'Putaendo'),
(78, 6, 'Santa María'),
(79, 6, 'Quilpué'),
(80, 6, 'Limache'),
(81, 6, 'Olmué'),
(82, 6, 'Villa Alemana'),
(83, 8, 'Rancagua'),
(84, 8, 'Codegua'),
(85, 8, 'Coinco'),
(86, 8, 'Coltauco'),
(87, 8, 'Doñihue'),
(88, 8, 'Graneros'),
(89, 8, 'Las Cabras'),
(90, 8, 'Machalí'),
(91, 8, 'Malloa'),
(92, 8, 'Mostazal'),
(93, 8, 'Olivar'),
(94, 8, 'Peumo'),
(95, 8, 'Pichidegua'),
(96, 8, 'Quinta de Tilcoco'),
(97, 8, 'Rengo'),
(98, 8, 'Requínoa'),
(99, 8, 'San Vicente'),
(100, 8, 'Pichilemu'),
(101, 8, 'La Estrella'),
(102, 8, 'Litueche'),
(103, 8, 'Marchihue'),
(104, 8, 'Navidad'),
(105, 8, 'Paredones'),
(106, 8, 'San Fernando'),
(107, 8, 'Chépica'),
(108, 8, 'Chimbarongo'),
(109, 8, 'Lolol'),
(110, 8, 'Nancagua'),
(111, 8, 'Palmilla'),
(112, 8, 'Peralillo'),
(113, 8, 'Placilla'),
(114, 8, 'Pumanque'),
(115, 8, 'Santa Cruz'),
(116, 9, 'Talca'),
(117, 9, 'Constitución'),
(118, 9, 'Curepto'),
(119, 9, 'Empedrado'),
(120, 9, 'Maule'),
(121, 9, 'Pelarco'),
(122, 9, 'Pencahue'),
(123, 9, 'Río Claro'),
(124, 9, 'San Clemente'),
(125, 9, 'San Rafael'),
(126, 9, 'Cauquenes'),
(127, 9, 'Chanco'),
(128, 9, 'Pelluhue'),
(129, 9, 'Curicó'),
(130, 9, 'Hualañé'),
(131, 9, 'Licantén'),
(132, 9, 'Molina'),
(133, 9, 'Rauco'),
(134, 9, 'Romeral'),
(135, 9, 'Sagrada Familia'),
(136, 9, 'Teno'),
(137, 9, 'Vichuquén'),
(138, 9, 'Linares'),
(139, 9, 'Colbún'),
(140, 9, 'Longaví'),
(141, 9, 'Parral'),
(142, 9, 'Retiro'),
(143, 9, 'San Javier'),
(144, 9, 'Villa Alegre'),
(145, 9, 'Yerbas Buenas'),
(146, 10, 'Chillán'),
(147, 10, 'Bulnes'),
(148, 10, 'Chillán Viejo'),
(149, 10, 'El Carmen'),
(150, 10, 'Pemuco'),
(151, 10, 'Pinto'),
(152, 10, 'Quillón'),
(153, 10, 'San Ignacio'),
(154, 10, 'Yungay'),
(155, 10, 'Quirihue'),
(156, 10, 'Cobquecura'),
(157, 10, 'Coelemu'),
(158, 10, 'Ninhue'),
(159, 10, 'Portezuelo'),
(160, 10, 'Ránquil'),
(161, 10, 'Treguaco'),
(162, 10, 'San Carlos'),
(163, 10, 'Coihueco'),
(164, 10, 'Ñiquén'),
(165, 10, 'San Fabián'),
(166, 10, 'San Nicolás'),
(167, 11, 'Concepción'),
(168, 11, 'Coronel'),
(169, 11, 'Chiguayante'),
(170, 11, 'Florida'),
(171, 11, 'Hualqui'),
(172, 11, 'Lota'),
(173, 11, 'Penco'),
(174, 11, 'San Pedro de La Paz'),
(175, 11, 'Santa Juana'),
(176, 11, 'Talcahuano'),
(177, 11, 'Tomé'),
(178, 11, 'Hualpén'),
(179, 11, 'Lebu'),
(180, 11, 'Arauco'),
(181, 11, 'Cañete'),
(182, 11, 'Contulmo'),
(183, 11, 'Curanilahue'),
(184, 11, 'Los Álamos'),
(185, 11, 'Tirúa'),
(186, 11, 'Los Ángeles'),
(187, 11, 'Antuco'),
(188, 11, 'Cabrero'),
(189, 11, 'Laja'),
(190, 11, 'Mulchén'),
(191, 11, 'Nacimiento'),
(192, 11, 'Negrete'),
(193, 11, 'Quilaco'),
(194, 11, 'Quilleco'),
(195, 11, 'San Rosendo'),
(196, 11, 'Santa Bárbara'),
(197, 11, 'Tucapel'),
(198, 11, 'Yumbel'),
(199, 11, 'Alto Biobío'),
(200, 12, 'Temuco'),
(201, 12, 'Carahue'),
(202, 12, 'Cunco'),
(203, 12, 'Curarrehue'),
(204, 12, 'Freire'),
(205, 12, 'Galvarino'),
(206, 12, 'Gorbea'),
(207, 12, 'Lautaro'),
(208, 12, 'Loncoche'),
(209, 12, 'Melipeuco'),
(210, 12, 'Nueva Imperial'),
(211, 12, 'Padre Las Casas'),
(212, 12, 'Perquenco'),
(213, 12, 'Pitrufquén'),
(214, 12, 'Pucón'),
(215, 12, 'Saavedra'),
(216, 12, 'Teodoro Schmidt'),
(217, 12, 'Toltén'),
(218, 12, 'Vilcún'),
(219, 12, 'Villarrica'),
(220, 12, 'Cholchol'),
(221, 12, 'Angol'),
(222, 12, 'Collipulli'),
(223, 12, 'Curacautín'),
(224, 12, 'Ercilla'),
(225, 12, 'Lonquimay'),
(226, 12, 'Los Sauces'),
(227, 12, 'Lumaco'),
(228, 12, 'Purén'),
(229, 12, 'Renaico'),
(230, 12, 'Traiguén'),
(231, 12, 'Victoria'),
(232, 13, 'Valdivia'),
(233, 13, 'Corral'),
(234, 13, 'Lanco'),
(235, 13, 'Los Lagos'),
(236, 13, 'Máfil'),
(237, 13, 'Mariquina'),
(238, 13, 'Paillaco'),
(239, 13, 'Panguipulli'),
(240, 13, 'La Unión'),
(241, 13, 'Futrono'),
(242, 13, 'Lago Ranco'),
(243, 13, 'Río Bueno'),
(244, 14, 'Puerto Montt'),
(245, 14, 'Calbuco'),
(246, 14, 'Cochamó'),
(247, 14, 'Fresia'),
(248, 14, 'Frutillar'),
(249, 14, 'Los Muermos'),
(250, 14, 'Llanquihue'),
(251, 14, 'Maullín'),
(252, 14, 'Puerto Varas'),
(253, 14, 'Castro'),
(254, 14, 'Ancud'),
(255, 14, 'Chonchi'),
(256, 14, 'Curaco de Vélez'),
(257, 14, 'Dalcahue'),
(258, 14, 'Puqueldón'),
(259, 14, 'Queilén'),
(260, 14, 'Quellón'),
(261, 14, 'Quemchi'),
(262, 14, 'Quinchao'),
(263, 14, 'Osorno'),
(264, 14, 'Puerto Octay'),
(265, 14, 'Purranque'),
(266, 14, 'Puyehue'),
(267, 14, 'Río Negro'),
(268, 14, 'San Juan de la Costa'),
(269, 14, 'San Pablo'),
(270, 14, 'Chaitén'),
(271, 14, 'Futaleufú'),
(272, 14, 'Hualaihué'),
(273, 14, 'Palena'),
(274, 15, 'Coyhaique'),
(275, 15, 'Lago Verde'),
(276, 15, 'Aysén'),
(277, 15, 'Cisnes'),
(278, 15, 'Guaitecas'),
(279, 15, 'Cochrane'),
(280, 15, 'O\'Higgins'),
(281, 15, 'Tortel'),
(282, 15, 'Chile Chico'),
(283, 15, 'Río Ibáñez'),
(284, 16, 'Punta Arenas'),
(285, 16, 'Laguna Blanca'),
(286, 16, 'Río Verde'),
(287, 16, 'San Gregorio'),
(288, 16, 'Cabo de Hornos'),
(289, 16, 'Antártica'),
(290, 16, 'Porvenir'),
(291, 16, 'Primavera'),
(292, 16, 'Timaukel'),
(293, 16, 'Natales'),
(294, 16, 'Torres del Paine'),
(295, 7, 'Santiago'),
(296, 7, 'Cerrillos'),
(297, 7, 'Cerro Navia'),
(298, 7, 'Conchalí'),
(299, 7, 'El Bosque'),
(300, 7, 'Estación Central'),
(301, 7, 'Huechuraba'),
(302, 7, 'Independencia'),
(303, 7, 'La Cisterna'),
(304, 7, 'La Florida'),
(305, 7, 'La Granja'),
(306, 7, 'La Pintana'),
(307, 7, 'La Reina'),
(308, 7, 'Las Condes'),
(309, 7, 'Lo Barnechea'),
(310, 7, 'Lo Espejo'),
(311, 7, 'Lo Prado'),
(312, 7, 'Macul'),
(313, 7, 'Maipú'),
(314, 7, 'Ñuñoa'),
(315, 7, 'Pedro Aguirre Cerda'),
(316, 7, 'Peñalolén'),
(317, 7, 'Providencia'),
(318, 7, 'Pudahuel'),
(319, 7, 'Quilicura'),
(320, 7, 'Quinta Normal'),
(321, 7, 'Recoleta'),
(322, 7, 'Renca'),
(323, 7, 'San Joaquín'),
(324, 7, 'San Miguel'),
(325, 7, 'San Ramón'),
(326, 7, 'Vitacura'),
(327, 7, 'Puente Alto'),
(328, 7, 'Pirque'),
(329, 7, 'San José de Maipo'),
(330, 7, 'Colina'),
(331, 7, 'Lampa'),
(332, 7, 'Til Til'),
(333, 7, 'San Bernardo'),
(334, 7, 'Buin'),
(335, 7, 'Calera de Tango'),
(336, 7, 'Paine'),
(337, 7, 'Melipilla'),
(338, 7, 'Alhué'),
(339, 7, 'Curacaví'),
(340, 7, 'María Pinto'),
(341, 7, 'San Pedro'),
(342, 7, 'Talagante'),
(343, 7, 'El Monte'),
(344, 7, 'Isla de Maipo'),
(345, 7, 'Padre Hurtado'),
(346, 7, 'Peñaflor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre`) VALUES
(1, 'Región de Arica y Parinacota'),
(2, 'Región de Tarapacá'),
(3, 'Región de Antofagasta'),
(4, 'Región de Atacama'),
(5, 'Región de Coquimbo'),
(6, 'Región de Valparaíso'),
(7, 'Región Metropolitana de Santiago'),
(8, 'Región del Libertador General Bernardo O\'Higgins'),
(9, 'Región del Maule'),
(10, 'Región de Ñuble'),
(11, 'Región del Biobío'),
(12, 'Región de La Araucanía'),
(13, 'Región de Los Ríos'),
(14, 'Región de Los Lagos'),
(15, 'Región Aysén del General Carlos Ibáñez del Campo'),
(16, 'Región de Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

CREATE TABLE `voto` (
  `id` int(10) UNSIGNED NOT NULL,
  `rut` varchar(10) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `alias` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `region` int(10) UNSIGNED NOT NULL,
  `comuna` int(10) UNSIGNED NOT NULL,
  `candidato` varchar(10) NOT NULL,
  `como_entero` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comuna_region` (`id_region`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `voto`
--
ALTER TABLE `voto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `FK_comuna_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
