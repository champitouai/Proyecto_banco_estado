-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: compras
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `analista`
--

DROP TABLE IF EXISTS `analista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analista` (
  `Analista` varchar(50) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Analista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analista`
--

LOCK TABLES `analista` WRITE;
/*!40000 ALTER TABLE `analista` DISABLE KEYS */;
INSERT INTO `analista` VALUES ('Arturo Prat','arturo.prat@gmail.com','84389423'),('Hector Hidalgo','hahidalgo@gmail.com','94848324'),('Henry Ford','henry.ford@gmail.com','64673464'),('Leonardo Farkas','leo.farkas@gmail.com','12345678'),('Lionel Messi','lio.messi@gmail.com','98765432'),('Manuel Rodriguez','manu.rodri@gmail.com','38218414');
/*!40000 ALTER TABLE `analista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `ID_categoria` int NOT NULL,
  `Asunto` varchar(50) DEFAULT NULL,
  `Rut_proveedor` varchar(12) DEFAULT NULL,
  `Analista` varchar(50) DEFAULT NULL,
  `Gestor` varchar(50) DEFAULT NULL,
  `Tramo` int DEFAULT NULL,
  `Modalidad` varchar(50) DEFAULT NULL,
  `Gerencia` varchar(50) DEFAULT NULL,
  `Subgerencia` varchar(50) DEFAULT NULL,
  `Clasificacion` varchar(50) DEFAULT NULL,
  `ID_fecha` int DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Monto` float DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_categoria`),
  KEY `Rut_proveedor` (`Rut_proveedor`),
  KEY `Analista` (`Analista`),
  KEY `Gestor` (`Gestor`),
  KEY `Gerencia` (`Gerencia`),
  KEY `Subgerencia` (`Subgerencia`),
  KEY `ID_fecha` (`ID_fecha`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Rut_proveedor`) REFERENCES `proveedor` (`Rut_proveedor`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`Analista`) REFERENCES `analista` (`Analista`),
  CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`Gestor`) REFERENCES `gestor` (`Gestor`),
  CONSTRAINT `compras_ibfk_4` FOREIGN KEY (`Gerencia`) REFERENCES `gerencia` (`Gerencia`),
  CONSTRAINT `compras_ibfk_5` FOREIGN KEY (`Subgerencia`) REFERENCES `subgerencia` (`Subgerencia`),
  CONSTRAINT `compras_ibfk_6` FOREIGN KEY (`ID_fecha`) REFERENCES `fecha` (`ID_fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1000,'Goles','12345678-9','Lionel Messi','Lionel Messi',5,'Licitacion privada','Gerencia de Goles','Subgerencia de penales','Licitacion privada',29122023,'abierto',10000,'Futbol'),(1001,'Minera','78956535-2','Leonardo Farkas','Farkitas',4,'Licitacion publica','Gerencias de minas','Subgerencia de mineras','Licitacion publica',12292023,'abierto',5000000,'Minera'),(1002,'Salud','15328565-6','Hector Hidalgo','Hector Hidalgo',3,'Licitacion privada','Gerencia de salud','Subgerencia de salud','Licitacion privada',11292023,'cerrado',1244370,'Salud'),(1003,'Salud ','15328565-6','Hector Hidalgo','Hector Hidalgo',5,'Licitacion publica','Gerencia de salud','Subgerencia de salud','Licitacion publica',23122023,'cerrado',8938890,'Salud'),(1004,'Comida','48318832-2','Manuel Rodriguez','Luis Rodriguez',1,'Licitacion privada','Gerencia de comida','Subgerencia de comida','Licitacion privada',29122023,'abierto',1000,'Comida'),(1005,'Autos','74712753-3','Henry Ford','Pablo Lopez',5,'Licitacion publica','Gerencia de autos','Subgerencia de autos','Licitacion publica',31122023,'abierto',10000000,NULL),(1006,'Muebles','75178754-9','Arturo Prat','Martin Carcamo',3,'Licitacion privada','Gerencia de muebles','Subgerencia de muebles','Licitacion privada',30122023,'abierto',20000,NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato_fecha`
--

DROP TABLE IF EXISTS `contrato_fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato_fecha` (
  `ID_fecha_contrato` int NOT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_renovacion` date DEFAULT NULL,
  `Fecha_termino` date DEFAULT NULL,
  `Plazo_dias_Aviso` int DEFAULT NULL,
  PRIMARY KEY (`ID_fecha_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato_fecha`
--

LOCK TABLES `contrato_fecha` WRITE;
/*!40000 ALTER TABLE `contrato_fecha` DISABLE KEYS */;
INSERT INTO `contrato_fecha` VALUES (1012024,'2024-01-01','2024-06-01','2024-12-01',180),(1022024,'2024-01-02','2024-06-02','2024-12-02',180),(1032024,'2024-01-03','2024-06-03','2024-12-03',180),(1042024,'2024-01-04','2024-04-04','2024-06-04',60),(1052024,'2024-01-05','2024-12-01','2025-06-01',180),(1062024,'2024-01-06','2024-06-06','2024-12-06',180),(1072024,'2024-01-07','2024-12-07','2025-06-07',360),(1082024,'2024-01-08','2024-04-08','2024-06-08',60);
/*!40000 ALTER TABLE `contrato_fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `N_contrato` int NOT NULL,
  `ID_categoria` int DEFAULT NULL,
  `Tipo_contrato` varchar(50) DEFAULT NULL,
  `ID_fecha_contrato` int DEFAULT NULL,
  `Estado_vencimiento` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Monto_total` float DEFAULT NULL,
  `Multas` int DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`N_contrato`),
  KEY `ID_categoria` (`ID_categoria`),
  KEY `ID_fecha_contrato` (`ID_fecha_contrato`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`ID_categoria`) REFERENCES `compras` (`ID_categoria`),
  CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`ID_fecha_contrato`) REFERENCES `contrato_fecha` (`ID_fecha_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (0,1000,'Orden de compra',1012024,'Activo','Al dia',10000,0,'Proveedor al dia'),(1,1001,'Garantia',1022024,'Activo','Al dia',500000,0,'Proveedor al dia'),(2,1002,'Orden de compra',1032024,'Activo','Al dia',1244370,0,'Proveedor al dia'),(3,1003,'Garantia',1042024,'Renovado','Al dia',8938890,0,'Proveedor unico'),(4,1004,'Poliza',1052024,'Renovado','Al dia',1000,0,'Proveedor Unico'),(5,1005,'Poliza',1062024,'Vencido','Atrasado',1000000,1,'Proveedor no responsable'),(6,1006,'Orden de compra',1072024,'Vencido','Atrasado',20000,2,'Proveedor no responsable');
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha`
--

DROP TABLE IF EXISTS `fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecha` (
  `ID_fecha` int NOT NULL,
  `Ano` year DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_abjudicacion` date DEFAULT NULL,
  PRIMARY KEY (`ID_fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha`
--

LOCK TABLES `fecha` WRITE;
/*!40000 ALTER TABLE `fecha` DISABLE KEYS */;
INSERT INTO `fecha` VALUES (11292023,2023,11,'2023-10-29','2023-11-29'),(12292023,2023,12,'2023-10-29','2023-12-29'),(17122023,2023,12,'2023-12-17','2023-12-18'),(23122023,2023,12,'2023-12-23','2024-12-24'),(29122023,2023,12,'2023-12-29','2023-12-30'),(30122023,2023,12,'2023-12-30','2023-12-31'),(31122023,2023,12,'2023-12-31','2024-01-01');
/*!40000 ALTER TABLE `fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerencia`
--

DROP TABLE IF EXISTS `gerencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerencia` (
  `Gerencia` varchar(50) NOT NULL,
  `Area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Gerencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerencia`
--

LOCK TABLES `gerencia` WRITE;
/*!40000 ALTER TABLE `gerencia` DISABLE KEYS */;
INSERT INTO `gerencia` VALUES ('Gerencia de autos','Autos'),('Gerencia de comida','Comida'),('Gerencia de goles','Futbol'),('Gerencia de muebles','Muebles'),('Gerencia de salud','Salud'),('Gerencias de minas','Mineria');
/*!40000 ALTER TABLE `gerencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestor`
--

DROP TABLE IF EXISTS `gestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor` (
  `Gestor` varchar(50) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Gestor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor`
--

LOCK TABLES `gestor` WRITE;
/*!40000 ALTER TABLE `gestor` DISABLE KEYS */;
INSERT INTO `gestor` VALUES ('Farkitas','farkitas@gmail.com','98765433'),('Hector Hidalgo','hhidalgo@gmail.com','99032568'),('Lionel Messi','messigod@gmail.com','12345678'),('Luis Rodriguez','luis.rodri@gmail.com','37487423'),('Martin Carcamo','marti.carca@gmail.com','48327148'),('Pablo Lopez','pablo.lopez@gmail.com','74382482');
/*!40000 ALTER TABLE `gestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `Razon_social` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `Rut_proveedor` varchar(50) NOT NULL,
  PRIMARY KEY (`Rut_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('Pelotas LA','balones@gmail.com',98765432,'12345678-9'),('Remedios LA','remedios@gmail.com',99804568,'15328565-6'),('Frutas LA','frutitas@gmail.com',74832442,'48318832-2'),('Mazda LA','mazda@gmail.com',12434598,'74712753-3'),('Muebles LA','muebles@gmail.com',74328747,'75178754-9'),('Mineria LA','minera@gmail.com',84123423,'78956535-2'),('Globos LA','globolandia@gmail.com',12345678,'98765432-1');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgerencia`
--

DROP TABLE IF EXISTS `subgerencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgerencia` (
  `Subgerencia` varchar(50) NOT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Gerencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Subgerencia`),
  KEY `Gerencia` (`Gerencia`),
  CONSTRAINT `subgerencia_ibfk_1` FOREIGN KEY (`Gerencia`) REFERENCES `gerencia` (`Gerencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgerencia`
--

LOCK TABLES `subgerencia` WRITE;
/*!40000 ALTER TABLE `subgerencia` DISABLE KEYS */;
INSERT INTO `subgerencia` VALUES ('Subgerencia de autos','Autos','Gerencia de autos'),('Subgerencia de comida','Comida','Gerencia de comida'),('Subgerencia de mineras','Mineria','Gerencias de minas'),('Subgerencia de muebles','Muebles','Gerencia de muebles'),('Subgerencia de penales','Futbol','Gerencia de goles'),('Subgerencia de salud','Salud','Gerencia de salud');
/*!40000 ALTER TABLE `subgerencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  PRIMARY KEY (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Andres Leon','Hidalgo Holloway','ahidalgo@gmail.com','5048d9e097a2df0dcd118f03af65d42f2878c8ef14110419cc53a8feca832b01'),('Hector Arturo','Hidalgo Armstrong','hahidalgo@gmail.com','5730ba44574a4b0a672d7476f0c9bc004f8a8c1a8626de67b01833356235aa9f'),('Leonardo Antonio','Farkas Lagos','leofarkas@gmail.com','dde956ad99b1ccbb58dd740887dd326f7df365085e03e2595666a93ccc1ab716'),('Lionel Andres','Messi Messi','leomessi@gmail.com','9a54546d3dc5d510eaab5319c687596c5e923ec881e8a916b5d4020fc312704c');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 17:13:35
