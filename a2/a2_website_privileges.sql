-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a2
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `website_privileges`
--

DROP TABLE IF EXISTS `website_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `website_privilege` varchar(45) DEFAULT NULL,
  `website_id_privilege` int DEFAULT NULL,
  `developer_id_privilege` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wensite_privilege_developer_id_idx` (`developer_id_privilege`),
  KEY `website_privilege_website_id_idx` (`website_id_privilege`),
  KEY `website_privilege_enumeration` (`website_privilege`),
  CONSTRAINT `website_privilege_developer_id` FOREIGN KEY (`developer_id_privilege`) REFERENCES `developers` (`id`),
  CONSTRAINT `website_privilege_enumeration` FOREIGN KEY (`website_privilege`) REFERENCES `privileges` (`privilege`) ON UPDATE CASCADE,
  CONSTRAINT `website_privilege_website_id` FOREIGN KEY (`website_id_privilege`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_privileges`
--

LOCK TABLES `website_privileges` WRITE;
/*!40000 ALTER TABLE `website_privileges` DISABLE KEYS */;
INSERT INTO `website_privileges` VALUES (247,'create',123,12),(248,'read',123,12),(249,'update',123,12),(250,'delete',123,12),(251,'read',123,23),(252,'update',123,23),(253,'create',123,34),(254,'read',123,34),(255,'update',123,34),(256,'delete',123,34),(257,'create',234,23),(258,'read',234,23),(259,'update',234,23),(260,'delete',234,23),(261,'read',234,34),(262,'update',234,34),(263,'create',234,12),(264,'read',234,12),(265,'update',234,12),(266,'delete',234,12),(267,'create',345,34),(268,'read',345,34),(269,'update',345,34),(270,'delete',345,34),(271,'read',345,12),(272,'update',345,12),(273,'create',345,23),(274,'read',345,23),(275,'update',345,23),(276,'delete',345,23),(277,'create',456,12),(278,'read',456,12),(279,'update',456,12),(280,'delete',456,12),(281,'read',456,23),(282,'update',456,23),(283,'create',456,34),(284,'read',456,34),(285,'update',456,34),(286,'delete',456,34),(287,'create',567,23),(288,'read',567,23),(289,'update',567,23),(290,'delete',567,23),(291,'read',567,34),(292,'update',567,34),(293,'create',567,12),(294,'read',567,12),(295,'update',567,12),(296,'delete',567,12),(297,'create',678,34),(298,'read',678,34),(299,'update',678,34),(300,'delete',678,34),(301,'read',678,12),(302,'update',678,12),(303,'create',678,23),(304,'read',678,23),(305,'update',678,23),(306,'delete',678,23);
/*!40000 ALTER TABLE `website_privileges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 19:02:41
