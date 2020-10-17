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
-- Table structure for table `page_privileges`
--

DROP TABLE IF EXISTS `page_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_privilege` varchar(45) DEFAULT NULL,
  `page_id_privilege` int DEFAULT NULL,
  `developer_id_privilege` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_privilege_developer_id` (`developer_id_privilege`),
  KEY `page_privilege_enumeration` (`page_privilege`),
  KEY `page_privilege_page_id_idx` (`page_id_privilege`),
  CONSTRAINT `page_privilege_developer_id` FOREIGN KEY (`developer_id_privilege`) REFERENCES `developers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `page_privilege_enumeration` FOREIGN KEY (`page_privilege`) REFERENCES `privileges` (`privilege`) ON UPDATE CASCADE,
  CONSTRAINT `page_privilege_page_id` FOREIGN KEY (`page_id_privilege`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_privileges`
--

LOCK TABLES `page_privileges` WRITE;
/*!40000 ALTER TABLE `page_privileges` DISABLE KEYS */;
INSERT INTO `page_privileges` VALUES (116,'read',123,12),(117,'update',123,12),(118,'read',123,23),(119,'create',123,34),(120,'read',123,34),(121,'update',123,34),(122,'read',234,23),(123,'update',234,23),(124,'read',234,34),(125,'create',234,12),(126,'read',234,12),(127,'update',234,12),(128,'read',345,34),(129,'update',345,34),(130,'read',345,12),(131,'create',345,23),(132,'read',345,23),(133,'update',345,23),(134,'read',456,12),(135,'update',456,12),(136,'read',456,23),(137,'create',456,34),(138,'read',456,34),(139,'update',456,34),(140,'read',567,23),(141,'update',567,23),(142,'read',567,34),(143,'create',567,12),(144,'read',567,12),(145,'update',567,12);
/*!40000 ALTER TABLE `page_privileges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 19:02:40
