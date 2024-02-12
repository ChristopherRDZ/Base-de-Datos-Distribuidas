-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: iot
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `IdAula` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Edificio` varchar(20) NOT NULL,
  `Nivel` varchar(20) NOT NULL,
  PRIMARY KEY (`IdAula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,'Salón 13 - CIDECAME','CITIS','Planta Baja');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observacion`
--

DROP TABLE IF EXISTS `observacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observacion` (
  `IdObservacion` int NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Minimo` float NOT NULL,
  `Maximo` float NOT NULL,
  `IdSensor` int NOT NULL,
  PRIMARY KEY (`IdObservacion`),
  KEY `IdSensor` (`IdSensor`),
  CONSTRAINT `observacion_ibfk_1` FOREIGN KEY (`IdSensor`) REFERENCES `sensor` (`IdSensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observacion`
--

LOCK TABLES `observacion` WRITE;
/*!40000 ALTER TABLE `observacion` DISABLE KEYS */;
INSERT INTO `observacion` VALUES (1,'Temperatura','Mide a cuantos grados celcius está el ambiente al momento',18.45,24.5,1);
/*!40000 ALTER TABLE `observacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot`
--

DROP TABLE IF EXISTS `ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot` (
  `IdOT` int NOT NULL,
  `Valor` float NOT NULL,
  `IdTiempo` int NOT NULL,
  `IdObservacion` int NOT NULL,
  `IdSA` int NOT NULL,
  PRIMARY KEY (`IdOT`),
  KEY `IdTiempo` (`IdTiempo`),
  KEY `IdObservacion` (`IdObservacion`),
  KEY `IdSA` (`IdSA`),
  CONSTRAINT `ot_ibfk_1` FOREIGN KEY (`IdTiempo`) REFERENCES `tiempo` (`IdTiempo`),
  CONSTRAINT `ot_ibfk_2` FOREIGN KEY (`IdObservacion`) REFERENCES `observacion` (`IdObservacion`),
  CONSTRAINT `ot_ibfk_3` FOREIGN KEY (`IdSA`) REFERENCES `sa` (`IdSA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot`
--

LOCK TABLES `ot` WRITE;
/*!40000 ALTER TABLE `ot` DISABLE KEYS */;
INSERT INTO `ot` VALUES (1,22.9,1,1,1);
/*!40000 ALTER TABLE `ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa`
--

DROP TABLE IF EXISTS `sa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sa` (
  `IdSA` int NOT NULL,
  `FechaInstalacion` date NOT NULL,
  `FechaMantenimiento` date NOT NULL,
  `FechaCalibracion` date NOT NULL,
  `IdSensor` int NOT NULL,
  `IdAula` int NOT NULL,
  PRIMARY KEY (`IdSA`),
  KEY `IdSensor` (`IdSensor`),
  KEY `IdAula` (`IdAula`),
  CONSTRAINT `sa_ibfk_1` FOREIGN KEY (`IdSensor`) REFERENCES `sensor` (`IdSensor`),
  CONSTRAINT `sa_ibfk_2` FOREIGN KEY (`IdAula`) REFERENCES `aula` (`IdAula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa`
--

LOCK TABLES `sa` WRITE;
/*!40000 ALTER TABLE `sa` DISABLE KEYS */;
INSERT INTO `sa` VALUES (1,'2002-01-01','2022-12-23','2022-12-23',1,1);
/*!40000 ALTER TABLE `sa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `IdSensor` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  `Rango` int NOT NULL,
  PRIMARY KEY (`IdSensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'MINISPLIT MABE','Mmt12habwcam2',1000);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo`
--

DROP TABLE IF EXISTS `tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiempo` (
  `IdTiempo` int NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  PRIMARY KEY (`IdTiempo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo`
--

LOCK TABLES `tiempo` WRITE;
/*!40000 ALTER TABLE `tiempo` DISABLE KEYS */;
INSERT INTO `tiempo` VALUES (1,'2024-02-12','12:34:29');
/*!40000 ALTER TABLE `tiempo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-12  1:15:28
