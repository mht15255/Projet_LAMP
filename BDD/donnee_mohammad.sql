SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `abonne_tp` (
  `NOM` varchar(50) DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL AUTO_INCREMENT,
  `PRENOM` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASS` varchar(50) NOT NULL,
  `ADRESSE` varchar(250) DEFAULT NULL,
  `IBAN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NB_BADGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `abonne_tp` (`NOM`, `NB_BADGE`, `PRENOM`, `EMAIL`, `PASS`, `ADRESSE`, `IBAN`) VALUES
('toto', 1, 'toto', 'toto@example.com', 'toto', '1, toto, totoville', 'toto toto toto toto toto'),
('titi', 2, 'titi', 'titi@example.com', 'titi', 'tit , rue de titi', 'titi titi titi titi titi');

CREATE TABLE IF NOT EXISTS `es` (
  `NOM` varchar(50) DEFAULT NULL,
  `ID_ES` int(11) NOT NULL AUTO_INCREMENT,
  `DIST_TRON` float NOT NULL,
  PRIMARY KEY (`ID_ES`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO `es` (`NOM`, `ID_ES`, `DIST_TRON`) VALUES
('Troy', 1, 10),
('Chmestar', 2, 20),
('Baalbeck', 3, 30),
('Fas', 4, 30),
('kasr hilal', 5, 40),
('kordoba', 6, 50),
('Nemours', 7, 60);

CREATE TABLE IF NOT EXISTS `ticket_na` (
  `ID_NA` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime NOT NULL,
  `ID_PAY` int(11) NOT NULL,
  `ID_VEH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_NA`),
  KEY `FK_TICKET_NA_ID_PAY` (`ID_PAY`),
  KEY `FK_TICKET_NA_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ticket_na` (`ID_NA`, `DATE_E`, `DATE_S`, `ID_PAY`, `ID_VEH`) VALUES
(1, '2017-09-23 02:05:00', '2017-09-09 02:48:00', 1, 2),
(2, '2017-09-09 05:13:00', '2017-09-09 05:48:00', 2, 3);

CREATE TABLE IF NOT EXISTS `ticket_tp` (
  `ID_TP` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL,
  `ID_VEH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TP`),
  KEY `FK_TICKET_TP_NB_BADGE` (`NB_BADGE`),
  KEY `FK_TICKET_TP_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ticket_tp` (`ID_TP`, `DATE_E`, `DATE_S`, `NB_BADGE`, `ID_VEH`) VALUES
(1, '2017-09-01 00:00:00', '2017-09-01 01:00:00', 1, 1),
(2, '2017-09-01 00:00:00', '2017-09-01 00:30:00', 2, 2);

CREATE TABLE IF NOT EXISTS `tronc` (
  `prix` float NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  `ID_ES` int(11) NOT NULL,
  PRIMARY KEY (`ID_VEH`,`ID_ES`),
  KEY `FK_TRONC_ID_ES` (`ID_ES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tronc` (`prix`, `ID_VEH`, `ID_ES`) VALUES
(10.52, 1, 1),
(10.52, 1, 2),
(10.52, 1, 3),
(10.52, 1, 4),
(10.52, 1, 5),
(10.52, 1, 6),
(10.52, 1, 7),
(15.52, 2, 1),
(15.52, 2, 2),
(15.52, 2, 3),
(15.52, 2, 4),
(15.52, 2, 5),
(15.52, 2, 6),
(15.52, 2, 7),
(20.52, 3, 1),
(20.52, 3, 2),
(20.52, 3, 3),
(20.52, 3, 4),
(20.52, 3, 5),
(20.52, 3, 6),
(20.52, 3, 7);

CREATE TABLE IF NOT EXISTS `type_pay` (
  `ID_PAY` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_PAY`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `type_pay` (`ID_PAY`, `NOM`) VALUES
(1, 'Carte Bancaire'),
(2, 'Espece');

CREATE TABLE IF NOT EXISTS `vehicule` (
  `ID_VEH` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_VEH` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `vehicule` (`ID_VEH`, `TYPE_VEH`) VALUES
(1, 'Automobile'),
(2, 'Moto'),
(3, 'Camion');


ALTER TABLE `ticket_na`
  ADD CONSTRAINT `FK_TICKET_NA_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_PAY` FOREIGN KEY (`ID_PAY`) REFERENCES `type_pay` (`ID_PAY`);

ALTER TABLE `ticket_tp`
  ADD CONSTRAINT `FK_TICKET_TP_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_TP_NB_BADGE` FOREIGN KEY (`NB_BADGE`) REFERENCES `abonne_tp` (`NB_BADGE`);

ALTER TABLE `tronc`
  ADD CONSTRAINT `FK_TRONC_ID_ES` FOREIGN KEY (`ID_ES`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TRONC_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`);
