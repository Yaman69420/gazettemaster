mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.44, for macos12.7 (arm64)
--
-- Host: 127.0.0.1    Database: dblaravelclone
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
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
  `expiration` int NOT NULL,
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Laravel','laravel','Artikels over het Laravel framework, routing, controllers, Blade, Eloquent en meer.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(2,'PHP','php','Artikels over PHP, objectgeoriënteerd programmeren, syntax en best practices.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(3,'JavaScript','javascript','Artikels over JavaScript, frontend interactie en moderne webontwikkeling.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(4,'Vue.js','vuejs','Artikels over Vue.js componenten, state en frontend architectuur.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(5,'Livewire','livewire','Artikels over Laravel Livewire, interactieve componenten en server-driven UI.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(6,'MySQL','mysql','Artikels over relationele databases, query optimalisatie en datamodellering.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(7,'AI','ai','Artikels over artificiële intelligentie, automatisatie en slimme workflows.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(8,'SEO','seo','Artikels over zoekmachineoptimalisatie, contentstructuur en online zichtbaarheid.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(9,'America','america','Alles die te maken heeft met america','2026-03-25 09:56:27','2026-03-25 09:56:27',NULL),(10,'Other','other','Andere categories','2026-03-25 09:56:50','2026-03-25 09:56:50',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_post`
--

DROP TABLE IF EXISTS `category_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_post_post_id_category_id_unique` (`post_id`,`category_id`),
  KEY `category_post_category_id_foreign` (`category_id`),
  CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_post`
--

LOCK TABLES `category_post` WRITE;
/*!40000 ALTER TABLE `category_post` DISABLE KEYS */;
INSERT INTO `category_post` VALUES (1,1,1,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(2,1,2,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(3,2,1,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(4,2,6,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(5,2,2,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(6,3,1,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(7,3,6,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(8,4,1,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(9,4,8,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(10,5,3,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(11,5,1,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(12,5,5,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(13,5,4,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(14,6,7,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(15,6,8,'2026-03-19 07:13:31','2026-03-19 07:13:31'),(16,7,5,'2026-03-19 08:28:29','2026-03-19 08:28:29'),(17,9,9,'2026-03-25 09:58:53','2026-03-25 09:58:53'),(18,9,10,'2026-03-25 09:58:53','2026-03-25 09:58:53'),(19,10,7,'2026-03-25 10:02:02','2026-03-25 10:02:02'),(20,10,10,'2026-03-25 10:02:02','2026-03-25 10:02:02'),(21,11,10,'2026-03-25 10:04:20','2026-03-25 10:04:20');
/*!40000 ALTER TABLE `category_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'dawdwadaw','yaman.terkawi.yt@gmail.com','dawdwadawdawdaw',1,'2026-03-26 07:40:28','2026-03-26 07:40:34');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
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
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'b30cec9b-5cfe-4201-8e02-b3cdcb2c8fc0','database','default','{\"uuid\":\"b30cec9b-5cfe-4201-8e02-b3cdcb2c8fc0\",\"displayName\":\"App\\\\Notifications\\\\ContactMessageNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";}}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\ContactMessageNotification\\\":2:{s:4:\\\"data\\\";a:3:{s:4:\\\"name\\\";s:9:\\\"yamanaosd\\\";s:5:\\\"email\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";s:7:\\\"message\\\";s:16:\\\"dawdawdawdwadawd\\\";}s:2:\\\"id\\\";s:36:\\\"024f9ad0-d16c-4e6b-9a57-c50ca5a484db\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"batchId\":null},\"createdAt\":1774513985,\"delay\":null}','Illuminate\\Queue\\TimeoutExceededException: App\\Notifications\\ContactMessageNotification has timed out. in /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/TimeoutExceededException.php:15\nStack trace:\n#0 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(873): Illuminate\\Queue\\TimeoutExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(242): Illuminate\\Queue\\Worker->timeoutExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 [internal function]: Illuminate\\Queue\\Worker->{closure:Illuminate\\Queue\\Worker::registerTimeoutHandler():239}(14, Array)\n#3 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/mailer/Transport/Smtp/Stream/AbstractStream.php(82): fgets(Resource id #1361)\n#4 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(339): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\AbstractStream->readLine()\n#5 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(186): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->getFullResponse()\n#6 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'RSET\\r\\n\', Array)\n#7 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(142): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'RSET\\r\\n\', Array)\n#8 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#9 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#10 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#11 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(163): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(Illuminate\\Notifications\\AnonymousNotifiable), Object(App\\Notifications\\ContactMessageNotification))\n#12 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(118): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(Illuminate\\Notifications\\AnonymousNotifiable), \'ef24a860-ef83-4...\', Object(App\\Notifications\\ContactMessageNotification), \'mail\')\n#13 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->{closure:Illuminate\\Notifications\\NotificationSender::sendNow():113}()\n#14 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(113): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#15 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(60): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\ContactMessageNotification), Array)\n#16 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\ContactMessageNotification), Array)\n#17 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#18 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#19 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#20 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#21 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#22 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#23 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#25 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#27 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():129}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#29 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#31 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#32 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#33 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#34 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#37 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#38 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#39 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#40 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#41 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#42 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call(Array)\n#43 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/console/Command/Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/console/Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /Applications/MAMP/htdocs/gazettemaster/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 /Applications/MAMP/htdocs/gazettemaster/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 /Applications/MAMP/htdocs/gazettemaster/artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#51 {main}','2026-03-26 07:35:13');
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
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (34,'default','{\"uuid\":\"9e59a3ce-010a-42b4-bf06-45e5e2be9864\",\"displayName\":\"App\\\\Notifications\\\\ContactMessageNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";}}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\ContactMessageNotification\\\":2:{s:4:\\\"data\\\";a:3:{s:4:\\\"name\\\";s:9:\\\"yamanaosd\\\";s:5:\\\"email\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";s:7:\\\"message\\\";s:16:\\\"dawdawdawdwadawd\\\";}s:2:\\\"id\\\";s:36:\\\"56f0610d-f325-4aea-99af-e2dde5eee17d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"batchId\":null},\"createdAt\":1774513995,\"delay\":null}',1,1774514600,1774513995,1774513995),(35,'default','{\"uuid\":\"4a279fc2-aab2-4bca-83aa-4065b63bfc68\",\"displayName\":\"App\\\\Notifications\\\\ContactMessageNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";}}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\ContactMessageNotification\\\":2:{s:4:\\\"data\\\";a:3:{s:4:\\\"name\\\";s:9:\\\"yamanaosd\\\";s:5:\\\"email\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";s:7:\\\"message\\\";s:16:\\\"dawdawdawdwadawd\\\";}s:2:\\\"id\\\";s:36:\\\"3cc0010b-24dd-4d4d-9d7f-d2fb7de553ab\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"batchId\":null},\"createdAt\":1774514031,\"delay\":null}',0,NULL,1774514031,1774514031),(36,'default','{\"uuid\":\"577cf9a8-4f47-4583-b362-6b9f36736e24\",\"displayName\":\"App\\\\Notifications\\\\ContactMessageNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";}}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\ContactMessageNotification\\\":2:{s:4:\\\"data\\\";a:3:{s:4:\\\"name\\\";s:9:\\\"yamanaosd\\\";s:5:\\\"email\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";s:7:\\\"message\\\";s:16:\\\"dawdawdawdwadawd\\\";}s:2:\\\"id\\\";s:36:\\\"0b939b88-b7e6-4e59-9f88-e3da7540e0c1\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"batchId\":null},\"createdAt\":1774514031,\"delay\":null}',0,NULL,1774514031,1774514031),(37,'default','{\"uuid\":\"ef296cb8-54e5-4b16-a6de-5a61eb3f86f9\",\"displayName\":\"App\\\\Notifications\\\\ContactMessageNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";}}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\ContactMessageNotification\\\":2:{s:4:\\\"data\\\";a:3:{s:4:\\\"name\\\";s:9:\\\"dawdwadaw\\\";s:5:\\\"email\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";s:7:\\\"message\\\";s:15:\\\"dawdwadawdawdaw\\\";}s:2:\\\"id\\\";s:36:\\\"b72f9bf9-5ac9-4508-b1c1-aba33567de18\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"batchId\":null},\"createdAt\":1774514428,\"delay\":null}',0,NULL,1774514428,1774514428),(38,'default','{\"uuid\":\"8d3d9e4f-f5fc-4198-a2a2-96dffc0b47e2\",\"displayName\":\"App\\\\Notifications\\\\ContactMessageNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";}}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:44:\\\"App\\\\Notifications\\\\ContactMessageNotification\\\":2:{s:4:\\\"data\\\";a:3:{s:4:\\\"name\\\";s:9:\\\"dawdwadaw\\\";s:5:\\\"email\\\";s:26:\\\"yaman.terkawi.yt@gmail.com\\\";s:7:\\\"message\\\";s:15:\\\"dawdwadawdawdaw\\\";}s:2:\\\"id\\\";s:36:\\\"6dc3206b-bb7b-48ed-91c9-ff07736fe38b\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"batchId\":null},\"createdAt\":1774514428,\"delay\":null}',0,NULL,1774514428,1774514428);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mediable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` bigint unsigned NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_mediable_type_mediable_id_index` (`mediable_type`,`mediable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,'App\\Models\\Post',7,'public','posts','k2HP8VWxTznJXl9hATALujaE5KXe3BhH1JqJRFZl.jpg','image/jpeg',3390038,NULL,NULL,'2026-03-25 07:33:20','2026-03-25 07:33:20'),(3,'App\\Models\\Post',9,'public','posts','AW0xqJrSaju1X0OBK7RfIJSYzgbWaolQJqIO7jkg.jpg','image/jpeg',214662,NULL,NULL,'2026-03-25 09:58:53','2026-03-25 09:58:53'),(4,'App\\Models\\Post',10,'public','posts','ttHGyspZn4HIKEyPyMiZbiOYfUNtAiyeyfZ0NYFh.jpg','image/jpeg',184008,NULL,NULL,'2026-03-25 10:02:02','2026-03-25 10:02:02'),(5,'App\\Models\\Post',11,'public','posts','O1O1q3DspQ1lpyA68WFm3UIeIAscV1LBwbOEYbBA.jpg','image/jpeg',99895,NULL,NULL,'2026-03-25 10:04:20','2026-03-25 10:04:20');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2026_02_23_101322_create_roles_table',1),(4,'2026_02_23_102000_create_users_table',1),(5,'2026_02_23_102500_add_two_factor_columns_to_users_table',1),(6,'2026_03_08_110512_create_categories_table',1),(7,'2026_03_08_154915_create_posts_table',1),(8,'2026_03_08_154916_create_category_post_table',1),(9,'2026_03_15_091257_create_media_table',1),(10,'2026_03_19_090639_add_activity_columns_to_posts_table',2),(11,'2026_03_24_091026_add_is_featured_to_posts_table',3),(12,'2026_03_18_154125_add_activity_columns_to_posts_table',1),(13,'2026_03_26_083529_create_contact_messages_table',4);
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_title_index` (`title`),
  KEY `posts_is_published_index` (`is_published`),
  KEY `posts_published_at_index` (`published_at`),
  KEY `posts_created_at_index` (`created_at`),
  KEY `posts_created_by_foreign` (`created_by`),
  KEY `posts_updated_by_foreign` (`updated_by`),
  CONSTRAINT `posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,27,NULL,52,'Laravel routing uitgelegd voor beginners','laravel-routing-uitgelegd-voor-beginners','Een praktische introductie tot routes, resource controllers en route model binding in Laravel.','In dit artikel bekijken we stap voor stap hoe routing werkt in Laravel. We bespreken eenvoudige routes, routegroepen, resource routes en route model binding. Daarna tonen we hoe je een nette backendstructuur opbouwt voor een professioneel project.',0,0,NULL,'2026-03-19 07:13:31','2026-03-25 10:08:00',NULL),(2,23,NULL,52,'Wat is het verschil tussen Eloquent en Query Builder','wat-is-het-verschil-tussen-eloquent-en-query-builder','We vergelijken twee belangrijke manieren om data op te halen in Laravel.','Laravel biedt meerdere manieren om met data te werken. In dit artikel vergelijken we Eloquent en de Query Builder. We bekijken leesbaarheid, flexibiliteit, performance en typische use cases zodat je beter weet wanneer je welke aanpak gebruikt.',0,0,NULL,'2026-03-19 07:13:31','2026-03-25 10:07:52',NULL),(3,10,NULL,52,'Een blogmodule bouwen met categories en posts','een-blogmodule-bouwen-met-categories-en-posts','We bouwen een complete backendmodule met CRUD, filters en relaties.','Een goede blogmodule bestaat niet alleen uit een posts-tabel. Je hebt ook categories, many-to-many relaties, valide routes, FormRequests en een nette admininterface nodig. In dit artikel bouwen we zo een module stap voor stap op.',0,0,NULL,'2026-03-19 07:13:31','2026-03-25 10:07:27',NULL),(4,15,NULL,NULL,'Waarom slugs belangrijk zijn in een CMS','waarom-slugs-belangrijk-zijn-in-een-cms','Mensvriendelijke en SEO-vriendelijke URLs zijn een basisprincipe in contentbeheer.','Een slug zorgt voor duidelijke en stabiele URLs. In een CMS gebruik je slugs meestal voor categories en posts. We tonen hoe je ze automatisch genereert, hoe je uniciteit bewaakt en hoe je ze inzet voor route model binding.',0,0,NULL,'2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(5,35,NULL,52,'Livewire of Vue in een modern Laravel project','livewire-of-vue-in-een-modern-laravel-project','Een eerlijke vergelijking tussen twee populaire manieren om interactieve interfaces te bouwen.','Sommige projecten hebben baat bij Livewire omdat het dicht bij Laravel blijft. Andere projecten vragen een meer uitgesproken frontendlaag, waar Vue.js beter past. We bespreken de sterktes, zwaktes en typische scenario’s.',0,0,NULL,'2026-03-19 07:13:31','2026-03-25 10:07:20',NULL),(6,11,NULL,52,'AI workflows voor kleine ondernemingen','ai-workflows-voor-kleine-ondernemingen','Hoe AI-agents en automatisaties nuttig kunnen zijn voor KMO’s en zelfstandigen.','AI is niet alleen iets voor grote bedrijven. Ook kleine ondernemingen kunnen vandaag processen automatiseren met slimme workflows. Denk aan leadopvolging, contentvoorstellen, FAQ-behandeling en interne assistenten.2',0,0,NULL,'2026-03-19 07:13:31','2026-03-25 10:07:00',NULL),(7,52,52,52,'231','231','dwasd','wadasdwadawd',0,0,NULL,'2026-03-19 08:28:29','2026-03-25 09:59:07',NULL),(9,53,52,52,'Verenigde Staten neemt afscheid van Donald Trump','verenigde-staten-neemt-afscheid-van-donald-trump','Na maanden van politieke spanningen, protesten en juridische procedures lijkt er een definitief einde te komen aan de rol van Donald Trump in de Amerikaanse politiek','Na een periode van politieke spanningen, protesten en juridische druk verliest Trump zijn invloed. Analisten spreken van een belangrijk keerpunt in de Amerikaanse politiek.\r\n\r\nNa maanden van politieke spanningen, protesten en juridische procedures lijkt er een definitief einde te komen aan de rol van Donald Trump in de Amerikaanse politiek.\r\n\r\nIn verschillende grote steden kwamen duizenden mensen op straat om hun onvrede te uiten over zijn beleid en recente controverses. Tegelijkertijd hebben meerdere politieke en juridische instanties stappen ondernomen die zijn invloed aanzienlijk hebben beperkt.\r\n\r\nVolgens analisten is dit een keerpunt voor de Verenigde Staten, waarbij het politieke landschap zich mogelijk herstructureert zonder de dominante aanwezigheid van Trump.\r\n\r\nVoor- en tegenstanders blijven echter verdeeld, en experts waarschuwen dat de nasleep van deze periode nog lang voelbaar zal zijn.',1,1,'2026-03-25 09:58:00','2026-03-25 09:58:53','2026-03-25 10:03:10',NULL),(10,53,52,52,'Creatieve sector remt opmars van AI','creatieve-sector-remt-opmars-van-ai','Kunstenaars en makers verzetten zich massaal tegen AI in de kunst en cultuur. Nieuwe regels en protesten zorgen ervoor dat de groei van AI in deze sector vertraagt.','Kunstenaars en makers verzetten zich massaal tegen AI in de kunst en cultuur. Nieuwe regels en protesten zorgen ervoor dat de groei van AI in deze sector vertraagt.\r\n\r\nNa jaren van snelle opmars lijkt de groei van kunstmatige intelligentie in de creatieve sector plots te vertragen. Steeds meer artiesten, schrijvers en filmmakers spreken zich uit tegen het gebruik van AI in hun werkveld.\r\n\r\nIn verschillende Europese steden vonden de afgelopen weken protestacties plaats, waarbij kunstenaars opriepen tot strengere regels en meer bescherming van menselijk creatief werk. Volgens hen ondermijnt AI niet alleen hun inkomsten, maar ook de waarde van originele creatie.\r\n\r\nAls reactie op de toenemende druk hebben beleidsmakers binnen de Europese Unie nieuwe maatregelen voorgesteld. Die zouden bedrijven verplichten om transparanter te zijn over het gebruik van AI en om toestemming te vragen voor het gebruik van bestaand creatief materiaal.\r\n\r\nOok grote technologiebedrijven lijken hun strategie aan te passen. Sommige projecten worden tijdelijk on hold gezet, terwijl anderen meer inzetten op samenwerking met menselijke makers.\r\n\r\nExperts spreken niet van een volledige “val” van AI, maar eerder van een kantelpunt. De technologie blijft zich ontwikkelen, maar zal volgens hen in de toekomst sterker gereguleerd worden en minder vrij ingezet kunnen worden in de creatieve sector.',1,1,'2026-03-25 10:02:00','2026-03-25 10:02:02','2026-03-25 10:02:56',NULL),(11,53,52,52,'Leven in België opnieuw betaalbaarder','leven-in-belgie-opnieuw-betaalbaarder','Door lagere inflatie, dalende energieprijzen en belastingverlagingen wordt het dagelijks leven opnieuw goedkoper. Volgens de Nationale Bank van België stijgt de koopkracht voorzichtig.','Door lagere inflatie, dalende energieprijzen en belastingverlagingen wordt het dagelijks leven opnieuw goedkoper. Volgens de Nationale Bank van België stijgt de koopkracht voorzichtig.\r\n\r\nNa jaren van stijgende prijzen lijkt het leven in België opnieuw betaalbaarder te worden. Nieuwe cijfers tonen aan dat de kosten voor basisproducten, energie en belastingen de afgelopen maanden merkbaar zijn gedaald.\r\n\r\nVolgens economen is deze trend het gevolg van een combinatie van factoren. De overheid heeft recent belastingverlagingen doorgevoerd voor zowel gezinnen als kleine bedrijven, terwijl ook de energieprijzen zijn gestabiliseerd na eerdere pieken.\r\n\r\nDaarnaast hebben grote supermarktketens hun prijzen verlaagd door nieuwe afspraken met leveranciers en strengere concurrentie binnen de sector. Producten zoals voeding en dagelijkse benodigdheden zijn daardoor opnieuw toegankelijker geworden voor een breder publiek.\r\n\r\nDe Nationale Bank van België bevestigt dat de inflatie sterker is afgekoeld dan verwacht. Dit heeft geleid tot een lichte stijging van de koopkracht, wat vooral merkbaar is bij middeninkomens.\r\n\r\nToch blijven experts voorzichtig optimistisch. Ze waarschuwen dat internationale factoren, zoals grondstoffenprijzen en geopolitieke spanningen, de situatie snel opnieuw kunnen beïnvloeden.\r\n\r\nVoor veel gezinnen voelt de verandering alvast als een opluchting na een lange periode van financiële druk.',1,1,'2026-03-25 10:04:20','2026-03-25 10:04:20','2026-03-25 10:04:20',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator with full backend access.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(2,'editor','User who can create and manage own posts.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(3,'user','Basic user with limited permissions.','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('UXjoz7LuqVqkN086qVl4vlMTuZa9SD6RfAN59M97',52,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNTJxb2VJU0I4N2RyUUVmZ3ZYbHo2dWZKQ0dMVjNVWW9MdG1FWDV3VSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9nYXpldHRlbWFzdGVyLnRlc3QvY29udGFjdCI7czo1OiJyb3V0ZSI7czo3OiJjb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1774528261);
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
  `role_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,'Tom','syntraprogrammeurs@gmail.com','2026-03-19 07:13:31','$2y$12$cq8/EgGOEOIn2b5kZKzv9uX4wepPfMbFee2tBJPwLd1i1ZhBOFSaG',NULL,NULL,NULL,NULL,'2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(2,3,1,'Christine Hammes MD','jayden22@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'ZFxXq6X6yr','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(3,1,0,'Shyanne Haley','jruecker@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'J5sNLh0yAK','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(4,2,1,'Prof. Lavinia Effertz','sschneider@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'hc7yDP0OIa','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(5,2,1,'Viviane Dare','eankunding@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'FPULB39kCV','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(6,3,0,'Jesse Schneider','borer.berta@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'NBSLB8suRG','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(7,1,1,'Berneice Schaefer','derek.schneider@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'Eeve8sMx2l','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(8,2,1,'Grover Maggio','crohan@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'vzLVjf8cEs','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(9,1,1,'Theron Nitzsche','macy.walker@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'2hOQpl7BN5','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(10,1,1,'Stephon Greenholt','tyrique.jones@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'nVuRG8CE5b','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(11,3,0,'Albert Mayert','erling.reichert@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'Xt1rbaVOYe','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(12,3,0,'Jules Funk','renner.selena@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'C9xFZSs6w4','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(13,3,1,'Lillian Waelchi','brook.satterfield@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'nX1EZAuHzH','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(14,1,1,'Kane Kessler I','bergnaum.lew@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'ZF6tiY2P0L','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(15,3,0,'Jacynthe Ruecker DVM','kaci.osinski@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'jwkvC9WLmp','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(16,3,0,'Julius Zieme','genesis49@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'w7SxAFJcHr','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(17,2,0,'Mrs. Nora Fadel Jr.','hjohnston@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'NoQNTOPQJE','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(18,2,0,'Aubrey Yundt IV','kkutch@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'nrCsRung9b','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(19,2,1,'Abigail Cartwright','kayley.howell@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'87Qu4a7cfd','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(20,2,0,'Vernie Hickle','mayert.sally@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'pgq7YKmDHJ','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(21,1,1,'Willie Conn','jkulas@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'luW1xyMNDh','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(22,3,1,'Gilberto Kassulke DVM','rickey71@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'23t0xMqY49','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(23,3,0,'Valentin Bailey','una.bode@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'mBSnRau677','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(24,2,0,'Clovis Murray','harris.kaley@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'V0yfVGxSkx','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(25,1,0,'Raina Corwin','brown.gerry@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'1y2FEupDll','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(26,2,0,'Dr. Kevin Leffler','koepp.coy@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'nnqsJG16d9','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(27,2,1,'Nyah Abernathy','dean46@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'RXoVVhSd7v','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(28,1,0,'Prof. Keshaun Kshlerin','nyah.west@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'L7rFcv8AxX','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(29,3,0,'Miss Sandy Towne II','wanda.spinka@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'W02tvX0VnG','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(30,1,1,'Jillian Kerluke','mikel01@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'cBh79bQEfw','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(31,2,1,'Marlon Anderson','keagan93@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'2oLEVpk3yW','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(32,1,1,'Miss Katlyn Watsica','goyette.rosetta@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'6MnnK9kfOl','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(33,2,0,'Antoinette Mueller','lpagac@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'d9UiGyjc9R','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(34,1,1,'Dr. Tomasa Keebler','fadel.ceasar@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'MUTcgwmEgO','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(35,3,1,'Marlene Will','pmedhurst@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'5I4rxfj5TO','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(36,1,1,'Carmine Bernier','brekke.isabella@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'BzS5g2nqYk','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(37,2,0,'Lenore Olson Jr.','wwill@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'uXYNvWFe7n','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(38,3,0,'Prof. Brendon Rau','waelchi.kiley@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'HP2Cnxuosb','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(39,1,0,'Alexys Rowe','bauch.tristin@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'poNojhGaAr','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(40,3,1,'Jazmin Welch','taya.gusikowski@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'8MejTDMAzB','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(41,3,1,'Dr. Deontae Conroy PhD','karina29@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'VEL8xTYvUB','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(42,2,1,'Casimir Rodriguez','nannie.koch@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'ZTm8CbJKig','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(43,3,0,'Fannie Kshlerin','rosendo36@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'aPYX8TRn2d','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(44,2,1,'Judge Von','immanuel.johnston@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'CxaiS9Ba1n','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(45,3,1,'Mariela Streich','rchristiansen@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'b9hoL03VHU','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(46,1,1,'Norberto Beahan','lmurazik@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'wFXwj1LrwK','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(47,3,0,'Leone Gislason','njakubowski@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'J0toLZpzaW','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(48,2,0,'Mr. Jarrell Trantow III','ikub@example.com','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'s6y1ST1sU9','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(49,1,0,'Angelica Ledner','clifford.legros@example.org','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'kAxD6sPmcy','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(50,2,1,'Mr. Leopold Von','glenda.wiegand@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'xGxzdfFPio','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(51,1,0,'Oren Grady','josiah76@example.net','2026-03-19 07:13:31','$2y$12$09wESY5yC8XT6uyya90hsOAr9XIokdmnOzVrUdjdwOaB8G96RthuC',NULL,NULL,NULL,'EyVby4xL6G','2026-03-19 07:13:31','2026-03-19 07:13:31',NULL),(52,1,1,'Yaman Terkawi','yaman.terkawi.yt@gmail.com',NULL,'$2y$12$1iGqiNMJRp/qMoPC0mfXie1IP9vWREAIjJssiknlfe/Dxz64jqjm2',NULL,NULL,NULL,'7j0CdVUDJqYCyAb7ozbX5YMrne4hWK1KDNoC5rQtiARg7UPqjOZ1amyNoPft','2026-03-19 07:14:30','2026-03-19 07:14:30',NULL),(53,2,1,'Kaithy','kaithy@art.com','2026-03-25 09:50:09','$2y$12$g4a7IRf70KfjmRpoppqaBOuPQlD5dGaSfmajmqiMkyHohsf1zAhYK',NULL,NULL,NULL,NULL,'2026-03-25 09:50:09','2026-03-25 09:50:09',NULL);
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

-- Dump completed on 2026-03-26 14:38:27
