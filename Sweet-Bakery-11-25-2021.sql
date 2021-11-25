-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: sweet-bakery
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `delivery_loc_id` int DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `create_dt` datetime NOT NULL,
  `update_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

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
  `zipcode` varchar(45) DEFAULT NULL,
  `next_delivery_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_location`
--

LOCK TABLES `delivery_location` WRITE;
/*!40000 ALTER TABLE `delivery_location` DISABLE KEYS */;
INSERT INTO `delivery_location` VALUES (1,'Univercity','Ann Arbor','MI',NULL,NULL),(2,'Rite Aid','Ann Arbor','MI',NULL,NULL),(3,'Napervill','Chicago','IL',NULL,NULL),(4,'Schaumburg','Chicago','IL',NULL,NULL),(5,'UCII','Chicago','IL',NULL,NULL),(6,'Centeral Chicago','Chicago','IL',NULL,NULL),(7,'North Chicago','Chicago','IL',NULL,NULL),(8,'Downtown','Champaign','IL',NULL,NULL),(9,'West Carrollton','Dayton','OH',NULL,NULL),(10,'Kenwood','Cincinnati','OH',NULL,NULL),(11,'Westchester','Cincinnati','OH',NULL,NULL),(12,'Centeral Ave','Toledo','OH',NULL,NULL),(13,'Detroit Rd','Celevland','OH',NULL,NULL),(14,'Downtown','Celevland','OH',NULL,NULL),(15,'Bechwood','Celevland','OH',NULL,NULL),(16,'Best Buy','Fairlawn','OH',NULL,NULL),(17,'Univercity','Akron','OH',NULL,NULL),(18,'Dublin','Columbus','OH',NULL,NULL),(19,'Univercity','Laffayet','IN',NULL,NULL),(20,'Costco','Indianapolis','IN',NULL,NULL),(21,'University','Indianapolis','IN',NULL,NULL),(22,'university','Bloomington','IN',NULL,NULL),(23,'Downtwon','Milwaukee','WI',NULL,NULL),(24,'Downtown','Madison','WI',NULL,NULL);
/*!40000 ALTER TABLE `delivery_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `delivery_loc_id` int NOT NULL,
  `total` decimal(2,0) NOT NULL,
  `created_dt` datetime NOT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `phone_number` varchar(45) NOT NULL,
  `uuid` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store orders paced by customers. it will store deliver location ids too.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123',NULL),(2,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(3,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(4,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(5,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(6,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(7,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(8,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(9,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(10,'q',17,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','2','ad130d80-4af6-11ec-9ba2-81233b5ec4e8'),(11,'a',1,4,'2021-10-00 00:00:00','2021-10-00 00:00:00','1','f6753750-4af6-11ec-a8c2-2d72d968f34a'),(12,'a',1,4,'2021-10-00 00:00:00','2021-10-00 00:00:00','1','004a7560-4af7-11ec-a8c2-2d72d968f34a');
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
INSERT INTO `products` VALUES (3,'نان سنگک','SANGAK BREAD',4.25,'img/Sangak.jpg',NULL,'1'),(4,'ننان بربری سفید','BARBARI BREAD',3.25,'img/WhiteBarbari.jpg',NULL,'1'),(5,'نان بربری سبوسدار','WHEAT BARBARI BREAD',3.25,'img/BrownBarbari.jpg',NULL,'1'),(6,'نان شیرمال','SHIRMAL BREAD',4.25,'img/Shirmal.jpg',NULL,'1'),(7,'شیرینی رولت','CREAM ROLL',6.00,'img/Rolet.jpg',NULL,'5 PICE'),(8,'شیرینی نان خامه ای','CREAM PUFF',6.00,'img/Creampuf.jpg',NULL,'4 PICE'),(9,'کیک یزدی','YAZDI CUPCAKE',7.00,'img/Yazdi.jpg',NULL,'6 PICE'),(10,'ماست ساده','YOGURT',4.00,'img/Maast.jpg',NULL,'2 LB'),(11,'ماست چکیده','GREEK YOUGRT',6.00,'img/Mastechekideh.jpg',NULL,'1LB'),(12,'کشک','KASHK',8.00,'img/kashk.jpg',NULL,'1LB'),(13,'سرشیر','CREAM',4.00,'img/kashk.jpg',NULL,'8 OZ'),(14,'کشک و بادمجان','KASHK O BADEMJAN',6.00,'img/kashkBademjan.jpg',NULL,'1LB'),(15,'حلیم گندم با گوشت','HALEM',6.00,'img/Halim.jpg',NULL,'1LB'),(16,'بادمجان سرخ کرده','FRIED EGGPLANT',7.00,'img/Bademjan.jpg',NULL,'8OZ'),(17,'کله پاچه کامل','LAMB HEAD',25.00,'img/Kpache.jpg',NULL,'1'),(18,'عسل طبیعی','HONEY',17.00,'img/Honey.jpg',NULL,'1.5LB'),(19,'ترشی ','PICKLES',10.00,'img/Torshi.jpg',NULL,'12OZ'),(20,'مربا','JAM',9.00,'img/Moraba.jpg',NULL,'8OZ'),(21,'زیتون پرورده','ZEYTOON PARVARDEH',13.00,'img/zeytoon.jpg',NULL,'1LB');
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

-- Dump completed on 2021-11-22  0:12:57
