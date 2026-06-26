-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: boletiland_crud
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `cache`
--
CREATE DATABASE IF NOT EXISTS boletiland_crud
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE boletiland_crud;

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_comprador` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_id` bigint unsigned NOT NULL,
  `cantidad` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_producto_id_foreign` (`producto_id`),
  CONSTRAINT `compras_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'Carlos Pérez',1,2,'2026-03-01 16:30:00','2026-03-01 16:30:00'),(2,'María Gómez',2,3,'2026-03-02 20:15:00','2026-03-02 20:15:00'),(3,'Juan López',3,1,'2026-03-03 15:00:00','2026-03-03 15:00:00'),(4,'Ana Martínez',4,2,'2026-03-04 22:45:00','2026-03-04 22:45:00'),(5,'Pedro Sánchez',5,4,'2026-03-05 17:30:00','2026-03-05 17:30:00'),(6,'Laura Fernández',6,1,'2026-03-06 14:20:00','2026-03-06 14:20:00'),(7,'Miguel Rodríguez',7,3,'2026-03-07 19:50:00','2026-03-07 19:50:00'),(8,'Sofía García',8,2,'2026-03-08 16:00:00','2026-03-08 16:00:00'),(9,'David Torres',9,5,'2026-03-09 21:30:00','2026-03-09 21:30:00'),(10,'Elena Morales',10,1,'2026-03-10 18:00:00','2026-03-10 18:00:00'),(11,'Javier Ramírez',11,2,'2026-03-11 15:30:00','2026-03-11 15:30:00'),(12,'Isabel Castro',12,3,'2026-03-12 20:00:00','2026-03-12 20:00:00'),(13,'Roberto Díaz',13,1,'2026-03-13 17:15:00','2026-03-13 17:15:00'),(14,'Carmen Reyes',14,4,'2026-03-14 22:30:00','2026-03-14 22:30:00'),(15,'Andrés Mendoza',15,2,'2026-03-15 16:45:00','2026-03-15 16:45:00'),(16,'Patricia Ortega',16,1,'2026-03-16 14:00:00','2026-03-16 14:00:00'),(17,'Ricardo Vargas',17,3,'2026-03-17 19:20:00','2026-03-17 19:20:00'),(18,'Natalia Romero',18,5,'2026-03-18 18:00:00','2026-03-18 18:00:00'),(19,'Francisco Cruz',19,2,'2026-03-19 15:40:00','2026-03-19 15:40:00'),(20,'Gabriela Silva',20,1,'2026-03-20 21:00:00','2026-03-20 21:00:00'),(21,'Alejandro Ruiz',21,4,'2026-03-21 17:00:00','2026-03-21 17:00:00'),(22,'Valeria Medina',22,2,'2026-03-22 20:30:00','2026-03-22 20:30:00'),(23,'Cristian Herrera',23,3,'2026-03-23 15:15:00','2026-03-23 15:15:00'),(24,'Paula Rojas',24,1,'2026-03-24 22:00:00','2026-03-24 22:00:00'),(25,'Ramón Gutiérrez',25,5,'2026-03-25 16:30:00','2026-03-25 16:30:00'),(26,'Manuela Pérez',26,2,'2026-03-26 19:45:00','2026-03-26 19:45:00'),(28,'Lucía Romero',28,3,'2026-03-28 18:15:00','2026-03-28 18:15:00'),(29,'Héctor Gómez',29,4,'2026-03-29 21:30:00','2026-03-29 21:30:00'),(30,'Diana Torres',30,2,'2026-03-30 17:00:00','2026-03-30 17:00:00'),(31,'Fernando Morales',31,1,'2026-03-31 15:00:00','2026-03-31 15:00:00'),(32,'Mariana Castillo',32,3,'2026-04-01 16:00:00','2026-04-01 16:00:00'),(33,'Vicente Herrera',33,2,'2026-04-02 20:30:00','2026-04-02 20:30:00'),(34,'Rosa Mendoza',34,1,'2026-04-03 15:20:00','2026-04-03 15:20:00'),(35,'Luis Fernández',35,4,'2026-04-04 22:00:00','2026-04-04 22:00:00'),(36,'Teresa Vargas',36,5,'2026-04-05 17:30:00','2026-04-05 17:30:00'),(37,'Mario Sánchez',37,2,'2026-04-06 14:45:00','2026-04-06 14:45:00'),(38,'Claudia Reyes',38,3,'2026-04-07 19:00:00','2026-04-07 19:00:00'),(39,'Hugo Martínez',39,1,'2026-04-08 21:30:00','2026-04-08 21:30:00'),(40,'Ana Silva',40,2,'2026-04-09 16:15:00','2026-04-09 16:15:00'),(41,'Emilio Castro',41,4,'2026-04-10 18:00:00','2026-04-10 18:00:00'),(42,'Lorena Rojas',42,1,'2026-04-11 15:00:00','2026-04-11 15:00:00'),(43,'Marcos García',43,3,'2026-04-12 20:30:00','2026-04-12 20:30:00'),(44,'Sandra Paredes',44,2,'2026-04-13 17:20:00','2026-04-13 17:20:00'),(45,'Tomás López',45,5,'2026-04-14 22:45:00','2026-04-14 22:45:00'),(46,'Nora Figueroa',46,1,'2026-04-15 16:00:00','2026-04-15 16:00:00'),(47,'Enrique Ríos',47,4,'2026-04-16 14:30:00','2026-04-16 14:30:00'),(48,'Marta Salazar',48,2,'2026-04-17 19:45:00','2026-04-17 19:45:00'),(49,'Jorge López',49,3,'2026-04-18 18:00:00','2026-04-18 18:00:00'),(50,'Florencia Ortiz',50,1,'2026-04-19 15:30:00','2026-04-19 15:30:00'),(51,'Daniel Acevedo',51,2,'2026-04-20 21:15:00','2026-04-20 21:15:00'),(52,'Sara Cabrera',52,4,'2026-04-21 16:00:00','2026-04-21 16:00:00'),(53,'Raúl Herrera',53,1,'2026-04-22 20:00:00','2026-04-22 20:00:00'),(54,'Gloria Acosta',54,3,'2026-04-23 14:45:00','2026-04-23 14:45:00'),(55,'Oscar Morales',55,2,'2026-04-24 19:30:00','2026-04-24 19:30:00'),(56,'María Pérez',56,5,'2026-04-25 17:00:00','2026-04-25 17:00:00'),(57,'Diego Fernández',57,1,'2026-04-26 15:15:00','2026-04-26 15:15:00'),(58,'Julia Martínez',58,4,'2026-04-27 22:00:00','2026-04-27 22:00:00'),(59,'Arturo Díaz',59,2,'2026-04-28 16:30:00','2026-04-28 16:30:00'),(60,'Cecilia Soto',60,3,'2026-04-29 20:45:00','2026-04-29 20:45:00'),(61,'Rubén González',61,1,'2026-04-30 14:00:00','2026-04-30 14:00:00'),(62,'Fátima Medina',62,2,'2026-05-01 18:30:00','2026-05-01 18:30:00'),(63,'Alexis Vargas',63,5,'2026-05-02 15:00:00','2026-05-02 15:00:00'),(64,'Mónica Romero',64,1,'2026-05-03 21:00:00','2026-05-03 21:00:00'),(65,'César Gutiérrez',65,3,'2026-05-04 16:45:00','2026-05-04 16:45:00'),(66,'Ana María León',66,4,'2026-05-05 20:00:00','2026-05-05 20:00:00'),(67,'Jesús Rojas',67,2,'2026-05-06 17:30:00','2026-05-06 17:30:00'),(68,'Violeta Castro',68,1,'2026-05-07 14:20:00','2026-05-07 14:20:00'),(69,'Guillermo Reyes',69,3,'2026-05-08 22:30:00','2026-05-08 22:30:00'),(70,'Pamela Herrera',70,5,'2026-05-09 19:00:00','2026-05-09 19:00:00'),(71,'Óscar Flores',71,2,'2026-05-10 15:45:00','2026-05-10 15:45:00'),(72,'Luis Alberto Pérez',72,1,'2026-05-11 18:15:00','2026-05-11 18:15:00'),(73,'Natalia Ríos',73,4,'2026-05-12 16:00:00','2026-05-12 16:00:00'),(74,'Ricardo Lozano',74,2,'2026-05-13 20:30:00','2026-05-13 20:30:00'),(75,'Elena Santos',75,3,'2026-05-14 14:50:00','2026-05-14 14:50:00'),(76,'Antonio González',76,1,'2026-05-15 22:15:00','2026-05-15 22:15:00'),(77,'Dolores Aguirre',77,5,'2026-05-16 17:00:00','2026-05-16 17:00:00'),(78,'Santiago Bautista',78,2,'2026-05-17 15:30:00','2026-05-17 15:30:00'),(79,'Brenda Paredes',79,4,'2026-05-18 19:45:00','2026-05-18 19:45:00'),(80,'Adrián Martínez',80,2,'2026-05-19 16:15:00','2026-06-25 21:42:17'),(81,'Karla Salinas',81,3,'2026-05-20 21:30:00','2026-05-20 21:30:00'),(82,'Pablo Méndez',82,2,'2026-05-21 14:00:00','2026-05-21 14:00:00'),(83,'Vanessa Delgado',83,1,'2026-05-22 18:45:00','2026-05-22 18:45:00'),(84,'Rafael Santos',84,5,'2026-05-23 20:00:00','2026-05-23 20:00:00'),(85,'Beatriz Peña',85,3,'2026-05-24 15:20:00','2026-05-24 15:20:00'),(86,'Humberto Cruz',86,4,'2026-05-25 22:30:00','2026-05-25 22:30:00'),(87,'Olivia Montoya',87,1,'2026-05-26 17:10:00','2026-05-26 17:10:00'),(88,'Gustavo Lira',88,2,'2026-05-27 14:40:00','2026-05-27 14:40:00'),(89,'Diana Mendoza',89,3,'2026-05-28 19:20:00','2026-05-28 19:20:00'),(90,'Ángel Fuentes',90,5,'2026-05-29 16:00:00','2026-05-29 16:00:00'),(91,'Yolanda Rocha',91,1,'2026-05-30 21:45:00','2026-05-30 21:45:00'),(92,'Eduardo Nava',92,4,'2026-06-01 15:00:00','2026-06-01 15:00:00'),(93,'Patricia Zúñiga',93,2,'2026-06-02 20:30:00','2026-06-02 20:30:00'),(94,'Esteban Cabrera',94,3,'2026-06-03 17:15:00','2026-06-03 17:15:00'),(95,'Lourdes Vega',95,1,'2026-06-04 14:20:00','2026-06-04 14:20:00'),(96,'Felipe Orozco',96,5,'2026-06-05 22:00:00','2026-06-05 22:00:00'),(97,'Leticia Herrera',97,2,'2026-06-06 16:30:00','2026-06-06 16:30:00'),(98,'Mauro Lara',98,4,'2026-06-07 19:45:00','2026-06-07 19:45:00'),(99,'Silvia Ponce',99,1,'2026-06-08 15:15:00','2026-06-08 15:15:00'),(100,'Alfonso Castillo',100,3,'2026-06-09 21:00:00','2026-06-09 21:00:00'),(101,'Jacqueline Solís',101,2,'2026-06-10 18:00:00','2026-06-10 18:00:00'),(102,'Carlos Pérez',15,2,'2026-01-05 16:30:00','2026-01-05 16:30:00'),(103,'María Gómez',42,1,'2026-01-07 20:15:00','2026-01-07 20:15:00'),(104,'Juan López',7,3,'2026-01-09 15:00:00','2026-01-09 15:00:00'),(105,'Ana Martínez',23,2,'2026-01-11 22:45:00','2026-01-11 22:45:00'),(106,'Pedro Sánchez',56,1,'2026-01-13 17:30:00','2026-01-13 17:30:00'),(107,'Laura Fernández',88,4,'2026-01-15 14:20:00','2026-01-15 14:20:00'),(108,'Miguel Rodríguez',33,2,'2026-01-17 19:50:00','2026-01-17 19:50:00'),(109,'Sofía García',67,1,'2026-01-19 16:00:00','2026-01-19 16:00:00'),(110,'David Torres',12,3,'2026-01-21 21:30:00','2026-01-21 21:30:00'),(111,'Elena Morales',94,2,'2026-01-23 18:00:00','2026-01-23 18:00:00'),(112,'Carlos Pérez',78,1,'2026-01-25 15:30:00','2026-01-25 15:30:00'),(113,'Javier Ramírez',45,3,'2026-02-02 20:00:00','2026-02-02 20:00:00'),(114,'Isabel Castro',19,2,'2026-02-04 17:15:00','2026-02-04 17:15:00'),(115,'María Gómez',71,1,'2026-02-06 22:30:00','2026-02-06 22:30:00'),(116,'Roberto Díaz',37,4,'2026-02-08 16:45:00','2026-02-08 16:45:00'),(117,'Carmen Reyes',52,2,'2026-02-10 14:00:00','2026-02-10 14:00:00'),(118,'Andrés Mendoza',9,1,'2026-02-12 19:20:00','2026-02-12 19:20:00'),(119,'Patricia Ortega',61,3,'2026-02-14 18:00:00','2026-02-14 18:00:00'),(120,'Juan López',86,2,'2026-02-16 15:40:00','2026-02-16 15:40:00'),(121,'Ricardo Vargas',28,1,'2026-02-18 21:00:00','2026-02-18 21:00:00'),(122,'Natalia Romero',14,4,'2026-02-20 17:00:00','2026-02-20 17:00:00'),(123,'Francisco Cruz',49,2,'2026-02-22 20:30:00','2026-02-22 20:30:00'),(124,'Gabriela Silva',73,3,'2026-02-24 15:15:00','2026-02-24 15:15:00'),(125,'Pedro Sánchez',22,1,'2026-02-26 22:00:00','2026-02-26 22:00:00'),(126,'Alejandro Ruiz',58,2,'2026-02-28 16:30:00','2026-02-28 16:30:00'),(127,'Valeria Medina',35,5,'2026-03-02 19:45:00','2026-03-02 19:45:00'),(128,'Cristian Herrera',16,2,'2026-03-04 14:30:00','2026-03-04 14:30:00'),(129,'Paula Rojas',92,1,'2026-03-06 18:15:00','2026-03-06 18:15:00'),(130,'Ana Martínez',44,3,'2026-03-08 21:30:00','2026-03-08 21:30:00'),(131,'Ramón Gutiérrez',68,2,'2026-03-10 17:00:00','2026-03-10 17:00:00'),(132,'Manuela Pérez',25,1,'2026-03-12 15:00:00','2026-03-12 15:00:00'),(133,'Alberto Díaz',51,4,'2026-03-14 16:00:00','2026-03-14 16:00:00'),(134,'Lucía Romero',30,2,'2026-03-16 20:30:00','2026-03-16 20:30:00'),(135,'Sofía García',79,3,'2026-03-18 15:20:00','2026-03-18 15:20:00'),(136,'Héctor Gómez',40,1,'2026-03-20 22:00:00','2026-03-20 22:00:00'),(137,'Diana Torres',13,2,'2026-03-22 17:30:00','2026-03-22 17:30:00'),(138,'Fernando Morales',97,3,'2026-03-24 14:45:00','2026-03-24 14:45:00'),(139,'Laura Fernández',64,1,'2026-03-26 19:00:00','2026-03-26 19:00:00'),(140,'Mariana Castillo',21,4,'2026-03-28 21:30:00','2026-03-28 21:30:00'),(141,'Vicente Herrera',75,2,'2026-03-30 16:15:00','2026-03-30 16:15:00'),(142,'Rosa Mendoza',89,1,'2026-04-01 18:00:00','2026-04-01 18:00:00'),(143,'Luis Fernández',38,3,'2026-04-03 15:00:00','2026-04-03 15:00:00'),(144,'Teresa Vargas',18,2,'2026-04-05 20:30:00','2026-04-05 20:30:00'),(145,'Mario Sánchez',65,4,'2026-04-07 17:20:00','2026-04-07 17:20:00'),(146,'Claudia Reyes',26,1,'2026-04-09 22:45:00','2026-04-09 22:45:00'),(147,'Hugo Martínez',82,2,'2026-04-11 16:00:00','2026-04-11 16:00:00'),(148,'Ana Silva',46,3,'2026-04-13 14:30:00','2026-04-13 14:30:00'),(149,'Emilio Castro',53,1,'2026-04-15 19:45:00','2026-04-15 19:45:00'),(150,'Lorena Rojas',11,4,'2026-04-17 18:00:00','2026-04-17 18:00:00'),(151,'David Torres',72,2,'2026-04-19 15:30:00','2026-04-19 15:30:00'),(152,'Marcos García',34,1,'2026-04-21 21:15:00','2026-04-21 21:15:00'),(153,'Sandra Paredes',87,3,'2026-04-23 16:00:00','2026-04-23 16:00:00'),(154,'Tomás López',49,2,'2026-04-25 20:00:00','2026-04-25 20:00:00'),(155,'Nora Figueroa',3,1,'2026-04-28 14:45:00','2026-04-28 14:45:00'),(156,'Enrique Ríos',77,5,'2026-05-01 19:30:00','2026-05-01 19:30:00'),(157,'Marta Salazar',31,2,'2026-05-03 17:00:00','2026-05-03 17:00:00'),(158,'Jorge López',60,3,'2026-05-05 15:15:00','2026-05-05 15:15:00'),(159,'Florencia Ortiz',8,1,'2026-05-07 22:00:00','2026-05-07 22:00:00'),(160,'Daniel Acevedo',93,2,'2026-05-09 16:30:00','2026-05-09 16:30:00'),(161,'Sara Cabrera',27,4,'2026-05-11 20:45:00','2026-05-11 20:45:00'),(162,'Raúl Herrera',55,1,'2026-05-13 14:00:00','2026-05-13 14:00:00'),(163,'Gloria Acosta',84,3,'2026-05-15 18:30:00','2026-05-15 18:30:00'),(164,'Carlos Pérez',17,2,'2026-05-17 15:00:00','2026-05-17 15:00:00'),(165,'Oscar Morales',69,1,'2026-05-19 21:00:00','2026-05-19 21:00:00'),(166,'María Pérez',43,3,'2026-05-21 16:45:00','2026-05-21 16:45:00'),(167,'Diego Fernández',24,2,'2026-05-23 20:00:00','2026-05-23 20:00:00'),(168,'Julia Martínez',80,1,'2026-05-25 17:30:00','2026-05-25 17:30:00'),(169,'Arturo Díaz',39,4,'2026-05-27 14:20:00','2026-05-27 14:20:00'),(170,'Cecilia Soto',63,2,'2026-05-30 22:30:00','2026-05-30 22:30:00'),(171,'Rubén González',91,3,'2026-06-01 19:00:00','2026-06-01 19:00:00'),(172,'Fátima Medina',41,1,'2026-06-03 15:45:00','2026-06-03 15:45:00'),(173,'Alexis Vargas',6,2,'2026-06-05 18:15:00','2026-06-05 18:15:00'),(174,'Mónica Romero',76,3,'2026-06-07 16:00:00','2026-06-07 16:00:00'),(175,'César Gutiérrez',32,1,'2026-06-09 20:30:00','2026-06-09 20:30:00'),(176,'Ana María León',50,4,'2026-06-11 14:50:00','2026-06-11 14:50:00'),(177,'Jesús Rojas',70,2,'2026-06-13 22:15:00','2026-06-13 22:15:00'),(178,'Violeta Castro',20,1,'2026-06-15 17:00:00','2026-06-15 17:00:00'),(179,'Guillermo Reyes',59,3,'2026-06-17 15:30:00','2026-06-17 15:30:00'),(180,'Pamela Herrera',82,2,'2026-06-19 19:45:00','2026-06-19 19:45:00'),(181,'Óscar Flores',5,1,'2026-06-20 16:15:00','2026-06-20 16:15:00'),(182,'Luis Alberto Pérez',36,2,'2026-06-22 21:30:00','2026-06-22 21:30:00'),(183,'Natalia Ríos',95,3,'2026-06-24 14:00:00','2026-06-24 14:00:00'),(184,'Ricardo Lozano',10,1,'2026-06-26 18:45:00','2026-06-26 18:45:00'),(185,'Elena Santos',48,2,'2026-06-28 20:00:00','2026-06-28 20:00:00'),(186,'Antonio González',57,4,'2026-06-30 15:20:00','2026-06-30 15:20:00'),(187,'Juan Velazques',80,3,'2026-06-25 21:42:49','2026-06-25 21:43:05'),(188,'Juanito',5,2,'2026-06-25 22:09:28','2026-06-25 22:09:28'),(189,'Prueba 2',58,2,'2026-06-25 22:26:13','2026-06-25 22:26:13'),(190,'Sandra Maribel',7,2,'2026-06-26 04:55:19','2026-06-26 04:55:31');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_06_24_172455_create_productos_table',1),(5,'2026_06_24_172502_create_compras_table',2),(6,'2026_06_24_214959_create_personal_access_tokens_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto prueba',16.00,NULL,'2026-06-25 12:20:42',NULL),(2,'Laptop HP 15',599.99,'2026-03-15 16:30:00','2026-03-15 16:30:00',NULL),(3,'Mouse Logitech M185',25.50,'2026-03-20 20:45:00','2026-04-01 15:15:00',NULL),(4,'Teclado Redragon K552',45.00,'2026-03-10 14:20:00','2026-03-25 22:40:00',NULL),(5,'Monitor Samsung 24\"',199.00,'2026-02-28 17:00:00','2026-03-05 19:30:00',NULL),(6,'Impresora Epson L3150',280.00,'2026-03-01 15:10:00','2026-03-01 15:10:00',NULL),(7,'Disco SSD 1TB',89.90,'2026-04-05 21:20:00','2026-04-10 16:00:00',NULL),(8,'Memoria RAM 16GB',120.00,'2026-02-15 18:00:00','2026-03-12 14:45:00',NULL),(9,'Router TP-Link AC1200',55.00,'2026-03-18 23:30:00','2026-03-18 23:30:00',NULL),(10,'Cámara Web HD',35.00,'2026-04-01 16:00:00','2026-04-01 16:00:00',NULL),(11,'Auriculares Sony WH-CH510',60.00,'2026-03-25 22:00:00','2026-04-02 17:30:00',NULL),(12,'Base Refrigerante Laptop',30.00,'2026-04-10 15:00:00','2026-04-12 20:20:00',NULL),(13,'Adaptador USB-C HDMI',22.00,'2026-03-05 19:15:00','2026-03-08 16:45:00',NULL),(14,'Cable HDMI 2m',12.50,'2026-02-20 17:30:00','2026-03-01 14:00:00',NULL),(15,'Funda Laptop 15.6\"',18.00,'2026-03-28 20:00:00','2026-03-28 20:00:00',NULL),(16,'Mousepad Gamer XL',15.00,'2026-04-03 22:30:00','2026-04-05 15:20:00',NULL),(17,'USB 64GB Kingston',18.00,'2026-03-12 16:00:00','2026-03-15 18:30:00',NULL),(18,'Disco Duro Externo 2TB',130.00,'2026-02-10 15:00:00','2026-03-01 22:00:00',NULL),(19,'Tarjeta SD 128GB',25.00,'2026-03-22 17:20:00','2026-03-25 20:10:00',NULL),(20,'Memoria USB 128GB',22.00,'2026-04-08 19:00:00','2026-04-08 19:00:00',NULL),(21,'Parlantes Bluetooth',45.00,'2026-03-30 16:30:00','2026-04-01 21:00:00',NULL),(22,'Micrófono USB',55.00,'2026-02-25 22:45:00','2026-03-10 15:30:00',NULL),(23,'Webcam 4K',75.00,'2026-04-12 14:00:00','2026-04-12 14:00:00',NULL),(24,'Auriculares Gaming RGB',85.00,'2026-03-08 20:20:00','2026-06-26 05:09:33','2026-06-26 05:09:33'),(25,'Switch 8 Puertos',40.00,'2026-03-15 15:00:00','2026-03-18 23:00:00',NULL),(26,'Extensor WiFi',30.00,'2026-04-05 18:00:00','2026-04-07 16:30:00',NULL),(27,'Cable Ethernet 10m',15.00,'2026-02-28 21:30:00','2026-03-03 14:15:00',NULL),(28,'Adaptador WiFi USB',20.00,'2026-03-20 16:00:00','2026-03-22 20:00:00',NULL),(29,'Regulador Voltaje 6 tomas',35.00,'2026-03-02 17:00:00','2026-03-05 19:45:00',NULL),(30,'UPS 650VA',120.00,'2026-04-10 15:30:00','2026-04-12 22:20:00',NULL),(31,'Cargador Universal 65W',28.00,'2026-03-18 18:00:00','2026-03-20 16:00:00',NULL),(32,'Tarjeta Gráfica GTX 1650',350.00,'2026-03-25 21:00:00','2026-04-01 15:00:00',NULL),(33,'Fuente Poder 600W',80.00,'2026-02-12 16:30:00','2026-03-08 20:15:00',NULL),(34,'Ventilador CPU',25.00,'2026-03-30 19:00:00','2026-03-30 19:00:00',NULL),(35,'Tarjeta Madre B450',150.00,'2026-04-01 17:00:00','2026-04-03 21:30:00',NULL),(36,'Procesador Ryzen 5',220.00,'2026-03-10 14:00:00','2026-03-15 22:45:00',NULL),(37,'Licencia Windows 11',140.00,'2026-04-08 20:30:00','2026-04-08 20:30:00',NULL),(38,'Antivirus 1 año',30.00,'2026-03-15 16:00:00','2026-03-20 18:00:00',NULL),(39,'Office 365 1 año',70.00,'2026-02-20 15:00:00','2026-03-01 16:30:00',NULL),(40,'Funda iPhone 14',20.00,'2026-03-28 22:00:00','2026-04-02 17:00:00',NULL),(41,'Cargador Rápido USB-C',18.00,'2026-04-05 19:30:00','2026-04-08 15:15:00',NULL),(42,'Soporte Tablet',15.00,'2026-03-12 20:00:00','2026-03-15 16:30:00',NULL),(43,'Protector Pantalla',12.00,'2026-03-22 15:00:00','2026-03-25 22:00:00',NULL),(44,'Lector Tarjetas USB',12.00,'2026-04-10 16:00:00','2026-04-12 14:30:00',NULL),(45,'Hub USB 4 puertos',25.00,'2026-03-05 21:45:00','2026-03-08 17:20:00',NULL),(46,'Soporte Laptop Ajustable',35.00,'2026-03-18 17:30:00','2026-03-20 20:00:00',NULL),(47,'Luz LED Escritorio',22.00,'2026-04-01 14:00:00','2026-04-03 18:45:00',NULL),(48,'Cámara Seguridad WiFi',80.00,'2026-02-15 16:00:00','2026-03-01 15:00:00',NULL),(49,'Sensor Movimiento',25.00,'2026-03-25 18:00:00','2026-03-28 21:30:00',NULL),(50,'Bocina Inteligente',50.00,'2026-04-08 22:30:00','2026-04-10 16:00:00',NULL),(51,'Pulsera Inteligente',35.00,'2026-03-30 20:00:00','2026-04-02 15:00:00',NULL),(52,'Cargador Inalámbrico',40.00,'2026-04-12 17:00:00','2026-04-12 17:00:00',NULL),(53,'Refrigeradora 10 pies',450.00,'2026-03-20 14:00:00','2026-03-25 16:30:00',NULL),(54,'Microondas 20L',120.00,'2026-04-01 20:15:00','2026-04-01 20:15:00',NULL),(55,'Licuadora Oster',65.00,'2026-02-28 15:30:00','2026-03-05 22:20:00',NULL),(56,'Cafetera Eléctrica',45.00,'2026-03-15 17:00:00','2026-03-18 19:45:00',NULL),(57,'Plancha de Vapor',35.00,'2026-04-05 16:00:00','2026-04-08 14:30:00',NULL),(58,'Aspiradora Manual',55.00,'2026-03-10 22:30:00','2026-03-10 22:30:00',NULL),(59,'Silla Ergonómica',180.00,'2026-03-25 15:00:00','2026-03-28 17:15:00',NULL),(60,'Escritorio 120cm',220.00,'2026-02-15 16:00:00','2026-02-20 20:30:00',NULL),(61,'Estante Metálico',75.00,'2026-04-08 14:45:00','2026-04-10 21:00:00',NULL),(62,'Gavetero 3 Cajones',95.00,'2026-03-18 19:00:00','2026-03-22 15:30:00',NULL),(63,'Lampara Escritorio LED',28.00,'2026-04-12 17:30:00','2026-04-12 17:30:00',NULL),(64,'Tablero Corcho 60x45',22.00,'2026-03-05 16:00:00','2026-03-08 18:00:00',NULL),(65,'Camisa Manga Larga',35.00,'2026-03-28 21:30:00','2026-04-01 15:00:00',NULL),(66,'Pantalón Jeans Slim',45.00,'2026-02-20 17:20:00','2026-02-25 22:00:00',NULL),(67,'Chaqueta Impermeable',65.00,'2026-04-03 16:00:00','2026-04-05 19:20:00',NULL),(68,'Zapatos Deportivos',55.00,'2026-03-12 15:00:00','2026-03-15 20:30:00',NULL),(69,'Bufanda de Lana',18.00,'2026-03-22 20:00:00','2026-03-25 16:00:00',NULL),(70,'Gorra Deportiva',15.00,'2026-04-10 14:30:00','2026-04-12 17:45:00',NULL),(71,'Perfume 50ml',40.00,'2026-03-30 17:00:00','2026-03-30 17:00:00',NULL),(72,'Set de Maquillaje',35.00,'2026-04-01 22:00:00','2026-04-03 16:30:00',NULL),(73,'Crema Facial Hidratante',24.00,'2026-02-25 16:00:00','2026-06-25 12:24:44',NULL),(74,'Aceite Esencial 30ml',20.00,'2026-03-15 14:30:00','2026-06-25 12:24:36',NULL),(75,'Cepillo Eléctrico Dental',60.00,'2026-04-05 20:00:00','2026-04-08 15:45:00',NULL),(76,'Rasuradora Eléctrica',55.00,'2026-03-08 17:00:00','2026-03-12 22:30:00',NULL),(77,'Juego de Mesa Monopoly',30.00,'2026-03-20 16:00:00','2026-03-22 19:00:00',NULL),(78,'Rompecabezas 1000 piezas',20.00,'2026-04-08 15:00:00','2026-04-10 17:00:00',NULL),(79,'Muñeca Coleccionable',45.00,'2026-02-28 21:30:00','2026-03-03 16:15:00',NULL),(80,'Carro Control Remoto',55.00,'2026-03-25 18:00:00','2026-03-28 14:45:00',NULL),(81,'Set de Arte 40 piezas',25.00,'2026-04-12 19:00:00','2026-04-12 19:00:00',NULL),(82,'Pista Hot Wheels',35.00,'2026-03-10 22:00:00','2026-03-15 16:30:00',NULL),(83,'Bicicleta Estática',280.00,'2026-04-01 14:00:00','2026-06-25 12:51:42','2026-06-25 12:51:42'),(84,'Pesas 10kg Set',45.00,'2026-03-18 20:00:00','2026-03-20 17:30:00',NULL),(85,'Esterilla de Yoga',25.00,'2026-02-15 15:00:00','2026-02-20 19:45:00',NULL),(86,'Balón de Fútbol',30.00,'2026-03-28 16:30:00','2026-03-30 21:00:00',NULL),(87,'Raqueta de Tenis',65.00,'2026-04-10 18:00:00','2026-04-12 14:00:00',NULL),(88,'Kit de Básquetbol',40.00,'2026-03-05 15:00:00','2026-03-08 20:30:00',NULL),(89,'Libro de Desarrollo Personal',25.00,'2026-03-22 17:00:00','2026-03-25 19:00:00',NULL),(90,'Cuaderno Profesional',12.00,'2026-04-03 16:00:00','2026-04-05 15:30:00',NULL),(91,'Set de Plumas Color',10.00,'2026-03-12 19:30:00','2026-03-15 17:15:00',NULL),(92,'Agenda 2026',18.00,'2026-02-28 14:00:00','2026-06-25 12:41:08','2026-06-25 12:41:08'),(93,'Carpeta Oficio',8.00,'2026-04-08 21:00:00','2026-04-10 16:00:00',NULL),(94,'Taladro Eléctrico',90.00,'2026-03-30 15:00:00','2026-04-02 20:00:00',NULL),(95,'Set de Destornilladores',25.00,'2026-04-05 17:30:00','2026-04-08 14:15:00',NULL),(96,'Cinta Métrica 5m',10.00,'2026-03-15 16:00:00','2026-03-18 18:00:00',NULL),(97,'Nivel de Burbuja',15.00,'2026-02-20 20:00:00','2026-02-25 15:45:00',NULL),(98,'Caja de Herramientas',50.00,'2026-03-08 14:00:00','2026-03-12 22:30:00',NULL),(99,'Tijeras de Podar',18.00,'2026-04-01 19:00:00','2026-04-03 16:00:00',NULL),(100,'Manguera 25m',30.00,'2026-03-20 14:30:00','2026-03-22 20:45:00',NULL),(101,'Maceta Decorativa',22.00,'2026-03-28 21:00:00','2026-03-30 17:30:00',NULL),(102,'Fertilizante 1kg',15.00,'2026-04-10 15:00:00','2026-04-12 19:15:00',NULL),(103,'Produco-1-prueba',22.00,'2026-06-25 12:20:04','2026-06-25 12:20:04',NULL),(104,'Nuevo Producto',125.00,'2026-06-26 05:01:55','2026-06-26 05:02:06',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('98AgSWfvWhHCh1QdesdfDSWeE7rqbhd2aFOxjtHf',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJ0VjVIRDB2djdYZUh0R0JUaGQzUFdLT3AwbUtoSm9UQjRlZ2N6dHNhIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wcm9kdWN0b3MiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1782419969),('dOEtVwIOkLCtaxgSY3X3NNN7gUUFnYBdHLL2jTpW',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJrV3lJSHNjeW9obkdISGIxbEh3Z0NnQmpkV2tQeEFYR1d6MnN2S20yIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wcm9kdWN0b3MiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1782428951),('qArckWKFXBF3lvtCCzul5ERoTyeCXuUr5SVtGGsh',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.126.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36','eyJfdG9rZW4iOiJ1a3NmRkRaS3F3dkJOR0I4T3FLUmpNMWZLTTBGVktBZ3FMM3NLY05kIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1782428947),('UTvEkKGspr42TZz1ugbm360JY7OSPuJ3SWF8yi0S',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.126.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36','eyJfdG9rZW4iOiJtRlBuaURkYkUwS1NJSFRHbUFOY3B2azExeldkYzV1NDljb2JYeEVnIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1782418617);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2026-06-26  1:23:39
