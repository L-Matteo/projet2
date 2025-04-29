-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 29 avr. 2025 à 21:15
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `easybee_java`
--

-- --------------------------------------------------------

--
-- Structure de la table `bonlivraison`
--

DROP TABLE IF EXISTS `bonlivraison`;
CREATE TABLE IF NOT EXISTS `bonlivraison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateLivraison` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `bonlivraison`
--

INSERT INTO `bonlivraison` (`id`, `dateLivraison`) VALUES
(4, '2025-09-05'),
(5, '2025-10-05'),
(6, '2025-11-05');

-- --------------------------------------------------------

--
-- Structure de la table `caisse`
--

DROP TABLE IF EXISTS `caisse`;
CREATE TABLE IF NOT EXISTS `caisse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomCaisse` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `idParamCaisse` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idParamCaisse` (`idParamCaisse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Structure de la table `categoriesalarie`
--

DROP TABLE IF EXISTS `categoriesalarie`;
CREATE TABLE IF NOT EXISTS `categoriesalarie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomCat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `categoriesalarie`
--

INSERT INTO `categoriesalarie` (`id`, `nomCat`) VALUES
(1, 'vendeur'),
(2, 'preparateur');

-- --------------------------------------------------------

--
-- Structure de la table `catproduit`
--

DROP TABLE IF EXISTS `catproduit`;
CREATE TABLE IF NOT EXISTS `catproduit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomCat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Structure de la table `cmdeapprodepot`
--

DROP TABLE IF EXISTS `cmdeapprodepot`;
CREATE TABLE IF NOT EXISTS `cmdeapprodepot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `statutCommande` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `idCatSalarie` int NOT NULL,
  `nomCommande` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCat` (`idCatSalarie`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `cmdeapprodepot`
--

INSERT INTO `cmdeapprodepot` (`id`, `dateCommande`, `statutCommande`, `idCatSalarie`, `nomCommande`) VALUES
(4, '2025-09-01', 'livrée', 1, 'commande de pots'),
(6, '2025-10-01', 'en attente', 1, 'commande de ruches'),
(7, '2025-11-01', 'en attente', 2, 'commande enfumoir');

-- --------------------------------------------------------

--
-- Structure de la table `detailcmd`
--

DROP TABLE IF EXISTS `detailcmd`;
CREATE TABLE IF NOT EXISTS `detailcmd` (
  `idProduit` int NOT NULL,
  `idBonLivraison` int NOT NULL,
  `qtePrepa` int NOT NULL,
  `qteRecu` int NOT NULL,
  `idCmdeApproDepot` int NOT NULL,
  PRIMARY KEY (`idProduit`,`idBonLivraison`),
  KEY `idBonLivraison` (`idBonLivraison`),
  KEY `idCmdeApproDepot` (`idCmdeApproDepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `detailcmd`
--

INSERT INTO `detailcmd` (`idProduit`, `idBonLivraison`, `qtePrepa`, `qteRecu`, `idCmdeApproDepot`) VALUES
(4, 4, 25, 0, 4),
(9, 5, 0, 0, 6),
(12, 6, 5, 0, 7);

-- --------------------------------------------------------

--
-- Structure de la table `detailproduit`
--

DROP TABLE IF EXISTS `detailproduit`;
CREATE TABLE IF NOT EXISTS `detailproduit` (
  `idProduit` int NOT NULL,
  `idCmdeApproDepot` int NOT NULL,
  `qteCmde` int NOT NULL,
  PRIMARY KEY (`idProduit`,`idCmdeApproDepot`),
  KEY `idCmdeApproDepot` (`idCmdeApproDepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `detailproduit`
--

INSERT INTO `detailproduit` (`idProduit`, `idCmdeApproDepot`, `qteCmde`) VALUES
(4, 4, 25),
(9, 6, 10),
(12, 7, 5);

-- --------------------------------------------------------

--
-- Structure de la table `operationcaisse`
--

DROP TABLE IF EXISTS `operationcaisse`;
CREATE TABLE IF NOT EXISTS `operationcaisse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateOperation` date NOT NULL,
  `heureOperation` time NOT NULL,
  `totalPaiement` int NOT NULL,
  `idCaisse` int NOT NULL,
  `idCat` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCaisse` (`idCaisse`),
  KEY `idCat` (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Structure de la table `parametrecaisse`
--

DROP TABLE IF EXISTS `parametrecaisse`;
CREATE TABLE IF NOT EXISTS `parametrecaisse` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codeProduit` int NOT NULL,
  `stockMag` int NOT NULL,
  `stockMiniMag` int NOT NULL,
  `designationProduit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `prixPdt` float NOT NULL,
  `stockEntrepot` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `codeProduit`, `stockMag`, `stockMiniMag`, `designationProduit`, `prixPdt`, `stockEntrepot`) VALUES
(4, 1001, 50, 20, 'Pot en verre 250g', 0.5, 100),
(5, 1002, 40, 20, 'Pot en verre 500g', 0.6, 80),
(6, 1003, 100, 30, 'Couvercle doré pour pot', 0.1, 200),
(7, 1004, 200, 50, 'Étiquettes personnalisables', 0.15, 500),
(8, 1005, 10, 2, 'Ruche Dadant 10 cadres', 85, 15),
(9, 1006, 5, 1, 'Ruche Dadant 20 cadres', 110, 10),
(10, 1007, 60, 20, 'Cadres montés avec fil', 1.2, 100),
(11, 1008, 70, 30, 'Feuilles de cire gaufrée', 0.9, 120),
(12, 1009, 15, 5, 'Enfumoir inox', 25, 30),
(13, 1010, 20, 5, 'Lève-cadres', 8, 40),
(14, 1011, 25, 10, 'Brosse à abeilles', 4.5, 50),
(15, 1012, 4, 2, 'Extracteur manuel 4 cadres', 190, 6),
(16, 1013, 10, 3, 'Couteau à désoperculer', 15, 15),
(17, 1014, 20, 5, 'Seau alimentaire 10L', 6, 30),
(18, 1015, 25, 10, 'Nourrissement sirop', 12, 40),
(19, 1016, 30, 10, 'Pâte candi', 8, 50),
(20, 1017, 10, 5, 'Traitement Varroa Apivar', 18, 20),
(21, 1018, 12, 3, 'Blouson apiculteur', 35, 20),
(22, 1019, 18, 5, 'Gants cuir + toile', 12, 30),
(23, 1020, 15, 5, 'Chapeau avec voile', 18, 25);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
CREATE TABLE IF NOT EXISTS `salarie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matriculeSalarie` int NOT NULL,
  `nomSalarie` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `prenomSalarie` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `idCat` int NOT NULL,
  `identifiant` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `motDePasse` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idCat` (`idCat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`id`, `matriculeSalarie`, `nomSalarie`, `prenomSalarie`, `idCat`, `identifiant`, `motDePasse`) VALUES
(1, 1, 'adminVendeur', 'adminVendeur', 1, 'adminVendeur', 'adminVendeur'),
(2, 2, 'adminPrepa', 'adminPrepa', 2, 'adminPrepa', 'adminPrepa');

-- --------------------------------------------------------

--
-- Structure de la table `tarificationproduit`
--

DROP TABLE IF EXISTS `tarificationproduit`;
CREATE TABLE IF NOT EXISTS `tarificationproduit` (
  `idProduit` int NOT NULL,
  `idOpeCaisse` int NOT NULL,
  `tauxTVA` float NOT NULL,
  `prixUnitaire` float NOT NULL,
  PRIMARY KEY (`idProduit`,`idOpeCaisse`),
  KEY `idOpeCaisse` (`idOpeCaisse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `caisse`
--
ALTER TABLE `caisse`
  ADD CONSTRAINT `caisse_ibfk_1` FOREIGN KEY (`idParamCaisse`) REFERENCES `parametrecaisse` (`id`);

--
-- Contraintes pour la table `cmdeapprodepot`
--
ALTER TABLE `cmdeapprodepot`
  ADD CONSTRAINT `cmdeapprodepot_ibfk_1` FOREIGN KEY (`idCatSalarie`) REFERENCES `categoriesalarie` (`id`);

--
-- Contraintes pour la table `detailcmd`
--
ALTER TABLE `detailcmd`
  ADD CONSTRAINT `detailcmd_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `detailcmd_ibfk_2` FOREIGN KEY (`idBonLivraison`) REFERENCES `bonlivraison` (`id`),
  ADD CONSTRAINT `detailcmd_ibfk_3` FOREIGN KEY (`idCmdeApproDepot`) REFERENCES `cmdeapprodepot` (`id`);

--
-- Contraintes pour la table `detailproduit`
--
ALTER TABLE `detailproduit`
  ADD CONSTRAINT `detailproduit_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `detailproduit_ibfk_2` FOREIGN KEY (`idCmdeApproDepot`) REFERENCES `cmdeapprodepot` (`id`);

--
-- Contraintes pour la table `operationcaisse`
--
ALTER TABLE `operationcaisse`
  ADD CONSTRAINT `operationcaisse_ibfk_1` FOREIGN KEY (`idCaisse`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `operationcaisse_ibfk_2` FOREIGN KEY (`idCat`) REFERENCES `categoriesalarie` (`id`);

--
-- Contraintes pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD CONSTRAINT `salarie_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `categoriesalarie` (`id`);

--
-- Contraintes pour la table `tarificationproduit`
--
ALTER TABLE `tarificationproduit`
  ADD CONSTRAINT `tarificationproduit_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `tarificationproduit_ibfk_2` FOREIGN KEY (`idOpeCaisse`) REFERENCES `operationcaisse` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
