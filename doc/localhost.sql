-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 23 déc. 2023 à 13:58
-- Version du serveur : 8.0.30
-- Version de PHP : 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `recettes`
--
CREATE DATABASE IF NOT EXISTS `recettes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `recettes`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Entrée'),
(2, 'Plat'),
(3, 'Dessert'),
(4, 'Hiver'),
(5, 'Eté'),
(6, 'Recette française'),
(7, 'Recette italienne');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231209134122', '2023-12-09 13:41:47', 11),
('DoctrineMigrations\\Version20231212194415', '2023-12-12 19:44:41', 25),
('DoctrineMigrations\\Version20231212195851', '2023-12-12 19:59:04', 79),
('DoctrineMigrations\\Version20231214095529', '2023-12-14 09:55:46', 26),
('DoctrineMigrations\\Version20231214121847', '2023-12-14 12:19:00', 83),
('DoctrineMigrations\\Version20231216095000', '2023-12-16 09:50:17', 32),
('DoctrineMigrations\\Version20231216124605', '2023-12-16 12:46:26', 10),
('DoctrineMigrations\\Version20231216125328', '2023-12-16 12:53:36', 52),
('DoctrineMigrations\\Version20231216131148', '2023-12-16 13:11:57', 16),
('DoctrineMigrations\\Version20231216131841', '2023-12-16 13:18:51', 45),
('DoctrineMigrations\\Version20231222153842', '2023-12-22 15:38:52', 14);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`) VALUES
(1, 'Lardons'),
(2, 'Pomme de terre'),
(3, 'Carotte'),
(4, 'Lard fumé'),
(5, 'Oignon'),
(6, 'Boeuf'),
(7, 'Coulis de tomate'),
(8, 'Mozzarella'),
(9, 'Pâte à pizza'),
(10, 'Feuille de lasagne'),
(11, 'Boeuf haché'),
(12, 'Purée de tomate'),
(13, 'Carotte'),
(14, 'Bière brune'),
(15, 'Reblochon'),
(16, 'Vin blanc'),
(17, 'Crème fraiche');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_quantity`
--

CREATE TABLE `ingredient_quantity` (
  `ingredient_id` int NOT NULL,
  `quantity_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient_quantity`
--

INSERT INTO `ingredient_quantity` (`ingredient_id`, `quantity_id`) VALUES
(1, 3),
(2, 4),
(6, 4),
(14, 7),
(15, 1),
(16, 5),
(17, 6);

-- --------------------------------------------------------

--
-- Structure de la table `quantity`
--

CREATE TABLE `quantity` (
  `id` int NOT NULL,
  `number` double NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quantity`
--

INSERT INTO `quantity` (`id`, `number`, `unit`) VALUES
(1, 1, NULL),
(2, 1.5, NULL),
(3, 200, 'g'),
(4, 1, 'kg'),
(5, 15, 'cl'),
(6, 200, 'ml'),
(7, 1, 'L');

-- --------------------------------------------------------

--
-- Structure de la table `recipe`
--

CREATE TABLE `recipe` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cook_time` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe`
--

INSERT INTO `recipe` (`id`, `name`, `picture`, `description`, `cook_time`, `servings`, `created_at`, `updated_at`) VALUES
(1, 'Tartiflette', NULL, 'La tartiflette est un plat traditionnel de la région de Savoie en France. Il est préparé à base de pommes de terre, de lardons fumés, d\'oignons, de vin blanc et de reblochon, un fromage local.', '20 minutes', 6, '2023-12-09 14:11:12', '2023-12-09 14:11:12'),
(2, 'Carbonade flammande', NULL, 'La carbonnade flamande est un plat traditionnel de la cuisine belge. Il s\'agit d\'un ragoût de bœuf mijoté dans de la bière brune, avec des oignons, du pain d\'épices, du lard fumé et des épices.', '45 minutes', 6, '2023-12-09 14:14:41', '2023-12-09 14:14:41'),
(3, 'Lasagne', NULL, 'Les lasagnes sont un plat italien classique et délicieux. Les lasagnes à la bolognaise sont particulièrement populaires.', '45 minutes', 6, '2023-12-09 14:16:39', '2023-12-09 14:16:39'),
(4, 'Pizza Margherita', NULL, 'La pizza Margherita est une pizza italienne classique, originaire de Naples. Elle est garnie de tomates, de mozzarella, de basilic frais et d’huile d’olive extra vierge.', '20 minutes', 2, '2023-12-11 19:55:27', '2023-12-11 19:55:27');

-- --------------------------------------------------------

--
-- Structure de la table `recipe_category`
--

CREATE TABLE `recipe_category` (
  `recipe_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_category`
--

INSERT INTO `recipe_category` (`recipe_id`, `category_id`) VALUES
(1, 2),
(1, 4),
(2, 4),
(2, 6),
(4, 5),
(4, 7);

-- --------------------------------------------------------

--
-- Structure de la table `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`) VALUES
(1, 1),
(1, 2),
(1, 15),
(1, 16),
(1, 17),
(2, 6),
(2, 14),
(3, 10),
(3, 11),
(4, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Structure de la table `recipe_step`
--

CREATE TABLE `recipe_step` (
  `recipe_id` int NOT NULL,
  `step_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_step`
--

INSERT INTO `recipe_step` (`recipe_id`, `step_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `step`
--

CREATE TABLE `step` (
  `id` int NOT NULL,
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `step`
--

INSERT INTO `step` (`id`, `instruction`, `priority`) VALUES
(1, 'Eplucher les pommes de terre, les couper en dés, bien les rincer et les essuyer dans un torchon propre.', 1),
(2, 'Faire chauffer l\'huile dans une poêle, y faire fondre les oignons.', 2),
(3, 'Lorsque les oignons sont fondus, ajouter les pommes de terre et les faire dorer de tous les côtés.', 3),
(4, 'Lorsqu\'elles sont dorées, ajouter les lardons et finir de cuire. Éponger le surplus de gras avec une feuille de papier essuie-tout.', 4);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ingredient_quantity`
--
ALTER TABLE `ingredient_quantity`
  ADD PRIMARY KEY (`ingredient_id`,`quantity_id`),
  ADD KEY `IDX_EDF546B8933FE08C` (`ingredient_id`),
  ADD KEY `IDX_EDF546B87E8B4AFC` (`quantity_id`);

--
-- Index pour la table `quantity`
--
ALTER TABLE `quantity`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`recipe_id`,`category_id`),
  ADD KEY `IDX_70DCBC5F59D8A214` (`recipe_id`),
  ADD KEY `IDX_70DCBC5F12469DE2` (`category_id`);

--
-- Index pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `IDX_22D1FE1359D8A214` (`recipe_id`),
  ADD KEY `IDX_22D1FE13933FE08C` (`ingredient_id`);

--
-- Index pour la table `recipe_step`
--
ALTER TABLE `recipe_step`
  ADD PRIMARY KEY (`recipe_id`,`step_id`),
  ADD KEY `IDX_3CA2A4E359D8A214` (`recipe_id`),
  ADD KEY `IDX_3CA2A4E373B21E9C` (`step_id`);

--
-- Index pour la table `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `quantity`
--
ALTER TABLE `quantity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `step`
--
ALTER TABLE `step`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ingredient_quantity`
--
ALTER TABLE `ingredient_quantity`
  ADD CONSTRAINT `FK_EDF546B87E8B4AFC` FOREIGN KEY (`quantity_id`) REFERENCES `quantity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EDF546B8933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `FK_70DCBC5F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_70DCBC5F59D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `FK_22D1FE1359D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_22D1FE13933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipe_step`
--
ALTER TABLE `recipe_step`
  ADD CONSTRAINT `FK_3CA2A4E359D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3CA2A4E373B21E9C` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
