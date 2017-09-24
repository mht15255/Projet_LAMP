
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
('Simpson', 1, 'Homer', 'homer@exemple.fr', 'passwd', '15 rue des roses ', 'FR76300010079412345678901'),
('Uzumaki', 2, 'Naruto', 'naruto@exemple.com', 'konoha', '5 rue Hashirama Senju', 'FR76300010079412345678922'),
('Olivier', 3, 'Tom', 'olivier@exemple.fr', 'tututu', '8 boulvard des oliviers', 'FR76300010079412345678932'),
('Raphael', 4, 'Turtle', 'Raph@exemple.com', 'cowabunga!', '4 avenue des tortues', 'FR76300010079412345678930'),
('Michelangelo', 5, 'Turtle', 'Mikey@exemple.com', 'pizza', '4 avenue des tortues', 'FR76300010079412345678931');



CREATE TABLE IF NOT EXISTS `es` (
  `NOM` varchar(50) DEFAULT NULL,
  `ID_ES` int(11) NOT NULL AUTO_INCREMENT,
  `DIST_TRON` float NOT NULL,
  PRIMARY KEY (`ID_ES`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;



INSERT INTO `es` (`NOM`, `ID_ES`, `DIST_TRON`) VALUES
('Montpellier', 1, 23),
('La Grande Motte', 2, 17),
('Lunel', 3, 34),
('Nîmes', 4, 44),
('Avignon', 5, 21),
('Orange', 6, 12),
('Mornas', 7, 13),
('Bollène', 8, 33),
('Montélimar', 9, 25),
('Valence', 10, 47);



CREATE TABLE IF NOT EXISTS `ticket_na` (
  `ID_NA` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime DEFAULT NULL,
  `ID_PAY` int(11) NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  `ID_ENA` int(11) NOT NULL,
  `ID_SNA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_NA`),
  KEY `FK_TICKET_NA_ID_ENA` (`ID_ENA`),
  KEY `FK_TICKET_NA_ID_SNA` (`ID_SNA`),
  KEY `FK_TICKET_NA_ID_PAY` (`ID_PAY`),
  KEY `FK_TICKET_NA_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;

INSERT INTO `ticket_na` (`ID_NA`, `DATE_E`, `DATE_S`, `ID_PAY`, `ID_VEH`, `ID_ENA`, `ID_SNA`) VALUES
(1, '2017-09-23 17:30:00', '2017-09-23 18:31:00', 1, 2, '1', '8'),
(2, '2017-09-23 00:08:00', '2017-09-23 00:33:23', 2, 2, '2', '8'),
(3, '2017-09-23 06:09:00', '2017-09-23 06:54:16', 2, 3, '3', '7'),
(4, '2017-09-23 07:14:10', '2017-09-23 07:46:14', 1, 2, '1', '5'),
(5, '2017-09-23 07:19:17', '2017-09-23 07:35:10', 1, 1, '9', '2'),
(6, '2017-09-13 06:20:00', '2017-09-23 07:26:00', 2, 3, '8', '4'),
(7, '2017-09-23 17:32:00', '2017-09-23 18:02:00', 1, 2, '5', '8'),
(8, '2017-09-23 17:33:00', '2017-09-23 17:50:00', 1, 2, '6', '9'),
(9, '2017-09-23 17:30:00', '2017-09-23 18:35:00', 1, 2, '2', '10'),
(10, '2017-09-23 17:31:00', '2017-09-23 17:45:00', 1, 2, '10', '8'),
(11, '2017-09-23 17:30:30', '2017-09-23 18:15:00', 1, 2, '7', '2');

CREATE TABLE IF NOT EXISTS `ticket_tp` (
  `ID_TP` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime DEFAULT NULL,
  `ID_ETP` int(11) NOT NULL,
  `ID_STP` int(11) DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  PRIMARY KEY (`ID_TP`),
  KEY `FK_TICKET_TP_ID_ETP` (`ID_ETP`),
  KEY `FK_TICKET_TP_ID_STP` (`ID_STP`),
  KEY `FK_TICKET_TP_NB_BADGE` (`NB_BADGE`),
  KEY `FK_TICKET_TP_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;



INSERT INTO `ticket_tp` (`ID_TP`, `DATE_E`, `DATE_S`, `NB_BADGE`, `ID_VEH`, `ID_ETP`, `ID_STP`) VALUES
(1, '2017-09-23 07:18:42', '2017-09-23 07:53:22', 1, 1, '1', '10'),
(2, '2017-09-23 07:41:00', '2017-09-23 07:51:25', 2, 2, '2', '8'),
(3, '2017-09-23 07:43:28', '2017-09-23 08:11:16', 3, 3, '3', '7'),
(4, '2017-09-23 07:28:34', '2017-09-23 07:58:21', 4, 2, '8', '3'),
(5, '2017-09-23 17:18:37', '2017-09-23 18:47:27', 1, 1, '5', '7'),
(6, '2017-09-23 17:33:41', '2017-09-23 18:51:28', 2, 2, '8', '2'),
(7, '2017-09-23 19:45:00', '2017-09-23 20:26:00', 3, 3, '7', '3'),
(8, '2017-09-23 16:40:40', '2017-09-23 17:14:00', 4, 2, '3', '8'),
(10, '2017-09-22 07:41:00', '2017-09-22 07:51:25', 2, 2, '3', '8'),
(11, '2017-09-22 07:43:28', '2017-09-22 08:11:16', 3, 3, '4', '7'),
(12, '2017-09-22 07:28:34', '2017-09-22 07:58:21', 4, 2, '7', '3'),
(13, '2017-09-22 17:17:37', '2017-09-22 18:47:27', 1, 1, '1', '10'),
(14, '2017-09-22 17:33:41', '2017-09-22 18:51:28', 2, 2, '8', '2'),
(15, '2017-09-22 19:45:00', '2017-09-22 20:26:00', 3, 3, '7', '3'),
(16, '2017-09-22 16:40:40', '2017-09-22 17:14:00', 4, 2, '3', '8');




CREATE TABLE IF NOT EXISTS `tronc` (
  `prix` float NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  `ID_ES` int(11) NOT NULL,
  PRIMARY KEY (`ID_VEH`,`ID_ES`),
  KEY `FK_TRONC_ID_ES` (`ID_ES`),
  KEY `FK_TRONC_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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



CREATE TABLE IF NOT EXISTS `type_pay` (
  `ID_PAY` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_PAY`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;



INSERT INTO `type_pay` (`ID_PAY`, `NOM`) VALUES
(1, 'Carte_bancaire'),
(2, 'liquide');



CREATE TABLE IF NOT EXISTS `vehicule` (
  `ID_VEH` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_VEH` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;



INSERT INTO `vehicule` (`ID_VEH`, `TYPE_VEH`) VALUES
(1, 'Moto'),
(2, 'Automobile'),
(3, 'Poids Lourd');
ALTER TABLE `ticket_na`
  ADD CONSTRAINT `FK_TICKET_NA_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_ENA` FOREIGN KEY (`ID_ENA`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_SNA` FOREIGN KEY (`ID_SNA`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_PAY` FOREIGN KEY (`ID_PAY`) REFERENCES `type_pay` (`ID_PAY`);
ALTER TABLE `ticket_tp`
  ADD CONSTRAINT `FK_TICKET_TP_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_TP_NB_BADGE` FOREIGN KEY (`NB_BADGE`) REFERENCES `abonne_tp` (`NB_BADGE`),
  ADD CONSTRAINT `FK_TICKET_TP_ID_ETP` FOREIGN KEY (`ID_ETP`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TICKET_TP_ID_STP` FOREIGN KEY (`ID_STP`) REFERENCES `es` (`ID_ES`);
ALTER TABLE `tronc`
  ADD CONSTRAINT `FK_TRONC_ID_ES` FOREIGN KEY (`ID_ES`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TRONC_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`);
