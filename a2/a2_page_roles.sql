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
-- Table structure for table `page_roles`
--

DROP TABLE IF EXISTS `page_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_role` varchar(45) DEFAULT NULL,
  `page_id_role` int DEFAULT NULL,
  `developer_id_role` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_role_enumeration_idx` (`page_role`),
  KEY `page_role_page_id_idx` (`page_id_role`) /*!80000 INVISIBLE */,
  KEY `page_role_developer_id_idx` (`developer_id_role`),
  CONSTRAINT `page_role_developer_id` FOREIGN KEY (`developer_id_role`) REFERENCES `developers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `page_role_enumeration` FOREIGN KEY (`page_role`) REFERENCES `roles` (`role`) ON UPDATE CASCADE,
  CONSTRAINT `page_role_page_id` FOREIGN KEY (`page_id_role`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_roles`
--

LOCK TABLES `page_roles` WRITE;
/*!40000 ALTER TABLE `page_roles` DISABLE KEYS */;
INSERT INTO `page_roles` VALUES (59,'editor',123,12),(60,'reviewer',123,23),(61,'writer',123,34),(62,'editor',234,23),(63,'reviewer',234,34),(64,'writer',234,12),(65,'editor',345,34),(66,'reviewer',345,12),(67,'writer',345,23),(68,'editor',456,12),(69,'reviewer',456,23),(70,'writer',456,34),(71,'editor',567,23),(72,'reviewer',567,34),(73,'writer',567,12);
/*!40000 ALTER TABLE `page_roles` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_INSERT` AFTER INSERT ON `page_roles` FOR EACH ROW BEGIN
	IF NEW.page_role='admin' OR NEW.page_role='owner' THEN
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'create', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'update', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'delete', NEW.page_id_role, NEW.developer_id_role);
	END IF;
    IF NEW.page_role='writer' THEN
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'create', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'update', NEW.page_id_role, NEW.developer_id_role);
	END IF;
    IF NEW.page_role='editor' THEN
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'update', NEW.page_id_role, NEW.developer_id_role);
	END IF;
		IF NEW.page_role='reviewer' THEN
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_UPDATE` AFTER UPDATE ON `page_roles` FOR EACH ROW BEGIN
	DELETE FROM page_privileges
		WHERE page_id_privilege=OLD.page_id_role AND developer_id_privilege=OLD.developer_id_role;
	IF NEW.page_role='admin' OR NEW.page_role='owner' THEN
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'create', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'update', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
			(DEFAULT, 'delete', NEW.page_id_role, NEW.developer_id_role);
	END IF;
	IF NEW.page_role='writer' THEN
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'create', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'update', NEW.page_id_role, NEW.developer_id_role);
	END IF;
	IF NEW.page_role='editor' THEN
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'update', NEW.page_id_role, NEW.developer_id_role);
	END IF;
		IF NEW.page_role='reviewer' THEN
		INSERT INTO page_privileges VALUES
				(DEFAULT, 'read', NEW.page_id_role, NEW.developer_id_role);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_DELETE` AFTER DELETE ON `page_roles` FOR EACH ROW BEGIN
DELETE FROM page_privileges
		WHERE page_id_privilege=OLD.page_id_role AND developer_id_privilege=OLD.developer_id_role;
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
