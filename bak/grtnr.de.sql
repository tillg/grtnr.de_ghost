-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: host.docker.internal    Database: grtnr-ghost
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` varchar(24) NOT NULL,
  `resource_id` varchar(24) DEFAULT NULL,
  `resource_type` varchar(50) NOT NULL,
  `actor_id` varchar(24) NOT NULL,
  `actor_type` varchar(50) NOT NULL,
  `event` varchar(50) NOT NULL,
  `context` text,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` varchar(24) NOT NULL,
  `type` varchar(50) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `role_id` varchar(24) DEFAULT NULL,
  `integration_id` varchar(24) DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `last_seen_version` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_secret_unique` (`secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES ('5ee36ad94fae3700011cafa6','admin','f05cef9b2bf87493b01577427e46b76e341a713e24bc00b298c29141b82e4129','5ee36ad74fae3700011caf4b','5ee36ad94fae3700011cafa5',NULL,NULL,'2020-06-12 11:45:29','1','2020-06-12 11:45:29','1'),('5ee36ad94fae3700011cafa8','admin','d86ac3d1849eacd075bd1e7b7508ba734fd316f39846a147999715d855d8b70a','5ee36ad74fae3700011caf4c','5ee36ad94fae3700011cafa7',NULL,NULL,'2020-06-12 11:45:29','1','2020-06-12 11:45:29','1'),('5ee36ad94fae3700011cafaa','admin','b52a02ecc934cc1a985f320892b4e8ad5eaa9e68f8b668ced2743e46096ad8e5','5ee36ad74fae3700011caf4d','5ee36ad94fae3700011cafa9',NULL,NULL,'2020-06-12 11:45:29','1','2020-06-12 11:45:29','1');
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fields`
--

DROP TABLE IF EXISTS `app_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fields` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(50) NOT NULL DEFAULT 'html',
  `app_id` varchar(24) NOT NULL,
  `relatable_id` varchar(24) NOT NULL,
  `relatable_type` varchar(50) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_fields_app_id_foreign` (`app_id`),
  CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fields`
--

LOCK TABLES `app_fields` WRITE;
/*!40000 ALTER TABLE `app_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `app_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_settings_key_unique` (`key`),
  KEY `app_settings_app_id_foreign` (`app_id`),
  CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apps` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `version` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apps_name_unique` (`name`),
  UNIQUE KEY `apps_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brute`
--

DROP TABLE IF EXISTS `brute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brute` (
  `key` varchar(191) NOT NULL,
  `firstRequest` bigint(20) NOT NULL,
  `lastRequest` bigint(20) NOT NULL,
  `lifetime` bigint(20) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brute`
--

LOCK TABLES `brute` WRITE;
/*!40000 ALTER TABLE `brute` DISABLE KEYS */;
/*!40000 ALTER TABLE `brute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `error` varchar(2000) DEFAULT NULL,
  `error_data` longtext,
  `meta` text,
  `stats` text,
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(300) DEFAULT NULL,
  `html` longtext,
  `plaintext` longtext,
  `submitted_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emails_post_id_unique` (`post_id`),
  KEY `emails_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrations`
--

DROP TABLE IF EXISTS `integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrations` (
  `id` varchar(24) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'custom',
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `icon_image` varchar(2000) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `integrations_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrations`
--

LOCK TABLES `integrations` WRITE;
/*!40000 ALTER TABLE `integrations` DISABLE KEYS */;
INSERT INTO `integrations` VALUES ('5ee36ad94fae3700011cafa5','builtin','Zapier','zapier',NULL,'Built-in Zapier integration','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1'),('5ee36ad94fae3700011cafa7','internal','Ghost Backup','ghost-backup',NULL,'Internal DB Backup integration','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1'),('5ee36ad94fae3700011cafa9','internal','Ghost Scheduler','ghost-scheduler',NULL,'Internal Scheduler integration','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1');
/*!40000 ALTER TABLE `integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invites` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `token` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `expires` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invites_token_unique` (`token`),
  UNIQUE KEY `invites_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labels_name_unique` (`name`),
  UNIQUE KEY `labels_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `geolocation` varchar(2000) DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`),
  UNIQUE KEY `members_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_labels`
--

DROP TABLE IF EXISTS `members_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_labels` (
  `id` varchar(24) NOT NULL,
  `member_id` varchar(24) NOT NULL,
  `label_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `members_labels_member_id_foreign` (`member_id`),
  KEY `members_labels_label_id_foreign` (`label_id`),
  CONSTRAINT `members_labels_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`),
  CONSTRAINT `members_labels_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_labels`
--

LOCK TABLES `members_labels` WRITE;
/*!40000 ALTER TABLE `members_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_stripe_customers`
--

DROP TABLE IF EXISTS `members_stripe_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_stripe_customers` (
  `id` varchar(24) NOT NULL,
  `member_id` varchar(24) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_stripe_customers`
--

LOCK TABLES `members_stripe_customers` WRITE;
/*!40000 ALTER TABLE `members_stripe_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_stripe_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_stripe_customers_subscriptions`
--

DROP TABLE IF EXISTS `members_stripe_customers_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_stripe_customers_subscriptions` (
  `id` varchar(24) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `subscription_id` varchar(255) NOT NULL,
  `plan_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `cancel_at_period_end` tinyint(1) NOT NULL DEFAULT '0',
  `current_period_end` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `default_payment_card_last4` varchar(4) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  `plan_nickname` varchar(50) NOT NULL,
  `plan_interval` varchar(50) NOT NULL,
  `plan_amount` int(11) NOT NULL,
  `plan_currency` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_stripe_customers_subscriptions`
--

LOCK TABLES `members_stripe_customers_subscriptions` WRITE;
/*!40000 ALTER TABLE `members_stripe_customers_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_stripe_customers_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `version` varchar(70) NOT NULL,
  `currentVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_name_version_unique` (`name`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'1-create-tables.js','init','3.8'),(2,'2-create-fixtures.js','init','3.8'),(3,'1-post-excerpt.js','1.3','3.8'),(4,'1-codeinjection-post.js','1.4','3.8'),(5,'1-og-twitter-post.js','1.5','3.8'),(6,'1-add-backup-client.js','1.7','3.8'),(7,'1-add-permissions-redirect.js','1.9','3.8'),(8,'1-custom-template-post.js','1.13','3.8'),(9,'2-theme-permissions.js','1.13','3.8'),(10,'1-add-webhooks-table.js','1.18','3.8'),(11,'1-webhook-permissions.js','1.19','3.8'),(12,'1-remove-settings-keys.js','1.20','3.8'),(13,'1-add-contributor-role.js','1.21','3.8'),(14,'1-multiple-authors-DDL.js','1.22','3.8'),(15,'1-multiple-authors-DML.js','1.22','3.8'),(16,'1-update-koenig-beta-html.js','1.25','3.8'),(17,'2-demo-post.js','1.25','3.8'),(18,'1-rename-amp-column.js','2.0','3.8'),(19,'2-update-posts.js','2.0','3.8'),(20,'3-remove-koenig-labs.js','2.0','3.8'),(21,'4-permalink-setting.js','2.0','3.8'),(22,'5-remove-demo-post.js','2.0','3.8'),(23,'6-replace-fixture-posts.js','2.0','3.8'),(24,'1-add-sessions-table.js','2.2','3.8'),(25,'2-add-integrations-and-api-key-tables.js','2.2','3.8'),(26,'3-insert-admin-integration-role.js','2.2','3.8'),(27,'4-insert-integration-and-api-key-permissions.js','2.2','3.8'),(28,'5-add-mobiledoc-revisions-table.js','2.2','3.8'),(29,'1-add-webhook-columns.js','2.3','3.8'),(30,'2-add-webhook-edit-permission.js','2.3','3.8'),(31,'1-add-webhook-permission-roles.js','2.6','3.8'),(32,'1-add-members-table.js','2.8','3.8'),(33,'1-remove-empty-strings.js','2.13','3.8'),(34,'1-add-actions-table.js','2.14','3.8'),(35,'2-add-actions-permissions.js','2.14','3.8'),(36,'1-add-type-column-to-integrations.js','2.15','3.8'),(37,'2-insert-zapier-integration.js','2.15','3.8'),(38,'1-add-members-perrmissions.js','2.16','3.8'),(39,'1-normalize-settings.js','2.17','3.8'),(40,'2-posts-add-canonical-url.js','2.17','3.8'),(41,'1-restore-settings-from-backup.js','2.18','3.8'),(42,'1-update-editor-permissions.js','2.21','3.8'),(43,'1-add-member-permissions-to-roles.js','2.22','3.8'),(44,'1-insert-ghost-db-backup-role.js','2.27','3.8'),(45,'2-insert-db-backup-integration.js','2.27','3.8'),(46,'3-add-subdirectory-to-relative-canonical-urls.js','2.27','3.8'),(47,'1-add-db-backup-content-permission.js','2.28','3.8'),(48,'2-add-db-backup-content-permission-to-roles.js','2.28','3.8'),(49,'3-insert-ghost-scheduler-role.js','2.28','3.8'),(50,'4-insert-scheduler-integration.js','2.28','3.8'),(51,'5-add-scheduler-permission-to-roles.js','2.28','3.8'),(52,'6-add-type-column.js','2.28','3.8'),(53,'7-populate-type-column.js','2.28','3.8'),(54,'8-remove-page-column.js','2.28','3.8'),(55,'1-add-post-page-column.js','2.29','3.8'),(56,'2-populate-post-page-column.js','2.29','3.8'),(57,'3-remove-page-type-column.js','2.29','3.8'),(58,'1-remove-name-and-password-from-members-table.js','2.31','3.8'),(59,'01-add-members-stripe-customers-table.js','2.32','3.8'),(60,'02-add-name-to-members-table.js','2.32','3.8'),(61,'01-correct-members-stripe-customers-table.js','2.33','3.8'),(62,'01-add-stripe-customers-subscriptions-table.js','2.34','3.8'),(63,'02-add-email-to-members-stripe-customers-table.js','2.34','3.8'),(64,'03-add-name-to-members-stripe-customers-table.js','2.34','3.8'),(65,'01-add-note-to-members-table.js','2.35','3.8'),(66,'01-add-self-signup-and-from address-to-members-settings.js','2.37','3.8'),(67,'01-remove-user-ghost-auth-columns.js','3.0','3.8'),(68,'02-drop-token-auth-tables.js','3.0','3.8'),(69,'03-drop-client-auth-tables.js','3.0','3.8'),(70,'04-add-posts-meta-table.js','3.0','3.8'),(71,'05-populate-posts-meta-table.js','3.0','3.8'),(72,'06-remove-posts-meta-columns.js','3.0','3.8'),(73,'07-add-posts-type-column.js','3.0','3.8'),(74,'08-populate-posts-type-column.js','3.0','3.8'),(75,'09-remove-posts-page-column.js','3.0','3.8'),(76,'10-remove-empty-strings.js','3.0','3.8'),(77,'11-update-posts-html.js','3.0','3.8'),(78,'12-populate-members-table-from-subscribers.js','3.0','3.8'),(79,'13-drop-subscribers-table.js','3.0','3.8'),(80,'14-remove-subscribers-flag.js','3.0','3.8'),(81,'01-add-send-email-when-published-to-posts.js','3.1','3.8'),(82,'02-add-email-subject-to-posts-meta.js','3.1','3.8'),(83,'03-add-email-preview-permissions.js','3.1','3.8'),(84,'04-add-subscribed-flag-to-members.js','3.1','3.8'),(85,'05-add-emails-table.js','3.1','3.8'),(86,'06-add-email-permissions.js','3.1','3.8'),(87,'07-add-uuid-field-to-members.js','3.1','3.8'),(88,'08-add-uuid-values-to-members.js','3.1','3.8'),(89,'09-add-further-email-permissions.js','3.1','3.8'),(90,'10-add-email-error-data-column.js','3.1','3.8'),(91,'01-add-cancel-at-period-end-to-subscriptions.js','3.2','3.8'),(92,'1-add-labels-table.js','3.6','3.8'),(93,'2-add-members-labels-table.js','3.6','3.8'),(94,'3-add-labels-permissions.js','3.6','3.8'),(95,'01-fix-incorrect-member-labels-foreign-keys.js','3.7','3.8'),(96,'01-add-geolocation-to-members.js','3.8','3.8');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations_lock`
--

DROP TABLE IF EXISTS `migrations_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations_lock` (
  `lock_key` varchar(191) NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `acquired_at` datetime DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  UNIQUE KEY `migrations_lock_lock_key_unique` (`lock_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations_lock`
--

LOCK TABLES `migrations_lock` WRITE;
/*!40000 ALTER TABLE `migrations_lock` DISABLE KEYS */;
INSERT INTO `migrations_lock` VALUES ('km01',0,'2020-06-12 11:45:22','2020-06-12 11:45:29');
/*!40000 ALTER TABLE `migrations_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobiledoc_revisions`
--

DROP TABLE IF EXISTS `mobiledoc_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobiledoc_revisions` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `mobiledoc` longtext,
  `created_at_ts` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobiledoc_revisions_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobiledoc_revisions`
--

LOCK TABLES `mobiledoc_revisions` WRITE;
/*!40000 ALTER TABLE `mobiledoc_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobiledoc_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `object_id` varchar(24) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('5ee36ad74fae3700011caf4e','Export database','db','exportContent',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf4f','Import database','db','importContent',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf50','Delete all content','db','deleteAllContent',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf51','Send mail','mail','send',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf52','Browse notifications','notification','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf53','Add notifications','notification','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf54','Delete notifications','notification','destroy',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf55','Browse posts','post','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf56','Read posts','post','read',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf57','Edit posts','post','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf58','Add posts','post','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf59','Delete posts','post','destroy',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf5a','Browse settings','setting','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf5b','Read settings','setting','read',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf5c','Edit settings','setting','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf5d','Generate slugs','slug','generate',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf5e','Browse tags','tag','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf5f','Read tags','tag','read',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf60','Edit tags','tag','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf61','Add tags','tag','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf62','Delete tags','tag','destroy',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf63','Browse themes','theme','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf64','Edit themes','theme','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf65','Activate themes','theme','activate',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf66','Upload themes','theme','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf67','Download themes','theme','read',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf68','Delete themes','theme','destroy',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf69','Browse users','user','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf6a','Read users','user','read',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf6b','Edit users','user','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf6c','Add users','user','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf6d','Delete users','user','destroy',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf6e','Assign a role','role','assign',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf6f','Browse roles','role','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf70','Browse invites','invite','browse',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf71','Read invites','invite','read',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf72','Edit invites','invite','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf73','Add invites','invite','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf74','Delete invites','invite','destroy',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf75','Download redirects','redirect','download',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf76','Upload redirects','redirect','upload',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf77','Add webhooks','webhook','add',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf78','Edit webhooks','webhook','edit',NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad84fae3700011caf79','Delete webhooks','webhook','destroy',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf7a','Browse integrations','integration','browse',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf7b','Read integrations','integration','read',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf7c','Edit integrations','integration','edit',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf7d','Add integrations','integration','add',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf7e','Delete integrations','integration','destroy',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf7f','Browse API keys','api_key','browse',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf80','Read API keys','api_key','read',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf81','Edit API keys','api_key','edit',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf82','Add API keys','api_key','add',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf83','Delete API keys','api_key','destroy',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf84','Browse Actions','action','browse',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf85','Browse Members','member','browse',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf86','Read Members','member','read',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf87','Edit Members','member','edit',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf88','Add Members','member','add',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf89','Delete Members','member','destroy',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf8a','Publish posts','post','publish',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf8b','Backup database','db','backupContent',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf8c','Email preview','email_preview','read',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf8d','Send test email','email_preview','sendTestEmail',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf8e','Browse emails','email','browse',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf8f','Read emails','email','read',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf90','Retry emails','email','retry',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf91','Browse labels','label','browse',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf92','Read labels','label','read',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf93','Edit labels','label','edit',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf94','Add labels','label','add',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5ee36ad84fae3700011caf95','Delete labels','label','destroy',NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_apps`
--

DROP TABLE IF EXISTS `permissions_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions_apps` (
  `id` varchar(24) NOT NULL,
  `app_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_apps`
--

LOCK TABLES `permissions_apps` WRITE;
/*!40000 ALTER TABLE `permissions_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions_roles` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES ('5ee36ad94fae3700011cafab','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf4e'),('5ee36ad94fae3700011cafac','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf4f'),('5ee36ad94fae3700011cafad','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf50'),('5ee36ad94fae3700011cafae','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf8b'),('5ee36ad94fae3700011cafaf','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf51'),('5ee36ad94fae3700011cafb0','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf52'),('5ee36ad94fae3700011cafb1','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf53'),('5ee36ad94fae3700011cafb2','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf54'),('5ee36ad94fae3700011cafb3','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf55'),('5ee36ad94fae3700011cafb4','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf56'),('5ee36ad94fae3700011cafb5','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf57'),('5ee36ad94fae3700011cafb6','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf58'),('5ee36ad94fae3700011cafb7','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf59'),('5ee36ad94fae3700011cafb8','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf8a'),('5ee36ad94fae3700011cafb9','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf5a'),('5ee36ad94fae3700011cafba','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf5b'),('5ee36ad94fae3700011cafbb','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf5c'),('5ee36ad94fae3700011cafbc','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf5d'),('5ee36ad94fae3700011cafbd','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf5e'),('5ee36ad94fae3700011cafbe','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf5f'),('5ee36ad94fae3700011cafbf','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf60'),('5ee36ad94fae3700011cafc0','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf61'),('5ee36ad94fae3700011cafc1','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf62'),('5ee36ad94fae3700011cafc2','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf63'),('5ee36ad94fae3700011cafc3','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf64'),('5ee36ad94fae3700011cafc4','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf65'),('5ee36ad94fae3700011cafc5','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf66'),('5ee36ad94fae3700011cafc6','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf67'),('5ee36ad94fae3700011cafc7','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf68'),('5ee36ad94fae3700011cafc8','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf69'),('5ee36ad94fae3700011cafc9','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf6a'),('5ee36ad94fae3700011cafca','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf6b'),('5ee36ad94fae3700011cafcb','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf6c'),('5ee36ad94fae3700011cafcc','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf6d'),('5ee36ad94fae3700011cafcd','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf6e'),('5ee36ad94fae3700011cafce','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf6f'),('5ee36ad94fae3700011cafcf','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf70'),('5ee36ad94fae3700011cafd0','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf71'),('5ee36ad94fae3700011cafd1','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf72'),('5ee36ad94fae3700011cafd2','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf73'),('5ee36ad94fae3700011cafd3','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf74'),('5ee36ad94fae3700011cafd4','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf75'),('5ee36ad94fae3700011cafd5','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf76'),('5ee36ad94fae3700011cafd6','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf77'),('5ee36ad94fae3700011cafd7','5ee36ad74fae3700011caf46','5ee36ad74fae3700011caf78'),('5ee36ad94fae3700011cafd8','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf79'),('5ee36ad94fae3700011cafd9','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf7a'),('5ee36ad94fae3700011cafda','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf7b'),('5ee36ad94fae3700011cafdb','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf7c'),('5ee36ad94fae3700011cafdc','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf7d'),('5ee36ad94fae3700011cafdd','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf7e'),('5ee36ad94fae3700011cafde','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf7f'),('5ee36ad94fae3700011cafdf','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf80'),('5ee36ad94fae3700011cafe0','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf81'),('5ee36ad94fae3700011cafe1','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf82'),('5ee36ad94fae3700011cafe2','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf83'),('5ee36ad94fae3700011cafe3','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf84'),('5ee36ad94fae3700011cafe4','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf85'),('5ee36ad94fae3700011cafe5','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf86'),('5ee36ad94fae3700011cafe6','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf87'),('5ee36ad94fae3700011cafe7','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf88'),('5ee36ad94fae3700011cafe8','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf89'),('5ee36ad94fae3700011cafe9','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf91'),('5ee36ad94fae3700011cafea','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf92'),('5ee36ad94fae3700011cafeb','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf93'),('5ee36ad94fae3700011cafec','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf94'),('5ee36ad94fae3700011cafed','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf95'),('5ee36ad94fae3700011cafee','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf8c'),('5ee36ad94fae3700011cafef','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf8d'),('5ee36ad94fae3700011caff0','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf8e'),('5ee36ad94fae3700011caff1','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf8f'),('5ee36ad94fae3700011caff2','5ee36ad74fae3700011caf46','5ee36ad84fae3700011caf90'),('5ee36ad94fae3700011caff3','5ee36ad74fae3700011caf4c','5ee36ad74fae3700011caf4e'),('5ee36ad94fae3700011caff4','5ee36ad74fae3700011caf4c','5ee36ad74fae3700011caf4f'),('5ee36ad94fae3700011caff5','5ee36ad74fae3700011caf4c','5ee36ad74fae3700011caf50'),('5ee36ad94fae3700011caff6','5ee36ad74fae3700011caf4c','5ee36ad84fae3700011caf8b'),('5ee36ad94fae3700011caff7','5ee36ad74fae3700011caf4d','5ee36ad84fae3700011caf8a'),('5ee36ad94fae3700011caff8','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf51'),('5ee36ad94fae3700011caff9','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf52'),('5ee36ad94fae3700011caffa','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf53'),('5ee36ad94fae3700011caffb','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf54'),('5ee36ad94fae3700011caffc','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf55'),('5ee36ad94fae3700011caffd','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf56'),('5ee36ad94fae3700011caffe','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf57'),('5ee36ad94fae3700011cafff','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf58'),('5ee36ad94fae3700011cb000','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf59'),('5ee36ad94fae3700011cb001','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf8a'),('5ee36ad94fae3700011cb002','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf5a'),('5ee36ad94fae3700011cb003','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf5b'),('5ee36ad94fae3700011cb004','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf5c'),('5ee36ad94fae3700011cb005','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf5d'),('5ee36ad94fae3700011cb006','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf5e'),('5ee36ad94fae3700011cb007','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf5f'),('5ee36ad94fae3700011cb008','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf60'),('5ee36ad94fae3700011cb009','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf61'),('5ee36ad94fae3700011cb00a','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf62'),('5ee36ad94fae3700011cb00b','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf63'),('5ee36ad94fae3700011cb00c','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf64'),('5ee36ad94fae3700011cb00d','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf65'),('5ee36ad94fae3700011cb00e','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf66'),('5ee36ad94fae3700011cb00f','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf67'),('5ee36ad94fae3700011cb010','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf68'),('5ee36ad94fae3700011cb011','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf69'),('5ee36ad94fae3700011cb012','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf6a'),('5ee36ad94fae3700011cb013','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf6b'),('5ee36ad94fae3700011cb014','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf6c'),('5ee36ad94fae3700011cb015','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf6d'),('5ee36ad94fae3700011cb016','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf6e'),('5ee36ad94fae3700011cb017','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf6f'),('5ee36ad94fae3700011cb018','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf70'),('5ee36ad94fae3700011cb019','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf71'),('5ee36ad94fae3700011cb01a','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf72'),('5ee36ad94fae3700011cb01b','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf73'),('5ee36ad94fae3700011cb01c','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf74'),('5ee36ad94fae3700011cb01d','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf75'),('5ee36ad94fae3700011cb01e','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf76'),('5ee36ad94fae3700011cb01f','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf77'),('5ee36ad94fae3700011cb020','5ee36ad74fae3700011caf4b','5ee36ad74fae3700011caf78'),('5ee36ad94fae3700011cb021','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf79'),('5ee36ad94fae3700011cb022','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf84'),('5ee36ad94fae3700011cb023','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf85'),('5ee36ad94fae3700011cb024','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf86'),('5ee36ad94fae3700011cb025','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf87'),('5ee36ad94fae3700011cb026','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf88'),('5ee36ad94fae3700011cb027','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf89'),('5ee36ad94fae3700011cb028','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf91'),('5ee36ad94fae3700011cb029','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf92'),('5ee36ad94fae3700011cb02a','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf93'),('5ee36ad94fae3700011cb02b','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf94'),('5ee36ad94fae3700011cb02c','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf95'),('5ee36ad94fae3700011cb02d','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf8c'),('5ee36ad94fae3700011cb02e','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf8d'),('5ee36ad94fae3700011cb02f','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf8e'),('5ee36ad94fae3700011cb030','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf8f'),('5ee36ad94fae3700011cb031','5ee36ad74fae3700011caf4b','5ee36ad84fae3700011caf90'),('5ee36ad94fae3700011cb032','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf52'),('5ee36ad94fae3700011cb033','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf53'),('5ee36ad94fae3700011cb034','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf54'),('5ee36ad94fae3700011cb035','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf55'),('5ee36ad94fae3700011cb036','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf56'),('5ee36ad94fae3700011cb037','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf57'),('5ee36ad94fae3700011cb038','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf58'),('5ee36ad94fae3700011cb039','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf59'),('5ee36ad94fae3700011cb03a','5ee36ad74fae3700011caf47','5ee36ad84fae3700011caf8a'),('5ee36ad94fae3700011cb03b','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf5a'),('5ee36ad94fae3700011cb03c','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf5b'),('5ee36ad94fae3700011cb03d','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf5d'),('5ee36ad94fae3700011cb03e','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf5e'),('5ee36ad94fae3700011cb03f','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf5f'),('5ee36ad94fae3700011cb040','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf60'),('5ee36ad94fae3700011cb041','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf61'),('5ee36ad94fae3700011cb042','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf62'),('5ee36ad94fae3700011cb043','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf69'),('5ee36ad94fae3700011cb044','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf6a'),('5ee36ad94fae3700011cb045','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf6b'),('5ee36ad94fae3700011cb046','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf6c'),('5ee36ad94fae3700011cb047','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf6d'),('5ee36ad94fae3700011cb048','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf6e'),('5ee36ad94fae3700011cb049','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf6f'),('5ee36ad94fae3700011cb04a','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf70'),('5ee36ad94fae3700011cb04b','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf71'),('5ee36ad94fae3700011cb04c','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf72'),('5ee36ad94fae3700011cb04d','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf73'),('5ee36ad94fae3700011cb04e','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf74'),('5ee36ad94fae3700011cb04f','5ee36ad74fae3700011caf47','5ee36ad74fae3700011caf63'),('5ee36ad94fae3700011cb050','5ee36ad74fae3700011caf47','5ee36ad84fae3700011caf8c'),('5ee36ad94fae3700011cb051','5ee36ad74fae3700011caf47','5ee36ad84fae3700011caf8d'),('5ee36ad94fae3700011cb052','5ee36ad74fae3700011caf47','5ee36ad84fae3700011caf8e'),('5ee36ad94fae3700011cb053','5ee36ad74fae3700011caf47','5ee36ad84fae3700011caf8f'),('5ee36ad94fae3700011cb054','5ee36ad74fae3700011caf47','5ee36ad84fae3700011caf90'),('5ee36ad94fae3700011cb055','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf55'),('5ee36ad94fae3700011cb056','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf56'),('5ee36ad94fae3700011cb057','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf58'),('5ee36ad94fae3700011cb058','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf5a'),('5ee36ad94fae3700011cb059','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf5b'),('5ee36ad94fae3700011cb05a','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf5d'),('5ee36ad94fae3700011cb05b','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf5e'),('5ee36ad94fae3700011cb05c','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf5f'),('5ee36ad94fae3700011cb05d','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf61'),('5ee36ad94fae3700011cb05e','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf69'),('5ee36ad94fae3700011cb05f','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf6a'),('5ee36ad94fae3700011cb060','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf6f'),('5ee36ad94fae3700011cb061','5ee36ad74fae3700011caf48','5ee36ad74fae3700011caf63'),('5ee36ad94fae3700011cb062','5ee36ad74fae3700011caf48','5ee36ad84fae3700011caf8c'),('5ee36ad94fae3700011cb063','5ee36ad74fae3700011caf48','5ee36ad84fae3700011caf8f'),('5ee36ad94fae3700011cb064','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf55'),('5ee36ad94fae3700011cb065','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf56'),('5ee36ad94fae3700011cb066','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf58'),('5ee36ad94fae3700011cb067','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf5a'),('5ee36ad94fae3700011cb068','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf5b'),('5ee36ad94fae3700011cb069','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf5d'),('5ee36ad94fae3700011cb06a','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf5e'),('5ee36ad94fae3700011cb06b','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf5f'),('5ee36ad94fae3700011cb06c','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf69'),('5ee36ad94fae3700011cb06d','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf6a'),('5ee36ad94fae3700011cb06e','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf6f'),('5ee36ad94fae3700011cb06f','5ee36ad74fae3700011caf49','5ee36ad74fae3700011caf63'),('5ee36ad94fae3700011cb070','5ee36ad74fae3700011caf49','5ee36ad84fae3700011caf8c'),('5ee36ad94fae3700011cb071','5ee36ad74fae3700011caf49','5ee36ad84fae3700011caf8f');
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions_users` (
  `id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `mobiledoc` longtext,
  `html` longtext,
  `comment_id` varchar(50) DEFAULT NULL,
  `plaintext` longtext,
  `feature_image` varchar(2000) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'post',
  `status` varchar(50) NOT NULL DEFAULT 'draft',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `send_email_when_published` tinyint(1) DEFAULT '0',
  `author_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` varchar(24) DEFAULT NULL,
  `custom_excerpt` varchar(2000) DEFAULT NULL,
  `codeinjection_head` text,
  `codeinjection_foot` text,
  `custom_template` varchar(100) DEFAULT NULL,
  `canonical_url` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('5ee36ad84fae3700011caf97','da5a4abe-f362-4bf0-b36e-1cc532f5a9cb','Creating a custom theme','themes','{\"version\":\"0.3.1\",\"atoms\":[[\"soft-return\",\"\",{}]],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v3.0.0/images/theme-marketplace.png\",\"caption\":\"Anyone can write a completely custom Ghost theme with some solid knowledge of HTML and CSS\",\"alt\":\"Ghost theme marketplace screenshot\"}]],\"markups\":[[\"a\",[\"href\",\"https://ghost.org/marketplace/\"]],[\"code\"],[\"a\",[\"href\",\"https://github.com/TryGhost/Casper\"]],[\"a\",[\"href\",\"https://ghost.org/docs/api/handlebars-themes/\"]],[\"a\",[\"href\",\"https://github.com/TryGhost/Starter/\"]],[\"strong\"],[\"a\",[\"href\",\"https://forum.ghost.org/c/themes\"]]],\"sections\":[[1,\"h2\",[[0,[],0,\"Ghost themes\"]]],[1,\"p\",[[0,[],0,\"Ghost comes with a default theme called Casper, which is designed to be a clean, readable publication layout and can be easily adapted for most purposes.\"]]],[1,\"p\",[[0,[],0,\"If you need something a little more customised, it\'s entirely possible to build on top of existing open source themes, or to build your own from scratch. Rather than giving you a few basic settings which act as a poor proxy for code, we just let you write code.\"]]],[1,\"h2\",[[0,[],0,\"Marketplace\"]]],[1,\"p\",[[0,[],0,\"There are a huge range of both free and premium pre-built themes which you can download from the \"],[0,[0],1,\"Ghost Theme Marketplace\"],[0,[],0,\":\"]]],[10,0],[1,\"h2\",[[0,[],0,\"Theme development\"]]],[1,\"p\",[[0,[],0,\"Ghost themes are written with a templating language called handlebars, which has a set of dynamic helpers to insert your data into template files. For example: \"],[0,[1],1,\"{{author.name}}\"],[0,[],0,\" outputs the name of the current author.\"]]],[1,\"p\",[[0,[],0,\"The best way to learn how to write your own Ghost theme is to have a look at \"],[0,[2],1,\"the source code for Casper\"],[0,[],0,\", which is heavily commented and should give you a sense of how everything fits together.\"],[1,[],0,0]]],[3,\"ul\",[[[0,[1],1,\"default.hbs\"],[0,[],0,\" is the main template file, all contexts will load inside this file unless specifically told to use a different template.\"]],[[0,[1],1,\"post.hbs\"],[0,[],0,\" is the file used in the context of viewing a post.\"]],[[0,[1],1,\"index.hbs\"],[0,[],0,\" is the file used in the context of viewing the home page.\"]],[[0,[],0,\"and so on\"]]]],[1,\"p\",[[0,[],0,\"We\'ve got \"],[0,[3],1,\"full and extensive theme documentation\"],[0,[],0,\" which outlines every template file, context and helper that you can use. You can also get started with our useful \"],[0,[4],1,\"starter theme\"],[0,[],0,\", which includes the most common foundations and components required to build your own theme.\"]]],[1,\"blockquote\",[[0,[],0,\"If you want to chat with other people making Ghost themes to get any advice or help, there\'s also a \"],[0,[5],1,\"themes\"],[0,[],0,\" section on our \"],[0,[6],1,\"public Ghost forum\"],[0,[],0,\".\"]]]]}','<h2 id=\"ghost-themes\">Ghost themes</h2><p>Ghost comes with a default theme called Casper, which is designed to be a clean, readable publication layout and can be easily adapted for most purposes.</p><p>If you need something a little more customised, it\'s entirely possible to build on top of existing open source themes, or to build your own from scratch. Rather than giving you a few basic settings which act as a poor proxy for code, we just let you write code.</p><h2 id=\"marketplace\">Marketplace</h2><p>There are a huge range of both free and premium pre-built themes which you can download from the <a href=\"https://ghost.org/marketplace/\">Ghost Theme Marketplace</a>:</p><figure class=\"kg-card kg-image-card kg-card-hascaption\"><img src=\"https://static.ghost.org/v3.0.0/images/theme-marketplace.png\" class=\"kg-image\" alt=\"Ghost theme marketplace screenshot\"><figcaption>Anyone can write a completely custom Ghost theme with some solid knowledge of HTML and CSS</figcaption></figure><h2 id=\"theme-development\">Theme development</h2><p>Ghost themes are written with a templating language called handlebars, which has a set of dynamic helpers to insert your data into template files. For example: <code>{{author.name}}</code> outputs the name of the current author.</p><p>The best way to learn how to write your own Ghost theme is to have a look at <a href=\"https://github.com/TryGhost/Casper\">the source code for Casper</a>, which is heavily commented and should give you a sense of how everything fits together.<br></p><ul><li><code>default.hbs</code> is the main template file, all contexts will load inside this file unless specifically told to use a different template.</li><li><code>post.hbs</code> is the file used in the context of viewing a post.</li><li><code>index.hbs</code> is the file used in the context of viewing the home page.</li><li>and so on</li></ul><p>We\'ve got <a href=\"https://ghost.org/docs/api/handlebars-themes/\">full and extensive theme documentation</a> which outlines every template file, context and helper that you can use. You can also get started with our useful <a href=\"https://github.com/TryGhost/Starter/\">starter theme</a>, which includes the most common foundations and components required to build your own theme.</p><blockquote>If you want to chat with other people making Ghost themes to get any advice or help, there\'s also a <strong>themes</strong> section on our <a href=\"https://forum.ghost.org/c/themes\">public Ghost forum</a>.</blockquote>','5ee36ad84fae3700011caf97','Ghost themes\nGhost comes with a default theme called Casper, which is designed to be a clean,\nreadable publication layout and can be easily adapted for most purposes.\n\nIf you need something a little more customised, it\'s entirely possible to build\non top of existing open source themes, or to build your own from scratch. Rather\nthan giving you a few basic settings which act as a poor proxy for code, we just\nlet you write code.\n\nMarketplace\nThere are a huge range of both free and premium pre-built themes which you can\ndownload from the Ghost Theme Marketplace [https://ghost.org/marketplace/]:\n\nAnyone can write a completely custom Ghost theme with some solid knowledge of\nHTML and CSSTheme development\nGhost themes are written with a templating language called handlebars, which has\na set of dynamic helpers to insert your data into template files. For example: \n{{author.name}} outputs the name of the current author.\n\nThe best way to learn how to write your own Ghost theme is to have a look at \nthe\nsource code for Casper [https://github.com/TryGhost/Casper], which is heavily\ncommented and should give you a sense of how everything fits together.\n\n\n * default.hbs is the main template file, all contexts will load inside this\n   file unless specifically told to use a different template.\n * post.hbs is the file used in the context of viewing a post.\n * index.hbs is the file used in the context of viewing the home page.\n * and so on\n\nWe\'ve got full and extensive theme documentation\n[https://ghost.org/docs/api/handlebars-themes/] which outlines every template\nfile, context and helper that you can use. You can also get started with our\nuseful starter theme [https://github.com/TryGhost/Starter/], which includes the\nmost common foundations and components required to build your own theme.\n\n> If you want to chat with other people making Ghost themes to get any advice or\nhelp, there\'s also a themes section on our public Ghost forum\n[https://forum.ghost.org/c/themes].','https://static.ghost.org/v3.0.0/images/creating-a-custom-theme.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:28','1','2020-06-12 11:45:28','1','2020-06-12 11:45:28','1','Ghost comes with a beautiful default theme designed for publishers which can easily be adapted for most purposes, or you can build a custom theme to suit your needs.',NULL,NULL,NULL,NULL),('5ee36ad84fae3700011caf99','ee9a8754-58ca-4b9a-8099-a8462a77b8a4','Apps & integrations','apps-integrations','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v3.0.0/images/integrations-icons.png\",\"cardWidth\":\"full\"}],[\"markdown\",{\"markdown\":\"<script src=\\\"https://zapier.com/apps/embed/widget.js?services=Ghost&container=true&limit=8\\\"></script>\\n\"}],[\"image\",{\"src\":\"https://static.ghost.org/v3.0.0/images/integrations-and-webhooks-in-ghost.png\",\"alt\":\"Screenshot of custom integrations with webhooks in Ghost Admin\",\"cardWidth\":\"\"}]],\"markups\":[[\"a\",[\"href\",\"https://ghost.org/integrations/\"]],[\"a\",[\"href\",\"https://zapier.com\"]],[\"strong\"],[\"a\",[\"href\",\"https://ghost.org/docs/api/\"]],[\"a\",[\"href\",\"/themes/\"]]],\"sections\":[[1,\"h2\",[[0,[],0,\"Work with your existing tools\"]]],[1,\"p\",[[0,[],0,\"It\'s possible to connect your Ghost site to hundreds of the most popular apps and tools using integrations that take no more than a few minutes to setup.\"]]],[1,\"p\",[[0,[],0,\"Whether you need to automate workflows, connect your email list, build a community or embed products from your ecommerce store, our \"],[0,[0],1,\"integrations library\"],[0,[],0,\" has got it all covered with hundreds of tutorials.\"]]],[10,0],[1,\"h2\",[[0,[],0,\"Zapier\"]]],[1,\"p\",[[0,[],0,\"On top of this, you can connect your Ghost site to more than 1,000 external services using the official integration with \"],[0,[1],1,\"Zapier\"],[0,[],0,\".\"]]],[1,\"p\",[[0,[],0,\"Zapier sets up automations with Triggers and Actions, which allows you to create and customise a wide range of connected applications.\"]]],[1,\"blockquote\",[[0,[2],1,\"Example\"],[0,[],0,\": When someone new subscribes to a newsletter on a Ghost site (Trigger) then the contact information is automatically pushed into MailChimp (Action).\"]]],[1,\"p\",[[0,[2],1,\"Here are the most popular Ghost<>Zapier automation templates:\"],[0,[],0,\" \"]]],[10,1],[1,\"h2\",[[0,[],0,\"Custom integrations\"]]],[1,\"p\",[[0,[],0,\"At the heart of Ghost sits a robust JSON API – designed to create, manage and retrieve content with ease. \"]]],[1,\"p\",[[0,[],0,\"It\'s possible to create custom Ghost integrations with dedicated API keys and webhooks from the Integrations page within Ghost Admin. \"]]],[10,2],[1,\"p\",[[0,[],0,\"Beyond that, the API allows you to build entirely custom publishing apps. You can send content from your favourite desktop editor, build a custom interface for handling editorial workflow or use Ghost as a full headless CMS with a custom front-end.\"]]],[1,\"p\",[[0,[],0,\"The Ghost API is \"],[0,[3],1,\"thoroughly documented\"],[0,[],0,\" and straightforward to work with for developers of almost any level. \"]]],[1,\"h2\",[[0,[],0,\"Final step: Themes\"]]],[1,\"p\",[[0,[],0,\"Alright, on to the last post in our welcome-series! If you\'re curious about creating your own Ghost theme from scratch, \"],[0,[4],1,\"find out how that works\"],[0,[],0,\".\"]]]]}','<h2 id=\"work-with-your-existing-tools\">Work with your existing tools</h2><p>It\'s possible to connect your Ghost site to hundreds of the most popular apps and tools using integrations that take no more than a few minutes to setup.</p><p>Whether you need to automate workflows, connect your email list, build a community or embed products from your ecommerce store, our <a href=\"https://ghost.org/integrations/\">integrations library</a> has got it all covered with hundreds of tutorials.</p><figure class=\"kg-card kg-image-card kg-width-full\"><img src=\"https://static.ghost.org/v3.0.0/images/integrations-icons.png\" class=\"kg-image\"></figure><h2 id=\"zapier\">Zapier</h2><p>On top of this, you can connect your Ghost site to more than 1,000 external services using the official integration with <a href=\"https://zapier.com\">Zapier</a>.</p><p>Zapier sets up automations with Triggers and Actions, which allows you to create and customise a wide range of connected applications.</p><blockquote><strong>Example</strong>: When someone new subscribes to a newsletter on a Ghost site (Trigger) then the contact information is automatically pushed into MailChimp (Action).</blockquote><p><strong>Here are the most popular Ghost&lt;&gt;Zapier automation templates:</strong> </p><!--kg-card-begin: markdown--><script src=\"https://zapier.com/apps/embed/widget.js?services=Ghost&container=true&limit=8\"></script>\n<!--kg-card-end: markdown--><h2 id=\"custom-integrations\">Custom integrations</h2><p>At the heart of Ghost sits a robust JSON API – designed to create, manage and retrieve content with ease. </p><p>It\'s possible to create custom Ghost integrations with dedicated API keys and webhooks from the Integrations page within Ghost Admin. </p><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v3.0.0/images/integrations-and-webhooks-in-ghost.png\" class=\"kg-image\" alt=\"Screenshot of custom integrations with webhooks in Ghost Admin\"></figure><p>Beyond that, the API allows you to build entirely custom publishing apps. You can send content from your favourite desktop editor, build a custom interface for handling editorial workflow or use Ghost as a full headless CMS with a custom front-end.</p><p>The Ghost API is <a href=\"https://ghost.org/docs/api/\">thoroughly documented</a> and straightforward to work with for developers of almost any level. </p><h2 id=\"final-step-themes\">Final step: Themes</h2><p>Alright, on to the last post in our welcome-series! If you\'re curious about creating your own Ghost theme from scratch, <a href=\"/themes/\">find out how that works</a>.</p>','5ee36ad84fae3700011caf99','Work with your existing tools\nIt\'s possible to connect your Ghost site to hundreds of the most popular apps\nand tools using integrations that take no more than a few minutes to setup.\n\nWhether you need to automate workflows, connect your email list, build a\ncommunity or embed products from your ecommerce store, our integrations library\n[https://ghost.org/integrations/] has got it all covered with hundreds of\ntutorials.\n\nZapier\nOn top of this, you can connect your Ghost site to more than 1,000 external\nservices using the official integration with Zapier [https://zapier.com].\n\nZapier sets up automations with Triggers and Actions, which allows you to create\nand customise a wide range of connected applications.\n\n> Example: When someone new subscribes to a newsletter on a Ghost site (Trigger)\nthen the contact information is automatically pushed into MailChimp (Action).\nHere are the most popular Ghost<>Zapier automation templates: \n\nCustom integrations\nAt the heart of Ghost sits a robust JSON API – designed to create, manage and\nretrieve content with ease. \n\nIt\'s possible to create custom Ghost integrations with dedicated API keys and\nwebhooks from the Integrations page within Ghost Admin. \n\nBeyond that, the API allows you to build entirely custom publishing apps. You\ncan send content from your favourite desktop editor, build a custom interface\nfor handling editorial workflow or use Ghost as a full headless CMS with a\ncustom front-end.\n\nThe Ghost API is thoroughly documented [https://ghost.org/docs/api/] and\nstraightforward to work with for developers of almost any level. \n\nFinal step: Themes\nAlright, on to the last post in our welcome-series! If you\'re curious about\ncreating your own Ghost theme from scratch, find out how that works [/themes/].','https://static.ghost.org/v3.0.0/images/app-integrations.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:28','1','2020-06-12 11:45:28','1','2020-06-12 11:45:29','1','Work with all your favourite apps and tools or create your own custom integrations using the Ghost API.',NULL,NULL,NULL,NULL),('5ee36ad84fae3700011caf9b','0f8ba15c-6389-4cf6-80ac-f66cb30addb0','Organising your content','organising-content','{\"version\":\"0.3.1\",\"atoms\":[[\"soft-return\",\"\",{}]],\"cards\":[],\"markups\":[[\"code\"],[\"em\"],[\"strong\"],[\"a\",[\"href\",\"https://ghost.org/docs/api/handlebars-themes/\"]],[\"a\",[\"href\",\"http://yaml.org/spec/1.2/spec.html\",\"rel\",\"noreferrer nofollow noopener\"]],[\"a\",[\"href\",\"https://ghost.org/docs/api/handlebars-themes/routing/\"]],[\"a\",[\"href\",\"/apps-integrations/\"]]],\"sections\":[[1,\"h2\",[[0,[],0,\"Sensible tagging\"]]],[1,\"p\",[[0,[],0,\"You can think of tags like Gmail labels. By tagging posts with one or more keyword, you can organise articles into buckets of related content.\"]]],[1,\"p\",[[0,[],0,\"When you create content for your publication you can assign tags to help differentiate between categories of content. \"]]],[1,\"p\",[[0,[],0,\"For example you may tag some content with News and other content with Podcast, which would create two distinct categories of content listed on \"],[0,[0],1,\"/tag/news/\"],[0,[],0,\" and \"],[0,[0],1,\"/tag/podcast/\"],[0,[],0,\", respectively.\"]]],[1,\"p\",[[0,[],0,\"If you tag a post with both \"],[0,[0],1,\"News\"],[0,[],0,\" \"],[0,[1],1,\"and\"],[0,[],0,\" \"],[0,[0],1,\"Podcast\"],[0,[],0,\" - then it appears in both sections. Tag archives are like dedicated home-pages for each category of content that you have. They have their own pages, their own RSS feeds, and can support their own cover images and meta data.\"]]],[1,\"h3\",[[0,[],0,\"The primary tag\"]]],[1,\"p\",[[0,[],0,\"Inside the Ghost editor, you can drag and drop tags into a specific order. The first tag in the list is always given the most importance, and some themes will only display the primary tag (the first tag in the list) by default. \"]]],[1,\"blockquote\",[[0,[1,2],1,\"News\"],[0,[],1,\", Technology, Startup\"]]],[1,\"p\",[[0,[],0,\"So you can add the most important tag which you want to show up in your theme, but also add related tags which are less important.\"]]],[1,\"h3\",[[0,[],0,\"Private tags\"]]],[1,\"p\",[[0,[],0,\"Sometimes you may want to assign a post a specific tag, but you don\'t necessarily want that tag appearing in the theme or creating an archive page. In Ghost, hashtags are private and can be used for special styling.\"]]],[1,\"p\",[[0,[],0,\"For example, if you sometimes publish posts with video content - you might want your theme to adapt and get rid of the sidebar for these posts, to give more space for an embedded video to fill the screen. In this case, you could use private tags to tell your theme what to do.\"]]],[1,\"blockquote\",[[0,[1,2],1,\"News\"],[0,[],1,\", #video\"]]],[1,\"p\",[[0,[],0,\"Here, the theme would assign the post publicly displayed tags of News - but it would also keep a private record of the post being tagged with #video. In your theme, you could then look for private tags conditionally and give them special formatting. \"]]],[1,\"blockquote\",[[0,[1],0,\"You can find documentation for theme development techniques like this and many more over on Ghost\'s extensive \"],[0,[3],1,\"theme docs\"],[0,[],1,\".\"]]],[1,\"h2\",[[0,[],0,\"Dynamic routing\"]]],[1,\"p\",[[0,[],0,\"Dynamic routing gives you the ultimate freedom to build a custom publication to suit your needs. Routes are rules that map URL patterns to your content and templates. \"]]],[1,\"p\",[[0,[],0,\"You may not want content tagged with \"],[0,[0],1,\"News\"],[0,[],0,\" to exist on: \"],[0,[0],1,\"example.com/tag/news\"],[0,[],0,\". Instead, you want it to exist on \"],[0,[0],1,\"example.com/news\"],[0,[],0,\" .\"]]],[1,\"p\",[[0,[],0,\"In this case you can use dynamic routes to create customised collections of content on your site. It\'s also possible to use multiple templates in your theme to render each content type differently.\"]]],[1,\"p\",[[0,[],0,\"There are lots of use cases for dynamic routing with Ghost, here are a few common examples: \"]]],[3,\"ul\",[[[0,[],0,\"Setting a custom home page with its own template\"]],[[0,[],0,\"Having separate content hubs for blog and podcast, that render differently, and have custom RSS feeds to support two types of content\"]],[[0,[],0,\"Creating a founders column as a unique view, by filtering content created by specific authors\"]],[[0,[],0,\"Including dates in permalinks for your posts\"]],[[0,[],0,\"Setting posts to have a URL relative to their primary tag like \"],[0,[0],1,\"example.com/europe/story-title/\"],[1,[],0,0]]]],[1,\"blockquote\",[[0,[1],0,\"Dynamic routing can be configured in Ghost using \"],[0,[4],1,\"YAML\"],[0,[],0,\" files. Read our dynamic routing \"],[0,[5],1,\"documentation\"],[0,[],1,\" for further details.\"]]],[1,\"h2\",[[0,[],0,\"Next: Apps & Integrations\"]]],[1,\"p\",[[0,[],0,\"Work with all your favourite apps and tools using our \"],[0,[6],1,\"integrations\"],[0,[],0,\", or create your own custom integrations with webhooks.\"]]],[1,\"p\",[]]]}','<h2 id=\"sensible-tagging\">Sensible tagging</h2><p>You can think of tags like Gmail labels. By tagging posts with one or more keyword, you can organise articles into buckets of related content.</p><p>When you create content for your publication you can assign tags to help differentiate between categories of content. </p><p>For example you may tag some content with News and other content with Podcast, which would create two distinct categories of content listed on <code>/tag/news/</code> and <code>/tag/podcast/</code>, respectively.</p><p>If you tag a post with both <code>News</code> <em>and</em> <code>Podcast</code> - then it appears in both sections. Tag archives are like dedicated home-pages for each category of content that you have. They have their own pages, their own RSS feeds, and can support their own cover images and meta data.</p><h3 id=\"the-primary-tag\">The primary tag</h3><p>Inside the Ghost editor, you can drag and drop tags into a specific order. The first tag in the list is always given the most importance, and some themes will only display the primary tag (the first tag in the list) by default. </p><blockquote><em><strong>News</strong>, Technology, Startup</em></blockquote><p>So you can add the most important tag which you want to show up in your theme, but also add related tags which are less important.</p><h3 id=\"private-tags\">Private tags</h3><p>Sometimes you may want to assign a post a specific tag, but you don\'t necessarily want that tag appearing in the theme or creating an archive page. In Ghost, hashtags are private and can be used for special styling.</p><p>For example, if you sometimes publish posts with video content - you might want your theme to adapt and get rid of the sidebar for these posts, to give more space for an embedded video to fill the screen. In this case, you could use private tags to tell your theme what to do.</p><blockquote><em><strong>News</strong>, #video</em></blockquote><p>Here, the theme would assign the post publicly displayed tags of News - but it would also keep a private record of the post being tagged with #video. In your theme, you could then look for private tags conditionally and give them special formatting. </p><blockquote><em>You can find documentation for theme development techniques like this and many more over on Ghost\'s extensive <a href=\"https://ghost.org/docs/api/handlebars-themes/\">theme docs</a>.</em></blockquote><h2 id=\"dynamic-routing\">Dynamic routing</h2><p>Dynamic routing gives you the ultimate freedom to build a custom publication to suit your needs. Routes are rules that map URL patterns to your content and templates. </p><p>You may not want content tagged with <code>News</code> to exist on: <code>example.com/tag/news</code>. Instead, you want it to exist on <code>example.com/news</code> .</p><p>In this case you can use dynamic routes to create customised collections of content on your site. It\'s also possible to use multiple templates in your theme to render each content type differently.</p><p>There are lots of use cases for dynamic routing with Ghost, here are a few common examples: </p><ul><li>Setting a custom home page with its own template</li><li>Having separate content hubs for blog and podcast, that render differently, and have custom RSS feeds to support two types of content</li><li>Creating a founders column as a unique view, by filtering content created by specific authors</li><li>Including dates in permalinks for your posts</li><li>Setting posts to have a URL relative to their primary tag like <code>example.com/europe/story-title/</code><br></li></ul><blockquote><em>Dynamic routing can be configured in Ghost using <a href=\"http://yaml.org/spec/1.2/spec.html\" rel=\"noreferrer nofollow noopener\">YAML</a> files. Read our dynamic routing <a href=\"https://ghost.org/docs/api/handlebars-themes/routing/\">documentation</a> for further details.</em></blockquote><h2 id=\"next-apps-integrations\">Next: Apps &amp; Integrations</h2><p>Work with all your favourite apps and tools using our <a href=\"/apps-integrations/\">integrations</a>, or create your own custom integrations with webhooks.</p>','5ee36ad84fae3700011caf9b','Sensible tagging\nYou can think of tags like Gmail labels. By tagging posts with one or more\nkeyword, you can organise articles into buckets of related content.\n\nWhen you create content for your publication you can assign tags to help\ndifferentiate between categories of content. \n\nFor example you may tag some content with News and other content with Podcast,\nwhich would create two distinct categories of content listed on /tag/news/ and \n/tag/podcast/, respectively.\n\nIf you tag a post with both News and Podcast - then it appears in both sections.\nTag archives are like dedicated home-pages for each category of content that you\nhave. They have their own pages, their own RSS feeds, and can support their own\ncover images and meta data.\n\nThe primary tag\nInside the Ghost editor, you can drag and drop tags into a specific order. The\nfirst tag in the list is always given the most importance, and some themes will\nonly display the primary tag (the first tag in the list) by default. \n\n> News, Technology, Startup\nSo you can add the most important tag which you want to show up in your theme,\nbut also add related tags which are less important.\n\nPrivate tags\nSometimes you may want to assign a post a specific tag, but you don\'t\nnecessarily want that tag appearing in the theme or creating an archive page. In\nGhost, hashtags are private and can be used for special styling.\n\nFor example, if you sometimes publish posts with video content - you might want\nyour theme to adapt and get rid of the sidebar for these posts, to give more\nspace for an embedded video to fill the screen. In this case, you could use\nprivate tags to tell your theme what to do.\n\n> News, #video\nHere, the theme would assign the post publicly displayed tags of News - but it\nwould also keep a private record of the post being tagged with #video. In your\ntheme, you could then look for private tags conditionally and give them special\nformatting. \n\n> You can find documentation for theme development techniques like this and many\nmore over on Ghost\'s extensive theme docs\n[https://ghost.org/docs/api/handlebars-themes/].\nDynamic routing\nDynamic routing gives you the ultimate freedom to build a custom publication to\nsuit your needs. Routes are rules that map URL patterns to your content and\ntemplates. \n\nYou may not want content tagged with News to exist on: example.com/tag/news.\nInstead, you want it to exist on example.com/news .\n\nIn this case you can use dynamic routes to create customised collections of\ncontent on your site. It\'s also possible to use multiple templates in your theme\nto render each content type differently.\n\nThere are lots of use cases for dynamic routing with Ghost, here are a few\ncommon examples: \n\n * Setting a custom home page with its own template\n * Having separate content hubs for blog and podcast, that render differently,\n   and have custom RSS feeds to support two types of content\n * Creating a founders column as a unique view, by filtering content created by\n   specific authors\n * Including dates in permalinks for your posts\n * Setting posts to have a URL relative to their primary tag like \n   example.com/europe/story-title/\n   \n\n> Dynamic routing can be configured in Ghost using YAML\n[http://yaml.org/spec/1.2/spec.html] files. Read our dynamic routing \ndocumentation [https://ghost.org/docs/api/handlebars-themes/routing/] for\nfurther details.\nNext: Apps & Integrations\nWork with all your favourite apps and tools using our integrations\n[/apps-integrations/], or create your own custom integrations with webhooks.','https://static.ghost.org/v3.0.0/images/organising-your-content.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:28','1','2020-06-12 11:45:28','1','2020-06-12 11:45:30','1','Ghost has a flexible organisational taxonomy called tags and the ability to create custom site structures using dynamic routes.',NULL,NULL,NULL,NULL),('5ee36ad94fae3700011caf9d','2e52894a-b698-4e0a-8155-6619726ebdef','Managing admin settings','admin-settings','{\"version\":\"0.3.1\",\"atoms\":[[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}],[\"soft-return\",\"\",{}]],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v1.0.0/images/private.png\"}]],\"markups\":[[\"em\"],[\"strong\"],[\"a\",[\"href\",\"https://ghost.org/pricing/\"]],[\"a\",[\"href\",\"/organising-content/\"]]],\"sections\":[[1,\"h2\",[[0,[],0,\"Make your site private\"]]],[1,\"p\",[[0,[],0,\"If you\'ve got a publication that you don\'t want the world to see yet because it\'s not ready to launch, you can hide your Ghost site behind a basic shared pass-phrase.\"]]],[1,\"p\",[[0,[],0,\"You can toggle this preference on at the bottom of Ghost\'s General Settings:\"]]],[10,0],[1,\"p\",[[0,[],0,\"Ghost will give you a short, randomly generated pass-phrase which you can share with anyone who needs access to the site while you\'re working on it. While this setting is enabled, all search engine optimisation features will be switched off to help keep your site under the radar.\"]]],[1,\"p\",[[0,[],0,\"Do remember though, this is \"],[0,[0],1,\"not\"],[0,[],0,\" secure authentication. You shouldn\'t rely on this feature for protecting important private data. It\'s just a simple, shared pass-phrase for some very basic privacy.\"]]],[1,\"h2\",[[0,[],0,\"Invite your team \"]]],[1,\"p\",[[0,[],0,\"Ghost has a number of different user roles for your team:\"]]],[1,\"p\",[[0,[1],1,\"Contributors\"],[1,[],0,0],[0,[],0,\"This is the base user level in Ghost. Contributors can create and edit their own draft posts, but they are unable to edit drafts of others or publish posts. Contributors are \"],[0,[1],1,\"untrusted\"],[0,[],0,\" users with the most basic access to your publication.\"]]],[1,\"p\",[[0,[1],1,\"Authors\"],[1,[],0,1],[0,[],0,\"Authors are the 2nd user level in Ghost. Authors can write, edit  and publish their own posts. Authors are \"],[0,[1],1,\"trusted\"],[0,[],0,\" users. If you don\'t trust users to be allowed to publish their own posts, they should be set as Contributors.\"]]],[1,\"p\",[[0,[1],1,\"Editors\"],[1,[],0,2],[0,[],0,\"Editors are the 3rd user level in Ghost. Editors can do everything that an Author can do, but they can also edit and publish the posts of others - as well as their own. Editors can also invite new Contributors & Authors to the site.\"]]],[1,\"p\",[[0,[1],1,\"Administrators\"],[1,[],0,3],[0,[],0,\"The top user level in Ghost is Administrator. Again, administrators can do everything that Authors and Editors can do, but they can also edit all site settings and data, not just content. Additionally, administrators have full access to invite, manage or remove any other user of the site.\"],[1,[],0,4],[1,[],0,5],[0,[1],1,\"The Owner\"],[1,[],0,6],[0,[],0,\"There is only ever one owner of a Ghost site. The owner is a special user which has all the same permissions as an Administrator, but with two exceptions: The Owner can never be deleted. And in some circumstances the owner will have access to additional special settings if applicable. For example: billing details, if using \"],[0,[2,1],2,\"Ghost(Pro)\"],[0,[],0,\".\"]]],[1,\"blockquote\",[[0,[0],1,\"It\'s a good idea to ask all of your users to fill out their user profiles, including bio and social links. These will populate rich structured data for posts and generally create more opportunities for themes to fully populate their design.\"]]],[1,\"h2\",[[0,[],0,\"Next: Organising content\"]]],[1,\"p\",[[0,[],0,\"Find out how to \"],[0,[3],1,\"organise your content\"],[0,[],0,\" with sensible tags and authors, or for more advanced configurations, how to create custom content structures using dynamic routing.\"]]]]}','<h2 id=\"make-your-site-private\">Make your site private</h2><p>If you\'ve got a publication that you don\'t want the world to see yet because it\'s not ready to launch, you can hide your Ghost site behind a basic shared pass-phrase.</p><p>You can toggle this preference on at the bottom of Ghost\'s General Settings:</p><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v1.0.0/images/private.png\" class=\"kg-image\"></figure><p>Ghost will give you a short, randomly generated pass-phrase which you can share with anyone who needs access to the site while you\'re working on it. While this setting is enabled, all search engine optimisation features will be switched off to help keep your site under the radar.</p><p>Do remember though, this is <em>not</em> secure authentication. You shouldn\'t rely on this feature for protecting important private data. It\'s just a simple, shared pass-phrase for some very basic privacy.</p><h2 id=\"invite-your-team\">Invite your team </h2><p>Ghost has a number of different user roles for your team:</p><p><strong>Contributors</strong><br>This is the base user level in Ghost. Contributors can create and edit their own draft posts, but they are unable to edit drafts of others or publish posts. Contributors are <strong>untrusted</strong> users with the most basic access to your publication.</p><p><strong>Authors</strong><br>Authors are the 2nd user level in Ghost. Authors can write, edit  and publish their own posts. Authors are <strong>trusted</strong> users. If you don\'t trust users to be allowed to publish their own posts, they should be set as Contributors.</p><p><strong>Editors</strong><br>Editors are the 3rd user level in Ghost. Editors can do everything that an Author can do, but they can also edit and publish the posts of others - as well as their own. Editors can also invite new Contributors &amp; Authors to the site.</p><p><strong>Administrators</strong><br>The top user level in Ghost is Administrator. Again, administrators can do everything that Authors and Editors can do, but they can also edit all site settings and data, not just content. Additionally, administrators have full access to invite, manage or remove any other user of the site.<br><br><strong>The Owner</strong><br>There is only ever one owner of a Ghost site. The owner is a special user which has all the same permissions as an Administrator, but with two exceptions: The Owner can never be deleted. And in some circumstances the owner will have access to additional special settings if applicable. For example: billing details, if using <a href=\"https://ghost.org/pricing/\"><strong>Ghost(Pro)</strong></a>.</p><blockquote><em>It\'s a good idea to ask all of your users to fill out their user profiles, including bio and social links. These will populate rich structured data for posts and generally create more opportunities for themes to fully populate their design.</em></blockquote><h2 id=\"next-organising-content\">Next: Organising content</h2><p>Find out how to <a href=\"/organising-content/\">organise your content</a> with sensible tags and authors, or for more advanced configurations, how to create custom content structures using dynamic routing.</p>','5ee36ad94fae3700011caf9d','Make your site private\nIf you\'ve got a publication that you don\'t want the world to see yet because\nit\'s not ready to launch, you can hide your Ghost site behind a basic shared\npass-phrase.\n\nYou can toggle this preference on at the bottom of Ghost\'s General Settings:\n\nGhost will give you a short, randomly generated pass-phrase which you can share\nwith anyone who needs access to the site while you\'re working on it. While this\nsetting is enabled, all search engine optimisation features will be switched off\nto help keep your site under the radar.\n\nDo remember though, this is not secure authentication. You shouldn\'t rely on\nthis feature for protecting important private data. It\'s just a simple, shared\npass-phrase for some very basic privacy.\n\nInvite your team \nGhost has a number of different user roles for your team:\n\nContributors\nThis is the base user level in Ghost. Contributors can create and edit their own\ndraft posts, but they are unable to edit drafts of others or publish posts.\nContributors are untrusted users with the most basic access to your publication.\n\nAuthors\nAuthors are the 2nd user level in Ghost. Authors can write, edit  and publish\ntheir own posts. Authors are trusted users. If you don\'t trust users to be\nallowed to publish their own posts, they should be set as Contributors.\n\nEditors\nEditors are the 3rd user level in Ghost. Editors can do everything that an\nAuthor can do, but they can also edit and publish the posts of others - as well\nas their own. Editors can also invite new Contributors & Authors to the site.\n\nAdministrators\nThe top user level in Ghost is Administrator. Again, administrators can do\neverything that Authors and Editors can do, but they can also edit all site\nsettings and data, not just content. Additionally, administrators have full\naccess to invite, manage or remove any other user of the site.\n\nThe Owner\nThere is only ever one owner of a Ghost site. The owner is a special user which\nhas all the same permissions as an Administrator, but with two exceptions: The\nOwner can never be deleted. And in some circumstances the owner will have access\nto additional special settings if applicable. For example: billing details, if\nusing Ghost(Pro) [https://ghost.org/pricing/].\n\n> It\'s a good idea to ask all of your users to fill out their user profiles,\nincluding bio and social links. These will populate rich structured data for\nposts and generally create more opportunities for themes to fully populate their\ndesign.\nNext: Organising content\nFind out how to organise your content [/organising-content/] with sensible tags\nand authors, or for more advanced configurations, how to create custom content\nstructures using dynamic routing.','https://static.ghost.org/v3.0.0/images/admin-settings.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1','2020-06-12 11:45:31','1','There are a couple of things to do next while you\'re getting set up: making your site private and inviting your team.',NULL,NULL,NULL,NULL),('5ee36ad94fae3700011caf9f','fe20af82-9325-47db-b82b-43f01591c09a','Publishing options','publishing-options','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"code\",{\"code\":\"{\\n    \\\"@context\\\": \\\"https://schema.org\\\",\\n    \\\"@type\\\": \\\"Article\\\",\\n    \\\"publisher\\\": {\\n        \\\"@type\\\": \\\"Organization\\\",\\n        \\\"name\\\": \\\"Publishing options\\\",\\n        \\\"logo\\\": \\\"https://static.ghost.org/ghost-logo.svg\\\"\\n    },\\n    \\\"author\\\": {\\n        \\\"@type\\\": \\\"Person\\\",\\n        \\\"name\\\": \\\"Ghost\\\",\\n        \\\"url\\\": \\\"http://demo.ghost.io/author/ghost/\\\",\\n        \\\"sameAs\\\": []\\n    },\\n    \\\"headline\\\": \\\"Publishing options\\\",\\n    \\\"url\\\": \\\"http://demo.ghost.io/publishing-options\\\",\\n    \\\"datePublished\\\": \\\"2018-08-08T11:44:00.000Z\\\",\\n    \\\"dateModified\\\": \\\"2018-08-09T12:06:21.000Z\\\",\\n    \\\"keywords\\\": \\\"Getting Started\\\",\\n    \\\"description\\\": \\\"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.\\\",\\n    }\\n}\\n    \"}]],\"markups\":[[\"strong\"],[\"a\",[\"href\",\"https://schema.org/\"]],[\"a\",[\"href\",\"https://search.google.com/structured-data/testing-tool\",\"rel\",\"noreferrer nofollow noopener\"]],[\"a\",[\"href\",\"/admin-settings/\"]]],\"sections\":[[1,\"h2\",[[0,[],0,\"Distribute your content\"]]],[1,\"p\",[[0,[],0,\"Access the post settings menu by clicking the settings icon in the top right hand corner of the editor and discover everything you need to get your content ready for publishing. This is where you can edit things like tags, post URL, publish date and custom meta data.\"]]],[1,\"h2\",[[0,[],0,\"Feature images, URL & excerpts\"]]],[1,\"p\",[[0,[],0,\"Insert your post feature image from the very top of the post settings menu. Consider resizing or optimising your image first to ensure it\'s an appropriate size. Below this, you can set your post URL, publish date and add a custom excerpt.\"]]],[1,\"h2\",[[0,[],0,\"Tags & authors\"]]],[1,\"p\",[[0,[],0,\"You can easily add multiple tags and authors to any post to filter and organise the relationships between your content in Ghost.\"]]],[1,\"h2\",[[0,[],0,\"Structured data & SEO\"]]],[1,\"p\",[[0,[],0,\"There\'s no need to hard code your meta data. In fact, Ghost will generate default meta data automatically using the content in your post.\"]]],[1,\"p\",[[0,[],0,\"Alternatively, you can override this by adding a custom meta title and description, as well as unique information for social media sharing cards on Facebook and Twitter.\"]]],[1,\"p\",[[0,[],0,\"It\'s also possible to set custom canonicals, which is useful for guest posts or curated lists of external links.\"]]],[1,\"p\",[[0,[],0,\"Ghost will automatically implement \"],[0,[0],1,\"structured data\"],[0,[],0,\" for your publication using JSON-LD to further optimise your content.\"]]],[10,0],[1,\"p\",[[0,[],0,\"You can test that the structured data \"],[0,[1],1,\"schema\"],[0,[],0,\" on your site is working as it should using \"],[0,[2],1,\"Google’s structured data tool\"],[0,[],0,\". \"]]],[1,\"h2\",[[0,[],0,\"Code injection\"]]],[1,\"p\",[[0,[],0,\"This tool allows you to inject code on a per post or page basis, or across your entire site. This means you can modify CSS, add unique tracking codes, or add other scripts to the head or foot of your publication without making edits to your theme files. \"]]],[1,\"p\",[[0,[0],1,\"To add code site-wide\"],[0,[],0,\", use the code injection tool in the main admin menu. This is useful for adding a Google Analytics tracking code, or to start tracking with any other analytics tool.\"]]],[1,\"p\",[[0,[0],1,\"To add code to a post or page\"],[0,[],0,\", use the code injection tool within the post settings menu. This is useful if you want to add art direction, scripts or styles that are only applicable to one post or page.\"]]],[1,\"h2\",[[0,[],0,\"Next: Admin settings\"]]],[1,\"p\",[[0,[],0,\"Now you understand how to create and optimise content, let\'s explore some \"],[0,[3],1,\"admin settings\"],[0,[],0,\" so you can invite your team and start collaborating.\"]]]]}','<h2 id=\"distribute-your-content\">Distribute your content</h2><p>Access the post settings menu by clicking the settings icon in the top right hand corner of the editor and discover everything you need to get your content ready for publishing. This is where you can edit things like tags, post URL, publish date and custom meta data.</p><h2 id=\"feature-images-url-excerpts\">Feature images, URL &amp; excerpts</h2><p>Insert your post feature image from the very top of the post settings menu. Consider resizing or optimising your image first to ensure it\'s an appropriate size. Below this, you can set your post URL, publish date and add a custom excerpt.</p><h2 id=\"tags-authors\">Tags &amp; authors</h2><p>You can easily add multiple tags and authors to any post to filter and organise the relationships between your content in Ghost.</p><h2 id=\"structured-data-seo\">Structured data &amp; SEO</h2><p>There\'s no need to hard code your meta data. In fact, Ghost will generate default meta data automatically using the content in your post.</p><p>Alternatively, you can override this by adding a custom meta title and description, as well as unique information for social media sharing cards on Facebook and Twitter.</p><p>It\'s also possible to set custom canonicals, which is useful for guest posts or curated lists of external links.</p><p>Ghost will automatically implement <strong>structured data</strong> for your publication using JSON-LD to further optimise your content.</p><pre><code>{\n    \"@context\": \"https://schema.org\",\n    \"@type\": \"Article\",\n    \"publisher\": {\n        \"@type\": \"Organization\",\n        \"name\": \"Publishing options\",\n        \"logo\": \"https://static.ghost.org/ghost-logo.svg\"\n    },\n    \"author\": {\n        \"@type\": \"Person\",\n        \"name\": \"Ghost\",\n        \"url\": \"http://demo.ghost.io/author/ghost/\",\n        \"sameAs\": []\n    },\n    \"headline\": \"Publishing options\",\n    \"url\": \"http://demo.ghost.io/publishing-options\",\n    \"datePublished\": \"2018-08-08T11:44:00.000Z\",\n    \"dateModified\": \"2018-08-09T12:06:21.000Z\",\n    \"keywords\": \"Getting Started\",\n    \"description\": \"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.\",\n    }\n}\n    </code></pre><p>You can test that the structured data <a href=\"https://schema.org/\">schema</a> on your site is working as it should using <a href=\"https://search.google.com/structured-data/testing-tool\" rel=\"noreferrer nofollow noopener\">Google’s structured data tool</a>. </p><h2 id=\"code-injection\">Code injection</h2><p>This tool allows you to inject code on a per post or page basis, or across your entire site. This means you can modify CSS, add unique tracking codes, or add other scripts to the head or foot of your publication without making edits to your theme files. </p><p><strong>To add code site-wide</strong>, use the code injection tool in the main admin menu. This is useful for adding a Google Analytics tracking code, or to start tracking with any other analytics tool.</p><p><strong>To add code to a post or page</strong>, use the code injection tool within the post settings menu. This is useful if you want to add art direction, scripts or styles that are only applicable to one post or page.</p><h2 id=\"next-admin-settings\">Next: Admin settings</h2><p>Now you understand how to create and optimise content, let\'s explore some <a href=\"/admin-settings/\">admin settings</a> so you can invite your team and start collaborating.</p>','5ee36ad94fae3700011caf9f','Distribute your content\nAccess the post settings menu by clicking the settings icon in the top right\nhand corner of the editor and discover everything you need to get your content\nready for publishing. This is where you can edit things like tags, post URL,\npublish date and custom meta data.\n\nFeature images, URL & excerpts\nInsert your post feature image from the very top of the post settings menu.\nConsider resizing or optimising your image first to ensure it\'s an appropriate\nsize. Below this, you can set your post URL, publish date and add a custom\nexcerpt.\n\nTags & authors\nYou can easily add multiple tags and authors to any post to filter and organise\nthe relationships between your content in Ghost.\n\nStructured data & SEO\nThere\'s no need to hard code your meta data. In fact, Ghost will generate\ndefault meta data automatically using the content in your post.\n\nAlternatively, you can override this by adding a custom meta title and\ndescription, as well as unique information for social media sharing cards on\nFacebook and Twitter.\n\nIt\'s also possible to set custom canonicals, which is useful for guest posts or\ncurated lists of external links.\n\nGhost will automatically implement structured data for your publication using\nJSON-LD to further optimise your content.\n\n{\n    \"@context\": \"https://schema.org\",\n    \"@type\": \"Article\",\n    \"publisher\": {\n        \"@type\": \"Organization\",\n        \"name\": \"Publishing options\",\n        \"logo\": \"https://static.ghost.org/ghost-logo.svg\"\n    },\n    \"author\": {\n        \"@type\": \"Person\",\n        \"name\": \"Ghost\",\n        \"url\": \"http://demo.ghost.io/author/ghost/\",\n        \"sameAs\": []\n    },\n    \"headline\": \"Publishing options\",\n    \"url\": \"http://demo.ghost.io/publishing-options\",\n    \"datePublished\": \"2018-08-08T11:44:00.000Z\",\n    \"dateModified\": \"2018-08-09T12:06:21.000Z\",\n    \"keywords\": \"Getting Started\",\n    \"description\": \"The Ghost editor has everything you need to fully optimise your content. This is where you can add tags and authors, feature a post, or turn a post into a page.\",\n    }\n}\n    \n\nYou can test that the structured data schema [https://schema.org/] on your site\nis working as it should using Google’s structured data tool\n[https://search.google.com/structured-data/testing-tool]. \n\nCode injection\nThis tool allows you to inject code on a per post or page basis, or across your\nentire site. This means you can modify CSS, add unique tracking codes, or add\nother scripts to the head or foot of your publication without making edits to\nyour theme files. \n\nTo add code site-wide, use the code injection tool in the main admin menu. This\nis useful for adding a Google Analytics tracking code, or to start tracking with\nany other analytics tool.\n\nTo add code to a post or page, use the code injection tool within the post\nsettings menu. This is useful if you want to add art direction, scripts or\nstyles that are only applicable to one post or page.\n\nNext: Admin settings\nNow you understand how to create and optimise content, let\'s explore some admin\nsettings [/admin-settings/] so you can invite your team and start collaborating.','https://static.ghost.org/v3.0.0/images/publishing-options.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1','2020-06-12 11:45:32','1','The Ghost editor post settings menu has everything you need to fully optimise and distribute your content effectively.',NULL,NULL,NULL,NULL),('5ee36ad94fae3700011cafa1','79b52069-4c8b-42ce-a9fc-77e44ddfa099','Writing posts with Ghost ✍️','the-editor','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[[\"image\",{\"src\":\"https://static.ghost.org/v2.0.0/images/formatting-editor-demo.gif\"}],[\"code\",{\"code\":\"<header class=\\\"site-header outer\\\">\\n    <div class=\\\"inner\\\">\\n        {{> \\\"site-nav\\\"}}\\n    </div>\\n</header>\"}],[\"bookmark\",{\"type\":\"bookmark\",\"url\":\"https://ghost.org/\",\"metadata\":{\"url\":\"https://ghost.org\",\"title\":\"Ghost: The #1 open source headless Node.js CMS\",\"description\":\"The world’s most popular modern open source publishing platform. A headless Node.js CMS used by Apple, Sky News, Tinder and thousands more. MIT licensed, with 30k+ stars on Github.\",\"author\":null,\"publisher\":\"Ghost\",\"thumbnail\":\"https://ghost.org/images/meta/Ghost.png\",\"icon\":\"https://ghost.org/icons/icon-512x512.png?v=188b8b6d743c6338ba2eab2e35bab4f5\"}}],[\"image\",{\"src\":\"https://static.ghost.org/v3.0.0/images/image-sizes-ghost-editor.png\"}],[\"gallery\",{\"images\":[{\"fileName\":\"gallery-sample-1.jpg\",\"row\":0,\"width\":6000,\"height\":4000,\"src\":\"https://static.ghost.org/v3.0.0/images/gallery-sample-1.jpg\"},{\"fileName\":\"gallery-sample-2.jpg\",\"row\":0,\"width\":5746,\"height\":3831,\"src\":\"https://static.ghost.org/v3.0.0/images/gallery-sample-2.jpg\"},{\"fileName\":\"gallery-sample-3.jpg\",\"row\":0,\"width\":5872,\"height\":3915,\"src\":\"https://static.ghost.org/v3.0.0/images/gallery-sample-3.jpg\"}]}]],\"markups\":[[\"strong\"],[\"code\"],[\"a\",[\"href\",\"/publishing-options/\"]]],\"sections\":[[1,\"h2\",[[0,[],0,\"Just start writing\"]]],[1,\"p\",[[0,[],0,\"Ghost has a powerful visual editor with familiar formatting options, as well as the ability to add dynamic content.\"]]],[1,\"p\",[[0,[],0,\"Select your text to add formatting such as headers or to create links. Or use Markdown shortcuts to do the work for you - if that\'s your thing. \"]]],[10,0],[1,\"h2\",[[0,[],0,\"Rich editing at your fingertips\"]]],[1,\"p\",[[0,[],0,\"The editor can also handle rich media objects, called \"],[0,[0],1,\"cards\"],[0,[],0,\", which can be organised and re-ordered using drag and drop. \"]]],[1,\"p\",[[0,[],0,\"You can insert a card either by clicking the  \"],[0,[1],1,\"+\"],[0,[],0,\"  button, or typing  \"],[0,[1],1,\"/\"],[0,[],0,\"  on a new line to search for a particular card. This allows you to efficiently insert\"],[0,[0],1,\" images\"],[0,[],0,\", \"],[0,[0],1,\"markdown\"],[0,[],0,\", \"],[0,[0],1,\"html, embeds \"],[0,[],0,\"and more.\"]]],[1,\"p\",[[0,[0],1,\"For example\"],[0,[],0,\":\"]]],[3,\"ul\",[[[0,[],0,\"Insert a video from YouTube directly by pasting the URL\"]],[[0,[],0,\"Create unique content like buttons or forms using the HTML card\"]],[[0,[],0,\"Need to share some code? Embed code blocks directly \"]]]],[10,1],[1,\"p\",[[0,[],0,\"It\'s also possible to share links from across the web in a visual way using bookmark cards that automatically render information from a websites meta data. Paste any URL to try it out: \"]]],[10,2],[1,\"h2\",[[0,[],0,\"Working with images in posts\"]]],[1,\"p\",[[0,[],0,\"You can add images to your posts in many ways:\"]]],[3,\"ul\",[[[0,[],0,\"Upload from your computer\"]],[[0,[],0,\"Click and drag an image into the browser\"]],[[0,[],0,\"Paste directly into the editor from your clipboard\"]],[[0,[],0,\"Insert using a URL\"]]]],[1,\"h3\",[[0,[],0,\"Image sizes\"]]],[1,\"p\",[[0,[],0,\"Once inserted you can blend images beautifully into your content at different sizes and add captions and alt tags wherever needed.\"]]],[10,3],[1,\"h3\",[[0,[],0,\"Image galleries\"]]],[1,\"p\",[[0,[],0,\"Tell visual stories using the gallery card to add up to 9 images that will display as a responsive image gallery: \"]]],[10,4],[1,\"h3\",[[0,[],0,\"Image optimisation\"]]],[1,\"p\",[[0,[],0,\"Ghost will automatically resize and optimise your images with lossless compression. Your posts will be fully optimised for the web without any extra effort on your part.\"]]],[1,\"h2\",[[0,[],0,\"Next: Publishing Options\"]]],[1,\"p\",[[0,[],0,\"Once your post is looking good, you\'ll want to use the \"],[0,[2],1,\"publishing options\"],[0,[],0,\" to ensure it gets distributed in the right places, with custom meta data, feature images and more.\"]]],[1,\"p\",[]]]}','<h2 id=\"just-start-writing\">Just start writing</h2><p>Ghost has a powerful visual editor with familiar formatting options, as well as the ability to add dynamic content.</p><p>Select your text to add formatting such as headers or to create links. Or use Markdown shortcuts to do the work for you - if that\'s your thing. </p><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v2.0.0/images/formatting-editor-demo.gif\" class=\"kg-image\"></figure><h2 id=\"rich-editing-at-your-fingertips\">Rich editing at your fingertips</h2><p>The editor can also handle rich media objects, called <strong>cards</strong>, which can be organised and re-ordered using drag and drop. </p><p>You can insert a card either by clicking the  <code>+</code>  button, or typing  <code>/</code>  on a new line to search for a particular card. This allows you to efficiently insert<strong> images</strong>, <strong>markdown</strong>, <strong>html, embeds </strong>and more.</p><p><strong>For example</strong>:</p><ul><li>Insert a video from YouTube directly by pasting the URL</li><li>Create unique content like buttons or forms using the HTML card</li><li>Need to share some code? Embed code blocks directly </li></ul><pre><code>&lt;header class=\"site-header outer\"&gt;\n    &lt;div class=\"inner\"&gt;\n        {{&gt; \"site-nav\"}}\n    &lt;/div&gt;\n&lt;/header&gt;</code></pre><p>It\'s also possible to share links from across the web in a visual way using bookmark cards that automatically render information from a websites meta data. Paste any URL to try it out: </p><figure class=\"kg-card kg-bookmark-card\"><a class=\"kg-bookmark-container\" href=\"https://ghost.org\"><div class=\"kg-bookmark-content\"><div class=\"kg-bookmark-title\">Ghost: The #1 open source headless Node.js CMS</div><div class=\"kg-bookmark-description\">The world’s most popular modern open source publishing platform. A headless Node.js CMS used by Apple, Sky News, Tinder and thousands more. MIT licensed, with 30k+ stars on Github.</div><div class=\"kg-bookmark-metadata\"><img class=\"kg-bookmark-icon\" src=\"https://ghost.org/icons/icon-512x512.png?v=188b8b6d743c6338ba2eab2e35bab4f5\"><span class=\"kg-bookmark-publisher\">Ghost</span></div></div><div class=\"kg-bookmark-thumbnail\"><img src=\"https://ghost.org/images/meta/Ghost.png\"></div></a></figure><h2 id=\"working-with-images-in-posts\">Working with images in posts</h2><p>You can add images to your posts in many ways:</p><ul><li>Upload from your computer</li><li>Click and drag an image into the browser</li><li>Paste directly into the editor from your clipboard</li><li>Insert using a URL</li></ul><h3 id=\"image-sizes\">Image sizes</h3><p>Once inserted you can blend images beautifully into your content at different sizes and add captions and alt tags wherever needed.</p><figure class=\"kg-card kg-image-card\"><img src=\"https://static.ghost.org/v3.0.0/images/image-sizes-ghost-editor.png\" class=\"kg-image\"></figure><h3 id=\"image-galleries\">Image galleries</h3><p>Tell visual stories using the gallery card to add up to 9 images that will display as a responsive image gallery: </p><figure class=\"kg-card kg-gallery-card kg-width-wide\"><div class=\"kg-gallery-container\"><div class=\"kg-gallery-row\"><div class=\"kg-gallery-image\"><img src=\"https://static.ghost.org/v3.0.0/images/gallery-sample-1.jpg\" width=\"6000\" height=\"4000\"></div><div class=\"kg-gallery-image\"><img src=\"https://static.ghost.org/v3.0.0/images/gallery-sample-2.jpg\" width=\"5746\" height=\"3831\"></div><div class=\"kg-gallery-image\"><img src=\"https://static.ghost.org/v3.0.0/images/gallery-sample-3.jpg\" width=\"5872\" height=\"3915\"></div></div></div></figure><h3 id=\"image-optimisation\">Image optimisation</h3><p>Ghost will automatically resize and optimise your images with lossless compression. Your posts will be fully optimised for the web without any extra effort on your part.</p><h2 id=\"next-publishing-options\">Next: Publishing Options</h2><p>Once your post is looking good, you\'ll want to use the <a href=\"/publishing-options/\">publishing options</a> to ensure it gets distributed in the right places, with custom meta data, feature images and more.</p>','5ee36ad94fae3700011cafa1','Just start writing\nGhost has a powerful visual editor with familiar formatting options, as well as\nthe ability to add dynamic content.\n\nSelect your text to add formatting such as headers or to create links. Or use\nMarkdown shortcuts to do the work for you - if that\'s your thing. \n\nRich editing at your fingertips\nThe editor can also handle rich media objects, called cards, which can be\norganised and re-ordered using drag and drop. \n\nYou can insert a card either by clicking the+ button, or typing/ on a new line\nto search for a particular card. This allows you to efficiently insert images, \nmarkdown, html, embeds and more.\n\nFor example:\n\n * Insert a video from YouTube directly by pasting the URL\n * Create unique content like buttons or forms using the HTML card\n * Need to share some code? Embed code blocks directly \n\n<header class=\"site-header outer\">\n    <div class=\"inner\">\n        {{> \"site-nav\"}}\n    </div>\n</header>\n\nIt\'s also possible to share links from across the web in a visual way using\nbookmark cards that automatically render information from a websites meta data.\nPaste any URL to try it out: \n\nGhost: The #1 open source headless Node.js CMSThe world’s most popular modern\nopen source publishing platform. A headless Node.js CMS used by Apple, Sky\nNews,\nTinder and thousands more. MIT licensed, with 30k+ stars on Github.Ghost\n[https://ghost.org]Working with images in posts\nYou can add images to your posts in many ways:\n\n * Upload from your computer\n * Click and drag an image into the browser\n * Paste directly into the editor from your clipboard\n * Insert using a URL\n\nImage sizes\nOnce inserted you can blend images beautifully into your content at different\nsizes and add captions and alt tags wherever needed.\n\nImage galleries\nTell visual stories using the gallery card to add up to 9 images that will\ndisplay as a responsive image gallery: \n\nImage optimisation\nGhost will automatically resize and optimise your images with lossless\ncompression. Your posts will be fully optimised for the web without any extra\neffort on your part.\n\nNext: Publishing Options\nOnce your post is looking good, you\'ll want to use the publishing options\n[/publishing-options/] to ensure it gets distributed in the right places, with\ncustom meta data, feature images and more.','https://static.ghost.org/v3.0.0/images/writing-posts-with-ghost.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1','2020-06-12 11:45:33','1','Discover familiar formatting options in a functional toolbar and the ability to add dynamic content seamlessly.',NULL,NULL,NULL,NULL),('5ee36ad94fae3700011cafa3','ac200e62-6c0c-4c84-ad9f-a681022c2ea8','Welcome to Ghost','welcome','{\"version\":\"0.3.1\",\"atoms\":[],\"cards\":[],\"markups\":[[\"strong\"],[\"a\",[\"href\",\"https://ghost.org/integrations/\"]],[\"a\",[\"href\",\"https://ghost.org/pricing\"]],[\"a\",[\"href\",\"https://github.com/TryGhost\"]],[\"a\",[\"href\",\"/the-editor/\"]]],\"sections\":[[1,\"h2\",[[0,[0],1,\"A few things you should know\"]]],[3,\"ol\",[[[0,[],0,\"Ghost is designed for ambitious, professional publishers who want to actively build a business around their content. That\'s who it works best for. \"]],[[0,[],0,\"The entire platform can be modified and customised to suit your needs. It\'s very powerful, but does require some knowledge of code. Ghost is not necessarily a good platform for beginners or people who just want a simple personal blog. \"]],[[0,[],0,\"It\'s possible to work with all your favourite tools and apps with hundreds of \"],[0,[1],1,\"integrations\"],[0,[],0,\" to speed up your workflows, connect email lists, build communities and much more.\"]]]],[1,\"h2\",[[0,[],0,\"Behind the scenes\"]]],[1,\"p\",[[0,[],0,\"Ghost is made by an independent non-profit organisation called the Ghost Foundation. We are 100% self funded by revenue from our \"],[0,[2],1,\"Ghost(Pro)\"],[0,[],0,\" service, and every penny we make is re-invested into funding further development of free, open source technology for modern publishing.\"]]],[1,\"p\",[[0,[],0,\"The version of Ghost you are looking at right now would not have been made possible without generous contributions from the open source \"],[0,[3],1,\"community\"],[0,[],0,\".\"]]],[1,\"h2\",[[0,[],0,\"Next up, the editor\"]]],[1,\"p\",[[0,[],0,\"The main thing you\'ll want to read about next is probably: \"],[0,[4],1,\"the Ghost editor\"],[0,[],0,\". This is where the good stuff happens.\"]]],[1,\"blockquote\",[[0,[],0,\"By the way, once you\'re done reading, you can simply delete the default Ghost user from your team to remove all of these introductory posts! \"]]]]}','<h2 id=\"a-few-things-you-should-know\"><strong>A few things you should know</strong></h2><ol><li>Ghost is designed for ambitious, professional publishers who want to actively build a business around their content. That\'s who it works best for. </li><li>The entire platform can be modified and customised to suit your needs. It\'s very powerful, but does require some knowledge of code. Ghost is not necessarily a good platform for beginners or people who just want a simple personal blog. </li><li>It\'s possible to work with all your favourite tools and apps with hundreds of <a href=\"https://ghost.org/integrations/\">integrations</a> to speed up your workflows, connect email lists, build communities and much more.</li></ol><h2 id=\"behind-the-scenes\">Behind the scenes</h2><p>Ghost is made by an independent non-profit organisation called the Ghost Foundation. We are 100% self funded by revenue from our <a href=\"https://ghost.org/pricing\">Ghost(Pro)</a> service, and every penny we make is re-invested into funding further development of free, open source technology for modern publishing.</p><p>The version of Ghost you are looking at right now would not have been made possible without generous contributions from the open source <a href=\"https://github.com/TryGhost\">community</a>.</p><h2 id=\"next-up-the-editor\">Next up, the editor</h2><p>The main thing you\'ll want to read about next is probably: <a href=\"/the-editor/\">the Ghost editor</a>. This is where the good stuff happens.</p><blockquote>By the way, once you\'re done reading, you can simply delete the default Ghost user from your team to remove all of these introductory posts! </blockquote>','5ee36ad94fae3700011cafa3','A few things you should know\n 1. Ghost is designed for ambitious, professional publishers who want to\n    actively build a business around their content. That\'s who it works best\n    for. \n 2. The entire platform can be modified and customised to suit your needs. It\'s\n    very powerful, but does require some knowledge of code. Ghost is not\n    necessarily a good platform for beginners or people who just want a simple\n    personal blog. \n 3. It\'s possible to work with all your favourite tools and apps with hundreds\n    of integrations [https://ghost.org/integrations/] to speed up your\n    workflows, connect email lists, build communities and much more.\n\nBehind the scenes\nGhost is made by an independent non-profit organisation called the Ghost\nFoundation. We are 100% self funded by revenue from our Ghost(Pro)\n[https://ghost.org/pricing] service, and every penny we make is re-invested into\nfunding further development of free, open source technology for modern\npublishing.\n\nThe version of Ghost you are looking at right now would not have been made\npossible without generous contributions from the open source community\n[https://github.com/TryGhost].\n\nNext up, the editor\nThe main thing you\'ll want to read about next is probably: the Ghost editor\n[/the-editor/]. This is where the good stuff happens.\n\n> By the way, once you\'re done reading, you can simply delete the default Ghost\nuser from your team to remove all of these introductory posts!','https://static.ghost.org/v3.0.0/images/welcome-to-ghost.png',0,'post','published',NULL,'public',0,'5951f5fca366002ebd5dbef7','2020-06-12 11:45:29','1','2020-06-12 11:45:29','1','2020-06-12 11:45:34','1','Welcome, it\'s great to have you here.\nWe know that first impressions are important, so we\'ve populated your new site with some initial getting started posts that will help you get familiar with everything in no time.',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_authors`
--

DROP TABLE IF EXISTS `posts_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_authors` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `author_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_authors_post_id_foreign` (`post_id`),
  KEY `posts_authors_author_id_foreign` (`author_id`),
  CONSTRAINT `posts_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_authors_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_authors`
--

LOCK TABLES `posts_authors` WRITE;
/*!40000 ALTER TABLE `posts_authors` DISABLE KEYS */;
INSERT INTO `posts_authors` VALUES ('5ee36ad84fae3700011caf98','5ee36ad84fae3700011caf97','5951f5fca366002ebd5dbef7',0),('5ee36ad84fae3700011caf9a','5ee36ad84fae3700011caf99','5951f5fca366002ebd5dbef7',0),('5ee36ad84fae3700011caf9c','5ee36ad84fae3700011caf9b','5951f5fca366002ebd5dbef7',0),('5ee36ad94fae3700011caf9e','5ee36ad94fae3700011caf9d','5951f5fca366002ebd5dbef7',0),('5ee36ad94fae3700011cafa0','5ee36ad94fae3700011caf9f','5951f5fca366002ebd5dbef7',0),('5ee36ad94fae3700011cafa2','5ee36ad94fae3700011cafa1','5951f5fca366002ebd5dbef7',0),('5ee36ad94fae3700011cafa4','5ee36ad94fae3700011cafa3','5951f5fca366002ebd5dbef7',0);
/*!40000 ALTER TABLE `posts_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_meta`
--

DROP TABLE IF EXISTS `posts_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_meta` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `og_image` varchar(2000) DEFAULT NULL,
  `og_title` varchar(300) DEFAULT NULL,
  `og_description` varchar(500) DEFAULT NULL,
  `twitter_image` varchar(2000) DEFAULT NULL,
  `twitter_title` varchar(300) DEFAULT NULL,
  `twitter_description` varchar(500) DEFAULT NULL,
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `email_subject` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_meta_post_id_unique` (`post_id`),
  CONSTRAINT `posts_meta_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_meta`
--

LOCK TABLES `posts_meta` WRITE;
/*!40000 ALTER TABLE `posts_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_tags` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `tag_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES ('5ee36ad94fae3700011cb072','5ee36ad84fae3700011caf97','5ee36ad74fae3700011caf45',0),('5ee36ad94fae3700011cb073','5ee36ad84fae3700011caf99','5ee36ad74fae3700011caf45',0),('5ee36ad94fae3700011cb074','5ee36ad84fae3700011caf9b','5ee36ad74fae3700011caf45',0),('5ee36ad94fae3700011cb075','5ee36ad94fae3700011caf9d','5ee36ad74fae3700011caf45',0),('5ee36ad94fae3700011cb076','5ee36ad94fae3700011caf9f','5ee36ad74fae3700011caf45',0),('5ee36ad94fae3700011cb077','5ee36ad94fae3700011cafa1','5ee36ad74fae3700011caf45',0),('5ee36ad94fae3700011cb078','5ee36ad94fae3700011cafa3','5ee36ad74fae3700011caf45',0);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('5ee36ad74fae3700011caf46','Administrator','Administrators','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf47','Editor','Editors','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf48','Author','Authors','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf49','Contributor','Contributors','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf4a','Owner','Blog Owner','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf4b','Admin Integration','External Apps','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf4c','DB Backup Integration','Internal DB Backup Client','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1'),('5ee36ad74fae3700011caf4d','Scheduler Integration','Internal Scheduler Client','2020-06-12 11:45:27','1','2020-06-12 11:45:27','1');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES ('5ee36ad84fae3700011caf96','5ee36ad74fae3700011caf48','5951f5fca366002ebd5dbef7'),('5ee36ad94fae3700011cb079','5ee36ad74fae3700011caf4a','1');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(24) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `session_data` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessions_session_id_unique` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(50) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('5ee36ada4fae3700011cb07a','db_hash','f0a6de5a-8690-4447-a5ec-8ecbde0e5270','core','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb07b','next_update_check',NULL,'core','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb07c','notifications','[]','core','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb07d','session_secret','c4f41e2fab5a19c76c8519bc72375b35870ffa6f9f15de4d19a09430bd10707f','core','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb07e','theme_session_secret','a7695e3000ccf687fc020fab1932f000ef3a85b8e20d6dc627227c8641b63c01','core','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb07f','title','Ghost','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb080','description','The professional publishing platform','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb081','logo','https://static.ghost.org/v1.0.0/images/ghost-logo.svg','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb082','cover_image','https://static.ghost.org/v3.0.0/images/publication-cover.png','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb083','icon',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb084','brand','{\"primaryColor\":\"\"}','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb085','default_locale','en','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb086','active_timezone','Etc/UTC','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb087','force_i18n','true','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb088','permalinks','/:slug/','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb089','amp','true','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb08a','ghost_head',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb08b','ghost_foot',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb08c','facebook','ghost','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb08d','twitter','tryghost','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb08e','labs','{}','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb08f','navigation','[{\"label\":\"Home\", \"url\":\"/\"},{\"label\":\"Tag\", \"url\":\"/tag/getting-started/\"}, {\"label\":\"Author\", \"url\":\"/author/ghost/\"},{\"label\":\"Help\", \"url\":\"https://ghost.org/docs/\"}]','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb090','secondary_navigation','[]','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb091','slack','[{\"url\":\"\", \"username\":\"Ghost\"}]','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb092','unsplash','{\"isActive\": true}','blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb093','meta_title',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb094','meta_description',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb095','og_image',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb096','og_title',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb097','og_description',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb098','twitter_image',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb099','twitter_title',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb09a','twitter_description',NULL,'blog','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb09b','active_theme','casper','theme','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb09c','is_private','false','private','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb09d','password',NULL,'private','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb09e','public_hash','d9e82f822bd6f5966724d94baaf7c3','private','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb09f','members_public_key','-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAI5BEykFVrIVQ0Kz8Hb5ViwssHiEk5IS2dl4lCl2akYFCcFoxs4E4q2qgx8ULpbZ\nDwcPlTA4sB83Gc2xlcrmGO75Q4QQ75zGHjHfCcomgo70FtmAGVPJ6TEV+M26CvdNaHBZBBIB\nY3sgQNVWDqCDn7q07zHfq1n/EZqBXhz2XcVTAgMBAAE=\n-----END RSA PUBLIC KEY-----\n','members','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb0a0','members_private_key','-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQCOQRMpBVayFUNCs/B2+VYsLLB4hJOSEtnZeJQpdmpGBQnBaMbOBOKtqoMf\nFC6W2Q8HD5UwOLAfNxnNsZXK5hju+UOEEO+cxh4x3wnKJoKO9BbZgBlTyekxFfjNugr3TWhw\nWQQSAWN7IEDVVg6gg5+6tO8x36tZ/xGagV4c9l3FUwIDAQABAoGAbizMcCroWIjLTTAb/6lh\nKll6W/0iZjIfc6VF608BRDXGtns17n4uKh8z6rAw3ThDwU46V9yv251LaNovj7PifpV+WUGj\n39GnXS7Ej2Q2xUydPKYim0mUbilrm1tbIj5CI8vYXpjREMFuIg5bMCglmjp7iYLzZEuiJOrE\nCotptbECQQDrb2eiWwoA0Z1IJ75ekdS4YGE9Kpu83c9gqE7ZQPZZfQnqkbNH3a506SXMcgqR\nD9AZUCja1aZoGekbybRd7opPAkEAmq4J5Fdgs2imB38XSVYqZQRD2ibTgc3H+17QutleTT0a\n7gHThFr4ztB1/QBnprLORdoa7lswCffXa6W2Hg6HvQJBAMr0zrH3KThretqo6EM+E9KdwzWn\ndXnq/MqmTNKcXcHnOJUt5Q8e2zWNhzgnV1SV/R7VK2L6quky7PE3gHU5HaECQFS8TtL2QxVF\nmN62cs1MFMFuCrWxW2DamFlOYc5aUdzCQsRr37G8HF0/ucM1u5KIlZOSnfpBnhl32l0wVIo2\nr4kCQE3hZkorRVOxciFk18vgbOVcbNM6Zixg9Y6eFwB99D01oETfRYOK1Pay50lgWuwvp5/v\n2TOvlaAVwlcphtOg0gI=\n-----END RSA PRIVATE KEY-----\n','members','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb0a1','members_session_secret','b39f2a6acdb3b9fbac24560c0a9df622d99cd12d86a352ee50db0777d29de815','members','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb0a2','members_email_auth_secret','a5628a7504830db004c3cba7ef18dcce5044ada884be4b3664d37701b234ef0674f97d62165b152c9c84d290278c56e9b871b6058f49132d6b7562e06c1bbdca','members','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb0a3','default_content_visibility','public','members','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb0a4','members_subscription_settings','{\"isPaid\":false,\"fromAddress\":\"noreply\",\"allowSelfSignup\":true,\"paymentProcessors\":[{\"adapter\":\"stripe\",\"config\":{\"secret_token\":\"\",\"public_token\":\"\",\"product\":{\"name\":\"Ghost Subscription\"},\"plans\":[{\"name\":\"Monthly\",\"currency\":\"usd\",\"interval\":\"month\",\"amount\":\"\"},{\"name\":\"Yearly\",\"currency\":\"usd\",\"interval\":\"year\",\"amount\":\"\"}]}}]}','members','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1'),('5ee36ada4fae3700011cb0a5','bulk_email_settings','{\"provider\":\"mailgun\", \"apiKey\": \"\", \"domain\": \"\", \"baseUrl\": \"\"}','bulk_email','2020-06-12 11:45:30','1','2020-06-12 11:45:30','1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text,
  `feature_image` varchar(2000) DEFAULT NULL,
  `parent_id` varchar(191) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES ('5ee36ad74fae3700011caf45','Getting Started','getting-started',NULL,NULL,NULL,'public',NULL,NULL,'2020-06-12 11:45:27','1','2020-06-12 11:45:27','1');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(191) NOT NULL,
  `profile_image` varchar(2000) DEFAULT NULL,
  `cover_image` varchar(2000) DEFAULT NULL,
  `bio` text,
  `website` varchar(2000) DEFAULT NULL,
  `location` text,
  `facebook` varchar(2000) DEFAULT NULL,
  `twitter` varchar(2000) DEFAULT NULL,
  `accessibility` text,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `tour` text,
  `last_seen` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','Ghost','ghost-user','$2a$10$27xvjUERlbJ5qmvq47toweKWqFXd/51jBPCGjAMWNNIjrMV6UerjS','ghost@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'inactive',NULL,'public',NULL,NULL,NULL,NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1'),('5951f5fca366002ebd5dbef7','Ghost','ghost','$2a$10$zMvLqG99L.WMWnJSH/SK5e1fberlN5j.hnU9JWsQ14QJRuhJqaP8K','ghost-author@example.com','https://static.ghost.org/v3.0.0/images/ghost.png',NULL,'You can delete this user to remove all the welcome posts','https://ghost.org','The Internet','ghost','ghost',NULL,'active',NULL,'public',NULL,NULL,NULL,NULL,'2020-06-12 11:45:28','1','2020-06-12 11:45:28','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` varchar(24) NOT NULL,
  `event` varchar(50) NOT NULL,
  `target_url` varchar(2000) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `secret` varchar(191) DEFAULT NULL,
  `api_version` varchar(50) NOT NULL DEFAULT 'v2',
  `integration_id` varchar(24) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'available',
  `last_triggered_at` datetime DEFAULT NULL,
  `last_triggered_status` varchar(50) DEFAULT NULL,
  `last_triggered_error` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-12 13:17:17
