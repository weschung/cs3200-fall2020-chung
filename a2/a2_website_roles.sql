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
-- Table structure for table `website_roles`
--

DROP TABLE IF EXISTS `website_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `website_role` varchar(45) DEFAULT NULL,
  `website_id_role` int DEFAULT NULL,
  `developer_id_role` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_roles_developer_id_idx` (`developer_id_role`),
  KEY `website_roles_website_id_idx` (`website_id_role`),
  KEY `website_roles_enumeration_idx` (`website_role`),
  CONSTRAINT `website_roles_developer_id` FOREIGN KEY (`developer_id_role`) REFERENCES `developers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `website_roles_enumeration` FOREIGN KEY (`website_role`) REFERENCES `roles` (`role`) ON UPDATE CASCADE,
  CONSTRAINT `website_roles_website_id` FOREIGN KEY (`website_id_role`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_roles`
--

LOCK TABLES `website_roles` WRITE;
/*!40000 ALTER TABLE `website_roles` DISABLE KEYS */;
INSERT INTO `website_roles` VALUES (81,'owner',123,12),(82,'editor',123,23),(83,'admin',123,34),(84,'owner',234,23),(85,'editor',234,34),(86,'admin',234,12),(87,'owner',345,34),(88,'editor',345,12),(89,'admin',345,23),(90,'owner',456,12),(91,'editor',456,23),(92,'admin',456,34),(93,'owner',567,23),(94,'editor',567,34),(95,'admin',567,12),(96,'owner',678,34),(97,'editor',678,12),(98,'admin',678,23);
/*!40000 ALTER TABLE `website_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_INSERT` AFTER INSERT ON `website_roles` FOR EACH ROW BEGIN
	IF NEW.website_role='admin' OR NEW.website_role='owner' THEN
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'create', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'update', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'delete', NEW.website_id_role, NEW.developer_id_role);
	END IF;
	IF NEW.website_role='writer' THEN
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'create', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'update', NEW.website_id_role, NEW.developer_id_role);
	END IF;
	IF NEW.website_role='editor' THEN
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'update', NEW.website_id_role, NEW.developer_id_role);
	END IF;
		IF NEW.website_role='reviewer' THEN
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_UPDATE` AFTER UPDATE ON `website_roles` FOR EACH ROW BEGIN
	DELETE FROM website_privileges
		WHERE website_id_privilege=OLD.website_id_role AND developer_id_privilege=OLD.developer_id_role;
	IF NEW.website_role='admin' OR NEW.website_role='owner' THEN
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'create', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'update', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
			(DEFAULT, 'delete', NEW.website_id_role, NEW.developer_id_role);
	END IF;
	IF NEW.website_role='writer' THEN
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'create', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'update', NEW.website_id_role, NEW.developer_id_role);
	END IF;
	IF NEW.website_role='editor' THEN
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'update', NEW.website_id_role, NEW.developer_id_role);
	END IF;
		IF NEW.website_role='reviewer' THEN
		INSERT INTO website_privileges VALUES
				(DEFAULT, 'read', NEW.website_id_role, NEW.developer_id_role);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_DELETE` AFTER DELETE ON `website_roles` FOR EACH ROW BEGIN
DELETE FROM website_privileges
		WHERE website_id_privilege=OLD.website_id_role AND developer_id_privilege=OLD.developer_id_role;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 19:02:41
