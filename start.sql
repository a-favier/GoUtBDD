-- Création de la BDD
CREATE DATABASE GoUt
    CHARACTER SET utf8
    COLLATE utf8_general_ci;
	USE GoUt;
	
CREATE TABLE GoUt.user
(
	`pseudo` VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
	`firstName` VARCHAR(50),
	`lastName` VARCHAR(50),
	`dateBorn` DATETIME,
	`mail` VARCHAR(255) NOT NULL,
	`tel` CHAR(12),
	`authToken` VARCHAR(255),
	`validUntil` DATETIME,
	`password` VARCHAR(255) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE GoUt.event
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`pseudo_organizer` VARCHAR(50),
	`name` VARCHAR(100) NOT NULL,
	`booking` BOOLEAN NOT NULL,
	`dateStart` DATETIME NOT NULL,
	`dateEnd` DATETIME NOT NULL,
	`country` VARCHAR(100),
	`city` VARCHAR(100),
	`postalCode` CHAR(5),
	`adresse` VARCHAR(255),
	`lat` DECIMAL(8,6),
	`lng` DECIMAL(8,6),
	`description` TEXT,
	`active` BOOLEAN NOT NULL,
	FOREIGN KEY(pseudo_organizer) REFERENCES user(pseudo) ON DELETE SET NULL
)ENGINE = InnoDB;

CREATE TABLE GoUt.participation
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`pseudo_user` VARCHAR(50) NOT NULL,
	`id_event` INT NOT NULL,
	FOREIGN KEY(pseudo_user) REFERENCES user(pseudo) ON DELETE CASCADE,
	FOREIGN KEY(id_event) REFERENCES event(id) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE GoUt.data_categorie
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`description` VARCHAR(255)
)ENGINE = InnoDB;

CREATE TABLE GoUt.data_clientele
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE GoUt.tarif
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`id_event` INT NOT NULL,
	`name` VARCHAR(255),
	`price` DECIMAL(7,2) NOT NULL,
	FOREIGN KEY(id_event) REFERENCES event(id) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE GoUt.categorie
(
	`id_event` INT NOT NULL,
	`id_data_categorie` INT NOT NULL,
	PRIMARY KEY(id_event, id_data_categorie),
	FOREIGN KEY(id_event) REFERENCES event(id) ON DELETE CASCADE,
	FOREIGN KEY(id_data_categorie) REFERENCES data_categorie(id) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE GoUt.clientele
(
	`id_event` INT NOT NULL,
	`id_data_clientele` INT NOT NULL,
    PRIMARY KEY(id_event, id_data_clientele),
	FOREIGN KEY(id_event) REFERENCES event(id) ON DELETE CASCADE,
	FOREIGN KEY(id_data_clientele) REFERENCES data_clientele(id) ON DELETE CASCADE
)ENGINE = InnoDB;

-- Data-Categorie
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Concert", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Festival", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Conférence", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Rencontre Professionel", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Examen", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Evenement Sportif", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Salon", null);
INSERT INTO `gout`.`data_categorie` (`name`, `description`)
VALUES ("Autre", null);

-- Data-Public
INSERT INTO `gout`.`data_clientele` (`name`)
VALUES ("Famille");
INSERT INTO `gout`.`data_clientele` (`name`)
VALUES ("Enfant");
INSERT INTO `gout`.`data_clientele` (`name`)
VALUES ("Adulte");
INSERT INTO `gout`.`data_clientele` (`name`)
VALUES ("Senior");
INSERT INTO `gout`.`data_clientele` (`name`)
VALUES ("Jeunes Adultes");
INSERT INTO `gout`.`data_clientele` (`name`)
VALUES ("Adolescents");
