-- MySQL dump 10.13  Distrib 8.0.19, for osx10.15 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin'),(4,'Maintainer'),(5,'Seller'),(2,'Sub Admin'),(3,'Supplier');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tech users',7,'add_techusers'),(26,'Can change tech users',7,'change_techusers'),(27,'Can delete tech users',7,'delete_techusers'),(28,'Can view tech users',7,'view_techusers'),(29,'Can add sub category',8,'add_subcategory'),(30,'Can change sub category',8,'change_subcategory'),(31,'Can delete sub category',8,'delete_subcategory'),(32,'Can view sub category',8,'view_subcategory'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add maker',10,'add_maker'),(38,'Can change maker',10,'change_maker'),(39,'Can delete maker',10,'delete_maker'),(40,'Can view maker',10,'view_maker'),(41,'Can add model line',11,'add_modelline'),(42,'Can change model line',11,'change_modelline'),(43,'Can delete model line',11,'delete_modelline'),(44,'Can view model line',11,'view_modelline'),(45,'Can add model year',12,'add_modelyear'),(46,'Can change model year',12,'change_modelyear'),(47,'Can delete model year',12,'delete_modelyear'),(48,'Can view model year',12,'view_modelyear'),(49,'Can add model modification',13,'add_modelmodification'),(50,'Can change model modification',13,'change_modelmodification'),(51,'Can delete model modification',13,'delete_modelmodification'),(52,'Can view model modification',13,'view_modelmodification'),(53,'Can add model listing',14,'add_modellisting'),(54,'Can change model listing',14,'change_modellisting'),(55,'Can delete model listing',14,'delete_modellisting'),(56,'Can view model listing',14,'view_modellisting'),(57,'Can add car list',15,'add_carlist'),(58,'Can change car list',15,'change_carlist'),(59,'Can delete car list',15,'delete_carlist'),(60,'Can view car list',15,'view_carlist'),(61,'Can add car maker',10,'add_carmaker'),(62,'Can change car maker',10,'change_carmaker'),(63,'Can delete car maker',10,'delete_carmaker'),(64,'Can view car maker',10,'view_carmaker'),(65,'Can add car modelline',16,'add_carmodelline'),(66,'Can change car modelline',16,'change_carmodelline'),(67,'Can delete car modelline',16,'delete_carmodelline'),(68,'Can view car modelline',16,'view_carmodelline'),(69,'Can add car model',17,'add_carmodel'),(70,'Can change car model',17,'change_carmodel'),(71,'Can delete car model',17,'delete_carmodel'),(72,'Can view car model',17,'view_carmodel'),(73,'Can add part category',18,'add_partcategory'),(74,'Can change part category',18,'change_partcategory'),(75,'Can delete part category',18,'delete_partcategory'),(76,'Can view part category',18,'view_partcategory'),(77,'Can add brand',19,'add_brand'),(78,'Can change brand',19,'change_brand'),(79,'Can delete brand',19,'delete_brand'),(80,'Can view brand',19,'view_brand'),(81,'Can add brand category',20,'add_brandcategory'),(82,'Can change brand category',20,'change_brandcategory'),(83,'Can delete brand category',20,'delete_brandcategory'),(84,'Can view brand category',20,'view_brandcategory'),(85,'Can add seller category',21,'add_sellercategory'),(86,'Can change seller category',21,'change_sellercategory'),(87,'Can delete seller category',21,'delete_sellercategory'),(88,'Can view seller category',21,'view_sellercategory'),(89,'Can add seller',22,'add_seller'),(90,'Can change seller',22,'change_seller'),(91,'Can delete seller',22,'delete_seller'),(92,'Can view seller',22,'view_seller'),(93,'Can add auto part',23,'add_autopart'),(94,'Can change auto part',23,'change_autopart'),(95,'Can delete auto part',23,'delete_autopart'),(96,'Can view auto part',23,'view_autopart'),(97,'Can add auto part category',24,'add_autopartcategory'),(98,'Can change auto part category',24,'change_autopartcategory'),(99,'Can delete auto part category',24,'delete_autopartcategory'),(100,'Can view auto part category',24,'view_autopartcategory'),(101,'Can add auto part images',25,'add_autopartimages'),(102,'Can change auto part images',25,'change_autopartimages'),(103,'Can delete auto part images',25,'delete_autopartimages'),(104,'Can view auto part images',25,'view_autopartimages'),(105,'Can add auto part brand',26,'add_autopartbrand'),(106,'Can change auto part brand',26,'change_autopartbrand'),(107,'Can delete auto part brand',26,'delete_autopartbrand'),(108,'Can view auto part brand',26,'view_autopartbrand'),(109,'Can add category',27,'add_category'),(110,'Can change category',27,'change_category'),(111,'Can delete category',27,'delete_category'),(112,'Can view category',27,'view_category'),(113,'Can add auto part picture',28,'add_autopartpicture'),(114,'Can change auto part picture',28,'change_autopartpicture'),(115,'Can delete auto part picture',28,'delete_autopartpicture'),(116,'Can view auto part picture',28,'view_autopartpicture'),(117,'Can add auto part seller',29,'add_autopartseller'),(118,'Can change auto part seller',29,'change_autopartseller'),(119,'Can delete auto part seller',29,'delete_autopartseller'),(120,'Can view auto part seller',29,'view_autopartseller');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$EhZkQGrT5aBV$t+VX264xKK5M1qx3wNSbNOyZIhnwefGa1e4hc1AzGL8=','2020-03-04 06:25:59.519666',1,'admin','Naveen','Chauhan','naveen.chauhan010@gmail.com',1,1,'2020-01-30 13:05:47.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
-- Table structure for table `car_carmaker`
--

DROP TABLE IF EXISTS `car_carmaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_carmaker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `shortName` varchar(4) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_carmaker`
--

LOCK TABLES `car_carmaker` WRITE;
/*!40000 ALTER TABLE `car_carmaker` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_carmaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_carmodel`
--

DROP TABLE IF EXISTS `car_carmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_carmodel` (
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
  KEY `car_carmodel_maker_id_f51d2ae1_fk_car_carmaker_id` (`maker_id`),
  CONSTRAINT `car_carmodel_maker_id_f51d2ae1_fk_car_carmaker_id` FOREIGN KEY (`maker_id`) REFERENCES `car_carmaker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_carmodel`
--

LOCK TABLES `car_carmodel` WRITE;
/*!40000 ALTER TABLE `car_carmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_carmodel` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category`
--

LOCK TABLES `category_category` WRITE;
/*!40000 ALTER TABLE `category_category` DISABLE KEYS */;
INSERT INTO `category_category` VALUES (6,'Maintenance',0,'2020-02-28 07:49:22.402717','2020-02-28 07:57:40.098016',NULL),(7,'Ait Conditioning',0,'2020-02-28 07:50:23.087565','2020-02-28 07:50:23.087604',NULL),(8,'Bels Chains and Rollers',1,'2020-02-28 07:51:02.711083','2020-03-04 06:44:46.370774',NULL),(9,'Body',0,'2020-02-28 07:57:47.410029','2020-02-28 07:57:47.410062',NULL);
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-01-31 08:48:14.742810','1','Admin',1,'[{\"added\": {}}]',3,1),(2,'2020-01-31 08:49:28.916423','1','Admins',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(3,'2020-01-31 08:49:45.198477','2','Super Admins',1,'[{\"added\": {}}]',3,1),(4,'2020-01-31 08:50:08.257457','3','Suppliers',1,'[{\"added\": {}}]',3,1),(5,'2020-01-31 08:50:43.077085','4','Maintainers',1,'[{\"added\": {}}]',3,1),(6,'2020-01-31 08:51:09.461331','1','Admin',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(7,'2020-01-31 08:51:16.836932','4','Maintainer',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(8,'2020-01-31 08:51:35.651664','2','Sub Admin',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(9,'2020-01-31 08:51:45.058928','3','Supplier',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(10,'2020-01-31 08:56:52.836843','1','admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',4,1),(11,'2020-02-03 12:14:28.802942','1','Maker object (1)',1,'[{\"added\": {}}]',10,1),(12,'2020-02-03 12:18:22.905066','2','Maker object (2)',1,'[{\"added\": {}}]',10,1),(13,'2020-02-03 12:19:09.976958','1','ModelLine object (1)',1,'[{\"added\": {}}]',11,1),(14,'2020-02-03 12:19:41.498893','2','ModelLine object (2)',1,'[{\"added\": {}}]',11,1),(15,'2020-02-03 12:20:23.073119','1','ModelYear object (1)',1,'[{\"added\": {}}]',12,1),(16,'2020-02-03 13:09:58.105439','3','CarMaker object (3)',1,'[{\"added\": {}}]',10,1),(17,'2020-02-03 13:10:25.348673','3','CarMaker object (3)',2,'[{\"changed\": {\"fields\": [\"Name\", \"ShortName\"]}}]',10,1),(18,'2020-02-11 11:16:51.001994','1','CarMaker object (1)',2,'[{\"changed\": {\"fields\": [\"ShortName\"]}}]',10,1),(19,'2020-02-11 11:37:00.082075','1','CarList object (1)',1,'[{\"added\": {}}]',15,1),(20,'2020-02-12 06:34:57.169936','1','CarList object (1)',3,'',15,1),(21,'2020-02-12 06:35:48.880311','3','CarMaker object (3)',3,'',10,1),(22,'2020-02-12 06:35:48.892339','2','CarMaker object (2)',3,'',10,1),(23,'2020-02-12 06:35:48.894199','1','CarMaker object (1)',3,'',10,1),(24,'2020-02-12 06:37:28.381401','4','CarMaker object (4)',1,'[{\"added\": {}}]',10,1),(25,'2020-02-12 06:37:53.436258','5','CarMaker object (5)',1,'[{\"added\": {}}]',10,1),(26,'2020-02-12 06:38:14.068800','6','CarMaker object (6)',1,'[{\"added\": {}}]',10,1),(27,'2020-02-12 06:38:24.419308','7','CarMaker object (7)',1,'[{\"added\": {}}]',10,1),(28,'2020-02-12 06:38:37.458259','8','CarMaker object (8)',1,'[{\"added\": {}}]',10,1),(29,'2020-02-12 06:38:55.626741','9','CarMaker object (9)',1,'[{\"added\": {}}]',10,1),(30,'2020-02-12 06:39:12.503039','10','CarMaker object (10)',1,'[{\"added\": {}}]',10,1),(31,'2020-02-12 06:39:27.059935','11','CarMaker object (11)',1,'[{\"added\": {}}]',10,1),(32,'2020-02-12 06:40:08.292485','12','CarMaker object (12)',1,'[{\"added\": {}}]',10,1),(33,'2020-02-12 06:40:19.384226','13','CarMaker object (13)',1,'[{\"added\": {}}]',10,1),(34,'2020-02-12 07:21:18.321920','1','CarModelline object (1)',1,'[{\"added\": {}}]',16,1),(35,'2020-02-12 07:22:25.492981','2','CarModelline object (2)',1,'[{\"added\": {}}]',16,1),(36,'2020-02-12 07:31:31.400417','3','CarModelline object (3)',1,'[{\"added\": {}}]',16,1),(37,'2020-02-17 12:54:12.873516','5','Seller',1,'[{\"added\": {}}]',3,1),(38,'2020-02-18 10:14:16.856398','1','CarMaker object (1)',1,'[{\"added\": {}}]',10,1),(39,'2020-02-18 10:14:25.520774','2','CarMaker object (2)',1,'[{\"added\": {}}]',10,1),(40,'2020-02-18 10:26:31.195652','1','CarModel object (1)',1,'[{\"added\": {}}]',17,1),(41,'2020-02-18 12:15:44.251878','1','PartCategory object (1)',1,'[{\"added\": {}}]',18,1),(42,'2020-02-18 12:16:16.117318','2','PartCategory object (2)',1,'[{\"added\": {}}]',18,1),(43,'2020-02-18 12:16:37.614307','3','PartCategory object (3)',1,'[{\"added\": {}}]',18,1),(44,'2020-02-18 12:18:29.084297','3','PartCategory object (3)',2,'[{\"changed\": {\"fields\": [\"Is class\"]}}]',18,1),(45,'2020-02-19 09:48:43.922649','1','Brand object (1)',1,'[{\"added\": {}}]',19,1),(46,'2020-02-19 09:49:40.189347','1','Brand object (1)',3,'',19,1),(47,'2020-02-19 09:50:41.591197','2','Brand object (2)',1,'[{\"added\": {}}]',19,1),(48,'2020-02-19 09:53:01.283030','2','Brand object (2)',3,'',19,1),(49,'2020-02-19 09:53:37.292225','3','Brand object (3)',1,'[{\"added\": {}}]',19,1),(50,'2020-02-19 11:24:41.717749','1','Seller object (1)',1,'[{\"added\": {}}]',22,1),(51,'2020-02-19 11:24:56.689711','1','SellerCategory object (1)',1,'[{\"added\": {}}]',21,1),(52,'2020-02-19 11:25:08.311751','2','SellerCategory object (2)',1,'[{\"added\": {}}]',21,1),(53,'2020-02-19 11:25:18.763083','3','SellerCategory object (3)',1,'[{\"added\": {}}]',21,1),(54,'2020-02-19 11:29:28.280277','1','BrandCategory object (1)',1,'[{\"added\": {}}]',20,1),(55,'2020-02-19 11:29:58.650886','2','BrandCategory object (2)',1,'[{\"added\": {}}]',20,1),(56,'2020-02-19 11:30:04.973914','3','BrandCategory object (3)',1,'[{\"added\": {}}]',20,1),(57,'2020-02-26 09:30:25.351043','4','Brand object (4)',1,'[{\"added\": {}}]',19,1),(58,'2020-02-27 10:12:51.572775','1','Category object (1)',1,'[{\"added\": {}}]',27,1),(59,'2020-02-27 10:15:03.151746','2','Category object (2)',1,'[{\"added\": {}}]',27,1),(60,'2020-02-27 10:15:44.817667','3','Category object (3)',1,'[{\"added\": {}}]',27,1),(61,'2020-02-27 10:16:09.462730','4','Category object (4)',1,'[{\"added\": {}}]',27,1),(62,'2020-02-27 10:46:14.157034','5','Category object (5)',1,'[{\"added\": {}}]',27,1),(63,'2020-02-27 10:47:38.188969','1','AutoPart object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (1)\"}}]',23,1),(64,'2020-02-27 10:53:10.314715','1','AutoPart object (1)',2,'[{\"added\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (2)\"}}, {\"added\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (3)\"}}]',23,1),(65,'2020-02-27 11:06:58.480074','1','AutoPart object (1)',2,'[{\"deleted\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (None)\"}}, {\"deleted\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (None)\"}}, {\"deleted\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (None)\"}}]',23,1),(66,'2020-02-28 05:23:32.547655','1','AutoPart object (1)',3,'',23,1),(67,'2020-02-28 06:39:10.903622','4','Brand object (4)',3,'',19,1),(68,'2020-02-28 06:39:10.942591','3','Brand object (3)',3,'',19,1),(69,'2020-02-28 06:39:26.539899','2','CarMaker object (2)',3,'',10,1),(70,'2020-02-28 06:39:26.543394','1','CarMaker object (1)',3,'',10,1),(71,'2020-02-28 06:39:46.185832','5','Category object (5)',3,'',27,1),(72,'2020-02-28 06:39:46.199048','4','Category object (4)',3,'',27,1),(73,'2020-02-28 06:39:46.200713','3','Category object (3)',3,'',27,1),(74,'2020-02-28 06:39:46.201935','2','Category object (2)',3,'',27,1),(75,'2020-02-28 06:39:46.203199','1','Category object (1)',3,'',27,1),(76,'2020-02-28 06:40:07.242705','1','Seller object (1)',3,'',22,1),(77,'2020-02-28 07:56:46.778687','6','Category object (6)',2,'[{\"changed\": {\"fields\": [\"Is class\"]}}]',27,1),(78,'2020-02-28 07:56:53.343977','6','Category object (6)',2,'[]',27,1),(79,'2020-02-28 07:57:40.099480','6','Category object (6)',2,'[]',27,1),(80,'2020-02-28 07:57:47.410861','9','Category object (9)',1,'[{\"added\": {}}]',27,1),(81,'2020-02-28 09:25:38.839107','5','Brand object (5)',1,'[{\"added\": {}}]',19,1),(82,'2020-02-28 09:30:56.036781','3','AutoPart object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"auto part category\", \"object\": \"AutoPartCategory object (3)\"}}, {\"added\": {\"name\": \"auto part brand\", \"object\": \"AutoPartBrand object (3)\"}}, {\"added\": {\"name\": \"auto part picture\", \"object\": \"AutoPartPicture object (1)\"}}, {\"added\": {\"name\": \"auto part picture\", \"object\": \"AutoPartPicture object (2)\"}}, {\"added\": {\"name\": \"auto part picture\", \"object\": \"AutoPartPicture object (3)\"}}]',23,1),(83,'2020-03-04 06:44:46.372225','8','Category object (8)',2,'[{\"changed\": {\"fields\": [\"Is class\"]}}]',27,1),(84,'2020-03-04 06:46:15.129122','3','AutoPart object (3)',2,'[{\"changed\": {\"name\": \"auto part brand\", \"object\": \"AutoPartBrand object (3)\", \"fields\": [\"Brand\"]}}, {\"deleted\": {\"name\": \"auto part picture\", \"object\": \"AutoPartPicture object (None)\"}}, {\"deleted\": {\"name\": \"auto part picture\", \"object\": \"AutoPartPicture object (None)\"}}, {\"deleted\": {\"name\": \"auto part picture\", \"object\": \"AutoPartPicture object (None)\"}}]',23,1),(85,'2020-03-04 07:38:52.624023','2','Seller object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"seller category\", \"object\": \"SellerCategory object (4)\"}}]',22,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(19,'brand','brand'),(20,'brand','brandcategory'),(15,'Car','carlist'),(10,'Car','carmaker'),(17,'Car','carmodel'),(16,'Car','carmodelline'),(11,'Car','modelline'),(14,'Car','modellisting'),(13,'Car','modelmodification'),(12,'Car','modelyear'),(27,'category','category'),(9,'CategoryManagement','category'),(8,'CategoryManagement','subcategory'),(5,'contenttypes','contenttype'),(7,'inventory','techusers'),(23,'part','autopart'),(26,'part','autopartbrand'),(24,'part','autopartcategory'),(25,'part','autopartimages'),(28,'part','autopartpicture'),(29,'part','autopartseller'),(18,'part','partcategory'),(22,'seller','seller'),(21,'seller','sellercategory'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-01-29 13:28:36.721193'),(2,'auth','0001_initial','2020-01-29 13:28:36.932553'),(3,'admin','0001_initial','2020-01-29 13:28:37.097546'),(4,'admin','0002_logentry_remove_auto_add','2020-01-29 13:28:37.150741'),(5,'admin','0003_logentry_add_action_flag_choices','2020-01-29 13:28:37.157821'),(6,'contenttypes','0002_remove_content_type_name','2020-01-29 13:28:37.210071'),(7,'auth','0002_alter_permission_name_max_length','2020-01-29 13:28:37.236424'),(8,'auth','0003_alter_user_email_max_length','2020-01-29 13:28:37.258526'),(9,'auth','0004_alter_user_username_opts','2020-01-29 13:28:37.265499'),(10,'auth','0005_alter_user_last_login_null','2020-01-29 13:28:37.291965'),(11,'auth','0006_require_contenttypes_0002','2020-01-29 13:28:37.294673'),(12,'auth','0007_alter_validators_add_error_messages','2020-01-29 13:28:37.303350'),(13,'auth','0008_alter_user_username_max_length','2020-01-29 13:28:37.335237'),(14,'auth','0009_alter_user_last_name_max_length','2020-01-29 13:28:37.368917'),(15,'auth','0010_alter_group_name_max_length','2020-01-29 13:28:37.384457'),(16,'auth','0011_update_proxy_permissions','2020-01-29 13:28:37.392662'),(17,'sessions','0001_initial','2020-01-29 13:28:37.405057'),(21,'inventory','0001_initial','2020-01-31 09:10:29.786128'),(22,'inventory','0002_auto_20200130_1237','2020-01-31 09:10:29.789894'),(23,'inventory','0003_delete_techusers','2020-01-31 09:10:29.800170'),(24,'CategoryManagement','0001_initial','2020-02-03 09:37:46.082865'),(25,'CategoryManagement','0002_auto_20200203_1050','2020-02-03 10:50:29.252842'),(26,'Car','0001_initial','2020-02-03 12:01:52.805757'),(27,'Car','0002_auto_20200203_1306','2020-02-03 13:07:20.159116'),(28,'Car','0003_auto_20200203_1312','2020-02-03 13:13:32.745883'),(29,'Car','0004_auto_20200203_1316','2020-02-03 13:17:11.908267'),(30,'Car','0005_auto_20200212_0709','2020-02-12 07:09:30.664309'),(31,'Car','0006_carmodelline_added_date','2020-02-12 07:13:04.973316'),(32,'Car','0007_auto_20200212_0717','2020-02-12 07:17:26.730597'),(33,'Car','0008_auto_20200218_0641','2020-02-18 06:41:33.033862'),(34,'Car','0009_auto_20200218_0644','2020-02-18 06:45:09.196451'),(35,'car','0001_initial','2020-02-18 10:11:44.312403'),(36,'car','0002_auto_20200218_1019','2020-02-18 10:19:53.920964'),(37,'car','0003_auto_20200218_1025','2020-02-18 10:25:15.788060'),(39,'part','0001_initial','2020-02-18 12:09:19.260887'),(40,'brand','0001_initial','2020-02-19 09:28:28.858337'),(41,'brand','0002_auto_20200219_0946','2020-02-19 09:47:07.884678'),(42,'brand','0003_auto_20200219_1043','2020-02-19 10:44:20.656195'),(43,'seller','0001_initial','2020-02-19 10:55:21.118994'),(44,'category','0001_initial','2020-02-26 09:20:50.127124'),(45,'part','0002_auto_20200226_0632','2020-02-26 09:20:50.419905'),(46,'brand','0004_auto_20200226_0632','2020-02-26 09:49:23.234146'),(47,'brand','0005_auto_20200226_0746','2020-02-26 09:49:23.275455'),(48,'seller','0002_auto_20200226_0632','2020-02-26 09:51:39.736246'),(49,'seller','0003_auto_20200226_0746','2020-02-26 09:51:39.754397'),(50,'part','0003_auto_20200226_0632','2020-02-26 09:51:39.805219'),(51,'part','0004_auto_20200226_0746','2020-02-26 09:51:39.845320'),(52,'part','0005_autopartbrand_autopartimages','2020-02-26 09:51:39.928273'),(53,'part','0006_autopart_part_title','2020-02-26 09:51:40.028310'),(54,'category','0002_auto_20200227_0726','2020-02-27 07:26:45.593138'),(55,'category','0003_auto_20200227_0736','2020-02-27 07:36:18.623376'),(56,'category','0004_auto_20200227_0853','2020-02-27 08:53:49.869294'),(57,'category','0005_auto_20200227_0857','2020-02-27 08:57:56.497164'),(58,'category','0006_auto_20200227_0901','2020-02-27 09:01:18.392207'),(59,'category','0007_auto_20200227_0906','2020-02-27 09:06:44.755835'),(60,'category','0008_auto_20200227_0929','2020-02-28 07:43:07.343150'),(61,'category','0009_auto_20200227_0929','2020-02-28 07:43:07.362586'),(62,'category','0010_auto_20200227_0933','2020-02-28 07:43:07.382545'),(63,'category','0011_auto_20200227_0938','2020-02-28 07:43:07.401954'),(64,'category','0012_auto_20200227_0955','2020-02-28 07:43:07.478543'),(65,'category','0013_auto_20200227_0957','2020-02-28 07:43:07.498145'),(66,'category','0014_auto_20200227_1000','2020-02-28 07:43:07.517642'),(67,'category','0015_auto_20200228_0543','2020-02-28 07:43:07.537567'),(68,'category','0016_auto_20200228_0559','2020-02-28 07:43:07.556219'),(69,'category','0017_auto_20200228_0608','2020-02-28 07:43:07.576397'),(70,'category','0018_auto_20200228_0649','2020-02-28 07:43:07.595449'),(71,'category','0019_auto_20200228_0651','2020-02-28 07:43:07.623272'),(72,'category','0020_auto_20200228_0740','2020-02-28 07:43:07.648732'),(73,'category','0021_auto_20200228_0755','2020-02-28 07:55:45.243481'),(74,'part','0007_auto_20200227_1113','2020-02-28 09:05:33.495063'),(75,'part','0008_auto_20200227_1121','2020-02-28 09:05:33.497998'),(76,'part','0009_auto_20200227_1130','2020-02-28 09:05:33.500922'),(77,'part','0010_auto_20200227_1145','2020-02-28 09:05:33.503767'),(78,'part','0011_auto_20200227_1146','2020-02-28 09:05:33.506331'),(79,'part','0012_auto_20200227_1149','2020-02-28 09:05:33.508442'),(80,'part','0013_auto_20200227_1151','2020-02-28 09:05:33.510518'),(81,'part','0014_auto_20200227_1152','2020-02-28 09:05:33.512509'),(82,'part','0015_auto_20200227_1153','2020-02-28 09:05:33.515658'),(83,'part','0016_auto_20200228_0528','2020-02-28 09:05:33.518262'),(84,'part','0017_auto_20200228_0535','2020-02-28 09:05:33.520612'),(85,'part','0018_auto_20200228_0857','2020-02-28 09:05:33.525225'),(86,'part','0019_auto_20200228_0905','2020-02-28 09:05:33.527878'),(87,'part','0020_autopart_autopartbrand_autopartcategory_autopartpicture','2020-02-28 09:11:24.851522'),(88,'part','0021_auto_20200228_0914','2020-02-28 09:14:11.755438'),(89,'part','0022_auto_20200228_0916','2020-02-28 09:16:38.968457'),(90,'part','0023_auto_20200228_0924','2020-02-28 09:24:09.081408'),(91,'brand','0006_auto_20200303_1145','2020-03-04 06:25:25.310859'),(92,'car','0004_auto_20200304_0625','2020-03-04 06:25:25.429206'),(93,'seller','0004_auto_20200303_1047','2020-03-04 06:25:25.507880'),(94,'seller','0005_auto_20200303_1111','2020-03-04 06:25:25.625840'),(95,'seller','0006_auto_20200303_1113','2020-03-04 06:25:25.751127'),(96,'part','0024_autopart_origin','2020-03-04 06:25:25.783732'),(97,'part','0025_auto_20200303_1219','2020-03-04 06:25:26.101149'),(98,'part','0026_autopartcategory','2020-03-04 06:40:09.966437');
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
INSERT INTO `django_session` VALUES ('1f9c9n8ddkjmfy147ioencc83m6fu3cn','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-03 06:42:16.983965'),('2li738szhr7ue4fpv9d20r2etopmasb6','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-18 06:25:59.522491'),('81vht6y5cblcfa8bd10renbs7m2mnulv','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-13 13:06:48.461620'),('digbgzv06gidzr9awt3s1djza4qwzxdp','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-03 10:13:56.077486'),('i27w4l5h0owoco2tdwgdb7sjb2m1es08','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-25 09:11:33.191788'),('ii1dp3re5hzf8jwm4y76chsc9uqpdidr','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-17 09:41:23.567553'),('ka0vmpvllqi27tx3qvanxwro03658iv4','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-11 10:13:24.910258'),('mvmfd7yvvoee9ao72qlrk8yye1jv5jk6','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-25 11:06:22.980618'),('rd2oz5s930kss3g4dxn52wxw1hwn2wt6','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-12 07:21:12.107664'),('rfsibjdmz4z24z4m59tnc4pkbuen50m4','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-13 05:08:54.916707'),('spic40z999k37az24ckfrb8avct0566v','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-25 09:25:13.628176'),('uaw061b0d4yls8bqgx1wuy1ddhwybn61','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-26 06:34:05.231869'),('vmqjl4efv6f83oonlpgy1968zady7uv0','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-17 13:09:17.250542'),('xmh88ot98ah55f5rw8o1wnkuiki8wva1','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-03-04 06:27:22.418818'),('xtx6d5jljjd90chpt7i9zg2mac84gu74','NmJmN2RiNDNjZGJhMGZhNmFjZDA0MWM4Y2JmMWZlMGY2YjE1NWJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjRmMGMyNDc1ZjhhNzA2NTVhNGQ2ZjcxZmI0NDdjZGJlMjI4MzIzIn0=','2020-02-14 08:47:49.923420');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopart`
--

LOCK TABLES `part_autopart` WRITE;
/*!40000 ALTER TABLE `part_autopart` DISABLE KEYS */;
INSERT INTO `part_autopart` VALUES (3,'Part 1','123456','<p>Feature</p>','Part Desc','OM');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartbrand`
--

LOCK TABLES `part_autopartbrand` WRITE;
/*!40000 ALTER TABLE `part_autopartbrand` DISABLE KEYS */;
INSERT INTO `part_autopartbrand` VALUES (3,3);
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
INSERT INTO `part_autopartbrand_brand` VALUES (1,3,5);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartcategory`
--

LOCK TABLES `part_autopartcategory` WRITE;
/*!40000 ALTER TABLE `part_autopartcategory` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartcategory_category`
--

LOCK TABLES `part_autopartcategory_category` WRITE;
/*!40000 ALTER TABLE `part_autopartcategory_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_autopartcategory_category` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartpicture`
--

LOCK TABLES `part_autopartpicture` WRITE;
/*!40000 ALTER TABLE `part_autopartpicture` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `autopart_id` (`autopart_id`),
  CONSTRAINT `part_autopartseller_autopart_id_2a1f1202_fk_part_autopart_id` FOREIGN KEY (`autopart_id`) REFERENCES `part_autopart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartseller`
--

LOCK TABLES `part_autopartseller` WRITE;
/*!40000 ALTER TABLE `part_autopartseller` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_autopartseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_autopartseller_seller`
--

DROP TABLE IF EXISTS `part_autopartseller_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_autopartseller_seller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `autopartseller_id` int NOT NULL,
  `seller_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_autopartseller_sell_autopartseller_id_seller_9f8d4ef7_uniq` (`autopartseller_id`,`seller_id`),
  KEY `part_autopartseller__seller_id_f583f4b5_fk_seller_se` (`seller_id`),
  CONSTRAINT `part_autopartseller__autopartseller_id_49b0ce70_fk_part_auto` FOREIGN KEY (`autopartseller_id`) REFERENCES `part_autopartseller` (`id`),
  CONSTRAINT `part_autopartseller__seller_id_f583f4b5_fk_seller_se` FOREIGN KEY (`seller_id`) REFERENCES `seller_seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_autopartseller_seller`
--

LOCK TABLES `part_autopartseller_seller` WRITE;
/*!40000 ALTER TABLE `part_autopartseller_seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_autopartseller_seller` ENABLE KEYS */;
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
INSERT INTO `seller_seller` VALUES (2,'Seller 1','Naveen','99110177999x0','Description of Seller 1','http://google.com','assets/seller/images.jpeg','2020-03-04 07:38:52.621383','2020-03-04 07:38:52.621409');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_sellercategory_category`
--

LOCK TABLES `seller_sellercategory_category` WRITE;
/*!40000 ALTER TABLE `seller_sellercategory_category` DISABLE KEYS */;
INSERT INTO `seller_sellercategory_category` VALUES (1,4,8);
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

-- Dump completed on 2020-03-04 18:43:51
