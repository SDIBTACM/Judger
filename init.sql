-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: onlinejudge-hzj-dev-judeger
-- ------------------------------------------------------
-- Server version	8.0.20

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

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `cache_key` varchar(255) NOT NULL,
  `cache_value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cache_key` (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `end_before` datetime DEFAULT NULL,
  `lock_rank_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `privilege` int DEFAULT NULL,
  `privilege_info` varchar(255) DEFAULT NULL,
  `rule` int DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_owner_id_start_at` (`owner_id`,`start_at`),
  KEY `idx_privilege_start_at` (`privilege`,`start_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_allow_lang`
--

DROP TABLE IF EXISTS `contest_allow_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_allow_lang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `lang` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contest_id` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_allow_lang`
--

LOCK TABLES `contest_allow_lang` WRITE;
/*!40000 ALTER TABLE `contest_allow_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_allow_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_ip_limit`
--

DROP TABLE IF EXISTS `contest_ip_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_ip_limit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `allow_ips` longtext,
  `contest_id` bigint DEFAULT NULL,
  `deny_ips` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_contest_id` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_ip_limit`
--

LOCK TABLES `contest_ip_limit` WRITE;
/*!40000 ALTER TABLE `contest_ip_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_ip_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_privilege`
--

DROP TABLE IF EXISTS `contest_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_privilege` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_privilege`
--

LOCK TABLES `contest_privilege` WRITE;
/*!40000 ALTER TABLE `contest_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_problem`
--

DROP TABLE IF EXISTS `contest_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_problem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `problem_id` bigint DEFAULT NULL,
  `problem_order` int DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_problem`
--

LOCK TABLES `contest_problem` WRITE;
/*!40000 ALTER TABLE `contest_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_register`
--

DROP TABLE IF EXISTS `contest_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_register` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `actual_name` varchar(64) DEFAULT NULL,
  `college` varchar(64) DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `discipline` varchar(64) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_register`
--

LOCK TABLES `contest_register` WRITE;
/*!40000 ALTER TABLE `contest_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_result`
--

DROP TABLE IF EXISTS `contest_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `ac_at` datetime DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `contest_problem_id` bigint DEFAULT NULL,
  `submit_count` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_result`
--

LOCK TABLES `contest_result` WRITE;
/*!40000 ALTER TABLE `contest_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `count` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `count_key` varchar(255) NOT NULL,
  `total` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_count_key` (`count_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES (1,'2020-05-28 05:50:00','2020-05-28 05:50:00','JUDGE_RESULT:1:PRESENTATION_ERROR',1),(2,'2020-05-28 05:50:00','2020-05-28 05:50:00','JUDGE_RESULT:1:MEMORY_LIMIT_EXCEED',1),(3,'2020-05-28 05:50:01','2020-05-28 05:50:01','JUDGE_RESULT:1:RUNTIME_ERROR',1),(4,'2020-05-28 05:50:01','2020-05-28 05:50:01','JUDGE_RESULT:1:OUTPUT_LIMIT_EXCEED',1),(5,'2020-05-28 05:50:01','2020-05-28 05:50:01','JUDGE_RESULT:1:WRONG_ANSWER',1),(6,'2020-05-28 05:50:01','2020-05-28 05:50:01','JUDGE_RESULT:1:TIME_LIMIT_EXCEED',1),(7,'2020-05-28 05:50:02','2020-05-28 05:50:02','JUDGE_RESULT:1:ACCEPT',2);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss_post`
--

DROP TABLE IF EXISTS `discuss_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `topic_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss_post`
--

LOCK TABLES `discuss_post` WRITE;
/*!40000 ALTER TABLE `discuss_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `discuss_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss_post_context`
--

DROP TABLE IF EXISTS `discuss_post_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss_post_context` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `context` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss_post_context`
--

LOCK TABLES `discuss_post_context` WRITE;
/*!40000 ALTER TABLE `discuss_post_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `discuss_post_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss_topic`
--

DROP TABLE IF EXISTS `discuss_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `latest_reply_at` datetime DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `problem_id` bigint DEFAULT NULL,
  `replies` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `views` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss_topic`
--

LOCK TABLES `discuss_topic` WRITE;
/*!40000 ALTER TABLE `discuss_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `discuss_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `from_user_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `to_user_id` bigint DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_context`
--

DROP TABLE IF EXISTS `mail_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_context` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `context` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_context`
--

LOCK TABLES `mail_context` WRITE;
/*!40000 ALTER TABLE `mail_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_context`
--

DROP TABLE IF EXISTS `news_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_context` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `context` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_context`
--

LOCK TABLES `news_context` WRITE;
/*!40000 ALTER TABLE `news_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_judge_option`
--

DROP TABLE IF EXISTS `online_judge_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_judge_option` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `option_comment` longtext,
  `option_key` varchar(64) DEFAULT NULL,
  `option_value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_judge_option`
--

LOCK TABLES `online_judge_option` WRITE;
/*!40000 ALTER TABLE `online_judge_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_judge_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `hide` bit(1) DEFAULT NULL,
  `memory_limit` int DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `problem_type` int DEFAULT NULL,
  `similar_from` bigint DEFAULT NULL,
  `source` varchar(128) DEFAULT NULL,
  `special_judge` bit(1) DEFAULT NULL,
  `test_data_updated_at` datetime DEFAULT NULL,
  `time_limit` int DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_owner_id` (`owner_id`),
  KEY `idx_source` (`source`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1,NULL,'2020-05-28 05:49:05',NULL,_binary '\0',512,1,0,1,'not source',_binary '\0','2020-04-28 17:54:17',1000,'this is a problem, id is 1'),(2,NULL,'2020-05-28 05:49:05',NULL,_binary '\0',512,1,0,1,'not source',_binary '\0','2020-04-28 17:54:17',1000,'this is a problem, id is 2'),(3,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [3]'),(4,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [4]'),(5,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [5]'),(6,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [6]'),(7,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [7]'),(8,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [8]'),(9,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [9]'),(10,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [10]'),(11,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [11]'),(12,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [12]'),(13,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [13]'),(14,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [14]'),(15,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [15]'),(16,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [16]'),(17,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [17]'),(18,'2020-05-28 05:48:28','2020-05-28 05:48:28','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [18]'),(19,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [19]'),(20,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [20]'),(21,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [21]'),(22,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [22]'),(23,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [23]'),(24,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [24]'),(25,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [25]'),(26,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [26]'),(27,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [27]'),(28,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [28]'),(29,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [29]'),(30,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [30]'),(31,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [31]'),(32,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [32]'),(33,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [33]'),(34,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [34]'),(35,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [35]'),(36,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [36]'),(37,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [37]'),(38,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [38]'),(39,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [39]'),(40,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [40]'),(41,'2020-05-28 05:48:29','2020-05-28 05:48:29','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [41]'),(42,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [42]'),(43,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [43]'),(44,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [44]'),(45,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [45]'),(46,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [46]'),(47,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [47]'),(48,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [48]'),(49,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [49]'),(50,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [50]'),(51,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [51]'),(52,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [52]'),(53,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [53]'),(54,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [54]'),(55,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [55]'),(56,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [56]'),(57,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [57]'),(58,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [58]'),(59,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [59]'),(60,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [60]'),(61,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [61]'),(62,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [62]'),(63,'2020-05-28 05:48:30','2020-05-28 05:48:30','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [63]'),(64,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [64]'),(65,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [65]'),(66,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [66]'),(67,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [67]'),(68,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [68]'),(69,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [69]'),(70,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [70]'),(71,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [71]'),(72,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [72]'),(73,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [73]'),(74,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [74]'),(75,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [75]'),(76,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [76]'),(77,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [77]'),(78,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [78]'),(79,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [79]'),(80,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [80]'),(81,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [81]'),(82,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [82]'),(83,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [83]'),(84,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [84]'),(85,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [85]'),(86,'2020-05-28 05:48:31','2020-05-28 05:48:31','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [86]'),(87,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [87]'),(88,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [88]'),(89,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [89]'),(90,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [90]'),(91,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [91]'),(92,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [92]'),(93,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [93]'),(94,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [94]'),(95,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [95]'),(96,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [96]'),(97,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [97]'),(98,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [98]'),(99,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [99]'),(100,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [100]'),(101,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [101]'),(102,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [102]'),(103,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [103]'),(104,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [104]'),(105,'2020-05-28 05:48:32','2020-05-28 05:48:32','1899-12-31 10:00:00',_binary '\0',1024,1,0,NULL,NULL,_binary '\0','1899-12-31 10:00:00',1000,'this is a problem, id is [105]');
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_descripton`
--

DROP TABLE IF EXISTS `problem_descripton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem_descripton` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `description` longtext,
  `hint` longtext,
  `input` longtext,
  `output` longtext,
  `problem_id` bigint DEFAULT NULL,
  `sample` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_problem_id` (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_descripton`
--

LOCK TABLES `problem_descripton` WRITE;
/*!40000 ALTER TABLE `problem_descripton` DISABLE KEYS */;
INSERT INTO `problem_descripton` VALUES (1,NULL,'2020-05-28 05:49:06','this is a problem desceription, id is 1, used HTML','not hint','1 1 1','1 2 3 ',1,'not sample'),(2,NULL,'2020-05-28 05:49:06','this is a problem desceription, id is 2, used HTML','not hint','2 2 2','2 2 2 ',2,'not sample'),(3,'2020-05-28 05:48:38','2020-05-28 05:48:38','ok.','Bronze IV','杜-邵','峻熙.刘@example.com',3,'Whenever I’m sad, I stop being sad and be awesome instead.'),(4,'2020-05-28 05:48:38','2020-05-28 05:48:38','A man, a woman and a yordle walk into the sun. They die! Because it burns them alive? heh heh heh heh','Iron II','丁-田','胤祥.蔡@example.com',4,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(5,'2020-05-28 05:48:38','2020-05-28 05:48:38','Defy Noxus and taste your own blood.','Iron II','莫-田','雨泽.李@example.com',5,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(6,'2020-05-28 05:48:38','2020-05-28 05:48:38','The cycle of life and death continues. We will live, they will die.','Bronze III','周-郝','志泽.孟@example.com',6,'We’re going to get older whether we like it or not, so the only question is whether we get on with our lives, or desperately cling to the past.'),(7,'2020-05-28 05:48:38','2020-05-28 05:48:38','Defy Noxus and taste your own blood.','Bronze II','莫-黄','金鑫.高@example.com',7,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(8,'2020-05-28 05:48:38','2020-05-28 05:48:38','You only have to click once, fool!','Silver III','罗, 潘 and 李','浩然.董@example.com',8,'Definitions are important.'),(9,'2020-05-28 05:48:38','2020-05-28 05:48:38','It\'s not how much you can lift. It\'s how good you look!','Platinum III','田 LLC','振家.魏@example.com',9,'You can’t just skip ahead to where you think your life should be.'),(10,'2020-05-28 05:48:38','2020-05-28 05:48:38','Hut, two, three, four. Yes, sir!','Bronze I','林-唐','靖琪.夏@example.com',10,'Look, you can’t design your life like a building. It doesn’t work that way. You just have to live it… and it’ll design itself.'),(11,'2020-05-28 05:48:38','2020-05-28 05:48:38','Who wants a piece of the champ?!','Silver II','冯, 徐 and 戴','博超.曾@example.com',11,'The future is scary but you can’t just run back to the past because it’s familiar.'),(12,'2020-05-28 05:48:38','2020-05-28 05:48:38','Blindness is no impairment against a smelly enemy.','Bronze II','程 LLC','乐驹.雷@example.com',12,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(13,'2020-05-28 05:48:38','2020-05-28 05:48:38','Master yourself, master the enemy.','Silver III','孙, 陆 and 邱','天磊.王@example.com',13,'The littlest thing can cause a ripple effect that changes your life.'),(14,'2020-05-28 05:48:38','2020-05-28 05:48:38','Master yourself, master the enemy.','Iron IV','孔 Group','浩.薛@example.com',14,'The future is scary but you can’t just run back to the past because it’s familiar.'),(15,'2020-05-28 05:48:38','2020-05-28 05:48:38','Blindness is no impairment against a smelly enemy.','Iron I','崔, 吕 and 陶','展鹏.杨@example.com',15,'The littlest thing can cause a ripple effect that changes your life.'),(16,'2020-05-28 05:48:38','2020-05-28 05:48:38','Mundo say his own name a lot, or else he forget! Has happened before.','Gold IV','金-叶','子默.罗@example.com',16,'Definitions are important.'),(17,'2020-05-28 05:48:38','2020-05-28 05:48:38','Captain Teemo on duty.','Platinum I','袁-郝','明辉.黄@example.com',17,'There are a lot of little reasons why the big things in our lives happen.'),(18,'2020-05-28 05:48:39','2020-05-28 05:48:39','Mundo say his own name a lot, or else he forget! Has happened before.','Silver III','苏, 龙 and 阎','晟睿.孔@example.com',18,'Whenever I’m sad, I stop being sad and be awesome instead.'),(19,'2020-05-28 05:48:39','2020-05-28 05:48:39','Who wants some Draven? Heheheh.','Iron IV','贺 Group','智渊.石@example.com',19,'I keep waiting for it to happen. I’m waiting for it to happen. I guess I’m just tired of waiting. And that is all I’m going to say on that subject.'),(20,'2020-05-28 05:48:39','2020-05-28 05:48:39','Hut, two, three, four. Yes, sir!','Bronze I','赖, 戴 and 郑','彬.曹@example.com',20,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(21,'2020-05-28 05:48:39','2020-05-28 05:48:39','Mundo say his own name a lot, or else he forget! Has happened before.','Gold II','郑 and Sons','志泽.萧@example.com',21,'There are a lot of little reasons why the big things in our lives happen.'),(22,'2020-05-28 05:48:39','2020-05-28 05:48:39','Mundo say his own name a lot, or else he forget! Has happened before.','Grandmaster','万 LLC','梓晨.姚@example.com',22,'There are a lot of little reasons why the big things in our lives happen.'),(23,'2020-05-28 05:48:39','2020-05-28 05:48:39','I suppose you\'re expecting some inBEARable pun?','Grandmaster','田-罗','子轩.戴@example.com',23,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(24,'2020-05-28 05:48:39','2020-05-28 05:48:39','The early bird guts the worm!','Bronze IV','李 and Sons','峻熙.丁@example.com',24,'You can’t just skip ahead to where you think your life should be.'),(25,'2020-05-28 05:48:39','2020-05-28 05:48:39','Hut, two, three, four. Yes, sir!','Iron I','苏 Inc','懿轩.赖@example.com',25,'Look, you can’t design your life like a building. It doesn’t work that way. You just have to live it… and it’ll design itself.'),(26,'2020-05-28 05:48:39','2020-05-28 05:48:39','My right arm is a lot stronger than my left.','Diamond IV','姚-曾','智辉.钱@example.com',26,'Revenge fantasies never work out the way you want.'),(27,'2020-05-28 05:48:39','2020-05-28 05:48:39','That\'s gotta sting.','Bronze II','严 and Sons','鸿煊.董@example.com',27,'Whenever I’m sad, I stop being sad and be awesome instead.'),(28,'2020-05-28 05:48:39','2020-05-28 05:48:39','Defy Noxus and taste your own blood.','Diamond IV','孟-程','峻熙.杜@example.com',28,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(29,'2020-05-28 05:48:39','2020-05-28 05:48:39','Ready to set the world on fire...','Grandmaster','韦 LLC','子涵.吕@example.com',29,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(30,'2020-05-28 05:48:39','2020-05-28 05:48:39','Welcome to Summoners Rift!','Bronze I','段-罗','雨泽.邵@example.com',30,'The littlest thing can cause a ripple effect that changes your life.'),(31,'2020-05-28 05:48:39','2020-05-28 05:48:39','Who wants a piece of the champ?!','Gold II','郑, 余 and 戴','熠彤.周@example.com',31,'There are a lot of little reasons why the big things in our lives happen.'),(32,'2020-05-28 05:48:39','2020-05-28 05:48:39','You only have to click once, fool!','Platinum IV','史, 江 and 余','思聪.梁@example.com',32,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(33,'2020-05-28 05:48:39','2020-05-28 05:48:39','Hut, two, three, four. Yes, sir!','Silver IV','吕-马','智渊.宋@example.com',33,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(34,'2020-05-28 05:48:39','2020-05-28 05:48:39','My right arm is a lot stronger than my left.','Gold III','冯, 叶 and 何','黎昕.钱@example.com',34,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(35,'2020-05-28 05:48:39','2020-05-28 05:48:39','Ready to set the world on fire...','Iron II','薛, 杜 and 龙','熠彤.徐@example.com',35,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(36,'2020-05-28 05:48:39','2020-05-28 05:48:39','Caught between a rock... and a hard place.','Diamond I','潘, 廖 and 吴','鑫鹏.石@example.com',36,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(37,'2020-05-28 05:48:39','2020-05-28 05:48:39','Welcome to Summoners Rift!','Platinum IV','丁 Group','智宸.叶@example.com',37,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(38,'2020-05-28 05:48:39','2020-05-28 05:48:39','A man, a woman and a yordle walk into the sun. They die! Because it burns them alive? heh heh heh heh','Platinum I','尹-袁','明轩.顾@example.com',38,'You can’t just skip ahead to where you think your life should be.'),(39,'2020-05-28 05:48:39','2020-05-28 05:48:39','ok.','Gold II','雷 LLC','昊强.朱@example.com',39,'Revenge fantasies never work out the way you want.'),(40,'2020-05-28 05:48:39','2020-05-28 05:48:39','Purge the unjust.','Platinum II','陆 LLC','语堂.陶@example.com',40,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(41,'2020-05-28 05:48:39','2020-05-28 05:48:39','Don\'t you trust me?','Iron III','龚-郑','荣轩.姚@example.com',41,'I keep waiting for it to happen. I’m waiting for it to happen. I guess I’m just tired of waiting. And that is all I’m going to say on that subject.'),(42,'2020-05-28 05:48:40','2020-05-28 05:48:40','By my will, this shall be finished!','Diamond III','李, 赵 and 赖','立诚.冯@example.com',42,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(43,'2020-05-28 05:48:40','2020-05-28 05:48:40','Purge the unjust.','Platinum I','戴, 蒋 and 郭','博文.廖@example.com',43,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(44,'2020-05-28 05:48:40','2020-05-28 05:48:40','Come on, live a little... while you can!','Master','孟-武','鑫鹏.尹@example.com',44,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(45,'2020-05-28 05:48:40','2020-05-28 05:48:40','Have you seen my Bear Tibbers?','Gold III','毛, 熊 and 孙','伟祺.何@example.com',45,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(46,'2020-05-28 05:48:40','2020-05-28 05:48:40','Not Draven; Draaaaven.','Diamond I','龚 Inc','熠彤.周@example.com',46,'Whenever I’m sad, I stop being sad and be awesome instead.'),(47,'2020-05-28 05:48:40','2020-05-28 05:48:40','My right arm is a lot stronger than my left.','Master','袁, 丁 and 汪','子骞.钱@example.com',47,'I realized that I’m searching, searching for what I really want in life. And you know what? I have absolutely no idea what that is.'),(48,'2020-05-28 05:48:40','2020-05-28 05:48:40','I\'ll scout ahead!','Iron II','龙 Inc','文轩.程@example.com',48,'I keep waiting for it to happen. I’m waiting for it to happen. I guess I’m just tired of waiting. And that is all I’m going to say on that subject.'),(49,'2020-05-28 05:48:40','2020-05-28 05:48:40','Monsters can be made to fear.','Gold IV','王, 龙 and 郭','越泽.王@example.com',49,'Revenge fantasies never work out the way you want.'),(50,'2020-05-28 05:48:40','2020-05-28 05:48:40','Ready to set the world on fire...','Challenger','尹-段','峻熙.于@example.com',50,'I realized that I’m searching, searching for what I really want in life. And you know what? I have absolutely no idea what that is.'),(51,'2020-05-28 05:48:40','2020-05-28 05:48:40','Who wants some Draven? Heheheh.','Silver II','胡-赵','语堂.魏@example.com',51,'We’re going to get older whether we like it or not, so the only question is whether we get on with our lives, or desperately cling to the past.'),(52,'2020-05-28 05:48:40','2020-05-28 05:48:40','Captain Teemo on duty.','Gold II','段 LLC','鹏飞.廖@example.com',52,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(53,'2020-05-28 05:48:40','2020-05-28 05:48:40','Who wants some Draven? Heheheh.','Gold IV','陆, 曹 and 潘','展鹏.许@example.com',53,'The littlest thing can cause a ripple effect that changes your life.'),(54,'2020-05-28 05:48:40','2020-05-28 05:48:40','Come on, live a little... while you can!','Platinum III','钟 Inc','修洁.曹@example.com',54,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(55,'2020-05-28 05:48:40','2020-05-28 05:48:40','Caught between a rock... and a hard place.','Diamond III','侯-萧','鸿涛.侯@example.com',55,'Revenge fantasies never work out the way you want.'),(56,'2020-05-28 05:48:40','2020-05-28 05:48:40','Hut, two, three, four. Yes, sir!','Gold III','谭-阎','昊焱.魏@example.com',56,'I realized that I’m searching, searching for what I really want in life. And you know what? I have absolutely no idea what that is.'),(57,'2020-05-28 05:48:40','2020-05-28 05:48:40','Monsters can be made to fear.','Silver I','王, 史 and 崔','风华.马@example.com',57,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(58,'2020-05-28 05:48:40','2020-05-28 05:48:40','Hut, two, three, four. Yes, sir!','Silver IV','董-洪','子骞.范@example.com',58,'You can’t just skip ahead to where you think your life should be.'),(59,'2020-05-28 05:48:40','2020-05-28 05:48:40','Monsters can be made to fear.','Master','杜-薛','鹏煊.吴@example.com',59,'You can’t just skip ahead to where you think your life should be.'),(60,'2020-05-28 05:48:40','2020-05-28 05:48:40','Master yourself, master the enemy.','Gold IV','毛 Group','立诚.李@example.com',60,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(61,'2020-05-28 05:48:40','2020-05-28 05:48:40','I suppose you\'re expecting some inBEARable pun?','Grandmaster','夏, 陆 and 段','风华.武@example.com',61,'Revenge fantasies never work out the way you want.'),(62,'2020-05-28 05:48:40','2020-05-28 05:48:40','Mundo say his own name a lot, or else he forget! Has happened before.','Iron IV','萧-董','熠彤.严@example.com',62,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(63,'2020-05-28 05:48:40','2020-05-28 05:48:40','Ready to set the world on fire...','Master','尹, 尹 and 曾','耀杰.江@example.com',63,'The future is scary but you can’t just run back to the past because it’s familiar.'),(64,'2020-05-28 05:48:40','2020-05-28 05:48:40','Monsters can be made to fear.','Gold II','戴 and Sons','昊然.梁@example.com',64,'There are a lot of little reasons why the big things in our lives happen.'),(65,'2020-05-28 05:48:41','2020-05-28 05:48:41','That\'s gotta sting.','Iron IV','史-邱','健柏.韩@example.com',65,'Whenever I’m sad, I stop being sad and be awesome instead.'),(66,'2020-05-28 05:48:41','2020-05-28 05:48:41','Captain Teemo on duty.','Diamond IV','熊, 冯 and 尹','瑞霖.程@example.com',66,'You can’t just skip ahead to where you think your life should be.'),(67,'2020-05-28 05:48:41','2020-05-28 05:48:41','Master yourself, master the enemy.','Gold I','冯-程','远航.董@example.com',67,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(68,'2020-05-28 05:48:41','2020-05-28 05:48:41','The cycle of life and death continues. We will live, they will die.','Iron III','江-高','雨泽.孙@example.com',68,'The littlest thing can cause a ripple effect that changes your life.'),(69,'2020-05-28 05:48:41','2020-05-28 05:48:41','Behold the might of the shadow isles.','Iron I','叶, 方 and 韩','昊焱.王@example.com',69,'The littlest thing can cause a ripple effect that changes your life.'),(70,'2020-05-28 05:48:41','2020-05-28 05:48:41','The early bird guts the worm!','Diamond I','戴-刘','乐驹.冯@example.com',70,'The littlest thing can cause a ripple effect that changes your life.'),(71,'2020-05-28 05:48:41','2020-05-28 05:48:41','Welcome to the League of Draven.','Challenger','阎, 崔 and 苏','绍辉.戴@example.com',71,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(72,'2020-05-28 05:48:41','2020-05-28 05:48:41','That\'s gotta sting.','Platinum IV','赖-魏','文.唐@example.com',72,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(73,'2020-05-28 05:48:41','2020-05-28 05:48:41','Mundo say his own name a lot, or else he forget! Has happened before.','Gold I','龚 and Sons','立诚.曾@example.com',73,'Revenge fantasies never work out the way you want.'),(74,'2020-05-28 05:48:41','2020-05-28 05:48:41','Monsters can be made to fear.','Challenger','杨, 蔡 and 邵','胤祥.徐@example.com',74,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(75,'2020-05-28 05:48:41','2020-05-28 05:48:41','Have you seen my Bear Tibbers?','Silver IV','林, 马 and 姚','雪松.郝@example.com',75,'You can’t just skip ahead to where you think your life should be.'),(76,'2020-05-28 05:48:41','2020-05-28 05:48:41','Mundo say his own name a lot, or else he forget! Has happened before.','Silver III','蒋-熊','鹏飞.胡@example.com',76,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(77,'2020-05-28 05:48:41','2020-05-28 05:48:41','Come on, live a little... while you can!','Diamond IV','戴-蔡','烨霖.夏@example.com',77,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(78,'2020-05-28 05:48:41','2020-05-28 05:48:41','Welcome to the League of Draven.','Iron I','唐 LLC','晟睿.黄@example.com',78,'Look, you can’t design your life like a building. It doesn’t work that way. You just have to live it… and it’ll design itself.'),(79,'2020-05-28 05:48:41','2020-05-28 05:48:41','ok.','Gold I','朱-杜','懿轩.钱@example.com',79,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(80,'2020-05-28 05:48:41','2020-05-28 05:48:41','Who wants some Draven? Heheheh.','Iron III','唐-田','思聪.于@example.com',80,'Definitions are important.'),(81,'2020-05-28 05:48:41','2020-05-28 05:48:41','A man, a woman and a yordle walk into the sun. They die! Because it burns them alive? heh heh heh heh','Iron I','蔡, 李 and 冯','哲瀚.徐@example.com',81,'Look, you can’t design your life like a building. It doesn’t work that way. You just have to live it… and it’ll design itself.'),(82,'2020-05-28 05:48:41','2020-05-28 05:48:41','The early bird guts the worm!','Silver II','董-贾','弘文.曹@example.com',82,'We’re going to get older whether we like it or not, so the only question is whether we get on with our lives, or desperately cling to the past.'),(83,'2020-05-28 05:48:41','2020-05-28 05:48:41','Tonight we hunt!','Diamond II','王 LLC','文昊.许@example.com',83,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(84,'2020-05-28 05:48:41','2020-05-28 05:48:41','Not Draven; Draaaaven.','Silver IV','魏 LLC','天宇.沈@example.com',84,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(85,'2020-05-28 05:48:41','2020-05-28 05:48:41','Not Draven; Draaaaven.','Challenger','傅 Group','鹤轩.覃@example.com',85,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(86,'2020-05-28 05:48:41','2020-05-28 05:48:41','Monsters can be made to fear.','Iron IV','张, 袁 and 彭','明轩.胡@example.com',86,'I keep waiting for it to happen. I’m waiting for it to happen. I guess I’m just tired of waiting. And that is all I’m going to say on that subject.'),(87,'2020-05-28 05:48:41','2020-05-28 05:48:41','My right arm is a lot stronger than my left.','Gold I','韦-郝','琪.廖@example.com',87,'I keep waiting for it to happen. I’m waiting for it to happen. I guess I’m just tired of waiting. And that is all I’m going to say on that subject.'),(88,'2020-05-28 05:48:42','2020-05-28 05:48:42','NOM NOM NOM','Silver I','侯-韩','瑾瑜.覃@example.com',88,'Definitions are important.'),(89,'2020-05-28 05:48:42','2020-05-28 05:48:42','Tonight we hunt!','Master','尹 and Sons','明辉.马@example.com',89,'The littlest thing can cause a ripple effect that changes your life.'),(90,'2020-05-28 05:48:42','2020-05-28 05:48:42','Have you seen my Bear Tibbers?','Challenger','武, 贾 and 万','嘉熙.袁@example.com',90,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(91,'2020-05-28 05:48:42','2020-05-28 05:48:42','I suppose you\'re expecting some inBEARable pun?','Silver II','罗 and Sons','雪松.丁@example.com',91,'Ted, how many times have I told you to put the lid back on the peanut butter jar?! It’s this inconsiderate, immature jackassery that makes me feel like I’m living in The Real World House! And not the early days when they all had jobs and social consciences, I’m talking about Hawaii, and after!'),(92,'2020-05-28 05:48:42','2020-05-28 05:48:42','Have you seen my Bear Tibbers?','Platinum IV','蒋, 吴 and 姜','弘文.史@example.com',92,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(93,'2020-05-28 05:48:42','2020-05-28 05:48:42','The early bird guts the worm!','Diamond III','侯-熊','思源.邹@example.com',93,'Whether a gesture’s charming or alarming, depends on how it’s received.'),(94,'2020-05-28 05:48:42','2020-05-28 05:48:42','It\'s not how much you can lift. It\'s how good you look!','Silver III','赖-钱','金鑫.邱@example.com',94,'There are a lot of little reasons why the big things in our lives happen.'),(95,'2020-05-28 05:48:42','2020-05-28 05:48:42','NOM NOM NOM','Diamond IV','彭-秦','立诚.覃@example.com',95,'Definitions are important.'),(96,'2020-05-28 05:48:42','2020-05-28 05:48:42','A man, a woman and a yordle walk into the sun. They die! Because it burns them alive? heh heh heh heh','Bronze IV','雷 and Sons','建辉.许@example.com',96,'It’s just, eventually we’re all gonna move on. It’s called growing up.'),(97,'2020-05-28 05:48:42','2020-05-28 05:48:42','My profession?! You know, now that I think of it, I\'ve always wanted to be a baker.','Bronze I','赖 LLC','苑博.潘@example.com',97,'There are a lot of little reasons why the big things in our lives happen.'),(98,'2020-05-28 05:48:42','2020-05-28 05:48:42','Welcome to the League of Draven.','Platinum I','高-吕','旭尧.孙@example.com',98,'There are two big days in any love story: the day you meet the girl of your dreams and the day you marry her.'),(99,'2020-05-28 05:48:42','2020-05-28 05:48:42','Captain Teemo on duty.','Platinum II','熊 Inc','越彬.傅@example.com',99,'I realized that I’m searching, searching for what I really want in life. And you know what? I have absolutely no idea what that is.'),(100,'2020-05-28 05:48:42','2020-05-28 05:48:42','Never underestimate the power of the Scout\'s code.','Diamond IV','石 and Sons','嘉熙.叶@example.com',100,'I keep waiting for it to happen. I’m waiting for it to happen. I guess I’m just tired of waiting. And that is all I’m going to say on that subject.'),(101,'2020-05-28 05:48:42','2020-05-28 05:48:42','Don\'t you trust me?','Platinum II','任 Group','子涵.石@example.com',101,'We’re going to get older whether we like it or not, so the only question is whether we get on with our lives, or desperately cling to the past.'),(102,'2020-05-28 05:48:42','2020-05-28 05:48:42','That\'s gotta sting.','Gold II','陶, 钟 and 莫','越泽.戴@example.com',102,'Because sometimes even if you know how something’s gonna end that doesn’t mean you can’t enjoy the ride.'),(103,'2020-05-28 05:48:42','2020-05-28 05:48:42','Never underestimate the power of the Scout\'s code.','Iron III','何-史','炎彬.雷@example.com',103,'Revenge fantasies never work out the way you want.'),(104,'2020-05-28 05:48:42','2020-05-28 05:48:42','Captain Teemo on duty.','Bronze III','覃, 万 and 熊','思.崔@example.com',104,'Whenever I’m sad, I stop being sad and be awesome instead.'),(105,'2020-05-28 05:48:42','2020-05-28 05:48:42','Mundo will go where he pleases!','Bronze II','顾 and Sons','金鑫.苏@example.com',105,'Whenever I’m sad, I stop being sad and be awesome instead.');
/*!40000 ALTER TABLE `problem_descripton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_template_code`
--

DROP TABLE IF EXISTS `problem_template_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem_template_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `extra_code` longtext,
  `problem_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_problem_id` (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_template_code`
--

LOCK TABLES `problem_template_code` WRITE;
/*!40000 ALTER TABLE `problem_template_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_template_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `code_length` int DEFAULT NULL,
  `contest_id` bigint DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `lang` int DEFAULT NULL,
  `memory_used` int DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  `problem_id` bigint DEFAULT NULL,
  `result` int DEFAULT NULL,
  `similar_at` bigint DEFAULT NULL,
  `similar_percent` bigint DEFAULT NULL,
  `time_used` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_owner_id` (`owner_id`),
  KEY `idx_problem_id` (`problem_id`),
  KEY `idx_contest_id` (`contest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (1,'2020-05-28 05:49:06','2020-05-28 05:49:06',NULL,NULL,NULL,0,NULL,1,1,5,NULL,NULL,NULL),(2,'2020-05-28 05:49:06','2020-05-28 05:49:06',NULL,NULL,NULL,0,NULL,1,1,6,NULL,NULL,NULL),(3,'2020-05-28 05:49:06','2020-05-28 05:49:06',NULL,NULL,NULL,0,NULL,1,1,7,NULL,NULL,NULL),(4,'2020-05-28 05:49:07','2020-05-28 05:49:07',NULL,NULL,NULL,0,NULL,1,1,8,NULL,NULL,NULL),(5,'2020-05-28 05:49:07','2020-05-28 05:49:07',NULL,NULL,NULL,0,NULL,1,1,9,NULL,NULL,NULL),(6,'2020-05-28 05:49:07','2020-05-28 05:49:07',NULL,NULL,NULL,0,NULL,1,1,10,NULL,NULL,NULL),(7,'2020-05-28 05:49:07','2020-05-28 05:49:07',NULL,NULL,NULL,0,NULL,1,1,11,NULL,NULL,NULL),(8,'2020-05-28 05:49:07','2020-05-28 05:49:07',NULL,NULL,NULL,0,NULL,1,2,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution_code`
--

DROP TABLE IF EXISTS `solution_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solution_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `code` longtext,
  `solution_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_solution_id` (`solution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution_code`
--

LOCK TABLES `solution_code` WRITE;
/*!40000 ALTER TABLE `solution_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution_full_result`
--

DROP TABLE IF EXISTS `solution_full_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solution_full_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `data` longtext,
  `solution_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_solution_id` (`solution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution_full_result`
--

LOCK TABLES `solution_full_result` WRITE;
/*!40000 ALTER TABLE `solution_full_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution_full_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(36) DEFAULT NULL,
  `role` int NOT NULL,
  `school` varchar(32) NOT NULL,
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username_delete` (`username`,`delete_at`),
  UNIQUE KEY `uk_email_delete` (`email`,`delete_at`),
  UNIQUE KEY `uk_token_delete` (`remember_token`,`delete_at`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2020-05-28 05:49:04','2020-05-28 05:49:04','1899-12-31 10:00:00','admin@mail.com','admin','$2a$10$tGzXUQvhNcpXV8d3hgDeRusPZxnNZ5HVOOm5bfHzbj7oTx64cqR06','363d570b-277c-41a2-9e49-d6773b68f992',3,'admin_school','admin'),(2,'2020-05-28 05:49:04','2020-05-28 05:49:04','1899-12-31 10:00:00','teacher@mail.com','teacher','$2a$10$.TKI4XG6I.dbQxLNCPpMB.FY.nx5rNjtey1PZ9QtdShkQ3l2S02dC','4fa1ee52-c916-48cb-9556-d65dd9e19a62',2,'teacher_school','teacher'),(3,'2020-05-28 05:49:04','2020-05-28 05:49:04','1899-12-31 10:00:00','student@mail.com','student','$2a$10$WLou3M2e8P5oQMHyEkutkuPiJnmCYfhqzbK/B71gdkN8LWUrFUBjG','71d688d4-75f9-45b1-ac69-2b796dc1168e',1,'student_school','student'),(4,'2020-05-28 05:49:04','2020-05-28 05:49:04','1899-12-31 10:00:00','lock@mail.com','locked','$2a$10$yjXQc971YVqwUQ3zv8xK1.TdnUlHF1nLrgHUcynaHZO.pK0UCCpYu','1f101ffd-88f2-4d89-84bc-24dc1faa53e9',0,'lock_school','lock'),(5,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','懿轩.廖@gmail.com','秦晋鹏','$2a$10$eVpsl.7SbCZDTugu9hjHlOhSke/eyvFyxbg20TvIuh0ivrmGT4KaC','0c30889e-e345-406a-9ded-ce7eaee44e27',1,'school','程, 姚 and 戴'),(6,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','正豪.丁@yahoo.com','万嘉懿','$2a$10$FushOV92MCy21A7ZKkMb8uuBsGxAz37LZdyLUE3mzfpMuOtNRfSlC','f435a704-5caf-438b-afe7-44feee968d71',1,'school','许-胡'),(7,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','子轩.孟@yahoo.com','谭昊然','$2a$10$4TdEtEpsZITKht.5OiQDYeL8oxMPaT7zN2S2nsslPn1jFA.fexzP6','cb7d8bc4-7d00-4ca7-8e25-be2deb7893bb',1,'school','尹, 史 and 冯'),(8,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','伟祺.段@hotmail.com','方航','$2a$10$CL0NuO7eTWx9sIX9XO2VVOpv0r35qIkfCpdIH1t04fhUMIbQ/OMa6','9698ad96-bcef-4ced-8cf7-38b79e7ba9f5',1,'school','曹-何'),(9,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','钰轩.郝@yahoo.com','崔皓轩','$2a$10$6f9jknqNOGaxk1zyswWAKuiRixxBXFteKXYa./JIqCpotCDHvlVXO','f8d3b77e-7b90-4ee9-b8b8-7399dd9c1267',1,'school','洪-袁'),(10,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','驰.吴@hotmail.com','任智辉','$2a$10$orWA5OtTEZkK99u7Q1mpjujj3mi8yLjHoYYIF3qayG2Y.rjvnQHqK','a8670f5a-903b-4cd7-9acd-5822fd321e19',1,'school','陆-雷'),(11,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','博超.蒋@hotmail.com','刘思淼','$2a$10$tGfb3BE3OZfrjreE4./6HO4IH6hYuL.OMpsuYmOKo.KhyhFgoPRb2','92ea30c6-db75-489d-beb9-64039fe202c9',1,'school','崔 LLC'),(12,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','志泽.高@gmail.com','范烨磊','$2a$10$JuzqS0/tpARLHBv4fh2J..DWm81J67TiJ03yvW0CmMGbLOiJckBea','12e9c4cc-fdd2-4cdf-b6bc-b8872b74aba5',1,'school','田, 雷 and 丁'),(13,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','哲瀚.魏@gmail.com','吴志泽','$2a$10$m2ChE2M50PRcnccR3HUnk.anUWSrInjo84iPh6k44ypgnCGJ85N42','06defbf7-30ed-4814-8179-0e109c51ab43',1,'school','高-范'),(14,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','晓啸.孟@hotmail.com','汪鸿涛','$2a$10$vkzGIsK4HJbj9i6tufV5geet/BCuFx4yKvz2VrURSloKkoDj1CQmG','36bb3104-1358-4941-964d-0bae49b4005d',1,'school','邱 Group'),(15,'2020-05-28 05:48:55','2020-05-28 05:48:55','1899-12-31 10:00:00','子骞.丁@hotmail.com','钟俊驰','$2a$10$aGZNRLUY4/jtCzrcOP953eMAdTe4INXk6vkvrJhxzk5tyBiZXy71e','86c2b7d0-941c-4db2-9ee3-71f5fb3b07c0',1,'school','廖 Inc'),(16,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','泽洋.尹@hotmail.com','梁雨泽','$2a$10$5aY5gBWkvDM5MJ20VrTBH.5s0zC/isIXUaGP5FVB9uN/XG7b5fvz.','bcf2971e-3b1e-4c7a-9ad4-eae927b2f97d',1,'school','汪, 张 and 谢'),(17,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','鹭洋.武@gmail.com','黄风华','$2a$10$ozn9NGiG8rFUU8Olgx2RE.yT7EZw/LgSIHc0yL9MV8ly6e9Q43W8.','45bc423a-0e3e-4b19-87fe-9f983c8d3c20',1,'school','梁 LLC'),(18,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','鑫鹏.唐@gmail.com','石绍辉','$2a$10$zPA8qetCbVEQT4udvjSD3utAM9prAjnecB/R1MjKsmNXkcRRmibdC','5ac5ff2d-eead-4c57-8162-5af84dd19798',1,'school','金 LLC'),(19,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','明杰.万@gmail.com','魏文博','$2a$10$/PCTPNaPLTBVtVpP7YRVKugu2qwbkEEq.jVSP9P5lkiM1UOKQg5Fi','a44f4340-b34a-475e-8b6a-acb961528156',1,'school','周 Group'),(20,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','炫明.梁@hotmail.com','冯荣轩','$2a$10$qZIOSrj.OaBETyIH4lhv0OB0Gq6A2yGmq96M1lTHzKWCYQwY.9lQ2','54898b25-e19e-4be6-840a-a2beefc996ca',1,'school','何-段'),(21,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','正豪.余@yahoo.com','袁琪','$2a$10$2AYEL1b9JXf/adP4v36s2.JmhOLq/ksJ6GBuha1ZX/o59LZ9smoSu','90d66164-bfc3-4aaf-95d1-3bc04b4a848a',1,'school','魏 and Sons'),(22,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','健雄.于@yahoo.com','罗鹏','$2a$10$5C9HCC5QrWQ7BnLj0XghpOY4xPJG8nXdsW/XQUn5PTuLrg5WMkVcu','e8015e67-82ab-4ccd-9ed9-2c023e3b3f5f',1,'school','杨, 丁 and 沈'),(23,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','雨泽.高@hotmail.com','彭泽洋','$2a$10$jl1Zco5f3T2NP6srPdnBxO0.rxpxZv.WOOIiTnaqVQPLNQ.7gWp5G','a01f8c96-e096-456d-be99-bafd0de5ae04',1,'school','钱 Group'),(24,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','博文.萧@hotmail.com','贾思','$2a$10$5enIUKcsk/Vn4lw/8nJdKeSkdns7McV528CFIgXB9BvFKBGqJzIh.','bcc1bd28-0109-4a31-9439-43df6c332c9f',1,'school','段, 孙 and 郝'),(25,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','明轩.唐@hotmail.com','于健雄','$2a$10$3YqYbCoc3bdYIPxJQS5d3OpZlijxUo6HGLnP9oWhMcn.2Kbec3J0a','0cdca414-8cb6-4f8b-b300-87a39e1e5553',1,'school','武 Group'),(26,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','涛.傅@hotmail.com','何金鑫','$2a$10$Tx7.4tIheyUYbKdIE4EbZeGfv9oYDPA2/Lv4Xry2vdO0wds24L5AC','71d4a0bc-2089-487d-9fd3-7ace8a8cc407',1,'school','汪, 卢 and 阎'),(27,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','智宸.丁@gmail.com','毛凯瑞','$2a$10$5pgw6I4AwmPa5cL0b/uf1e//t8TY6ItQQRJw/RmnzYjKFMoQ0EkKK','652600a2-6846-4da7-a137-705009cbbada',1,'school','龙-莫'),(28,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','煜城.宋@yahoo.com','范煜祺','$2a$10$hfHt6CXhSJK4Mgw.QGnxAeog/IYMnKk0IOaidaCoIdfYi/b/QUVOK','be32847a-23be-46e0-9eb1-aaed35c2c0e1',1,'school','曹, 孔 and 钱'),(29,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','鹏飞.何@hotmail.com','汪皓轩','$2a$10$k2GsjCS9jWv7W/luuC0XSe99LbkZn97v/0iM6f.lRV8l2eRXgzFzK','38a58253-e0f7-41e7-a026-8e43e795fb41',1,'school','夏 and Sons'),(30,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','展鹏.金@yahoo.com','范风华','$2a$10$tH1AMk7tczhQW/KuOOWadOJ2KXk2dAgbHtDQYnaGr35040fSkB8UO','4824f9ff-3e7e-494e-ad94-f2157250bd9d',1,'school','贾, 龚 and 廖'),(31,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','炎彬.洪@yahoo.com','谭志泽','$2a$10$d9D2C/JWuZZg5xf.QRsDrOnDZe01.xn4.sMeXVcElaVsEXXgCPZ1e','deb9f19e-002c-4839-9b19-3b5abf3d402a',1,'school','林-潘'),(32,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','凯瑞.戴@yahoo.com','方立诚','$2a$10$6/.LtHV10bukaxa7DNjC1Ohf4CK6b6W3CdeJAY3b2ma23GAst.356','b29b59ec-cd60-4834-ac9f-e0d5ddecb767',1,'school','刘, 钱 and 曹'),(33,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','锦程.陈@hotmail.com','郝昊天','$2a$10$SPwKKCmD6OZCtBry2HBreeUCP5U2QcybS3YI1HzaU2crYjwv7s2la','60c1fa7c-e2eb-4e6c-b030-20a152034a7e',1,'school','萧-范'),(34,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','鹏涛.孙@hotmail.com','刘雨泽','$2a$10$2zTco51pPO7X7dEgEwKU1.NfXTW8bNJ6tngSS6OJZWuuPE2QP8hkm','a91496bb-f92d-45f5-b702-1c58b2b21d9e',1,'school','尹, 王 and 彭'),(35,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','哲瀚.陆@gmail.com','蔡文昊','$2a$10$1fznLwpWQKqyFJeyuokOA.jDKc0MvmcP.s8oRqy3VZYWtncl5pIiO','ab02b706-afdc-468f-bccf-607bff7eb2f8',1,'school','许-崔'),(36,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','瑾瑜.武@yahoo.com','武炎彬','$2a$10$Xx6KGIKptOGQdltZcXtyXOSWyRwTFqZrVa8UNK9OudYiPL/CoSUvG','240c1d6a-e707-4c8d-b35f-2e07be347dea',1,'school','程, 徐 and 秦'),(37,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','鹤轩.覃@yahoo.com','杜天翊','$2a$10$3.1E3PTuKIfJk9s2k7lqTut.IiHAquPJTMvXTN1asUFbHeeHxCWzm','c1acab91-2674-413e-87db-f9fa8d688b2f',1,'school','杨 LLC'),(38,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','雨泽.龚@yahoo.com','薛子默','$2a$10$SikNZ5wRlFRd3hLsgzfGQOLIJ/VEXkLlap2pqgFmybrTKmbthQ8Gu','c64633c1-3e44-4a5e-86fa-4b8443bf34d6',1,'school','阎 Inc'),(39,'2020-05-28 05:48:56','2020-05-28 05:48:56','1899-12-31 10:00:00','烨华.韩@yahoo.com','董烨磊','$2a$10$0Ws7jdejMeRMFTWa2TdUN.RtichwNtL/fF.jieZQQ2gLU0l2bM.Uq','23c58a72-8af1-4bcd-b788-60fe84c4f763',1,'school','李 and Sons'),(40,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','文.郝@gmail.com','蔡昊然','$2a$10$0PUVdxYBbRX6M3L8/QMC0.FXnDqt.GdCFKzTF0//Ojn3bHVTeLRTW','51235cf0-b67c-4078-8e71-751426cba4c1',1,'school','戴 LLC'),(41,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','博涛.罗@gmail.com','雷钰轩','$2a$10$ZLZAalJxVFAfuSKpEQvN0ugWDhQXPiSbta/i1Uo96K/2wnj1M/k/e','6b4aba2f-f3a4-48ae-a926-ce7b9ccfef45',1,'school','龚-郝'),(42,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','弘文.黄@gmail.com','何弘文','$2a$10$eQDWhsFlkro5mHZeT9AwOOAqJrbXmU3QqCwiM2N050VmbAydeQ52O','4c0cd509-a91f-4143-b60b-89b272613f7f',1,'school','唐, 阎 and 潘'),(43,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','金鑫.孙@hotmail.com','叶修洁','$2a$10$fJADLeVQPBQiAUe827x.AupkJyXpNMSdr6JEuuWMdeMpSEvJFe/lO','782343cc-e6ff-4db7-bb7a-55424612f26a',1,'school','方-李'),(44,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','瑾瑜.蒋@gmail.com','白文博','$2a$10$LO3L3QiDoZYlGRt5Od5TQOy2VlXrZbXBUTsaZsInf1Temd55v63pi','9bda367c-b987-45e2-b029-7d5e267c3eef',1,'school','陶, 田 and 高'),(45,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','子轩.程@gmail.com','孔语堂','$2a$10$T90GBVnSscVzkFnltfKe3u/7pA2WBm3KqNnPTu/pne0BKzvGaqx9q','ba96bf2a-e3c1-4091-ae92-be366762c870',1,'school','严, 王 and 胡'),(46,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','晓啸.于@hotmail.com','崔振家','$2a$10$G4uAjSeE4ZYMLEy6dRLi0OJEftpcQHfQVt.ji0N0oZiZdh1V8EPk.','fb94ab70-1f14-4952-8de4-9efa7eccb9e8',1,'school','余 LLC'),(47,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','伟泽.蔡@gmail.com','贺浩轩','$2a$10$IbrsYh.j3ohkQ6JKuAEO2.1L4S0HXO1NQdEKbFwn3JU7ZOLgpb7Au','f393ff2d-f6dd-4db1-bf85-3fa9ba82a2c8',1,'school','徐-吴'),(48,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','笑愚.吕@gmail.com','孟越彬','$2a$10$QEtknMTj.C/QHuUkivnAL.a9JyVe1ctq8MBBFlnXU9q/AVEaoD.Di','74864be9-a6d1-404c-a7c1-fea1d1168eb6',1,'school','郑-彭'),(49,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','峻熙.余@hotmail.com','薛展鹏','$2a$10$zO2kFmyXLBWY6rfJ3UrBVeFvHvHs0RaVaocSuKdlMARcXS4hVsqFW','534bebde-8926-42ec-bc03-20f9223fd6b0',1,'school','方 Inc'),(50,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','展鹏.郝@hotmail.com','萧振家','$2a$10$Tan93Vhw9WEaytWvlbrxy.DE4/ZawM2R.N/ItADjUyJx9oV5MYOOm','4207d116-7cc2-478d-bcb2-fd3658cb9c80',1,'school','洪-钱'),(51,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','瑞霖.胡@gmail.com','黄弘文','$2a$10$.2W5niUoGpeHVnUOOZY/ROWIlAiC9f/CueeDOjMTiiiXaCbNtOQP6','ac7993b0-81d1-4c21-ac4f-2bfb1f4f3fbf',1,'school','龙-戴'),(52,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','擎宇.田@gmail.com','邵鹭洋','$2a$10$E0oHZ3bwEURViZdKmOqz4ed/z7DqH3qnTD1MIDxj66QEVJ.oVyKca','1338f40c-ad95-4b27-96b6-5228bb6880a4',1,'school','武, 王 and 高'),(53,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','晋鹏.郝@yahoo.com','谭浩然','$2a$10$8CrvUVvpyEMBOX.3GH/t6.Xcfno6XiJbXvhMVrwfhLoDFt/5v5zL.','ed9587f0-5bc8-4ab4-a5c0-ff17b0d19911',1,'school','孟, 龚 and 阎'),(54,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','胤祥.薛@hotmail.com','严晓啸','$2a$10$QjiUfhOf1yUb5Kz4Mcz6YO6jVP2iJLy2glwKEiX2uksMVtK.UYs4O','aa5bca9a-995c-4bbb-b86f-006e2c734cb8',1,'school','贺 and Sons'),(55,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','锦程.郝@yahoo.com','姚梓晨','$2a$10$VGZNdpL7CYqjdjsTVdd1P.YrajyEdooG/rtxsCPY8n1QiC1sSvguu','0f7c3179-8595-45b1-b86f-ca721fbabfab',1,'school','谢-余'),(56,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','明辉.石@gmail.com','苏驰','$2a$10$e3PvYKPI78M1A2jHNCnoXO2s0DLE4Flg.eBuEi8CHtf2okPqiInNG','c552c731-4de7-4a90-b3d9-a017b0140429',1,'school','林-龚'),(57,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','振家.程@gmail.com','萧鑫鹏','$2a$10$e60XGXtvG3peEOL0RUh0we/y7v4RQQYIv0W96JMMdbzoihnn4sQDO','6dabc690-74c9-4fd3-af55-f1789eba0685',1,'school','朱 LLC'),(58,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','昊然.阎@hotmail.com','袁煜城','$2a$10$7cFMi2kxuDygT2xGvtmyWe6kZacHfTIskLILBKm.u1qCSVVvZQ6u6','6444598a-0851-4172-a2fa-e9feb8de32c6',1,'school','黄, 唐 and 邓'),(59,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','炫明.汪@hotmail.com','萧皓轩','$2a$10$1twInpzryFrwI6UpqX.TE.N9tOg6GO.0EusdURqfmBM2mJwTOzgSS','ddec524a-faf6-4eb5-9db6-d54cdb51a229',1,'school','莫, 邵 and 韩'),(60,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','黎昕.郝@gmail.com','邵晟睿','$2a$10$K25/GbVH7ZkOPkAo3G/SxuDdMmwXkngLlK/lFEUp/K746DoISEqMm','3c83441f-cf47-4871-8ca8-32837f6a9e60',1,'school','徐, 陶 and 吕'),(61,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','伟宸.熊@yahoo.com','江修杰','$2a$10$QO9im8vehp0qirK7P9z8LOelW02XalZ.00UBV7zY13GO3wCQuZiwK','077ce4c2-3913-418f-8401-60e7908f3beb',1,'school','钱, 韦 and 侯'),(62,'2020-05-28 05:48:57','2020-05-28 05:48:57','1899-12-31 10:00:00','昊强.程@gmail.com','万晓啸','$2a$10$aiMdaJDkpeliN6xm.nHHxu5nGVL6FBb2kiIokrXjVFUVgbs5D4rvq','c4185874-b005-47d5-ad15-da36d6e328bb',1,'school','武, 于 and 毛'),(63,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','嘉熙.魏@hotmail.com','李哲瀚','$2a$10$InvGOEsaze.lZSWxVDUoV.KbT7wtSgX6qL.ZYm7NPRRnosOohxtu2','c5d7525a-6ee8-4c85-8f80-09e45eebd83a',1,'school','贺 Group'),(64,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','弘文.史@yahoo.com','邓绍辉','$2a$10$pQIPC7RnxCRdXDlbVbXP7OaDkQ55Wdmb5ooSdYNzrkyO.8qZSmPRK','3c46ebcc-938c-448a-829c-d788c15648d6',1,'school','贾, 赖 and 蔡'),(65,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','炫明.陶@yahoo.com','许瑞霖','$2a$10$IbEa.2xk5AdITwW5txR8o.zpObKxAJMBmez91jW2Ah33cm4xObSNm','0ef94cc9-fafa-4219-8d00-34e3d33221e8',1,'school','许-陈'),(66,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','修杰.孔@gmail.com','江聪健','$2a$10$yQGLavgVogBljZ8lHcqBeeHMLUqwpMXLyHI.YQDsY/jFa92wVu9JK','acf45459-095c-43ab-b445-f09fd034e3ab',1,'school','黄, 钟 and 姜'),(67,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','鹤轩.冯@gmail.com','郭健雄','$2a$10$9gFIVvyAC370xsXMnvtn4.ZMXTLLbUr.GnCAbCoQ31chpItURXfXe','d276a808-bbeb-44b2-9ca4-e4a2c38cec6b',1,'school','郝-徐'),(68,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','鹏涛.雷@hotmail.com','彭胤祥','$2a$10$KpInz4VuzobcnG6XiiHjw.Tw/7AgVCUiGnfZ3T0lMkwCA1Owega56','0daa0d11-8d57-4078-b314-735910b0a291',1,'school','秦, 蔡 and 潘'),(69,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','涛.万@gmail.com','孔思','$2a$10$lfSpNX41k8fHgzlQSrQ2fu9OdQs7oQ4ex2cjyQMPSp2CcUjOupfkW','54734629-b5c0-4b69-bef3-0b989e5495ad',1,'school','唐-谭'),(70,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','立辉.万@hotmail.com','宋烨磊','$2a$10$/jtUVNCemzk.Iafm.fqJ3OgwYZye1o35Ue4zxAQp.2bg3JF9oduyu','08f98c1e-4cbc-4be0-bb71-926cc12ad11f',1,'school','赖-孔'),(71,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','天宇.武@gmail.com','梁振家','$2a$10$5cs1Aomgo9CtrZu.nJGjruWqUT.HWijK/0y8/4iM90JcEQruxrmXW','23af7488-699e-4a99-8f70-9c5979d4a759',1,'school','苏 LLC'),(72,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','浩.于@hotmail.com','于鸿煊','$2a$10$047Y/INffHnrLQpDc29wTe922afQFg98H/9bax.LEUempl9ndGdEW','a16cc6ee-f5e8-4d72-ac48-50cb6c282303',1,'school','邓, 蒋 and 叶'),(73,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','子轩.沈@yahoo.com','史博涛','$2a$10$1sDvjlZNTJ1aXxwSPzx/FuAy01BtwQ.ErRsNYNfot2osNcNncSAHG','7d36c02a-7591-4dc8-9dcd-e2caac8852e9',1,'school','沈 and Sons'),(74,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','语堂.谭@hotmail.com','姚嘉熙','$2a$10$JWwKzl7.6mO8asUGLiqW1ea3bu9vqzsmhmgjlhezenNcotC9PUyJK','285bea00-e522-45a4-aee0-1385ae1b0505',1,'school','金-许'),(75,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','晓啸.宋@hotmail.com','萧潇然','$2a$10$p9Z7Ke8yjsimGhVAQHh0ve7RpcJWf1JtBJj06QwMjshhEdoaIlL56','ae1dd5a5-9065-438d-baf5-7d61878ef398',1,'school','贺, 覃 and 雷'),(76,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','立辉.莫@yahoo.com','洪煜祺','$2a$10$BGL0QxQr6NfZG6szekBqVOEUZv4xNOK1pn8a3bhvOZSF1Js.kHEci','b06ecf74-3b87-4379-aad8-dc930e869bfc',1,'school','严, 谢 and 许'),(77,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','荣轩.廖@hotmail.com','张熠彤','$2a$10$5v7lru4RYK..G0bhqmN6S.cCf6y5cKUg11Yckp.buSJptK.n8DKv2','008eaa61-f0f5-481f-b67b-13ee5d3609a3',1,'school','何 Group'),(78,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','越彬.张@yahoo.com','邱烨磊','$2a$10$uJuyhZjAqOBHIu7BRHfRROihnS/Y4pshLdEQY/KJV1YPydQBN2myO','efabfc24-969d-4ac8-8e0b-105fb0aa21bc',1,'school','姚-谭'),(79,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','熠彤.赖@yahoo.com','夏君浩','$2a$10$d1UAc6pvpZnsauplYeSZCuip9HxHX3zzujMEzB56iY42hcEoBLLGO','02a2482c-66a4-4ff5-a094-5ea8c96e8d00',1,'school','黎, 任 and 郝'),(80,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','子涵.廖@yahoo.com','谢烨霖','$2a$10$VvaeNj5CTbtle31gOCo2mOF3DUJ.3nJOWKYxVvrv/lFC6sgm3iXPe','48d38298-ec90-489c-978e-d24800900073',1,'school','江 LLC'),(81,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','建辉.崔@hotmail.com','金鹏','$2a$10$3d9Q8pPBslr2EbrTR1XHA.KYxvSLlfdiicYUFrEio5iusQYiEQWMS','a7bbb099-58ff-4696-aa96-1252307e408c',1,'school','陈 Group'),(82,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','致远.杜@gmail.com','武子轩','$2a$10$Z00ZhYyiAUI9YUhsv3aOw.CmcZWr5Til7MtB9gqO6ocrujcWSvMy6','7cb64b97-88fb-431f-a8c7-b0ee254be12b',1,'school','谢, 邹 and 姜'),(83,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','博涛.赵@gmail.com','邓浩轩','$2a$10$IFT2ebTSTV2QzxsrFwbnVOi6cF85LAV70erJGRndnv1PyTSSdvGs.','18fabcdc-9ffb-44a0-94ec-9e5dcf76cfb6',1,'school','宋 Inc'),(84,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','炎彬.覃@yahoo.com','任语堂','$2a$10$5T.SgKKjmzZR0R4xcmpc4eK5Ai4NkMA8wfIb8AzlwVgKxfmP04HyK','ab3e7467-689b-43ae-817c-0d5d00a536a2',1,'school','范 Group'),(85,'2020-05-28 05:48:58','2020-05-28 05:48:58','1899-12-31 10:00:00','烨磊.徐@gmail.com','贺思淼','$2a$10$93hU8b1o9pdL6HPpeG9So.QsMYER5Faj38e5U0kY5S3ByQuUGmDwu','40074f75-c8e4-468e-9d18-be4e3550a2a5',1,'school','田 Inc'),(86,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','俊驰.黄@yahoo.com','白致远','$2a$10$rniLX.cCbGcirfZmyfDa.eX/t3VRNShNmQtWfpWU9wk9AhHjNZ.se','8fa053c1-8a65-490b-9c2c-709bc4d48816',1,'school','田, 毛 and 吴'),(87,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','立果.罗@gmail.com','郭明杰','$2a$10$03j.FkOlxvuDaVROPbG/4O0Lso0a5LbtB4B8csYWkadLKvwkx/slS','113ab96e-15ec-4c60-a03b-05aa7fae4e50',1,'school','唐-曾'),(88,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','志泽.林@yahoo.com','许烨霖','$2a$10$0NrjD4Ck3kUb8u95anofK.YQLmVT4963KM.BMsGe8bu/TqADIBlWK','5e355d1d-0aa8-49d8-beec-54ab4a6a9ae7',1,'school','莫, 胡 and 梁'),(89,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','瑾瑜.傅@gmail.com','钟擎苍','$2a$10$6fr0m3f.94h9EqlvpSKKTe38LBc88uNIeiAzR3R5QjiWLg1McxMl6','c0185b08-5904-44fa-8346-8d869098487f',1,'school','侯 Group'),(90,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','峻熙.于@hotmail.com','胡伟诚','$2a$10$Jh3yYunO.hC9UNY/Q1jXh.PvUWkQ3koMSpfYBB9Q1bZ6JgQrLFIJK','7bed81ce-4581-4afc-80a7-4f9c45618b88',1,'school','罗-曾'),(91,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','绍齐.阎@hotmail.com','赖浩宇','$2a$10$DNrJKE98mf88SXPY3HeCcu4UFu84m3cArS82bsqAI.AU1RYTAjvNS','6d7ba37f-d93a-4713-afcc-5cc63e548a64',1,'school','崔, 朱 and 何'),(92,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','弘文.冯@yahoo.com','郑绍辉','$2a$10$2eymKVjLqbyaYwxmkOqs2.h2mUdcc879swGeCXbl65gk/Er.uwvii','4f2cae23-afdc-4b11-a332-2ea060faa34d',1,'school','陆-段'),(93,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','航.林@gmail.com','叶熠彤','$2a$10$4fl3MS3pEVAwMsrwkhkQveLIaRPrWdLf0h012ZsKSGescaVLqssSK','acafcd77-ac21-42c2-9353-29565cedca6b',1,'school','苏, 于 and 白'),(94,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','立果.梁@yahoo.com','程智宸','$2a$10$byRxNW5u0arju3dKA4dgr.edOKlh37W9cp1W1X0IBu6MRaibzKZgC','ff1efe75-9f8c-4ea9-bf5f-b76dea71545f',1,'school','于, 朱 and 汪'),(95,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','懿轩.覃@yahoo.com','秦浩然','$2a$10$SRnBV8hCcHI63K3xnDSsXunP6VOFiaVKkC51NafS0tEJiR6ijXTkW','ade7f8be-653c-41a7-9912-6afe5f1e5f45',1,'school','夏-金'),(96,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','思.廖@gmail.com','任鸿煊','$2a$10$KuFbw1HEwaCmsrhlvUQnVONEst9gDpKoO1OPZcOyDEBAssuV27zR2','97656153-7cf4-4d5a-800d-e3a23a4da12c',1,'school','卢, 曾 and 曾'),(97,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','晋鹏.朱@gmail.com','许子骞','$2a$10$Lp9ybj2kgQ66YFJCABl7zeTVcKfIih0EJmyr2e2fG3kQxEI8aiy86','d8720293-08f7-42de-9789-5d4af851ba98',1,'school','方, 任 and 李'),(98,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','越彬.萧@hotmail.com','陶潇然','$2a$10$FjihrVuPr5/SQf/8yWFAEOTRDXDkS9T1WU6crgQMzktzFP2hpjsVe','ed97b983-0498-4088-b59e-acfed1683dcf',1,'school','程-董'),(99,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','涛.蔡@hotmail.com','林笑愚','$2a$10$a4Zb/oFNlQJ3iNLQ3xrHf.klr6f7gLR2XlSiXCY6JiQZRVlORrQI2','00ef2e37-8ed6-4f7c-ab8f-02e1a121a158',1,'school','曹 and Sons'),(100,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','文轩.孙@gmail.com','赖伟泽','$2a$10$2jZ5RbW/y1DSMgpWv4KFPOO2Zvpvue.hEK3vVTQVDEkMeiqaVOP5.','1fa740de-3ad3-4a7d-894d-3783a246b987',1,'school','任-谭'),(101,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','雨泽.吕@yahoo.com','陈越彬','$2a$10$PYGvBn7L4GYenftAOiscmeZGbTm.sHunDhf5rdTbW0jiWioSBLMpe','2466dec9-6e4a-458d-80e8-26dd127d868b',1,'school','卢-陶'),(102,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','伟泽.白@yahoo.com','史志强','$2a$10$m8al9jbfMk9n/nmSKmLwleiFHQwtCm5cT4kRKRBW8NCetGoIgwng2','3fde0a0f-d2ec-4db6-a8b3-59ada323edd7',1,'school','周 and Sons'),(103,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','靖琪.宋@hotmail.com','谭雪松','$2a$10$NhUfYC.umKX3CbgwuRyyuePBW7fQAhl5hgXNQiyWfxHIBOuzBjghy','4ed17d80-5e2b-40d6-ad38-f72465b81f21',1,'school','郝-黄'),(104,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','子默.曾@gmail.com','董博超','$2a$10$2lgaoRykOXsYloucnTYzSeqWdRPbUNDQ59XK8zJA0WaS4YkNAHg9q','b993ee22-4e2d-486f-81e1-479896312292',1,'school','严 and Sons'),(105,'2020-05-28 05:48:59','2020-05-28 05:48:59','1899-12-31 10:00:00','展鹏.万@yahoo.com','莫笑愚','$2a$10$CwUke8jkISfRzi34nBHu6eZP.NCHMISji6yO2g5nvMzRgjH8gdkri','046fbebe-a502-4b68-a6f3-56882e115956',1,'school','姚, 朱 and 杨');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_class`
--

DROP TABLE IF EXISTS `user_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `class_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_class_id_delete` (`class_id`,`user_id`,`delete_at`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_class`
--

LOCK TABLES `user_class` WRITE;
/*!40000 ALTER TABLE `user_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-28 18:53:38
