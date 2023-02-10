-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistema_resilia
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_turma` (`id_turma`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Amanda',NULL,'036.258.258-98'),(2,'Julia',NULL,'123.456.789-00'),(3,'Julia',1,'123.456.789-00');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_turma` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_turma` (`id_turma`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`),
  CONSTRAINT `aula_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'T.I','T?cnico de Inform?tica');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `data_matricula` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_turma` (`id_turma`),
  KEY `id_aluno` (`id_aluno`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_matricula` int(11) DEFAULT NULL,
  `id_aula` int(11) DEFAULT NULL,
  `nota` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_aula` (`id_aula`),
  KEY `id_matricula` (`id_matricula`),
  CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id`),
  CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Ruan','164.785.987-58','2198852-8598','Tecnico de Informatica'),(2,'Thais','164.785.987-74','2196541-8598','Tecnico de Redes'),(3,'Lucia','123.785.987-58','2198852-1234','Tecnico de Telecomunicacao');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `ano` date DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'01','0000-00-00','tarde',NULL);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 10:15:59
