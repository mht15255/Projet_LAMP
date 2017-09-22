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

CREATE TABLE TICKET_NA(
        ID_NA  int (11) Auto_increment  NOT NULL ,
        DATE_E Datetime NOT NULL ,
        DATE_S Datetime NOT NULL ,
        ID_PAY Int NOT NULL ,
        ID_VEH Int ,
        PRIMARY KEY (ID_NA )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VEHICULE
#------------------------------------------------------------

CREATE TABLE VEHICULE(
        ID_VEH   int (11) Auto_increment  NOT NULL ,
        TYPE_VEH Varchar (25) ,
        PRIMARY KEY (ID_VEH )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ES
#------------------------------------------------------------

CREATE TABLE ES(
        NOM             Varchar (50) ,
        ID_ES           Numeric NOT NULL ,
        DIST_TRON       Float NOT NULL ,
        ID_TP           Int ,
        ID_TP_TICKET_TP Int ,
        PRIMARY KEY (ID_ES )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TICKET_TP
#------------------------------------------------------------

CREATE TABLE TICKET_TP(
        ID_TP    int (11) Auto_increment  NOT NULL ,
        DATE_E   Datetime NOT NULL ,
        DATE_S   Datetime ,
        NB_BADGE Int NOT NULL ,
        ID_VEH   Int ,
        PRIMARY KEY (ID_TP )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ABONNE_TP
#------------------------------------------------------------

CREATE TABLE ABONNE_TP(
        NOM      Varchar (50) ,
        NB_BADGE int (11) Auto_increment  NOT NULL ,
        PRENOM   Varchar (50) ,
        EMAIL    Varchar (50) ,
        PASS     Varchar (50) NOT NULL ,
        ADRESSE  Varchar (250) ,
        IBAN     Varchar (25) ,
        PRIMARY KEY (NB_BADGE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TYPE_PAY
#------------------------------------------------------------

CREATE TABLE TYPE_PAY(
        ID_PAY int (11) Auto_increment  NOT NULL ,
        NOM    Varchar (50) ,
        PRIMARY KEY (ID_PAY )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TRONC
#------------------------------------------------------------

CREATE TABLE TRONC(
        prix   Float NOT NULL ,
        ID_VEH Int NOT NULL ,
        ID_ES  Numeric NOT NULL ,
        PRIMARY KEY (ID_VEH ,ID_ES )
)ENGINE=InnoDB;

ALTER TABLE TICKET_NA ADD CONSTRAINT FK_TICKET_NA_ID_PAY FOREIGN KEY (ID_PAY) REFERENCES TYPE_PAY(ID_PAY);
ALTER TABLE TICKET_NA ADD CONSTRAINT FK_TICKET_NA_ID_VEH FOREIGN KEY (ID_VEH) REFERENCES VEHICULE(ID_VEH);
ALTER TABLE ES ADD CONSTRAINT FK_ES_ID_TP FOREIGN KEY (ID_TP) REFERENCES TICKET_TP(ID_TP);
ALTER TABLE ES ADD CONSTRAINT FK_ES_ID_TP_TICKET_TP FOREIGN KEY (ID_TP_TICKET_TP) REFERENCES TICKET_TP(ID_TP);
ALTER TABLE TICKET_TP ADD CONSTRAINT FK_TICKET_TP_NB_BADGE FOREIGN KEY (NB_BADGE) REFERENCES ABONNE_TP(NB_BADGE);
ALTER TABLE TICKET_TP ADD CONSTRAINT FK_TICKET_TP_ID_VEH FOREIGN KEY (ID_VEH) REFERENCES VEHICULE(ID_VEH);
ALTER TABLE TRONC ADD CONSTRAINT FK_TRONC_ID_VEH FOREIGN KEY (ID_VEH) REFERENCES VEHICULE(ID_VEH);
ALTER TABLE TRONC ADD CONSTRAINT FK_TRONC_ID_ES FOREIGN KEY (ID_ES) REFERENCES ES(ID_ES);
