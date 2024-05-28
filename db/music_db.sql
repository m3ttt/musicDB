-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: music_db
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `music_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `music_db` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `music_db`;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `id_artist` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(500) DEFAULT NULL,
  `telephone` varchar(500) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id_artist`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES
(1,'Jacques','Webster II','Travis Scott','travis.scott@astroworld.com','123-456-7890','American rapper, singer, songwriter, and record producer. Known for his unique sound and energetic performances.'),
(2,'Kendrick','Duckworth','Kendrick Lamar','kingkunta@gmail.com','987-654-3210','American rapper, songwriter, and record producer. Renowned for his thought-provoking lyrics and socially conscious themes.'),
(3,'Symere','Woods','Lil Uzi Vert','uzigang@gmail.com','555-555-5555','American rapper, singer, and songwriter. Recognized for his melodic style and innovative approach to hip-hop.'),
(4,'Jermaine','Cole','J. Cole','coleworld@dreamville.com','444-555-6666','American rapper, singer, and songwriter. Known for his introspective storytelling and insightful commentary on life and society.'),
(5,'Austin','Post','Post Malone','posty@postmalone.com','777-888-9999','American rapper, singer, and songwriter. Celebrated for his genre-blending music and laid-back demeanor.'),
(6,'Donald','Glover','Childish Gambino','donaldglover@pharos.earth','123-123-1234','American rapper, singer, actor, writer, and producer. Notable for his versatility and boundary-pushing creativity.'),
(7,'Aubrey','Graham','Drake','champagnepapi@ovo.com','111-222-3333','Canadian rapper, singer, and songwriter. Known for his catchy hooks and emotional vulnerability in his music.'),
(8,'Michael','Dean','MIKE DEAN','mikedean@gmail.com','123-456-7890','American record producer, audio engineer, and musician. Known for his work as a producer for various hip-hop artists.'),
(9,'Michael','Williams II','Mike Will Made-It','mikewill@gmail.com','987-654-3210','American record producer, rapper, and songwriter. Notable for producing hit singles for various artists.'),
(10,'Leland','Wayne','Metro Boomin','metroboomin@gmail.com','555-555-5555','American record producer, record executive, songwriter, and DJ. Known for his distinct tag, \"If Young Metro don\'t trust you, I\'m gon\' shoot you\".'),
(11,'Bryan','Simmons','TM88','tm88@example.com','123-456-7890','American record producer and DJ known for his work in the trap genre. Collaborated with numerous artists including Lil Uzi Vert, Future, and Travis Scott.');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborations`
--

DROP TABLE IF EXISTS `collaborations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collaborations` (
  `id_collaboration` int(11) NOT NULL,
  `id_artist` int(11) DEFAULT NULL,
  `id_song` int(11) DEFAULT NULL,
  `date_collaboration` date NOT NULL,
  `role` varchar(500) NOT NULL,
  `royalties_percentage` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_collaboration`),
  KEY `id_artist` (`id_artist`),
  KEY `id_song` (`id_song`),
  CONSTRAINT `collaborations_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `artists` (`id_artist`),
  CONSTRAINT `collaborations_ibfk_2` FOREIGN KEY (`id_song`) REFERENCES `songs` (`id_song`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborations`
--

LOCK TABLES `collaborations` WRITE;
/*!40000 ALTER TABLE `collaborations` DISABLE KEYS */;
INSERT INTO `collaborations` VALUES
(1,1,1,'2018-08-21','Main Artist',75.00),
(2,2,2,'2017-03-30','Main Artist',70.00),
(3,3,3,'2017-03-24','Main Artist',63.76),
(4,4,4,'2014-12-09','Main Artist',100.00),
(5,5,5,'2017-09-15','Main Artist',80.00),
(6,6,6,'2018-05-05','Main Artist',100.00),
(7,7,7,'2015-07-31','Main Artist',100.00),
(8,8,1,'2018-08-21','Producer',25.00),
(9,9,2,'2017-03-30','Producer',30.00),
(10,10,5,'2017-09-15','Producer',20.00),
(11,11,3,'2022-05-12','Producer',36.24);
/*!40000 ALTER TABLE `collaborations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id_song` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `duration` varchar(500) DEFAULT NULL,
  `album_name` varchar(500) DEFAULT NULL,
  `hot_hit` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id_song`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES
(1,'SICKO MODE','Hip-Hop','5:12','ASTROWORLD','yes'),
(2,'HUMBLE.','Hip-Hop','3:04','DAMN.','yes'),
(3,'XO Tour Llif3','Hip-Hop','3:02','Luv Is Rage 2','yes'),
(4,'No Role Modelz','Hip-Hop','4:52','2014 Forest Hills Drive','yes'),
(5,'rockstar','Hip-Hop','3:38','beerbongs & bentleys','no'),
(6,'This Is America','Hip-Hop','3:46','Single','no'),
(7,'Hotline Bling','Hip-Hop','4:27','Views','no');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 18:38:58
