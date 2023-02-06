-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 01 fév. 2023 à 20:06
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressFood`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `rue_adresse` varchar(200) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`client_id`, `prenom`, `nom`, `email`, `telephone`, `rue_adresse`, `code_postal`, `ville`, `mot_de_passe`) VALUES
(1, 'Ariana', 'Pacheco', 'metus.vitae@icloud.com', '05 85 53 66 09', '784-6247 Nunc Avenue', '01804', 'Béziers', 'OTV54IGM2VP'),
(2, 'Jared', 'Cross', 'commodo.tincidunt@hotmail.net', '08 46 74 44 25', 'Ap #211-8778 Eros. St.', '49428', 'Nanterre', 'BBD08SEN6SI'),
(3, 'Ciara', 'Keller', 'cum.sociis@yahoo.org', '04 26 56 73 38', '1762 In St.', '48533', 'Colombes', 'BNY71NMV1ST'),
(4, 'Leonard', 'Huber', 'erat.volutpat@aol.edu', '02 78 64 26 17', 'Ap #604-9817 Aliquam Av.', '45518', 'Issy-les-Moulineaux', 'QZS63LNH4SO'),
(5, 'Palmer', 'Landry', 'nibh.phasellus@icloud.net', '07 08 56 91 46', '1057 Molestie Street', '91316', 'Le Mans', 'LXD75WJI1YR');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `commande_id` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `statut_commande` int(5) NOT NULL,
  `prix_total` float NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`commande_id`, `date_commande`, `statut_commande`, `prix_total`, `livreur_id`, `client_id`) VALUES
(1, '2023-01-23 15:10:13', 3, 30.6, 2, 1),
(2, '2023-01-27 20:10:13', 2, 25.7, 3, 3),
(3, '2023-01-26 18:29:19', 1, 15, 1, 5),
(4, '2023-01-27 20:44:14', 3, 6.5, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `expressFood_restaurateur`
--

CREATE TABLE `expressFood_restaurateur` (
  `expressFood_restaurateur_id` int(11) NOT NULL,
  `stock_Plat` int(11) NOT NULL,
  `stock_Plat2` int(11) NOT NULL,
  `stock_Dessert` int(11) NOT NULL,
  `stock_Dessert2` int(11) NOT NULL,
  `mot_de_passe` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `expressFood_restaurateur`
--

INSERT INTO `expressFood_restaurateur` (`expressFood_restaurateur_id`, `stock_Plat`, `stock_Plat2`, `stock_Dessert`, `stock_Dessert2`, `mot_de_passe`, `email`) VALUES
(1, 30, 25, 30, 25, 'zefiz482FTZttr', 'expressfood@food.com');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `livreur_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `est_disponible` tinyint(1) NOT NULL,
  `stock_plat` int(11) NOT NULL,
  `stock_plat2` int(11) NOT NULL,
  `stock_dessert` int(11) NOT NULL,
  `stock_dessert2` int(11) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  `expressFood_restaurateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`livreur_id`, `nom`, `est_disponible`, `stock_plat`, `stock_plat2`, `stock_dessert`, `stock_dessert2`, `latitude`, `longitude`, `email`, `mot_de_passe`, `expressFood_restaurateur_id`) VALUES
(1, 'Cesar', 1, 4, 2, 2, 4, '9.6970708992', '67.0011870208', 'aliquam.adig@pronmail.com', 'sefguy43jsdfg753', 1),
(2, 'Brutus', 0, 8, 1, 3, 2, '42.3933791232', '-171.2973533184', 'dis.parturient.montes@hotmail.com', 'SBY88PVI7NI', 1),
(3, 'Caton', 1, 1, 2, 2, 1, '-68.4104108032', '49.5545800704', 'in@google.org', 'dfbegf45df1334', 1);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `plat_id` int(11) NOT NULL,
  `nom_plat` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `prix` float NOT NULL,
  `type_du_plat` int(11) NOT NULL,
  `est_du_jour` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`plat_id`, `nom_plat`, `description`, `prix`, `type_du_plat`, `est_du_jour`) VALUES
(1, 'Blanquette de veau', 'Une délicieuse blanquette', 8.8, 1, 0),
(2, 'Chili con carne', 'Un chili aux saveurs épicées.', 7.5, 1, 0),
(3, 'Lasagnes', 'Des lasagnes italiennes.', 6.5, 1, 1),
(4, 'Moelleux au chocolat', 'Un gâteau fort en chocolat.', 5, 2, 0),
(5, 'Paris-Brest', 'Une pâtisserie légendaire.', 6.2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `plats_commande`
--

CREATE TABLE `plats_commande` (
  `plat_commande_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `qt_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plats_commande`
--

INSERT INTO `plats_commande` (`plat_commande_id`, `commande_id`, `plat_id`, `qt_plat`) VALUES
(1, 1, 1, 2),
(2, 1, 3, 2),
(3, 2, 3, 3),
(4, 2, 5, 1),
(5, 3, 2, 2),
(6, 4, 3, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`commande_id`),
  ADD KEY `livreur_id` (`livreur_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `expressFood_restaurateur`
--
ALTER TABLE `expressFood_restaurateur`
  ADD PRIMARY KEY (`expressFood_restaurateur_id`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`livreur_id`),
  ADD KEY `restaurateur_id` (`expressFood_restaurateur_id`),
  ADD KEY `expressFood_restaurateur_id` (`expressFood_restaurateur_id`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`plat_id`);

--
-- Index pour la table `plats_commande`
--
ALTER TABLE `plats_commande`
  ADD PRIMARY KEY (`plat_commande_id`),
  ADD KEY `commande_id` (`commande_id`),
  ADD KEY `plat_id` (`plat_id`),
  ADD KEY `plat1_id` (`plat_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `commande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `expressFood_restaurateur`
--
ALTER TABLE `expressFood_restaurateur`
  MODIFY `expressFood_restaurateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `livreur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `plat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `plats_commande`
--
ALTER TABLE `plats_commande`
  MODIFY `plat_commande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`livreur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`expressFood_restaurateur_id`) REFERENCES `expressFood_restaurateur` (`expressFood_restaurateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plats_commande`
--
ALTER TABLE `plats_commande`
  ADD CONSTRAINT `plats_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plats_commande_ibfk_2` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`plat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
