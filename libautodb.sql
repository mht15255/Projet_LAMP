-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Sam 23 Septembre 2017 à 16:30
-- Version du serveur: 5.5.16
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `libautodb`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne_tp`
--

CREATE TABLE IF NOT EXISTS `abonne_tp` (
  `NOM` varchar(50) DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL AUTO_INCREMENT,
  `PRENOM` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASS` varchar(50) NOT NULL,
  `ADRESSE` varchar(250) DEFAULT NULL,
  `IBAN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NB_BADGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `abonne_tp`
--

INSERT INTO `abonne_tp` (`NOM`, `NB_BADGE`, `PRENOM`, `EMAIL`, `PASS`, `ADRESSE`, `IBAN`) VALUES
('Simpson', 1, 'Homer', 'homer@exemple.fr', 'passwd', '15 rue des roses ', 'FR76300010079412345678901'),
('Usomaki', 2, 'Naruto', 'naruto@exemple.com', 'passwd', '5 rue Nelson Mandela', 'FR76300010079412345678922'),
('Olivier', 3, 'Tom', 'olivier@exemple.fr', 'tututu', '8 boulvard des oliviers', 'FR76300010079412345678932'),
('Raphael', 4, 'Angelo', 'tortue@exemple.com', 'tortue', '4 avenue des tortues', 'FR76300010079412345678930');

-- --------------------------------------------------------

--
-- Structure de la table `es`
--

CREATE TABLE IF NOT EXISTS `es` (
  `NOM` varchar(50) DEFAULT NULL,
  `ID_ES` int(11) NOT NULL AUTO_INCREMENT,
  `DIST_TRON` float NOT NULL,
  `ID_TP` int(11) DEFAULT NULL,
  `ID_TP_TICKET_TP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ES`),
  KEY `FK_ES_ID_TP` (`ID_TP`),
  KEY `FK_ES_ID_TP_TICKET_TP` (`ID_TP_TICKET_TP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `es`
--

INSERT INTO `es` (`NOM`, `ID_ES`, `DIST_TRON`, `ID_TP`, `ID_TP_TICKET_TP`) VALUES
('Montpellier', 1, 23, NULL, NULL),
('La Grande Motte', 2, 17, NULL, NULL),
('Lunel', 3, 34, NULL, NULL),
('Nîmes', 4, 44, NULL, NULL),
('Avignon', 5, 21, NULL, NULL),
('Orange', 6, 12, NULL, NULL),
('Mornas', 7, 13, NULL, NULL),
('Bollène', 8, 33, NULL, NULL),
('Montélimar', 9, 25, NULL, NULL),
('Valence', 10, 47, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ticket_na`
--

CREATE TABLE IF NOT EXISTS `ticket_na` (
  `ID_NA` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime NOT NULL,
  `ID_PAY` int(11) NOT NULL,
  `ID_VEH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_NA`),
  KEY `FK_TICKET_NA_ID_PAY` (`ID_PAY`),
  KEY `FK_TICKET_NA_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ticket_tp`
--

CREATE TABLE IF NOT EXISTS `ticket_tp` (
  `ID_TP` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL,
  `ID_VEH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TP`),
  KEY `FK_TICKET_TP_NB_BADGE` (`NB_BADGE`),
  KEY `FK_TICKET_TP_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tronc`
--

CREATE TABLE IF NOT EXISTS `tronc` (
  `prix` float NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  `ID_ES` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_VEH`,`ID_ES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tronc`
--

INSERT INTO `tronc` (`prix`, `ID_VEH`, `ID_ES`) VALUES
(1.76, 1, '1'),
(1.4, 1, '2'),
(6.5, 1, '3'),
(5.5, 1, '4'),
(3.02, 1, '5'),
(1.5, 1, '6'),
(1.2, 1, '7'),
(4.8, 1, '8'),
(3.2, 1, '9'),
(6.8, 1, '10'),
(2.6, 2, '1'),
(1.96, 2, '2'),
(7.04, 2, '3'),
(6.6, 2, '4'),
(3.57, 2, '5'),
(1.83, 2, '6'),
(1.5, 2, '7'),
(5.63, 2, '8'),
(4.2, 2, '9'),
(7.75, 2, '10'),
(4.8, 3, '1'),
(3.5, 3, '2'),
(13.5, 3, '3'),
(6.6, 3, '4'),
(5.2, 3, '5'),
(2.5, 3, '6'),
(2.45, 3, '7'),
(10.2, 3, '8'),
(7.65, 3, '9'),
(13.2, 3, '10');

-- --------------------------------------------------------

--
-- Structure de la table `type_pay`
--

CREATE TABLE IF NOT EXISTS `type_pay` (
  `ID_PAY` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_PAY`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `type_pay`
--

INSERT INTO `type_pay` (`ID_PAY`, `NOM`) VALUES
(1, 'Carte_bancaire'),
(2, 'liquide');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE IF NOT EXISTS `vehicule` (
  `ID_VEH` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_VEH` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `vehicule`
--

INSERT INTO `vehicule` (`ID_VEH`, `TYPE_VEH`) VALUES
(1, 'Moto'),
(2, 'Automobile'),
(3, 'Poids Lourd');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `es`
--
ALTER TABLE `es`
  ADD CONSTRAINT `FK_ES_ID_TP_TICKET_TP` FOREIGN KEY (`ID_TP_TICKET_TP`) REFERENCES `ticket_tp` (`ID_TP`),
  ADD CONSTRAINT `FK_ES_ID_TP` FOREIGN KEY (`ID_TP`) REFERENCES `ticket_tp` (`ID_TP`);

--
-- Contraintes pour la table `ticket_na`
--
ALTER TABLE `ticket_na`
  ADD CONSTRAINT `FK_TICKET_NA_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_PAY` FOREIGN KEY (`ID_PAY`) REFERENCES `type_pay` (`ID_PAY`);

--
-- Contraintes pour la table `ticket_tp`
--
ALTER TABLE `ticket_tp`
  ADD CONSTRAINT `FK_TICKET_TP_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_TP_NB_BADGE` FOREIGN KEY (`NB_BADGE`) REFERENCES `abonne_tp` (`NB_BADGE`);

--
-- Contraintes pour la table `tronc`
--
ALTER TABLE `tronc`
  ADD CONSTRAINT `FK_TRONC_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
