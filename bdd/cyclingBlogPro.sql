SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
DROP DATABASE  IF EXISTS `cyclingBlogPro`;
CREATE DATABASE IF NOT EXISTS `cyclingBlogPro`;
USE `cyclingBlogPro`;

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `streetNumber` int(11) NOT NULL,
  `streetName` varchar(255)  NOT NULL,
  `postalCode` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT NOW(),
  `updateDate` datetime DEFAULT NOW(),
  `deleteDate` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO addresses (streetNumber,streetName,postalCode,city,country) VALUES ('29','Résidence la roseraie','62122','Lapugnoy','France'),('12','rue de jonathan',6200,'Arras','France');


DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role`varchar(255) NOT NULL DEFAULT 'user',
  `idAddress` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NOW(),
  `updateDate` datetime DEFAULT NOW(),
  `deleteDate` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idAddress`) REFERENCES addresses (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO users (name,surname,mail,password,idAddress) VALUES ('Lamorski','Philippe','philippe.lamorski@gmail.com','$2y$10$8SP.Eni4WPGV98CM1Z11vOZMxN/UxnpsQEkGDg56VhV2.3IwWaxSW',1),('Jonathan','Jonathan','jonathan.jonathangmail.com','$2y$10$HS2oIdLY3TkmKn7H2dcGheLpQTXT9mqQmq/FHQge4LuofTDpSJHam',2);

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(255) NOT NULL,
  `coureur` varchar(255) NOT NULL,
  `mecanique` varchar(255) NOT NULL,
  `materiel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `article` text NOT NULL,
  `creationDate` datetime DEFAULT NOW(),
  `updateDate` datetime DEFAULT NOW(),
  `deleteDate` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `idCategory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idCategory`) REFERENCES category (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` int(11) NOT NULL,
  `orderDate` datetime DEFAULT NOW(),
  `idUser` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idUser`) REFERENCES users (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `reference` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `ligneCommandes`;
CREATE TABLE IF NOT EXISTS `ligneCommandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idCommande`) REFERENCES commandes (`id`),
    FOREIGN KEY (`idProduit`) REFERENCES produits (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `races`;
CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `raceResults`;
CREATE TABLE IF NOT EXISTS `raceResults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCoureurs` int(11) NOT NULL,
  `idRace` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

   
COMMIT;



