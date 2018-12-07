-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 07 déc. 2018 à 17:18
-- Version du serveur :  10.1.26-MariaDB
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `btime`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`) VALUES
(1, 'beer', 'assets/icon/beer.png'),
(2, 'star', 'assets/icon/star.png');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `poster` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `place_id`, `name`, `created_date`, `start_date`, `end_date`, `description`, `price`, `poster`, `owner_id`) VALUES
(1, 2, 'L’événement du siècle', '2018-11-30 14:35:09', '2018-11-30 08:00:00', '2018-11-30 23:00:00', 'Vivamus dapibus tempus ligula ac tempus. Ut viverra augue ligula. Cras in lectus at magna fermentum condimentum. Ut enim velit, aliquam ut iaculis non, venenatis vel augue. Pellentesque fermentum fermentum varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent gravida felis eu ex rutrum venenatis. Nam posuere auctor eros vitae mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor quam enim, quis rhoncus sem aliquet sit amet. Duis ac faucibus massa. Aenean gravida aliquam dapibus. Nulla id lacus sed mi rhoncus interdum.\r\n', 25, '', 2),
(2, 1, 'L’événement envers de terre', '2018-11-30 14:37:51', '2018-12-13 08:00:00', '2018-12-16 18:00:00', 'Babloblu dapibus tempus ligula ac tempus. Ut viverra augue ligula. Cras in lectus at magna fermentum condimentum. Ut enim velit, aliquam ut iaculis non, venenatis vel augue. Pellentesque fermentum fermentum varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent gravida felis eu ex rutrum venenatis. Nam posuere auctor eros vitae mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor quam enim, quis rhoncus sem aliquet sit amet. Duis ac faucibus massa. Aenean gravida aliquam dapibus. Nulla id lacus sed mi rhoncus interdum\r\n', 10, '', 1),
(3, 3, 'Débat sur Batman VS Superman', '2018-11-30 14:41:09', '2018-11-16 08:00:00', '2018-11-20 17:00:00', 'Vivamus dapibus tempus ligula ac tempus. Ut viverra augue ligula. Cras in lectus at magna fermentum condimentum. Ut enim velit, aliquam ut iaculis non, venenatis vel augue. Pellentesque fermentum fermentum varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent gravida felis eu ex rutrum venenatis. Nam posuere auctor eros vitae mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor quam enim, quis rhoncus sem aliquet sit amet. Duis ac faucibus massa. Aenean gravida aliquam dapibus. Nulla id lacus sed mi rhoncus interdum.\r\n', NULL, '', 3),
(4, 3, 'Un grand pas pour oui', '2018-12-03 14:49:59', '2018-12-10 00:00:00', '2018-12-11 00:00:00', 'Suspendisse accumsan enim ligula. Nunc aliquam dignissim ex ac molestie. Morbi sagittis sagittis mauris, non commodo nisl mollis ut. Donec auctor vel mi quis hendrerit. Nullam hendrerit lectus et sem dapibus commodo. Vestibulum sodales massa et tempor dictum. Aliquam non dui dapibus, mattis purus at, malesuada dolor. Vestibulum posuere fringilla sapien, sit amet interdum ante scelerisque ornare. Suspendisse vitae venenatis arcu. In sed hendrerit mauris, nec mattis sem. Quisque tincidunt est ipsum, vel fringilla orci suscipit a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut aliquam tempus ante sed consectetur.', 2.5, '', 2),
(5, 1, 'Bonjour le tewst', '2018-12-04 17:34:57', '2018-12-04 00:00:00', '2018-12-04 00:00:00', 'ffffrfrvergvfsdbrdtrshtrhjeyhnjetyhnjtynty', 5, '', 1),
(6, 2, 'Aujourd\'hui c\'est pas demain', '2018-12-05 14:29:30', '2018-12-05 14:26:48', '2018-12-06 23:59:00', 'grougrougrogurogurogrougrogrougrougrogurgo', NULL, '', 1),
(7, 1, 'Test 2', '2018-12-05 14:32:38', '2018-12-05 14:31:50', '2018-12-28 00:00:00', 'fefedfefefefe', 1, '', 1),
(8, 1, 'Test 3', '2018-12-05 14:41:55', '2018-12-20 10:00:58', '2018-12-21 23:00:00', 'meta meta meta meta mon mon', 3, '', 1),
(9, 1, 'Test 4', '2018-12-05 14:45:43', '2018-12-15 09:00:44', '2018-12-15 23:00:00', 'lolo lala lolol loal  lao oal oalao aoa aloa oloa aolal', 35, '', 1),
(10, 3, 'Test 5', '2018-12-05 17:18:26', '2018-12-05 17:15:16', '2018-12-05 23:59:00', 'tous qui marche', 9, '', 1),
(11, 3, 'Test upload', '2018-12-06 10:35:58', '2018-12-06 10:34:08', '2018-12-28 00:59:00', 'this is a upload test', NULL, '7c4815024a269a3d748c8644cc84adab.jpeg', 1),
(13, 2, 'Upload 2 TEST', '2018-12-06 12:17:11', '2018-12-06 12:16:52', '2018-12-06 23:59:00', 'oui', NULL, '1604d0895f897029cc1c02e0f9f036e7.jpeg', 1),
(14, 2, 'Test6', '2018-12-07 09:52:25', '2018-12-07 09:50:18', '2018-12-08 00:59:00', 'Donec vulputate neque metus, vel vestibulum risus malesuada ut. Donec eu efficitur ante, vel elementum leo. Suspendisse in hendrerit ipsum. Ut dictum, leo at convallis blandit, erat velit vehicula diam, non tincidunt justo tortor quis libero. Quisque et leo sem. Cras consequat egestas mi, eu fermentum metus finibus vel. Sed maximus dui in erat bibendum, eget eleifend arcu vehicula. Etiam et tortor posuere, feugiat sapien at, congue dolor. Proin a leo vitae lectus commodo consequat.', 1, '3486612cdd3663e86c6ef404eebc0a95.jpeg', 7),
(15, 1, 'Aloween', '2018-12-07 10:00:48', '2018-12-25 10:00:14', '2018-12-26 00:59:00', 'Donec vulputate neque metus, vel vestibulum risus malesuada ut. Donec eu efficitur ante, vel elementum leo. Suspendisse in hendrerit ipsum. Ut dictum, leo at convallis blandit, erat velit vehicula diam, non tincidunt justo tortor quis libero. Quisque et leo sem. Cras consequat egestas mi, eu fermentum metus finibus vel. Sed maximus dui in erat bibendum, eget eleifend arcu vehicula. Etiam et tortor posuere, feugiat sapien at, congue dolor. Proin a leo vitae lectus commodo consequat.', NULL, '8b2ca1e67bdc7cb1fe43d383bc220f20.png', 1),
(16, 3, 'L\'événement de fou avec fham', '2018-12-07 10:08:26', '2018-12-15 10:07:18', '2018-12-21 20:10:00', 'oui les pokémon c\'est cool', 123, 'c39146f3b05a1efecc062379fd0b3d7e.jpeg', 7);

-- --------------------------------------------------------

--
-- Structure de la table `event_categories`
--

CREATE TABLE `event_categories` (
  `event_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `event_categories`
--

INSERT INTO `event_categories` (`event_id`, `categories_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2),
(5, 1),
(6, 1),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 2),
(10, 1),
(11, 2),
(13, 1),
(13, 2),
(14, 1),
(16, 1),
(16, 2);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20181203152413'),
('20181203152824'),
('20181203153438'),
('20181203153600');

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`event_id`, `user_id`, `booking_number`) VALUES
(1, 2, '987654'),
(2, 1, '856321'),
(3, 1, '224433'),
(3, 3, '554433');

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `place`
--

INSERT INTO `place` (`id`, `name`, `adress`, `zip`, `country`, `city`) VALUES
(1, 'Le chemin', '5 rue du chemin', 46000, 'France', 'Cahors'),
(2, 'A coté du lac', '6, Quai des Belges', 13500, 'France', 'MARTIGUES'),
(3, 'Salle des fêtes', '26, rue Clement Marot', 24000, 'France', 'PÉRIGUEUX');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `mail`, `password`, `roles`) VALUES
(1, 'Batman', 'bat@gmail.com', '123456', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(2, 'Aquaman', 'aqua@gmail.com', '123456', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(3, 'superman', 'super@gmail.com', '$2y$13$ky8/5FMW4wg3mYG9jwy43.dd3PhMM4tvhNurjhCtJlanpjdoB6LOC', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(6, 'test', 'test@gmail.com', '$2y$13$7F04D5bNI6SMtdgL6nUw.ecTQfNfu.wZj/rvgAUiM50mbw5pB5Auy', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(7, 'fham', 'fham@gmail.com', '$2y$13$4DsrbccPdwa1dYW/x3B4QOtXBhh4GWxMzhF3ftwf/kRFRU2ufpTam', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(8, 'titi', 'titi@gmail.com', '$2y$13$BUb4OHzAwsBFMqOcp.ijrOEubN.u73GZWwzcGLwTN5kL/Bz4n5wNm', 'a:1:{i:0;s:9:\"ROLE_USER\";}');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526C71F7E88B` (`event_id`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3BAE0AA7DA6A219` (`place_id`),
  ADD KEY `IDX_3BAE0AA77E3C61F9` (`owner_id`);

--
-- Index pour la table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`event_id`,`categories_id`),
  ADD KEY `IDX_621D9F4771F7E88B` (`event_id`),
  ADD KEY `IDX_621D9F47A21214B7` (`categories_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`event_id`,`user_id`),
  ADD KEY `IDX_AB55E24F71F7E88B` (`event_id`),
  ADD KEY `IDX_AB55E24FA76ED395` (`user_id`);

--
-- Index pour la table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_3BAE0AA77E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_3BAE0AA7DA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`);

--
-- Contraintes pour la table `event_categories`
--
ALTER TABLE `event_categories`
  ADD CONSTRAINT `FK_621D9F4771F7E88B` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_621D9F47A21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `FK_AB55E24F71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `FK_AB55E24FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
