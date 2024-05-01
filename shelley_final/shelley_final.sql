-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: millennia-pavilion-db
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(45) DEFAULT NULL,
  `artist_hometown` varchar(45) DEFAULT NULL,
  `artist_genre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'TCTG','Conway','Smooth Jazz'),(2,'The Kytes','Conway','American Folk'),(3,'Jack Solomon','Georgetown','Inde Rock'),(4,'Beach Man','Myrtle Beach','Raggae');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_firstname` varchar(45) DEFAULT NULL,
  `customer_lastname` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_mailerlist` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Samuel','Shelley','sshell18@hgtc.edu',0),(2,'Dennis','Quaid','osi@uni.com',1),(3,'Regala','Schmegala','noone@gmail.com',0),(4,'John','Doe','jdoe@yahoo.com',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventcustomer`
--

DROP TABLE IF EXISTS `eventcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventcustomer` (
  `eventcustomer_id` int NOT NULL AUTO_INCREMENT,
  `eventcustomer_viplevel` varchar(45) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`eventcustomer_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `event_id_idx` (`event_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eventcustomer_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventcustomer`
--

LOCK TABLES `eventcustomer` WRITE;
/*!40000 ALTER TABLE `eventcustomer` DISABLE KEYS */;
INSERT INTO `eventcustomer` VALUES (1,'Diamond',1,1),(2,'Gold',2,2),(3,'Bronze',3,3),(4,'Silver',4,4);
/*!40000 ALTER TABLE `eventcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `event_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'2024-04-20','22:00:00','Par Four Jazz Bash'),(2,'2024-04-27','20:00:00','Dedicated to Algorithms'),(3,'2024-05-04','20:00:00','Desert Man vs. Beach Man'),(4,'2024-04-11','15:00:00','Beach Man\'s Celebration');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postevents`
--

DROP TABLE IF EXISTS `postevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postevents` (
  `event_id` int NOT NULL,
  `event_attendantscount` int DEFAULT NULL,
  `event_revenue` double(12,2) DEFAULT NULL,
  `event_duration` time DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  CONSTRAINT `event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postevents`
--

LOCK TABLES `postevents` WRITE;
/*!40000 ALTER TABLE `postevents` DISABLE KEYS */;
INSERT INTO `postevents` VALUES (1,157,3143.55,'04:34:00'),(2,78,936.72,'02:35:00'),(3,382,14134.88,'05:48:00'),(4,191,4775.93,'02:20:00');
/*!40000 ALTER TABLE `postevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setlist`
--

DROP TABLE IF EXISTS `setlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setlist` (
  `set_id` int NOT NULL AUTO_INCREMENT,
  `set_songname` varchar(45) DEFAULT NULL,
  `set_artist` int DEFAULT NULL,
  `set_event` int DEFAULT NULL,
  PRIMARY KEY (`set_id`),
  KEY `set_artist_idx` (`set_artist`),
  KEY `set_event_idx` (`set_event`),
  CONSTRAINT `set_artist` FOREIGN KEY (`set_artist`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `set_event` FOREIGN KEY (`set_event`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setlist`
--

LOCK TABLES `setlist` WRITE;
/*!40000 ALTER TABLE `setlist` DISABLE KEYS */;
INSERT INTO `setlist` VALUES (1,'I Just Really Love That Golf Stuff',1,1),(2,'American Puzzles',2,2),(3,'Rain Dance',3,3),(4,'Juju Bak at Yu',4,3),(5,'I Don Won',4,4);
/*!40000 ALTER TABLE `setlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 21:59:08
