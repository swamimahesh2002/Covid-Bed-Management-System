-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: cbms
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bedtype` enum('NORMAL','OXYGEN','VENTILATOR') DEFAULT NULL,
  `hospitalId` int DEFAULT NULL,
  `patientId` int DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,'NORMAL',1,1,0),(2,'NORMAL',1,NULL,1),(3,'OXYGEN',1,6,0),(4,'OXYGEN',1,NULL,1),(5,'NORMAL',2,7,0),(6,'OXYGEN',2,8,0),(7,'NORMAL',1,NULL,1),(8,'VENTILATOR',1,NULL,1),(9,'NORMAL',3,NULL,1),(10,'VENTILATOR',2,9,0),(11,'NORMAL',2,NULL,1),(12,'OXYGEN',2,NULL,1),(13,'NORMAL',1,NULL,1),(14,'OXYGEN',1,NULL,1),(15,'VENTILATOR',1,NULL,1);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `muncipalId` int DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mid` (`muncipalId`),
  CONSTRAINT `fk_mid` FOREIGN KEY (`muncipalId`) REFERENCES `muncipal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Apollo ','2023-08-01',1,411012),(2,'pluto','2023-08-02',1,411012),(3,'sasoon','2023-08-03',1,411041),(4,'KEM','2023-08-03',1,411012),(5,'jupiter','2023-08-08',1,411012);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muncipal`
--

DROP TABLE IF EXISTS `muncipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muncipal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muncipal`
--

LOCK TABLES `muncipal` WRITE;
/*!40000 ALTER TABLE `muncipal` DISABLE KEYS */;
INSERT INTO `muncipal` VALUES (1,'pmc');
/*!40000 ALTER TABLE `muncipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `hospitalId` int DEFAULT NULL,
  `bedId` int DEFAULT NULL,
  `isDischarged` tinyint(1) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `dischargeDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'vinit',1,1,0,'Aundh',NULL),(2,'shubham',1,NULL,1,'Narhe','2023-08-24'),(3,'rajesh',1,NULL,1,'kothrud','2023-08-24'),(4,'zuber',1,NULL,1,'pune','2023-08-24'),(5,'faraz',2,NULL,1,'Narhe','2023-08-24'),(6,'adarsh',1,3,0,'123',NULL),(7,'rohit',2,5,0,'dapodi',NULL),(8,'sham',2,6,0,'Aundh',NULL),(9,'karan',2,10,0,'khadki',NULL),(10,'vikram',1,NULL,1,'akurdi','2023-08-24');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` enum('ADMIN','MUNCIPAL','HOSPITAL') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@123','123','MUNCIPAL'),(2,'hospital@123','123','HOSPITAL');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-24 22:44:50
