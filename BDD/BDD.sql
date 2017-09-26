#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE IF EXISTS libautodb;

CREATE DATABASE libautodb
     DEFAULT CHARACTER SET utf8;
	  
USE libautodb;

#------------------------------------------------------------
# Table: TICKET_NA
#------------------------------------------------------------

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


#------------------------------------------------------------
# Table: VEHICULE
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicule` (
  `ID_VEH` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_VEH` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_VEH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;


#------------------------------------------------------------
# Table: ES
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `es` (
  `NOM` varchar(50) DEFAULT NULL,
  `ID_ES` int(11) NOT NULL AUTO_INCREMENT,
  `DIST_TRON` float NOT NULL,
  PRIMARY KEY (`ID_ES`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;


#------------------------------------------------------------
# Table: TICKET_TP
#------------------------------------------------------------

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


#------------------------------------------------------------
# Table: ABONNE_TP
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `abonne_tp` (
  `NOM` varchar(50) DEFAULT NULL,
  `NB_BADGE` int(11) NOT NULL AUTO_INCREMENT,
  `PRENOM` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASS` varchar(50) NOT NULL,
  `ADRESSE` varchar(250) DEFAULT NULL,
  `IBAN` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NB_BADGE`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


#------------------------------------------------------------
# Table: TYPE_PAY
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `type_pay` (
  `ID_PAY` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_PAY`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


#------------------------------------------------------------
# Table: TRONC
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tronc` (
  `prix` float NOT NULL,
  `ID_VEH` int(11) NOT NULL,
  `ID_ES` int(11) NOT NULL,
  PRIMARY KEY (`ID_VEH`,`ID_ES`),
  KEY `FK_TRONC_ID_ES` (`ID_ES`),
  KEY `FK_TRONC_ID_VEH` (`ID_VEH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
