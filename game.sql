-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: pinball_db
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `gameid` varchar(45) GENERATED ALWAYS AS (concat(cast(`operator_code` as char charset utf8mb4),`game_code`,cast(substr(`serial_num`,-(4)) as char charset utf8mb4))) STORED NOT NULL,
  `game_code` varchar(12) NOT NULL,
  `operator_code` int(2) unsigned zerofill NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `serial_num` varchar(12) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `model` varchar(25) DEFAULT NULL,
  `manufacturer` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`gameid`),
  UNIQUE KEY `serial_num_UNIQUE` (`serial_num`),
  KEY `operator_code_idx` (`operator_code`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`operator_code`) REFERENCES `operator` (`operator_code`),
  CONSTRAINT `operator_code` FOREIGN KEY (`operator_code`) REFERENCES `operator` (`operator_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-09 12:32:16
