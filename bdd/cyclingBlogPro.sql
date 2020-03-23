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
  `deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO addresses (streetNumber,streetName,postalCode,city,country) VALUES ('29','Résidence la roseraie','62122','Lapugnoy','France'),('12','rue de jonathan',6200,'Arras','France');

DROP TABLE IF EXISTS `addressCommandes`;
CREATE TABLE IF NOT EXISTS `addressCommandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `streetNumber` int(11) NOT NULL,
  `streetName` varchar(255)  NOT NULL,
  `postalCode` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT NOW(),
  `deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role`varchar(255) NOT NULL DEFAULT 'user',
  `idAddress` int(11) NOT NULL,
  `idAdressCommandes` int(11),
  `creationDate` datetime DEFAULT NOW(),
  `updateDate` datetime DEFAULT NOW(),
  `deleteDate` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idAddress`) REFERENCES addresses (`id`),
  FOREIGN KEY (`idAdressCommandes`) REFERENCES addressCommandes (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO users (name,surname,mail,password,idAddress) VALUES ('Lamorski','Philippe','philippe.lamorski@gmail.com','$2y$10$8SP.Eni4WPGV98CM1Z11vOZMxN/UxnpsQEkGDg56VhV2.3IwWaxSW',1),('Delannoy','Jonathan','delannoy.jonathan94@laposte.net','$2y$10$HS2oIdLY3TkmKn7H2dcGheLpQTXT9mqQmq/FHQge4LuofTDpSJHam',2);

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
insert into category (name) 
values ('courses'),('materiel'),('entrainement'),('mecanique'),('divers');


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


DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduit` int(11) ,
  `idArticle` int(11)  ,
  `picture1` varchar(255) NOT NULL,
  `picture2` varchar(255) NOT NULL,
  `picture3` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT NOW(),
  `deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`idProduit`) REFERENCES produits (`id`),
  FOREIGN KEY (`idArticle`) REFERENCES articles (`id`)

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
  `startDate` date NOT NULL,
  `endDate` date NOT NULL  NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
insert into races (name,startDate,endDate,country,city)
values ('Santos Tour Down Under','2019-01-21','2019-01-26','Australie','Adelaide'),('Cadel Ewans Great Ocean','2019-02-02','2019-02-02','Australie','Geelong'),('UAE Tour','postal-02-23','2019-02-29','Émirats arabes unis','Bubai'),('Omloop Het Nieuwsblad','2019-02-29','2019-02-29','Belgique','Ardennes flamandes'),('La drôme classic','2019-03-01','2019-03-01','France','Montmeyran'),('Kurne Bruxelle Kurne','2019-03-01','2019-03-01','Belgique','Kurne'),('Strade Bianche','2019-03-07','2019-03-07','Italie','Sienne'),('Paris Nice','2019-03-08','2019-03-15','France','Nice'),('Tirreno-Adriatico','2019-03-11','2019-03-17','Italie',' San Benedetto del Tronto '),('Milan-San-Remo','2019-03-21','2019-03-21','Italie','Milan'),('Trois jours de la Panne','2019-03-25','2019-03-28','Belgique','Bruges-la Panne'),('E3 BinckBank Classic','2019-03-27','2019-03-27','Belgique',' Harelbeke'),('Tour de catalogne','2019-03-23','2019-03-29','Espagne','Barcelone'),('Gand-Wevelgem','2019-03-29','2019-03-29','Belgique','Wevelgem'),('A travers la Flandre','2019-04-01','2019-04-01','Belgique','Waregem'),('Tours des Flandres','2019-04-05','2019-04-05','Belgique','Oudenaarde'),('Tors du pay Basque','2019-04-06','2019-04-11','Espagne','Communauté autonome du Pays basque'),('Paris Roubaix','2019-04-12','2019-04-12','France','Roubaix'),('Amstel Gold Race','2019-04-19','2019-04-19','Pays-bas','Limbourg'),('La flèche Wallonne','2019-04-22','2019-04-22','Belgique','Région wallonne'),('Liège-Bastogne-Liège','2019-04-26','2019-04-26','Belgique','Liége'),('Tour de Romandie','2019-04-28','2019-05-03','Suisse et Romandie','Suisse et Romandie'),('Escborn-Francfort','2019-05-01','2019-05-01','Allemagne','Francfort'),('Tour d Italie','2019-05-09','2019-05-31','Italie','Italie'),('Criterium du Dauphiné','2019-05-31','2019-06-07','France','Grenoble');

DROP TABLE IF EXISTS `raceResults`;
CREATE TABLE IF NOT EXISTS `raceResults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCoureurs` int(11) NOT NULL,
  `idRace` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
insert into raceResults (idCoureurs,idRace,position)
values (1,1,1);
   
COMMIT;



