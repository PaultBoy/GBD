-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: iesguara.cf    Database: profeasir1_Peliculas2
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal
create schema Peliculas;
use Peliculas;
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
-- Table structure for table `Actriz`
--

DROP TABLE IF EXISTS `Actriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actriz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `fecha_nac` date NOT NULL,
  `pais` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Actriz_Pais1_idx` (`pais`),
  CONSTRAINT `fk_Actriz_Pais1` FOREIGN KEY (`pais`) REFERENCES `Pais` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actriz`
--

LOCK TABLES `Actriz` WRITE;
/*!40000 ALTER TABLE `Actriz` DISABLE KEYS */;
INSERT INTO `Actriz` VALUES (7,'Keanu Reeves','1964-09-02','Canadá'),(8,'Santiago Segura','1965-06-17','España'),(9,'Adam Sandler','1966-09-09','Estados Unidos'),(10,'Sacha Baron Cohen','1971-10-13','Reino Unido'),(11,'Vin Diesel','1967-07-18','Estados Unidos'),(12,'Toshiro Mifune','1920-04-01','Japón'),(13,'Amanda Peet','1972-01-11','Estados Unidos'),(14,'Luis Tosar','1971-10-13','España'),(15,'Anne Hataway','1982-11-12','Estados Unidos'),(16,'Penelope Cruz','1974-04-28','España'),(17,'Penélope Cruz','1974-04-28','España');
/*!40000 ALTER TABLE `Actriz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Director`
--

DROP TABLE IF EXISTS `Director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `pais` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Director_Pais1_idx` (`pais`),
  CONSTRAINT `fk_Director_Pais1` FOREIGN KEY (`pais`) REFERENCES `Pais` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Director`
--

LOCK TABLES `Director` WRITE;
/*!40000 ALTER TABLE `Director` DISABLE KEYS */;
INSERT INTO `Director` VALUES (1,'Akira Kurosawa','Japón'),(2,'Larry Charles','Estados Unidos'),(3,'Lana Wachowski','Estados Unidos'),(4,'Santiago Segura','España'),(5,'Dennis Dugan','Estados Unidos'),(6,'F. Gary Gray				','Estados Unidos'),(7,'Edward Burns','Estados Unidos'),(8,'Daniel Monzón','España'),(10,'Christopher Nolan','Estados Unidos');
/*!40000 ALTER TABLE `Director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pais` (
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES ('Alemania'),('Argentina'),('Australia'),('Canadá'),('España'),('Estados Unidos'),('Francia'),('Japón'),('Mexico'),('Portugal'),('Reino Unido'),('Rusia');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Papel`
--

DROP TABLE IF EXISTS `Papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Papel` (
  `id_Pelicula` int(11) NOT NULL,
  `id_Actriz` int(11) NOT NULL,
  `personaje` varchar(150) NOT NULL,
  PRIMARY KEY (`id_Pelicula`,`id_Actriz`),
  KEY `fk_Pelicula_has_Actriz_Actriz1_idx` (`id_Actriz`),
  KEY `fk_Pelicula_has_Actriz_Pelicula_idx` (`id_Pelicula`),
  CONSTRAINT `fk_Pelicula_has_Actriz_Actriz1` FOREIGN KEY (`id_Actriz`) REFERENCES `Actriz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pelicula_has_Actriz_Pelicula` FOREIGN KEY (`id_Pelicula`) REFERENCES `Pelicula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Papel`
--

LOCK TABLES `Papel` WRITE;
/*!40000 ALTER TABLE `Papel` DISABLE KEYS */;
INSERT INTO `Papel` VALUES (1,12,'Kikuchiyo'),(2,13,'Jennifer Aniston'),(3,7,'Neo'),(4,10,'Almirante General Haffaz Aladeen'),(5,11,'Dominic Toretto'),(6,8,'Jose Luis Torrente'),(7,9,'Lenny Feder'),(8,14,'Malamadre'),(11,15,'Amelia Brand');
/*!40000 ALTER TABLE `Papel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pelicula`
--

DROP TABLE IF EXISTS `Pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pelicula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `duracion` smallint(5) unsigned NOT NULL COMMENT 'Duración en minutos',
  `id_Director` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Pelicula_Director1_idx` (`id_Director`),
  CONSTRAINT `fk_Pelicula_Director1` FOREIGN KEY (`id_Director`) REFERENCES `Director` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='En esta tabla guardamos las películas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pelicula`
--

LOCK TABLES `Pelicula` WRITE;
/*!40000 ALTER TABLE `Pelicula` DISABLE KEYS */;
INSERT INTO `Pelicula` VALUES (1,'Los siete samuráis',207,1),(2,'Ella es única',96,7),(3,'Matrix',150,3),(4,'El Dictador',83,2),(5,'Fast & Furious 8',135,6),(6,'Torrente',97,4),(7,'Niños Grandes',102,5),(8,'Celda 211',113,8),(11,'Interstellar',169,10);
/*!40000 ALTER TABLE `Pelicula` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-10 19:49:39
