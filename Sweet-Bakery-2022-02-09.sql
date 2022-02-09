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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store orders paced by customers. it will store deliver location ids too.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123',NULL),(2,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(3,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(4,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(5,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(6,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(7,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(8,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(9,'fa',16,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','123','akc-'),(10,'q',17,3,'2012-12-11 00:00:00','2012-12-11 00:00:00','2','ad130d80-4af6-11ec-9ba2-81233b5ec4e8'),(11,'a',1,4,'2021-10-00 00:00:00','2021-10-00 00:00:00','1','f6753750-4af6-11ec-a8c2-2d72d968f34a'),(12,'a',1,4,'2021-10-00 00:00:00','2021-10-00 00:00:00','1','004a7560-4af7-11ec-a8c2-2d72d968f34a'),(13,'Omid Yousefian',2,6,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','792ccb90-4e03-11ec-ad16-f3276f8d305f'),(14,'Omid Yousefian',1,3,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','eb0d0450-4e03-11ec-8da5-ed8328237d22'),(15,'Omid Yousefian',1,3,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','2e610a30-4e04-11ec-8fa0-43828be007b3'),(16,'Omid Yousefian',1,3,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','73fba4b0-4e04-11ec-bb60-1d6ae5aa759b'),(17,'Omid Yousefian',2,3,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','cde2eec0-4e04-11ec-876d-f382eb8051ba'),(18,'Omid Yousefian',1,4,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','b0976e80-4e05-11ec-8426-d1eeaa85911a'),(19,'Omid Yousefian',1,8,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','c10f2bd0-4e06-11ec-8426-d1eeaa85911a'),(20,'Omid Yousefian',5,17,'2021-10-25 00:00:00','2021-10-25 00:00:00','2062914728','64fd6b30-4e07-11ec-8426-d1eeaa85911a'),(21,'Omid Yousefian',1,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','011fc260-4fbb-11ec-a95d-4b5edce9ef83'),(22,'Omid Yousefian',1,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','14880560-4fbb-11ec-a95d-4b5edce9ef83'),(23,'',2,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','0','72fd8a20-4fbb-11ec-84a5-f5f58df85c80'),(24,'Omid Yousefian',2,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','b7eca260-4fbb-11ec-9d19-f17dcf99b221'),(25,'Omid Yousefian',3,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','a512ee50-4fbc-11ec-8fa7-5b59699ecacb'),(26,'Omid Yousefian',3,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','b2f02010-4fbc-11ec-8fa7-5b59699ecacb'),(27,'Omid Yousefian',2,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','d22e2c10-4fbc-11ec-8fa7-5b59699ecacb'),(28,'Omid Yousefian',2,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','69d1cb20-4fbe-11ec-9cf8-c109233569cc'),(29,'Omid Yousefian',2,6,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','e89cc9e0-4fbf-11ec-8756-effb2d5611ea'),(30,'Omid Yousefian',3,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','afc76c00-4fc0-11ec-b6bb-4f49c4e3922c'),(31,'Omid Yousefian',2,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','fc53d3b0-4fc0-11ec-9df0-57bc55640671'),(32,'Omid Yousefian',1,3,'2021-10-27 00:00:00','2021-10-27 00:00:00','2062914728','48b0c6f0-4fc1-11ec-bdb9-b5e56caea212'),(33,'Omid Yousefian',3,3,'2021-11-01 00:00:00','2021-11-01 00:00:00','2062914728','35b99790-532a-11ec-8d80-a5aad0d79bbc'),(34,'Omid Yousefian',3,3,'2021-11-01 00:00:00','2021-11-01 00:00:00','2062914728','ef580e20-532a-11ec-8d80-a5aad0d79bbc'),(35,'Omid Yousefian',3,3,'2021-11-01 00:00:00','2021-11-01 00:00:00','2062914728','541c6950-532b-11ec-8d80-a5aad0d79bbc'),(36,'Omid Yousefian',1,3,'2021-11-02 00:00:00','2021-11-02 00:00:00','2062914728','92f0a180-532d-11ec-85be-4be53694135c'),(37,'Omid Yousefian',2,3,'2021-11-02 00:00:00','2021-11-02 00:00:00','2062914728','cceed280-532d-11ec-8446-dd1b6e14a641'),(38,'omid yousefian',2,3,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','2f051db0-55ec-11ec-bf1a-35dedab9d49d'),(39,'omid yousefian',2,3,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','033a90f0-55ee-11ec-bf1a-35dedab9d49d'),(40,'omid yousefian',2,3,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','3d3b32f0-55ee-11ec-bf1a-35dedab9d49d'),(41,'omid yousefian',2,3,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','badcf3f0-55ef-11ec-bc1c-719533df43c1'),(42,'omid yousefian',1,36,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','79d1fe40-55f0-11ec-9ea0-bb613c0b49c5'),(43,'omid yousefian',1,3,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','1cddfe80-55f2-11ec-ac69-ab3b2722bb4e'),(44,'omid yousefian',2,3,'2021-11-05 00:00:00','2021-11-05 00:00:00','2062914728','4873d4c0-55f2-11ec-ac69-ab3b2722bb4e'),(45,'omid yousefian',3,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','dab39390-56f9-11ec-bb14-2921d3cf9862'),(46,'omid yousefian',13,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','cb2c17c0-56fa-11ec-bb14-2921d3cf9862'),(47,'omid yousefian',10,4,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','01da0c50-56fb-11ec-b97f-b9975cde88fd'),(48,'sanaz Makoui',3,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','8594686018','57e1ab30-56fb-11ec-ab85-c349877f88a8'),(49,'omid yousefian',1,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','f9293490-56fb-11ec-9ad8-5b4f205a91c3'),(50,'omid yousefian',1,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','ff74cf50-56fe-11ec-8509-a3cca05d46eb'),(51,'omid yousefian',2,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','6f6015e0-56ff-11ec-b8e9-f1a6147ce74f'),(52,'omid yousefian',1,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','a1135250-56ff-11ec-8496-49f8730b853b'),(53,'omid yousefian',1,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','1a16ef90-5700-11ec-9e48-956ba13699a6'),(54,'omid yousefian',2,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','dc59cfe0-5701-11ec-8777-43206ee672fc'),(55,'omid yousefian',1,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','6f8a8470-5703-11ec-a186-07bb73b88297'),(56,'omid yousefian',1,3,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','879e0000-5703-11ec-a186-07bb73b88297'),(57,'omid yousefian',11,4,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','30347fd0-5706-11ec-a1ec-4f0959958f70'),(58,'omid yousefian',11,4,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','40232c70-5706-11ec-a1ec-4f0959958f70'),(59,'omid yousefian',11,4,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','51d0a010-5706-11ec-a1ec-4f0959958f70'),(60,'omid yousefian',11,4,'2021-11-06 00:00:00','2021-11-06 00:00:00','2062914728','5f3398c0-5706-11ec-a1ec-4f0959958f70'),(61,'Omid Yousefian',5,3,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','8342d4d0-5cf9-11ec-b427-655f82f8cffe'),(62,'sunny Makoui',4,3,'2021-11-14 00:00:00','2021-11-14 00:00:00','8594686018','649ccda0-5cfa-11ec-a067-47a3beb11299'),(63,'Omid Yousefian',2,3,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','5d2a5690-5d2d-11ec-ac80-958aa986f1ff'),(64,'Manouchehr Yousefian',10,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','8594686018','a1d539e0-5d2d-11ec-a2b5-37b42e1ba563'),(65,'Omid Yousefian',7,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','c26c88c0-5d37-11ec-80f8-0d16acdea932'),(66,'Manouchehr Yousefian',11,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','b3569370-5d38-11ec-b2ac-87f994753b8f'),(67,'Omid Yousefian',12,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','d80990a0-5d38-11ec-a427-d7a1457debe9'),(68,'Omid Yousefian',12,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','1597ed40-5d39-11ec-b2cf-f71c9af16dc2'),(69,'Omid Yousefian',12,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','ffd57120-5d39-11ec-b9a0-f7d168fb91e8'),(70,'Omid Yousefian',12,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','ee02b050-5d3b-11ec-b39f-5d495fce4d8f'),(71,'Omid Yousefian',12,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','1b8ae0b0-5d3c-11ec-b39f-5d495fce4d8f'),(72,'Manouchehr Yousefian',10,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','f7d97f90-5d3c-11ec-aad8-6b016024df48'),(73,'Omid Yousefian',11,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','14c76af0-5d46-11ec-ac5c-abc8597671cc'),(74,'Omid Yousefian',11,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','2857cf60-5d46-11ec-ac5c-abc8597671cc'),(75,'Omid Yousefian',11,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','0920f9e0-5d47-11ec-ac5c-abc8597671cc'),(76,'Omid Yousefian',11,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','148d79c0-5d47-11ec-ac5c-abc8597671cc'),(77,'Omid Yousefian',12,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','521100f0-5d47-11ec-ac5c-abc8597671cc'),(78,'Omid Yousefian',11,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','6cfd1b20-5d4b-11ec-90be-bbf1292271fc'),(79,'Omid Yousefian',1,4,'2021-11-14 00:00:00','2021-11-14 00:00:00','2062914728','9e4eaf90-5d4b-11ec-ab12-b7f5e15df4c6'),(80,'Hasani',5,87,'2022-00-26 00:00:00','2022-00-26 00:00:00','989898','f0407ee0-7f07-11ec-89f4-8f752da5b18c'),(81,'Omid Yousefian',2,26,'2022-01-02 00:00:00','2022-01-02 00:00:00','2062914728','504ad130-84aa-11ec-88f9-e7ad9f50b437'),(82,'Omid Yousefian',2,3,'2022-01-03 00:00:00','2022-01-03 00:00:00','2062914728','2f9a6f80-84b5-11ec-a1cc-c712b414f813'),(83,'sunny Makoui',4,4,'2022-01-03 00:00:00','2022-01-03 00:00:00','8594686018','a1dc7750-84b5-11ec-9a44-753636e34a7f');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (5,4,39,1),(6,4,40,1),(7,4,41,1),(8,4,42,11),(9,4,43,1),(10,4,44,1),(11,4,45,1),(12,4,46,1),(13,3,47,1),(14,4,48,1),(15,4,49,1),(16,4,50,1),(17,4,51,1),(18,4,52,1),(19,4,53,1),(20,5,54,1),(21,4,55,1),(22,4,56,1),(23,3,57,1),(24,3,58,1),(25,3,59,1),(26,3,60,1),(27,4,61,1),(28,4,62,1),(29,3,65,1),(30,3,66,1),(31,3,67,1),(32,3,68,1),(33,3,69,1),(34,3,70,1),(35,3,71,1),(36,3,72,1),(37,3,73,1),(38,3,74,1),(39,3,75,1),(40,3,76,1),(41,3,77,1),(42,3,78,1),(43,3,79,1),(44,5,80,1),(45,8,80,14),(46,3,81,6),(47,4,82,1),(48,3,83,1);
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

-- Dump completed on 2022-02-09 10:31:44
