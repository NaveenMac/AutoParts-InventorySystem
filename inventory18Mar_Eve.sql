-- MySQL dump 10.13  Distrib 8.0.19, for osx10.13 (x86_64)
--
-- Host: localhost    Database: inventory_system
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `accounts_role`
--

DROP TABLE IF EXISTS `accounts_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_role` (
  `id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `accounts_role_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_role`
--

LOCK TABLES `accounts_role` WRITE;
/*!40000 ALTER TABLE `accounts_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `seller_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `accounts_user_seller_id_b7d216fa_fk_seller_seller_id` (`seller_id`),
  CONSTRAINT `accounts_user_seller_id_b7d216fa_fk_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$180000$XW4H59t8xDQc$rFxyHk70tPUeF122ezNtoFZMYBvyBZXLS5gaNQHAEHA=','2020-03-18 10:24:39.497541',1,'naveenchauhan','','','naveen.chauhan010@gmail.com',1,1,'2020-03-18 10:23:26.595373',NULL);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_roles`
--

DROP TABLE IF EXISTS `accounts_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_roles_user_id_role_id_d36f9c32_uniq` (`user_id`,`role_id`),
  KEY `accounts_user_roles_role_id_3be0e909_fk_accounts_role_id` (`role_id`),
  CONSTRAINT `accounts_user_roles_role_id_3be0e909_fk_accounts_role_id` FOREIGN KEY (`role_id`) REFERENCES `accounts_role` (`id`),
  CONSTRAINT `accounts_user_roles_user_id_5c537963_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_roles`
--

LOCK TABLES `accounts_user_roles` WRITE;
/*!40000 ALTER TABLE `accounts_user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areapincode_areapincode`
--

DROP TABLE IF EXISTS `areapincode_areapincode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areapincode_areapincode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pincode` int NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areapincode_areapincode`
--

LOCK TABLES `areapincode_areapincode` WRITE;
/*!40000 ALTER TABLE `areapincode_areapincode` DISABLE KEYS */;
INSERT INTO `areapincode_areapincode` VALUES (1,110096,'2020-03-17 18:45:31.874576','2020-03-17 18:45:31.874613'),(2,10092,'2020-03-17 18:52:10.184994','2020-03-17 18:52:10.185041');
/*!40000 ALTER TABLE `areapincode_areapincode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Allied Autotech');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,13),(2,1,14),(3,1,15),(4,1,16),(5,1,17),(6,1,18),(7,1,19),(8,1,20),(9,1,21),(10,1,22),(11,1,23),(12,1,24),(13,1,25),(14,1,26),(15,1,27),(16,1,28),(17,1,29),(18,1,30),(19,1,31),(20,1,32),(21,1,33),(22,1,34),(23,1,35),(24,1,36),(25,1,37),(26,1,38),(27,1,39),(28,1,40),(29,1,41),(30,1,42),(31,1,43),(32,1,44),(33,1,45),(34,1,46),(35,1,47),(36,1,48),(37,1,49),(38,1,50),(39,1,51),(40,1,52),(41,1,53),(42,1,54),(43,1,55),(44,1,56),(45,1,57),(46,1,58),(47,1,59),(48,1,60),(49,1,61),(50,1,62),(51,1,63),(52,1,64),(53,1,65),(54,1,66),(55,1,67),(56,1,68),(57,1,73),(58,1,74),(59,1,75),(60,1,76);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add car maker',4,'add_carmaker'),(14,'Can change car maker',4,'change_carmaker'),(15,'Can delete car maker',4,'delete_carmaker'),(16,'Can view car maker',4,'view_carmaker'),(17,'Can add car maker model',5,'add_carmakermodel'),(18,'Can change car maker model',5,'change_carmakermodel'),(19,'Can delete car maker model',5,'delete_carmakermodel'),(20,'Can view car maker model',5,'view_carmakermodel'),(21,'Can add seller',6,'add_seller'),(22,'Can change seller',6,'change_seller'),(23,'Can delete seller',6,'delete_seller'),(24,'Can view seller',6,'view_seller'),(25,'Can add seller category',7,'add_sellercategory'),(26,'Can change seller category',7,'change_sellercategory'),(27,'Can delete seller category',7,'delete_sellercategory'),(28,'Can view seller category',7,'view_sellercategory'),(29,'Can add auto part',8,'add_autopart'),(30,'Can change auto part',8,'change_autopart'),(31,'Can delete auto part',8,'delete_autopart'),(32,'Can view auto part',8,'view_autopart'),(33,'Can add auto part seller',9,'add_autopartseller'),(34,'Can change auto part seller',9,'change_autopartseller'),(35,'Can delete auto part seller',9,'delete_autopartseller'),(36,'Can view auto part seller',9,'view_autopartseller'),(37,'Can add auto part picture',10,'add_autopartpicture'),(38,'Can change auto part picture',10,'change_autopartpicture'),(39,'Can delete auto part picture',10,'delete_autopartpicture'),(40,'Can view auto part picture',10,'view_autopartpicture'),(41,'Can add auto part compatibility',11,'add_autopartcompatibility'),(42,'Can change auto part compatibility',11,'change_autopartcompatibility'),(43,'Can delete auto part compatibility',11,'delete_autopartcompatibility'),(44,'Can view auto part compatibility',11,'view_autopartcompatibility'),(45,'Can add auto part category',12,'add_autopartcategory'),(46,'Can change auto part category',12,'change_autopartcategory'),(47,'Can delete auto part category',12,'delete_autopartcategory'),(48,'Can view auto part category',12,'view_autopartcategory'),(49,'Can add auto part brand',13,'add_autopartbrand'),(50,'Can change auto part brand',13,'change_autopartbrand'),(51,'Can delete auto part brand',13,'delete_autopartbrand'),(52,'Can view auto part brand',13,'view_autopartbrand'),(53,'Can add brand',14,'add_brand'),(54,'Can change brand',14,'change_brand'),(55,'Can delete brand',14,'delete_brand'),(56,'Can view brand',14,'view_brand'),(57,'Can add brand category',15,'add_brandcategory'),(58,'Can change brand category',15,'change_brandcategory'),(59,'Can delete brand category',15,'delete_brandcategory'),(60,'Can view brand category',15,'view_brandcategory'),(61,'Can add category',16,'add_category'),(62,'Can change category',16,'change_category'),(63,'Can delete category',16,'delete_category'),(64,'Can view category',16,'view_category'),(65,'Can add area pincode',17,'add_areapincode'),(66,'Can change area pincode',17,'change_areapincode'),(67,'Can delete area pincode',17,'delete_areapincode'),(68,'Can view area pincode',17,'view_areapincode'),(69,'Can add role',18,'add_role'),(70,'Can change role',18,'change_role'),(71,'Can delete role',18,'delete_role'),(72,'Can view role',18,'view_role'),(73,'Can add user',19,'add_user'),(74,'Can change user',19,'change_user'),(75,'Can delete user',19,'delete_user'),(76,'Can view user',19,'view_user'),(77,'Can add log entry',20,'add_logentry'),(78,'Can change log entry',20,'change_logentry'),(79,'Can delete log entry',20,'delete_logentry'),(80,'Can view log entry',20,'view_logentry'),(81,'Can add session',21,'add_session'),(82,'Can change session',21,'change_session'),(83,'Can delete session',21,'delete_session'),(84,'Can view session',21,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_brand`
--

DROP TABLE IF EXISTS `brand_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact_name` varchar(30) NOT NULL,
  `contact_number` varchar(31) NOT NULL,
  `description` longtext NOT NULL,
  `website` varchar(200) NOT NULL,
  `upload` varchar(100) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_brand`
--

LOCK TABLES `brand_brand` WRITE;
/*!40000 ALTER TABLE `brand_brand` DISABLE KEYS */;
INSERT INTO `brand_brand` VALUES (5,'Brand 1','Naveen','99110177999','Brand 1','http://google.com','assets/brands/thumb.jpeg','2020-02-28 09:25:38.838304','2020-02-28 09:25:38.838333');
/*!40000 ALTER TABLE `brand_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_brandcategory`
--

DROP TABLE IF EXISTS `brand_brandcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_brandcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_brandcategory_brand_id_0777a525_uniq` (`brand_id`),
  CONSTRAINT `brand_brandcategory_brand_id_0777a525_fk_brand_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_brandcategory`
--

LOCK TABLES `brand_brandcategory` WRITE;
/*!40000 ALTER TABLE `brand_brandcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_brandcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_brandcategory_category`
--

DROP TABLE IF EXISTS `brand_brandcategory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_brandcategory_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brandcategory_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_brandcategory_cate_brandcategory_id_categor_1be48b1f_uniq` (`brandcategory_id`,`category_id`),
  KEY `brand_brandcategory__category_id_774e16cc_fk_category_` (`category_id`),
  CONSTRAINT `brand_brandcategory__brandcategory_id_cce90021_fk_brand_bra` FOREIGN KEY (`brandcategory_id`) REFERENCES `brand_brandcategory` (`id`),
  CONSTRAINT `brand_brandcategory__category_id_774e16cc_fk_category_` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_brandcategory_category`
--

LOCK TABLES `brand_brandcategory_category` WRITE;
/*!40000 ALTER TABLE `brand_brandcategory_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_brandcategory_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carmaker_carmaker`
--

DROP TABLE IF EXISTS `carmaker_carmaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carmaker_carmaker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `shortName` varchar(4) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmaker_carmaker`
--

LOCK TABLES `carmaker_carmaker` WRITE;
/*!40000 ALTER TABLE `carmaker_carmaker` DISABLE KEYS */;
INSERT INTO `carmaker_carmaker` VALUES (1,'HONDA','HND','2020-03-17 19:15:58.482858','2020-03-17 19:15:58.482891');
/*!40000 ALTER TABLE `carmaker_carmaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carmaker_carmakermodel`
--

DROP TABLE IF EXISTS `carmaker_carmakermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carmaker_carmakermodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL,
  `released_on` date DEFAULT NULL,
  `closed_on` date DEFAULT NULL,
  `engine` double NOT NULL,
  `power` double NOT NULL,
  `fuel_type` varchar(2) NOT NULL,
  `engine_type` varchar(50) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `maker_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carmaker_carmakermodel_maker_id_0cbc855e_fk_carmaker_carmaker_id` (`maker_id`),
  CONSTRAINT `carmaker_carmakermodel_maker_id_0cbc855e_fk_carmaker_carmaker_id` FOREIGN KEY (`maker_id`) REFERENCES `carmaker_carmaker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmaker_carmakermodel`
--

LOCK TABLES `carmaker_carmakermodel` WRITE;
/*!40000 ALTER TABLE `carmaker_carmakermodel` DISABLE KEYS */;
INSERT INTO `carmaker_carmakermodel` VALUES (1,'JAZZ','2020-03-17','2020-03-17',1.2,2.3,'PL','MULTI','2020-03-17 19:15:58.484935','2020-03-17 19:15:58.484961',1),(2,'AMAZE','2020-03-17','2020-03-17',1.3,2.4,'DL','PLAYER','2020-03-17 19:15:58.489271','2020-03-17 19:15:58.489300',1);
/*!40000 ALTER TABLE `carmaker_carmakermodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_category`
--

DROP TABLE IF EXISTS `category_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_class` tinyint(1) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_category_parent_id_bce0763d_fk_category_category_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category`
--

LOCK TABLES `category_category` WRITE;
/*!40000 ALTER TABLE `category_category` DISABLE KEYS */;
INSERT INTO `category_category` VALUES (6,'Cabin Filter',1,'2020-02-28 07:49:22.402717','2020-03-17 11:20:55.259282',8),(7,'Air Filter',1,'2020-02-28 07:50:23.087565','2020-03-17 11:20:25.289603',8),(8,'Filters',0,'2020-02-28 07:51:02.711083','2020-03-17 11:20:01.035974',9),(9,'Maintenance Service Parts',0,'2020-02-28 07:57:47.410029','2020-03-17 11:15:55.731315',NULL),(10,'Fuel Filter',1,'2020-03-17 11:21:10.767525','2020-03-17 11:21:10.767560',8),(11,'Oil Filter',1,'2020-03-17 11:21:26.764281','2020-03-17 11:21:26.764319',8);
/*!40000 ALTER TABLE `category_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-18 10:34:06.155864','1','Allied Autotech',1,'[{\"added\": {}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (18,'accounts','role'),(19,'accounts','user'),(20,'admin','logentry'),(17,'areapincode','areapincode'),(2,'auth','group'),(1,'auth','permission'),(14,'brand','brand'),(15,'brand','brandcategory'),(4,'carmaker','carmaker'),(5,'carmaker','carmakermodel'),(16,'category','category'),(3,'contenttypes','contenttype'),(8,'part','autopart'),(13,'part','autopartbrand'),(12,'part','autopartcategory'),(11,'part','autopartcompatibility'),(10,'part','autopartpicture'),(9,'part','autopartseller'),(6,'seller','seller'),(7,'seller','sellercategory'),(21,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (21,'inventory','0001_initial','2020-01-31 09:10:29.786128'),(22,'inventory','0002_auto_20200130_1237','2020-01-31 09:10:29.789894'),(23,'inventory','0003_delete_techusers','2020-01-31 09:10:29.800170'),(24,'CategoryManagement','0001_initial','2020-02-03 09:37:46.082865'),(25,'CategoryManagement','0002_auto_20200203_1050','2020-02-03 10:50:29.252842'),(27,'Car','0002_auto_20200203_1306','2020-02-03 13:07:20.159116'),(28,'Car','0003_auto_20200203_1312','2020-02-03 13:13:32.745883'),(29,'Car','0004_auto_20200203_1316','2020-02-03 13:17:11.908267'),(30,'Car','0005_auto_20200212_0709','2020-02-12 07:09:30.664309'),(31,'Car','0006_carmodelline_added_date','2020-02-12 07:13:04.973316'),(32,'Car','0007_auto_20200212_0717','2020-02-12 07:17:26.730597'),(33,'Car','0008_auto_20200218_0641','2020-02-18 06:41:33.033862'),(34,'Car','0009_auto_20200218_0644','2020-02-18 06:45:09.196451'),(39,'part','0001_initial','2020-02-18 12:09:19.260887'),(40,'brand','0001_initial','2020-02-19 09:28:28.858337'),(41,'brand','0002_auto_20200219_0946','2020-02-19 09:47:07.884678'),(42,'brand','0003_auto_20200219_1043','2020-02-19 10:44:20.656195'),(43,'seller','0001_initial','2020-02-19 10:55:21.118994'),(44,'category','0001_initial','2020-02-26 09:20:50.127124'),(45,'part','0002_auto_20200226_0632','2020-02-26 09:20:50.419905'),(46,'brand','0004_auto_20200226_0632','2020-02-26 09:49:23.234146'),(47,'brand','0005_auto_20200226_0746','2020-02-26 09:49:23.275455'),(48,'seller','0002_auto_20200226_0632','2020-02-26 09:51:39.736246'),(49,'seller','0003_auto_20200226_0746','2020-02-26 09:51:39.754397'),(50,'part','0003_auto_20200226_0632','2020-02-26 09:51:39.805219'),(51,'part','0004_auto_20200226_0746','2020-02-26 09:51:39.845320'),(52,'part','0005_autopartbrand_autopartimages','2020-02-26 09:51:39.928273'),(53,'part','0006_autopart_part_title','2020-02-26 09:51:40.028310'),(54,'category','0002_auto_20200227_0726','2020-02-27 07:26:45.593138'),(55,'category','0003_auto_20200227_0736','2020-02-27 07:36:18.623376'),(56,'category','0004_auto_20200227_0853','2020-02-27 08:53:49.869294'),(57,'category','0005_auto_20200227_0857','2020-02-27 08:57:56.497164'),(58,'category','0006_auto_20200227_0901','2020-02-27 09:01:18.392207'),(59,'category','0007_auto_20200227_0906','2020-02-27 09:06:44.755835'),(60,'category','0008_auto_20200227_0929','2020-02-28 07:43:07.343150'),(61,'category','0009_auto_20200227_0929','2020-02-28 07:43:07.362586'),(62,'category','0010_auto_20200227_0933','2020-02-28 07:43:07.382545'),(63,'category','0011_auto_20200227_0938','2020-02-28 07:43:07.401954'),(64,'category','0012_auto_20200227_0955','2020-02-28 07:43:07.478543'),(65,'category','0013_auto_20200227_0957','2020-02-28 07:43:07.498145'),(66,'category','0014_auto_20200227_1000','2020-02-28 07:43:07.517642'),(67,'category','0015_auto_20200228_0543','2020-02-28 07:43:07.537567'),(68,'category','0016_auto_20200228_0559','2020-02-28 07:43:07.556219'),(69,'category','0017_auto_20200228_0608','2020-02-28 07:43:07.576397'),(70,'category','0018_auto_20200228_0649','2020-02-28 07:43:07.595449'),(71,'category','0019_auto_20200228_0651','2020-02-28 07:43:07.623272'),(72,'category','0020_auto_20200228_0740','2020-02-28 07:43:07.648732'),(73,'category','0021_auto_20200228_0755','2020-02-28 07:55:45.243481'),(74,'part','0007_auto_20200227_1113','2020-02-28 09:05:33.495063'),(75,'part','0008_auto_20200227_1121','2020-02-28 09:05:33.497998'),(76,'part','0009_auto_20200227_1130','2020-02-28 09:05:33.500922'),(77,'part','0010_auto_20200227_1145','2020-02-28 09:05:33.503767'),(78,'part','0011_auto_20200227_1146','2020-02-28 09:05:33.506331'),(79,'part','0012_auto_20200227_1149','2020-02-28 09:05:33.508442'),(80,'part','0013_auto_20200227_1151','2020-02-28 09:05:33.510518'),(81,'part','0014_auto_20200227_1152','2020-02-28 09:05:33.512509'),(82,'part','0015_auto_20200227_1153','2020-02-28 09:05:33.515658'),(83,'part','0016_auto_20200228_0528','2020-02-28 09:05:33.518262'),(84,'part','0017_auto_20200228_0535','2020-02-28 09:05:33.520612'),(85,'part','0018_auto_20200228_0857','2020-02-28 09:05:33.525225'),(86,'part','0019_auto_20200228_0905','2020-02-28 09:05:33.527878'),(87,'part','0020_autopart_autopartbrand_autopartcategory_autopartpicture','2020-02-28 09:11:24.851522'),(88,'part','0021_auto_20200228_0914','2020-02-28 09:14:11.755438'),(89,'part','0022_auto_20200228_0916','2020-02-28 09:16:38.968457'),(90,'part','0023_auto_20200228_0924','2020-02-28 09:24:09.081408'),(91,'part','0024_autopart_origin','2020-03-03 09:09:00.931981'),(92,'seller','0004_auto_20200303_1047','2020-03-03 10:47:28.863290'),(93,'seller','0005_auto_20200303_1111','2020-03-03 11:11:42.234311'),(94,'seller','0006_auto_20200303_1113','2020-03-03 11:13:50.568352'),(95,'brand','0006_auto_20200303_1145','2020-03-03 11:45:11.153072'),(96,'part','0025_auto_20200303_1219','2020-03-03 12:19:42.381315'),(97,'part','0026_autopartcategory','2020-03-16 07:15:50.100604'),(98,'part','0027_auto_20200305_1137','2020-03-16 07:15:58.237586'),(99,'areapincode','0001_initial','2020-03-16 07:15:58.338214'),(100,'areapincode','0002_auto_20200305_1217','2020-03-16 07:15:58.622606'),(101,'areapincode','0003_auto_20200305_1230','2020-03-16 07:15:58.747226'),(102,'areapincode','0004_auto_20200316_0711','2020-03-16 07:15:58.764560'),(105,'category','0022_auto_20200316_0711','2020-03-16 07:15:59.536051'),(106,'part','0028_auto_20200305_1217','2020-03-16 07:16:00.058287'),(109,'carmaker','0001_initial','2020-03-17 07:55:31.083021'),(110,'part','0029_auto_20200306_0732','2020-03-17 07:55:31.155155'),(111,'part','0030_auto_20200316_0711','2020-03-17 07:55:31.163519'),(112,'part','0031_autopartcompatibility','2020-03-17 07:55:31.191162'),(113,'contenttypes','0001_initial','2020-03-18 10:11:57.469255'),(114,'contenttypes','0002_remove_content_type_name','2020-03-18 10:11:57.545875'),(115,'auth','0001_initial','2020-03-18 10:11:57.613955'),(116,'auth','0002_alter_permission_name_max_length','2020-03-18 10:11:57.759832'),(117,'auth','0003_alter_user_email_max_length','2020-03-18 10:11:57.770655'),(118,'auth','0004_alter_user_username_opts','2020-03-18 10:11:57.782973'),(119,'auth','0005_alter_user_last_login_null','2020-03-18 10:11:57.793139'),(120,'auth','0006_require_contenttypes_0002','2020-03-18 10:11:57.797706'),(121,'auth','0007_alter_validators_add_error_messages','2020-03-18 10:11:57.809061'),(122,'auth','0008_alter_user_username_max_length','2020-03-18 10:11:57.819896'),(123,'auth','0009_alter_user_last_name_max_length','2020-03-18 10:11:57.830341'),(124,'auth','0010_alter_group_name_max_length','2020-03-18 10:11:57.850022'),(125,'auth','0011_update_proxy_permissions','2020-03-18 10:11:57.880369'),(126,'accounts','0001_initial','2020-03-18 10:11:58.056844'),(127,'admin','0001_initial','2020-03-18 10:23:59.692039'),(128,'admin','0002_logentry_remove_auto_add','2020-03-18 10:23:59.858920'),(129,'admin','0003_logentry_add_action_flag_choices','2020-03-18 10:23:59.874692'),(130,'sessions','0001_initial','2020-03-18 10:23:59.896387');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('czxqvgd4op9t9udbvcij2upyfzcsho41','MmZhNGMwNjMzMWVhYmFiMGRhODQ2NjNmZTMzNjNkZDU4OWRkMzM4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NGYxZDU2MmIwZmM2NTkxYWM4NDFkY2M1NjZjYjMwMjQyNjVlM2QyIn0=','2020-04-01 10:24:39.502556');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopart`
--

DROP TABLE IF EXISTS `part_autopart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `part_title` varchar(70) NOT NULL,
  `part_number` varchar(100) NOT NULL,
  `feature` longtext NOT NULL,
  `description` longtext NOT NULL,
  `origin` varchar(2) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopart`
--

LOCK TABLES `part_autopart` WRITE;
/*!40000 ALTER TABLE `part_autopart` DISABLE KEYS */;
INSERT INTO `part_autopart` VALUES (4,'OIL FILTER','1MER9IJLKDEFR','<p>FORMATTER DESCRIPTION WILL HE HERE</p>','DESCRIPTION','OM','2020-03-17 19:34:24.853419','2020-03-17 19:34:24.853447');
/*!40000 ALTER TABLE `part_autopart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartbrand`
--

DROP TABLE IF EXISTS `part_autopartbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartbrand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopart_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_autopartbrand_autopart_id_80da8a44_uniq` (`autopart_id`),
  CONSTRAINT `part_autopartbrand_autopart_id_80da8a44_fk_part_autopart_id` FOREIGN KEY (`autopart_id`) REFERENCES `part_autopart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartbrand`
--

LOCK TABLES `part_autopartbrand` WRITE;
/*!40000 ALTER TABLE `part_autopartbrand` DISABLE KEYS */;
INSERT INTO `part_autopartbrand` VALUES (4,4);
/*!40000 ALTER TABLE `part_autopartbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartbrand_brand`
--

DROP TABLE IF EXISTS `part_autopartbrand_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartbrand_brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopartbrand_id` int NOT NULL,
  `brand_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_autopartbrand_brand_autopartbrand_id_brand_id_87a85069_uniq` (`autopartbrand_id`,`brand_id`),
  KEY `part_autopartbrand_brand_brand_id_2cd0e28d_fk_brand_brand_id` (`brand_id`),
  CONSTRAINT `part_autopartbrand_b_autopartbrand_id_b80fe0e1_fk_part_auto` FOREIGN KEY (`autopartbrand_id`) REFERENCES `part_autopartbrand` (`id`),
  CONSTRAINT `part_autopartbrand_brand_brand_id_2cd0e28d_fk_brand_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartbrand_brand`
--

LOCK TABLES `part_autopartbrand_brand` WRITE;
/*!40000 ALTER TABLE `part_autopartbrand_brand` DISABLE KEYS */;
INSERT INTO `part_autopartbrand_brand` VALUES (1,4,5);
/*!40000 ALTER TABLE `part_autopartbrand_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartcategory`
--

DROP TABLE IF EXISTS `part_autopartcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopart_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `autopart_id` (`autopart_id`),
  CONSTRAINT `part_autopartcategory_autopart_id_fc668849_fk_part_autopart_id` FOREIGN KEY (`autopart_id`) REFERENCES `part_autopart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartcategory`
--

LOCK TABLES `part_autopartcategory` WRITE;
/*!40000 ALTER TABLE `part_autopartcategory` DISABLE KEYS */;
INSERT INTO `part_autopartcategory` VALUES (1,4);
/*!40000 ALTER TABLE `part_autopartcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartcategory_category`
--

DROP TABLE IF EXISTS `part_autopartcategory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartcategory_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopartcategory_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_autopartcategory_ca_autopartcategory_id_cate_4a1e8594_uniq` (`autopartcategory_id`,`category_id`),
  KEY `part_autopartcategor_category_id_22c3dc97_fk_category_` (`category_id`),
  CONSTRAINT `part_autopartcategor_autopartcategory_id_19626263_fk_part_auto` FOREIGN KEY (`autopartcategory_id`) REFERENCES `part_autopartcategory` (`id`),
  CONSTRAINT `part_autopartcategor_category_id_22c3dc97_fk_category_` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartcategory_category`
--

LOCK TABLES `part_autopartcategory_category` WRITE;
/*!40000 ALTER TABLE `part_autopartcategory_category` DISABLE KEYS */;
INSERT INTO `part_autopartcategory_category` VALUES (1,1,11);
/*!40000 ALTER TABLE `part_autopartcategory_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartcompatibility`
--

DROP TABLE IF EXISTS `part_autopartcompatibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartcompatibility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopart_id` int NOT NULL,
  `carmaker_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `part_autopartcompati_autopart_id_31394bed_fk_part_auto` (`autopart_id`),
  KEY `part_autopartcompati_carmaker_id_2c6f1453_fk_carmaker_` (`carmaker_id`),
  CONSTRAINT `part_autopartcompati_autopart_id_31394bed_fk_part_auto` FOREIGN KEY (`autopart_id`) REFERENCES `part_autopart` (`id`),
  CONSTRAINT `part_autopartcompati_carmaker_id_2c6f1453_fk_carmaker_` FOREIGN KEY (`carmaker_id`) REFERENCES `carmaker_carmaker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartcompatibility`
--

LOCK TABLES `part_autopartcompatibility` WRITE;
/*!40000 ALTER TABLE `part_autopartcompatibility` DISABLE KEYS */;
INSERT INTO `part_autopartcompatibility` VALUES (1,4,1);
/*!40000 ALTER TABLE `part_autopartcompatibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartcompatibility_carmakermodel`
--

DROP TABLE IF EXISTS `part_autopartcompatibility_carmakermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartcompatibility_carmakermodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopartcompatibility_id` int NOT NULL,
  `carmakermodel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_autopartcompatibili_autopartcompatibility_id_523be9c2_uniq` (`autopartcompatibility_id`,`carmakermodel_id`),
  KEY `part_autopartcompati_carmakermodel_id_6ce5ca20_fk_carmaker_` (`carmakermodel_id`),
  CONSTRAINT `part_autopartcompati_autopartcompatibilit_592a3503_fk_part_auto` FOREIGN KEY (`autopartcompatibility_id`) REFERENCES `part_autopartcompatibility` (`id`),
  CONSTRAINT `part_autopartcompati_carmakermodel_id_6ce5ca20_fk_carmaker_` FOREIGN KEY (`carmakermodel_id`) REFERENCES `carmaker_carmakermodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartcompatibility_carmakermodel`
--

LOCK TABLES `part_autopartcompatibility_carmakermodel` WRITE;
/*!40000 ALTER TABLE `part_autopartcompatibility_carmakermodel` DISABLE KEYS */;
INSERT INTO `part_autopartcompatibility_carmakermodel` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `part_autopartcompatibility_carmakermodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartpicture`
--

DROP TABLE IF EXISTS `part_autopartpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartpicture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `autopart_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `part_autopartpicture_autopart_id_3f5ae04a` (`autopart_id`),
  CONSTRAINT `part_autopartpicture_autopart_id_3f5ae04a_fk_part_autopart_id` FOREIGN KEY (`autopart_id`) REFERENCES `part_autopart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartpicture`
--

LOCK TABLES `part_autopartpicture` WRITE;
/*!40000 ALTER TABLE `part_autopartpicture` DISABLE KEYS */;
INSERT INTO `part_autopartpicture` VALUES (4,'assets/part/1mer9ijlkdefr/32763735_2057109344527643_593998753040433152_n-1png',4);
/*!40000 ALTER TABLE `part_autopartpicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartseller`
--

DROP TABLE IF EXISTS `part_autopartseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartseller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopart_id` int NOT NULL,
  `seller_id` int DEFAULT NULL,
  `in_stock` int unsigned NOT NULL,
  `out_stock` int unsigned NOT NULL,
  `stock_in_process` int unsigned NOT NULL,
  `unit_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `part_autopartseller_autopart_id_2a1f1202` (`autopart_id`),
  KEY `part_autopartseller_seller_id_86b9e155_fk_seller_seller_id` (`seller_id`),
  CONSTRAINT `part_autopartseller_autopart_id_2a1f1202_fk_part_autopart_id` FOREIGN KEY (`autopart_id`) REFERENCES `part_autopart` (`id`),
  CONSTRAINT `part_autopartseller_seller_id_86b9e155_fk_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller_seller` (`id`),
  CONSTRAINT `part_autopartseller_chk_1` CHECK ((`in_stock` >= 0)),
  CONSTRAINT `part_autopartseller_chk_2` CHECK ((`out_stock` >= 0)),
  CONSTRAINT `part_autopartseller_chk_3` CHECK ((`stock_in_process` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartseller`
--

LOCK TABLES `part_autopartseller` WRITE;
/*!40000 ALTER TABLE `part_autopartseller` DISABLE KEYS */;
INSERT INTO `part_autopartseller` VALUES (1,4,2,10,1,1,2000);
/*!40000 ALTER TABLE `part_autopartseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartseller_availability`
--

DROP TABLE IF EXISTS `part_autopartseller_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartseller_availability` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopartseller_id` int NOT NULL,
  `areapincode_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_autopartseller_avai_autopartseller_id_areapi_680de947_uniq` (`autopartseller_id`,`areapincode_id`),
  KEY `part_autopartseller__areapincode_id_0c0ea565_fk_areapinco` (`areapincode_id`),
  CONSTRAINT `part_autopartseller__areapincode_id_0c0ea565_fk_areapinco` FOREIGN KEY (`areapincode_id`) REFERENCES `areapincode_areapincode` (`id`),
  CONSTRAINT `part_autopartseller__autopartseller_id_a43fc475_fk_part_auto` FOREIGN KEY (`autopartseller_id`) REFERENCES `part_autopartseller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartseller_availability`
--

LOCK TABLES `part_autopartseller_availability` WRITE;
/*!40000 ALTER TABLE `part_autopartseller_availability` DISABLE KEYS */;
INSERT INTO `part_autopartseller_availability` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `part_autopartseller_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_seller`
--

DROP TABLE IF EXISTS `seller_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_seller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contact_name` varchar(30) NOT NULL,
  `contact_number` varchar(31) NOT NULL,
  `description` longtext NOT NULL,
  `website` varchar(200) NOT NULL,
  `upload` varchar(100) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_seller`
--

LOCK TABLES `seller_seller` WRITE;
/*!40000 ALTER TABLE `seller_seller` DISABLE KEYS */;
INSERT INTO `seller_seller` VALUES (2,'Allied Autotech','Nav','+18989898989','Allied Autotech Noida','http://icrackexam.com','assets/seller/graduate-user-icon.png','2020-03-03 11:12:27.293222','2020-03-17 11:22:30.809056');
/*!40000 ALTER TABLE `seller_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_sellercategory`
--

DROP TABLE IF EXISTS `seller_sellercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_sellercategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seller_sellercategory_seller_id_5fd3c9e3_uniq` (`seller_id`),
  CONSTRAINT `seller_sellercategory_seller_id_5fd3c9e3_fk_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_sellercategory`
--

LOCK TABLES `seller_sellercategory` WRITE;
/*!40000 ALTER TABLE `seller_sellercategory` DISABLE KEYS */;
INSERT INTO `seller_sellercategory` VALUES (4,2);
/*!40000 ALTER TABLE `seller_sellercategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_sellercategory_category`
--

DROP TABLE IF EXISTS `seller_sellercategory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_sellercategory_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sellercategory_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seller_sellercategory_ca_sellercategory_id_catego_e59fc7d0_uniq` (`sellercategory_id`,`category_id`),
  KEY `seller_sellercategor_category_id_72a8c3bb_fk_category_` (`category_id`),
  CONSTRAINT `seller_sellercategor_category_id_72a8c3bb_fk_category_` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`),
  CONSTRAINT `seller_sellercategor_sellercategory_id_8d538a3c_fk_seller_se` FOREIGN KEY (`sellercategory_id`) REFERENCES `seller_sellercategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_sellercategory_category`
--

LOCK TABLES `seller_sellercategory_category` WRITE;
/*!40000 ALTER TABLE `seller_sellercategory_category` DISABLE KEYS */;
INSERT INTO `seller_sellercategory_category` VALUES (5,4,6),(2,4,7),(3,4,10),(4,4,11);
/*!40000 ALTER TABLE `seller_sellercategory_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-18 16:47:58
