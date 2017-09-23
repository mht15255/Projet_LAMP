
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
  `ID_ES_E` int(11) NOT NULL,
  `ID_ES_S` int(11) DEFAULT NULL,
  `ID_PAY` int(11) NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  PRIMARY KEY (`ID_NA`),
  KEY `FK_TICKET_NA_ID_ES_E` (`ID_ES_E`),
  KEY `FK_TICKET_NA_ID_ES_S` (`ID_ES_S`),
  KEY `FK_TICKET_NA_ID_PAY` (`ID_PAY`),
  KEY `FK_TICKET_NA_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;


CREATE TABLE IF NOT EXISTS `ticket_tp` (
  `ID_TP` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_E` datetime NOT NULL,
  `DATE_S` datetime DEFAULT NULL,
  `ID_ES_E` int(11) NOT NULL,
  `ID_ES_S` int(11) DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  PRIMARY KEY (`ID_TP`),
  KEY `FK_TICKET_TP_NB_BADGE` (`NB_BADGE`),
  KEY `FK_TICKET_TP_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;



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
  ADD CONSTRAINT `FK_TICKET_NA_ID_ES_E` FOREIGN KEY (`ID_ES_E`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_ES_S` FOREIGN KEY (`ID_ES_S`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TICKET_NA_ID_PAY` FOREIGN KEY (`ID_PAY`) REFERENCES `type_pay` (`ID_PAY`);
ALTER TABLE `ticket_tp`
  ADD CONSTRAINT `FK_TICKET_TP_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`),
  ADD CONSTRAINT `FK_TICKET_TP_NB_BADGE` FOREIGN KEY (`NB_BADGE`) REFERENCES `abonne_tp` (`NB_BADGE`),
  ADD CONSTRAINT `FK_TICKET_TP_ID_ES_E` FOREIGN KEY (`ID_ES_E`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TICKET_TP_ID_ES_S` FOREIGN KEY (`ID_ES_S`) REFERENCES `es` (`ID_ES`);
ALTER TABLE `tronc`
  ADD CONSTRAINT `FK_TRONC_ID_ES` FOREIGN KEY (`ID_ES`) REFERENCES `es` (`ID_ES`),
  ADD CONSTRAINT `FK_TRONC_ID_VEH` FOREIGN KEY (`ID_VEH`) REFERENCES `vehicule` (`ID_VEH`);
