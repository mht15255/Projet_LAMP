DROP DATABASE IF EXISTS libautodb;

CREATE DATABASE libautodb
     DEFAULT CHARACTER SET utf8;
	  
USE libautodb;

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


CREATE TABLE IF NOT EXISTS `gestionnaire` (
  `NOM` varchar(50) NOT NULL DEFAULT '',
  `PASS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NOM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `gestionnaire` (`NOM`, `PASS`) VALUES
('Consessionnaire', 'password'),
('prestataire', 'password');

create or replace view dist_TP as
SELECT t.ID_TP as ID_TP, t.DATE_E,t.DATE_S, e.NOM as nom_e, s.NOM as nom_s, sum( d.DIST_TRON ) as distance,t.NB_BADGE as nb_badge
FROM ticket_tp t
JOIN es e ON ( e.ID_ES = t.ID_ETP )
JOIN es s ON ( s.ID_ES = t.ID_STP )
JOIN es d ON ( (d.ID_ES >= t.ID_ETP AND d.ID_ES < t.ID_STP) OR (d.ID_ES >= s.ID_ES AND t.ID_STP < t.ID_ETP ) )
GROUP BY t.ID_TP;


create or replace view prix_TP as
SELECT t.ID_TP as ID_TP,t.DATE_E, t.DATE_S, e.NOM as nom_e, s.NOM as nom_s, round(sum( tr.prix ),2) as prix,t.NB_BADGE as nb_badge
FROM ticket_tp t
JOIN es e ON ( e.ID_ES = t.ID_ETP )
JOIN es s ON ( s.ID_ES = t.ID_STP )
JOIN tronc tr ON ( tr.id_veh= t.id_veh and ( (tr.ID_ES >= t.ID_ETP AND tr.ID_ES < t.ID_STP) OR (tr.ID_ES >= s.ID_ES AND tr.ID_ES < t.ID_ETP) ) )
GROUP BY t.ID_TP;


create or replace view facture_TP as
select t1.ID_TP,t1.DATE_E,t1.DATE_S, t1.nom_e, t1.nom_s, t1.distance DISTANCE, t2.prix as PRIX,t1.nb_badge as NB_BADGE
from dist_TP t1
join prix_TP t2 on t1.ID_TP = t2.ID_TP;



create or replace view dist_NA as
SELECT t.ID_NA as ID_NA, t.DATE_E as DATE_E,t.DATE_S as DATE_S, e.NOM as NOM_E, s.NOM as NOM_S, sum( d.DIST_TRON ) as DISTANCE,t.ID_PAY as ID_PAY
FROM ticket_na t
JOIN es e ON ( e.ID_ES = t.ID_ENA )
JOIN es s ON ( s.ID_ES = t.ID_SNA )
JOIN es d ON ( (d.ID_ES >= t.ID_ENA AND d.ID_ES < t.ID_SNA) OR (d.ID_ES >= s.ID_ES AND t.ID_SNA < t.ID_ENA ) )
GROUP BY t.ID_NA;


create or replace view prix_NA as
SELECT t.ID_NA as ID_NA,t.DATE_E as DATE_E, t.DATE_S as DATE_S, e.NOM as NOM_E, s.NOM as NOM_S, round(sum( tr.prix ),2) as PRIX,t.ID_PAY as ID_PAY
FROM ticket_na t
JOIN es e ON ( e.ID_ES = t.ID_ENA )
JOIN es s ON ( s.ID_ES = t.ID_SNA )
JOIN tronc tr ON ( tr.id_veh= t.id_veh and ( (tr.ID_ES >= t.ID_ENA AND tr.ID_ES < t.ID_SNA) OR (tr.ID_ES >= s.ID_ES AND tr.ID_ES < t.ID_ENA) ) )
GROUP BY t.ID_NA;

create or replace view facture_NA as
select t1.ID_NA ID_NA, t1.DATE_E DATE_E, t1.DATE_S DATE_S, t1.NOM_E NOM_E, t1.NOM_S NOM_S, t1.DISTANCE DISTANCE, t2.PRIX as PRIX, t1.ID_PAY as ID_PAY
from dist_NA t1
join prix_NA t2 on t1.ID_NA = t2.ID_NA;



create or replace view trajet_NA as
SELECT f.DATE_E DATE_E, f.DATE_S DATE_S, f.NOM_E NOM_E, f.NOM_S NOM_S, f.DISTANCE DISTANCE, f.PRIX PRIX, p.NOM PAY
FROM facture_NA f
JOIN type_pay p ON ( f.ID_PAY = p.ID_PAY );



create or replace view trajet_TP as
SELECT f.DATE_E DATE_E, f.DATE_S DATE_S, f.NOM_E NOM_E, f.NOM_S NOM_S, f.DISTANCE DISTANCE, f.PRIX PRIX, 'Télépéage' PAY
FROM facture_TP f;

create or replace view facture as
SELECT DATE_E, DATE_S, NOM_E NOM_E,NOM_S, DISTANCE, PRIX
from facture_NA
UNION
SELECT DATE_E, DATE_S, NOM_E NOM_E,NOM_S, DISTANCE, PRIX
from facture_TP;

create or replace view trajet as
SELECT * from trajet_NA
UNION
SELECT * from trajet_TP;



create or replace view traffic_mois_heur as select MONTH(DATE_E) as MONTH_VAL, HOUR(DATE_E) as HOUR_VAL, count(*) as COMPTE from facture
group by HOUR_VAL;


create or replace view traffic_heur_aut as select HOUR(DATE_E) as HOUR_VAL, count(*) as COMPTE from facture
group by HOUR(DATE_E);


create or replace view traffic_heur as select HOUR_VAL, sum(COMPTE) as COMPTE from traffic_mois_heur
group by HOUR_VAL;


create or replace view traffic_mois as select  MONTH_VAL,  sum(COMPTE) as COMPTE from traffic_mois_heur
group by MONTH_VAL;


CREATE USER 'prestataire'@'%' IDENTIFIED BY 'prestataire';
CREATE USER 'concessionnaire'@'localhost' IDENTIFIED BY 'concess';
CREATE USER 'prestataire'@'localhost' IDENTIFIED BY 'prestataire';
CREATE USER 'concessionnaire'@'%' IDENTIFIED BY 'concess';
GRANT ALL ON libautodb.* TO 'concessionnaire'@'localhost';
GRANT ALL ON libautodb.* TO 'prestataire'@'localhost';
GRANT ALL ON libautodb.* TO 'concessionnaire'@'%';
GRANT ALL ON libautodb.* TO 'prestataire'@'%';
