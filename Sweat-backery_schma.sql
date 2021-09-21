CREATE DATABASE  IF NOT EXISTS `sweet-bakery` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sweet-bakery`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: sweet-bakery
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `delivery_location`
--

DROP TABLE IF EXISTS `delivery_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_location` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `next_delivery_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_location`
--

LOCK TABLES `delivery_location` WRITE;
/*!40000 ALTER TABLE `delivery_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `phone` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `productId` int NOT NULL,
  `Created_dt` datetime NOT NULL,
  `Updated_dt` datetime DEFAULT NULL,
  `Total` decimal(2,0) NOT NULL,
  `delivery_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store orders paced by customers. it will store deliver location ids too.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prd_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `persianName` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `imageUrl` varchar(300) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `QuantityType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table stores all items offerd by sweet bakery for sale';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'نان سنگک','SANGAK BREAD',4.25,NULL,NULL,'1'),(4,'ننان بربری سفید','BARBARI BREAD',3.25,NULL,NULL,'1'),(5,'نان بربری سبوسدار','WHEAT BARBARI BREAD',3.25,NULL,NULL,'1'),(6,'نان شیرمال','SHIRMAL BREAD',4.25,NULL,NULL,'1'),(7,'شیرینی رولت','CREAM ROLL',6.00,NULL,NULL,'5 PICE'),(8,'شیرینی نان خامه ای','CREAM PUFF',6.00,NULL,NULL,'4 PICE'),(9,'کیک یزدی','YAZDI CUPCAKE',7.00,NULL,NULL,'6 PICE'),(10,'ماست ساده','YOGURT',4.00,NULL,NULL,'2 LB'),(11,'ماست چکیده','GREEK YOUGRT',6.00,NULL,NULL,'1LB'),(12,'کشک','KASHK',8.00,NULL,NULL,'1LB'),(13,'سرشیر','CREAM',4.00,NULL,NULL,'8 OZ'),(14,'کشک و بادمجان','KASHK O BADEMJAN',6.00,NULL,NULL,'1LB'),(15,'حلیم گندم با گوشت','HALEM',6.00,NULL,NULL,'1LB'),(16,'بادمجان سرخ کرده','FRIED EGGPLANT',7.00,NULL,NULL,'8OZ'),(17,'کله پاچه کامل','LAMB HEAD',25.00,NULL,NULL,'1'),(18,'عسل طبیعی','HONEY',17.00,NULL,NULL,'1.5LB'),(19,'ترشی ','PICKLES',10.00,NULL,NULL,'12OZ'),(20,'مربا','JAM',9.00,NULL,NULL,'8OZ'),(21,'زیتون پرورده','ZEYTOON PARVARDEH',13.00,NULL,NULL,'1LB');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-21 17:51:17
