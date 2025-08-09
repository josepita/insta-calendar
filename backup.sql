/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: insta_calendar
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
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
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_cuenta` varchar(255) NOT NULL,
  `handle_instagram` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES
(1,'Alda Joyeros','@aldajoyeros',NULL,'2025-08-07 13:31:10','2025-08-07 13:31:10'),
(2,'Joyerías Sanchez','@joyeriassanchez',NULL,'2025-08-08 05:33:49','2025-08-08 05:33:49');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2025_08_07_114423_create_cuentas_table',2),
(5,'2025_08_07_114428_create_posts_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cuenta_id` bigint(20) unsigned NOT NULL,
  `instagram_id` varchar(255) NOT NULL,
  `type` enum('Video','Image','Sidecar') NOT NULL,
  `caption` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `comments_count` int(10) unsigned NOT NULL,
  `likes_count` bigint(20) unsigned NOT NULL,
  `video_play_count` int(10) unsigned NOT NULL DEFAULT 0,
  `display_url` varchar(1024) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `published_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_instagram_id_unique` (`instagram_id`),
  KEY `posts_cuenta_id_foreign` (`cuenta_id`),
  CONSTRAINT `posts_cuenta_id_foreign` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES
(156,1,'3645553065059714228','Sidecar','Empezar junio estrenando  pendientes de @aldajoyeros.es \n\nPendientes fabricados en oro amarillo de 18 kilates. Diseño contemporáneo, cargado de movimiento. Pendientes con cadena y diseño de clip, os dejo vídeo para que los veías en zoom🔎\n\nQue os parecen? \n\n#pendientes#oro#18kilates#diseñosunicos#diseñocontemporaneo#me#pendientesoriginales','https://www.instagram.com/p/DKXmzKcuIS0/',91,621,0,'/storage/posts/cuenta-1-3iNp2E3mhV.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-DVpKorwr4R.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-kU5mnjSmNX.jpg\\\"]\"','2025-06-01 16:50:12','2025-08-08 05:19:12','2025-08-08 05:19:12'),
(157,1,'3669123542647607443','Image','Certificado por los mejores especialistas… en joyas 🤭\n\nEn nuestra web tenemos el mejor remedio 💍 ¡y ahora con hasta 30% de descuento!\n\n#descuentos #rebajas #verano #joyeria','https://www.instagram.com/p/DLrWGwUiJCT/',0,3,0,'/storage/posts/cuenta-1-J5kR6Nh5Mf.jpg',NULL,'2025-07-06 17:05:00','2025-08-08 05:19:13','2025-08-08 05:19:13'),
(158,1,'3656198260064353019','Sidecar','Nuestra colección de tobilleras 🌊 ideales para lucir este verano 🏖️','https://www.instagram.com/p/DK9bPI3iXr7/',0,30,0,'/storage/posts/cuenta-1-gUgwGvBDu6.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-lDNqKvhR7a.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-H7lpGhLC6v.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-HEIxjPZq0j.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-cRzhtTiux9.jpg\\\"]\"','2025-06-16 09:20:00','2025-08-08 05:19:20','2025-08-08 05:19:20'),
(159,1,'3651371785406474952','Video','Confirmamos 🤭🧚','https://www.instagram.com/p/DKsR0sECWrI/',3,21,1433,'/storage/posts/cuenta-1-6j1QxYOeWU.jpg',NULL,'2025-06-09 17:30:00','2025-08-08 05:19:21','2025-08-08 05:19:21'),
(160,1,'3657615304831982265','Sidecar','Que la suerte te acompañe 🍀 \n\nEncuentra tu amuleto de la suerte en Alda Joyeros ✨','https://www.instagram.com/p/DLCdb2pitq5/',3,40,0,'/storage/posts/cuenta-1-EIr43cKak6.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-UTdctLjk9N.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-6vZC8089Zv.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-DkYuagM7iu.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-0gDYAnsokb.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-j9aEtuCFv7.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-mkBZ7hmbSN.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-s3YMB6N02W.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-SxkcHpbldq.jpg\\\"]\"','2025-06-18 08:15:00','2025-08-08 05:19:42','2025-08-08 05:19:42'),
(161,1,'3648834963971328737','Image','👩🏻‍🏫👨🏼‍🏫 Hay profesores que dejan huella 💖 y sus alumnos también podrán dejarla en ellos con nuestras joyas personalizadas ✨\n\nEncuentra en nuestra web ideas de regalo para profesores para este final de curso 🎓','https://www.instagram.com/p/DKjRBE_iUrh/',0,19,0,'/storage/posts/cuenta-1-kAe1zVAMRM.jpg',NULL,'2025-06-06 05:30:00','2025-08-08 05:19:44','2025-08-08 05:19:44'),
(162,1,'3667909661820514557','Sidecar','¿Qué te parece nuestra colección Adore? 💜🧡🩵\n\n#coleccion #mujer #collar #colgante #colección #nuevacoleccion #joyas','https://www.instagram.com/p/DLnCGdtCPD9/',0,8,0,'/storage/posts/cuenta-1-b5gvNuebel.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-aWXQHQv6gn.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-qGEIMtRc3r.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-KeWzn7gwTB.jpg\\\"]\"','2025-07-02 13:08:46','2025-08-08 05:19:51','2025-08-08 05:19:51'),
(163,1,'3662962982864453503','Sidecar','Te acompañamos en tu día más especial ♥️\n\nDescubre nuestra colección de alianzas de boda 💍\n\n#alianzas #boda #bodas #anillos #alianzasdebodas \n\n¿Eres team oro blanco o team oro amarillo? 🤔','https://www.instagram.com/p/DLVdWz7Cn9_/',2,21,0,'/storage/posts/cuenta-1-qLGhoJ0frZ.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-DoJzw9cKH3.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-FDiRpEHxzi.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-iiKACisDVO.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-OkAEkYPEIv.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-xPdVmHiQ0Z.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-AE3bZ6wDXL.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-NpMJdQN25U.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-i5bkX2oCQe.jpg\\\"]\"','2025-06-25 17:20:00','2025-08-08 05:19:58','2025-08-08 05:19:58'),
(164,1,'3652639884961341600','Sidecar','Un momento tan especial ✨ requiere un anillo único.\n\nEncuentra en Alda Joyeros el anillo de pedida perfecto para un momento que os acompañará toda la vida 💖','https://www.instagram.com/p/DKwyJ9zi2Cg/',2,31,0,'/storage/posts/cuenta-1-JOt7sQzfRX.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-P9gsfHIyrY.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-xyADDrk7ZY.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-NAwhEe6Pcs.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-jXBKKfA3eB.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-KJtlnffGI1.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-sQmiH3wWcT.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-8tPYjwknvr.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Tmap22GwvE.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-YtdX3FTmmp.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-s15jjLBjsE.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-nJS1gfIQIT.jpg\\\"]\"','2025-06-11 09:15:00','2025-08-08 05:20:35','2025-08-08 05:20:35'),
(165,1,'3658966542479764223','Image','📣 En Alda Joyeros nos adelantamos a las Rebajas sorteando un vale de 200 euros para gastar en nuestra web 🎁\n\nPara participar tienes que ⤵️⁣⁣ ⁣⁣⁣\n⁣\n♥️ Seguir a nuestra cuenta.\n♥️ Dar “me gusta” a esta publicación⁣⁣⁣.\n♥️ Mencionar a dos personas en comentarios⁣⁣⁣.\n♥️ Subir una historia mencionándonos.⁣⁣⁣\n⁣\n💭 Recuerda: si tu perfil es privado, envíanos una captura para contabilizar tu participación 📲⁣\n⁣⁣\n ✨ Puedes participar las veces que quieras siempre que menciones a amigos diferentes (y que no sean perfiles falsos o de famosos). Cada comentario nuevo es una oportunidad más para ganar.⁣⁣ ⁣⁣ ⁣\n⁣\n⏳ Tienes hasta el 29 de junio para participar. El ganador/a será anunciado el 30 de junio en nuestras stories 👀\n\n¡Mucha suerte! 🤞✨⁣⁣ ⁣⁣⁣','https://www.instagram.com/p/DLHQq8xi6r_/',4170,1131,0,'/storage/posts/cuenta-1-sHbaX4UCeC.jpg',NULL,'2025-06-20 05:00:00','2025-08-08 05:20:36','2025-08-08 05:20:36'),
(166,1,'3643942792143050615','Image','Últimos días de promoción ⏳\n\nConsigue 10 euros de descuento en pedidos superiores a 99 euros de graduaciones y eventos con el código AJMY10 🎟️\n\n*️⃣ Promoción válida hasta el 1 de junio.','https://www.instagram.com/p/DKR4qm7iBd3/',0,15,0,'/storage/posts/cuenta-1-XkC9ypjS8a.jpg',NULL,'2025-05-30 11:30:00','2025-08-08 05:20:38','2025-08-08 05:20:38'),
(167,1,'3635411450015244698','Sidecar','Un detalle que jamás olvidará ✨ las insignias profesionales son un regalo perfecto para Graduaciones 🎓\n\n#regalo #insignia #magisterio #derecho #ingenieria #graduación #ingeniería #graduacion #telecomunicaciones #graduacion🎓 #enfermeria #medicina #enfermería #empresariales #farmacia #periodismo','https://www.instagram.com/p/DJzk3Pai-Ga/',0,11,0,'/storage/posts/cuenta-1-FDkxQ2RokJ.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-mahPgbP9hD.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-GXIlkYimUD.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-uC3TXLTJ0C.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-yOExoaT1N2.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-PefFeD6sIa.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-byyDlNzpev.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-gU6qhx5E2F.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-tOxz5wKzAY.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-whQfVbJ48R.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Uu8Iom0t0y.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-NQy7GhRN5h.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-GraDy3d5JD.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-nuA2etHjrC.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-RoTTurq49L.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-AX281C45Ox.jpg\\\"]\"','2025-05-18 17:00:00','2025-08-08 05:21:01','2025-08-08 05:21:01'),
(168,1,'3661866877749770183','Video','Ha llegado el día 🤩 comenzamos las rebajas de verano en Alda Joyeros 🛍️ \n\nDisfruta de hasta un 30% de descuento en nuestra web del 24 de junio al 31 de agosto 📌\n\n#rebajas #verano #joyas #ofertas #joyeria','https://www.instagram.com/p/DLRkIYfCzfH/',2,29,2389,'/storage/posts/cuenta-1-IGGrTVFhLE.jpg',NULL,'2025-06-24 05:14:18','2025-08-08 05:21:03','2025-08-08 05:21:03'),
(169,1,'3633738312705521357','Sidecar','💡 Ideas de regalo para Graduaciones 🎓 descubre nuestra colección para recordar un día muy especial ✨\n\n#graduación #graduacion #joyas #regalo #graduacion🎓 #ideaspararegalar #oro #regalos','https://www.instagram.com/p/DJtob43ijbN/',0,12,0,'/storage/posts/cuenta-1-f34Z6PpO14.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Cjy766rUPy.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-m0dYOqnHqF.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-NFWD7LI28g.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-WNgFJv7aVx.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-V225cJDu1d.jpg\\\"]\"','2025-05-16 09:36:24','2025-08-08 05:21:12','2025-08-08 05:21:12'),
(170,1,'3627212647290111576','Sidecar','💚 Esmeralda, la piedra natal del mes de mayo 📆 no te pierdas nuestra amplia colección de esmeralda colombiana ✨\n\n#esmeralda #piedras #piedraspreciosas #mayo #joyeria #joyas #oro #anillo #collar #colgante','https://www.instagram.com/p/DJWcq9WiAZY/',3,11,0,'/storage/posts/cuenta-1-STpMPpsNHh.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-VWeHntZPeD.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-XDb2x073IK.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-sha47qzyDF.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-iswgkvjzfs.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-oEv7HDJ0pv.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-rIwAcxnIjd.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-BWL4SDwMOz.jpg\\\"]\"','2025-05-07 09:31:04','2025-08-08 05:21:30','2025-08-08 05:21:30'),
(171,1,'3640967864406244647','Sidecar','Un amor que deja huella 🐾\n\nCrea un recuerdo inolvidable de tu fiel compañero 🐶 con Alda Joyeros ✨\n\n#perro #perros #mascotas #doglovers #mascota #doglover #doglove #recuerdo #recuerdos #joyas #joyaspersonalizadas','https://www.instagram.com/p/DKHUPtki_0n/',0,15,0,'/storage/posts/cuenta-1-r3DzuJ4o1G.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-186MhkiqIe.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-aUV3T3p0Px.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-3yRtQLFkfj.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-v3igorkKa6.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-cgxt9zCMlL.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Hn61m0nT7N.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-ymH66p13BY.jpg\\\"]\"','2025-05-26 09:00:14','2025-08-08 05:21:50','2025-08-08 05:21:50'),
(172,1,'3625702714283511431','Sidecar','El complemento ideal para la Primera Comunión 🙏 nuestros conjuntos darán el toque perfecto en ese día tan señalado ✨\n\n#comunion #comunionniña #primeracomunion #primeracomunión #conjunto #conjuntoniña #pendientes #anillo','https://www.instagram.com/p/DJRFWiqCc6H/',0,15,0,'/storage/posts/cuenta-1-Q13leWnsSY.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-ASVNlP0L60.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-qaxeIbW0ov.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-B0k1FXSDOv.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-ECQ1txZn8G.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-aGd0Qtb1Mj.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Fh8k1PUIjh.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-wnhrNCUn0E.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-jtlNexD5yt.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-0I9KUMvrWc.jpg\\\"]\"','2025-05-05 07:31:06','2025-08-08 05:22:06','2025-08-08 05:22:06'),
(173,1,'3630811150910233468','Video','¿Necesitas inspiración? ✨ aquí te traemos 1 look de piercings para cada día de la semana ☺️\n\n#piercing #piercings #piercingideas #look #lookdeldia #lookdeldía #inspiracion #pendientes','https://www.instagram.com/p/DJjO4FAiBt8/',0,15,1558,'/storage/posts/cuenta-1-VgvIc5zhPb.jpg',NULL,'2025-05-12 09:00:21','2025-08-08 05:22:08','2025-08-08 05:22:08'),
(174,1,'3632289222566324085','Video','Tenemos nuevos piercings disponibles 💖 ¿cuál es tu favorito? ✨\n\n#piercing #novedades #joyas #piercings #look #mujer','https://www.instagram.com/p/DJoe82gi6d1/',0,12,1586,'/storage/posts/cuenta-1-MMa3Hxzi28.jpg',NULL,'2025-05-14 09:37:41','2025-08-08 05:22:11','2025-08-08 05:22:11'),
(175,1,'3647551376244564499','Sidecar','¿Sabías que la perla es la piedra natal del mes de junio? 🤍','https://www.instagram.com/p/DKetKaxC2IT/',0,23,0,'/storage/posts/cuenta-1-lgxGmGGU6e.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-SSyYA6lHY9.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-IyzOImxkUj.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-XsxaMJqvGo.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-LT3byzGG3t.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Ggaqk91AZL.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-SKzAPhxe1t.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-NrDsJMvB2w.jpg\\\"]\"','2025-06-04 11:00:00','2025-08-08 05:22:30','2025-08-08 05:22:30'),
(176,1,'3628749798754587702','Sidecar','Que tu nombre te acompañe 🌸 encuentra tu inicial y crea tu collar personalizado con Alda Joyeros 💖\n\n#collar #collarpersonalizado #joyas #joyaspersonalizadas #nombre #colgante #colgantes #joya #oro','https://www.instagram.com/p/DJb6LdNiZQ2/',0,14,0,'/storage/posts/cuenta-1-AZNSFaEnYw.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-Uyr8p3WhmF.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-jmsStH7dbZ.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-SnCEROQhfE.jpg\\\"]\"','2025-05-09 12:25:07','2025-08-08 05:22:37','2025-08-08 05:22:37'),
(177,1,'3617307005888872300','Video','Estamos preparando vuestros pedidos para el Día de la Madre ✨ pero necesitamos vuestra opinión ☺️\n\n¿Qué conjunto creéis que gustará más? 💝 dejádnoslo en los comentarios 👀\n\n#diadelamadre #díadelamadre #regalo #regalopersonalizado #joyas #joya #regalos #madre','https://www.instagram.com/p/DIzQY55ib9s/',0,64,5901,'/storage/posts/cuenta-1-BUjQ6vdida.jpg',NULL,'2025-04-23 17:30:00','2025-08-08 05:22:39','2025-08-08 05:22:39'),
(178,1,'3635834092161367903','Image','Nuevo código de descuento 🎟️⁣\n⁣\nIntroduce el código AJMY10 y consigue 10 euros de descuento en pedidos superiores a 99 euros de graduaciones y eventos 🛍️⁣\n⁣\nPromoción disponible hasta el 1 de junio ⏳⁣\n⁣\n#descuento #graduacion #graduación #hombre #mujer #joyas','https://www.instagram.com/p/DJ1E9fliH9f/',0,11,0,'/storage/posts/cuenta-1-NMJDXqECk2.jpg',NULL,'2025-05-19 07:00:20','2025-08-08 05:22:40','2025-08-08 05:22:40'),
(179,1,'3623543259907350921','Sidecar','⚡️ 35% de descuento en pendientes ⚡️ entra en nuestra web y disfruta de nuestro outlet 🛍️\n\n🌐 www.aldajoyeros.com/es/100-special-prices 🌐\n\n#outlet #pendientes #joyas #pendientes #rebajas','https://www.instagram.com/p/DJJaWWDCeGJ/',0,8,0,'/storage/posts/cuenta-1-wa1Qi2WILp.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-BAV2GrsYga.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-WLWAJrdiPK.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-yivzuEGbxC.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-kUtmR9ZOVW.jpg\\\"]\"','2025-05-02 08:00:39','2025-08-08 05:22:42','2025-08-08 05:22:42'),
(180,1,'3611992150147361645','Video','POV: recibes un pedido de Alda Joyeros por el Día de la Madre ✨ si tu pedido de la colección Madre supera los 75 euros te llevarás gratis esta tote bag personalizada 💖\n\n#diadelamadre #oro18k #joyeria #regalos #madre #totebags #díadelamadre #joyas #oro','https://www.instagram.com/p/DIgX7kxCGtt/',0,30,1773,'/storage/posts/cuenta-1-cKiQ5jFcym.jpg',NULL,'2025-04-16 09:30:00','2025-08-08 05:22:44','2025-08-08 05:22:44'),
(181,1,'3608292460277144674','Image','Este Sant Jordi regala un libro 📕 una rosa 🌹 y una joya de Alda Joyeros ✨\n\nDescubre las distintas medallas de San Jorge que tenemos disponibles en nuestra web 🌐\n\n#aldalovers #santjordi #santjordi2025 #cataluña #catalunya #medalla #oro #medallas #joyeria #oro18k','https://www.instagram.com/p/DITOuAEihxi/',2,30,0,'/storage/posts/cuenta-1-UzLOGkckQc.jpg',NULL,'2025-04-14 11:00:00','2025-08-08 05:22:47','2025-08-08 05:22:47'),
(182,1,'3618500088814965839','Video','Regala momentos tan especiales como este 💖 con Alda Joyeros, el Día de la Madre será inolvidable ✨\n\n#diadelamadre #díadelamadre #regalo #regalopersonalizado #joyas #joya #regalos #madre #sorpresa #sorpresaparamamá','https://www.instagram.com/p/DI3fqi9iRRP/',0,29,1943,'/storage/posts/cuenta-1-rgQEOFtgcU.jpg',NULL,'2025-04-25 09:00:00','2025-08-08 05:22:49','2025-08-08 05:22:49'),
(183,1,'3620553516078119026','Image','📦 Recibe tu regalo a tiempo para el Día de la Madre ✨\n\n⏳ Tienes hasta mañana para hacer tu pedido 🛍️ y asegurarte de tener todo listo para este día tan especial 💖\n\n#diadelamadre #díadelamadre #regalo #regaloparamamá #madre #mujer #regalomama #joyeria #oro','https://www.instagram.com/p/DI-yj2IILhy/',0,10,0,'/storage/posts/cuenta-1-HVVmQFFtrb.jpg',NULL,'2025-04-28 05:00:00','2025-08-08 05:22:52','2025-08-08 05:22:52'),
(184,1,'3622184361121569207','Video','Crea tu nombre en Alda Joyeros ✨ elige entre nuestras opciones de iniciales y lleva contigo el collar más especial 💖\n\n#collar #joyas #joyaspersonalizadas #moda #oro #iniciales #inicial #colgante #colgantes','https://www.instagram.com/p/DJElXw7oFm3/',2,13,1715,'/storage/posts/cuenta-1-jDrtjSwj1B.jpg',NULL,'2025-04-30 11:00:00','2025-08-08 05:22:57','2025-08-08 05:22:57'),
(185,1,'3615661245590120304','Image','Personaliza tus joyas en Alda Joyeros ✨ y logra el regalo perfecto para este Día de la Madre 💖⁣\n⁣\n#diadelamadre #joyaspersonalizadas #regalo #regalopersonalizado #díadelamadre','https://www.instagram.com/p/DItaL8Li6dw/',0,28,0,'/storage/posts/cuenta-1-bh2uRn5NiP.jpg',NULL,'2025-04-21 11:00:30','2025-08-08 05:23:00','2025-08-08 05:23:00'),
(186,1,'3642402407533209985','Sidecar','Los últimos piercings en aterrizar en nuestra web 💘\n\n¿Qué te parecen? ¡Te leemos! 👀','https://www.instagram.com/p/DKMabD-C2mB/',0,17,0,'/storage/posts/cuenta-1-HGpVU7adKc.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-9w4ZlGNzJy.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-KLUKDgxIOJ.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-3zmkA9eDhw.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-fvZrA5AkYK.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-AALrLvBnC2.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-iEf3cH7t6p.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-WvPqW9irds.jpg\\\"]\"','2025-05-28 08:30:24','2025-08-08 05:23:19','2025-08-08 05:23:19'),
(187,1,'3672773775852267040','Sidecar','Los tips que necesitabas ✨ esto es lo que debes saber para elegir las joyas adecuadas según tu tono de piel. \n\n#tips #joyeria #piel #consejos #joyería','https://www.instagram.com/p/DL4UEo6C2Yg/',1,7,0,'/storage/posts/cuenta-1-D2j8MbeWJO.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-HHY1wJDhBd.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-nhyCJo9Q6n.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-0A2OGaKGND.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-1-pZHCIgWx55.jpg\\\"]\"','2025-07-09 06:12:54','2025-08-08 05:23:23','2025-08-08 05:23:23'),
(188,2,'3662137539402277397','Image','¡ELIGE TU REGALO! 🎁🤩 \nEn compras superiores a 99€, llévate GRATIS una de estas joyas de Itemporality fabricadas en plata de primera ley con recubrimiento en oro, ¡ideales para brillar este verano 🌞✨','https://www.instagram.com/p/DLShrBysiIV/',0,13,0,'/storage/posts/cuenta-2-yERJHXhxA0.jpg',NULL,'2025-06-24 14:00:36','2025-08-08 05:40:44','2025-08-08 05:40:44'),
(189,2,'3689739844662482451','Image','Munsmawa 💛 \nUn beso, un latido, un instante eterno.\nNuestra nueva colección de gargantilla y pendientes con forma de corazón, bañados en oro, celebra ese amor profundo que no necesita palabras.\n\nPlata bañada en oro, diseñada para hablarle directo al corazón ✨','https://www.instagram.com/p/DM0ltbytlYT/',0,13,0,'/storage/posts/cuenta-2-TGLiKUnzh9.jpg',NULL,'2025-08-01 16:01:27','2025-08-08 05:40:45','2025-08-08 05:40:45'),
(190,2,'3640454743642406997','Image','Estos días de primavera combinan a la perfección con nuestra nueva colección de plata 😎❤️‍🔥 ¿Todavía no la has descubierto? \n\nJoyas fabricadas en plata de primera ley con recubrimiento en oro 18 quilates, ideales para hacerte brillar esta temporada ✨','https://www.instagram.com/p/DKFfk0nsQBV/',0,19,0,'/storage/posts/cuenta-2-xnCnPTbAnV.jpg',NULL,'2025-05-25 16:00:45','2025-08-08 05:40:46','2025-08-08 05:40:46'),
(191,2,'3633237149727170334','Image','Para destacar la energía de la primavera, las perlas se convierten en el complemento perfecto. Pequeñas o más protagonistas, ¡puedes llevarlas de mil maneras! 🌷🤍','https://www.instagram.com/p/DJr2fAePZ8e/',0,23,0,'/storage/posts/cuenta-2-I9JlmEELd5.jpg',NULL,'2025-05-15 17:00:41','2025-08-08 05:40:47','2025-08-08 05:40:47'),
(192,2,'3645528599328945133','Video','¡Se acerca fin de curso y es momento de dar las gracias! ✏️💗 Elige el regalo ideal para profesores entre nuestro catálogo de artículos personalizados en plata de primera ley. ¡Personalízalo y sorprende! ✨','https://www.instagram.com/p/DKXhPI9h3Pt/',0,22,1917,'/storage/posts/cuenta-2-mmF6HVbXPN.jpg',NULL,'2025-06-01 16:02:02','2025-08-08 05:40:49','2025-08-08 05:40:49'),
(193,2,'3643263454115803014','Image','Un detalle que destaque sin invadir, que aporte luz y elegancia y esté pensando para adaptarse a cualquier época y estilo ✨🤍','https://www.instagram.com/p/DKPeM8FvC-G/',1,19,0,'/storage/posts/cuenta-2-l3jtRdN8Fp.jpg',NULL,'2025-05-29 13:01:10','2025-08-08 05:40:50','2025-08-08 05:40:50'),
(194,2,'3636040467195603680','Video','Joyas únicas creadas desde el corazón. Encuentra toda la colección de fabricacion propia o las marcas más top en nuestra web o nuestras tiendas físicas en Granada, Motril y Jaén.\n\n#Joyas #regalos #oro18k \n#comunionespaña #trendy','https://www.instagram.com/p/DJ1z4pUI6rg/',0,48,3314,'/storage/posts/cuenta-2-BKcbFkURYk.jpg',NULL,'2025-05-19 13:51:44','2025-08-08 05:40:52','2025-08-08 05:40:52'),
(195,2,'3648426970593774988','Image','Una joya, un regalo, un recuerdo que vaya siempre contigo 🥰💗\n¿Y tú qué inicial llevarías? \n\nDescubre nuestro sello \"Ralph\", una pieza única fabricada en oro de 18 quilates y esmalte negro.','https://www.instagram.com/p/DKh0P_jMk2M/',3,16,0,'/storage/posts/cuenta-2-EztZMvDIIo.jpg',NULL,'2025-06-05 16:00:09','2025-08-08 05:40:53','2025-08-08 05:40:53'),
(196,2,'3638929317119293899','Video','El regalo perfecto para estas comuniones está en Joyerías Sánchez ✨🕊️ ¿Y tú ya tienes el tuyo?','https://www.instagram.com/p/DKAEu8dpnnL/',2,28,3474,'/storage/posts/cuenta-2-F5HaehwOti.jpg',NULL,'2025-05-23 13:30:32','2025-08-08 05:40:54','2025-08-08 05:40:54'),
(197,2,'3652051284372452072','Image','El verano ya casi está aquí y este conjunto en plata de primera ley con recubrimiento en oro 18 quilates y tréboles de nácar es tendencia esta temporada 🌞✨ ¡Corre que vuela!','https://www.instagram.com/p/DKusUsyh3Lo/',0,22,0,'/storage/posts/cuenta-2-FkUId3WDn7.jpg',NULL,'2025-06-10 16:01:01','2025-08-08 05:40:54','2025-08-08 05:40:54'),
(198,2,'3641831818806811587','Image','La delicadeza propia y natural de nuestras perlas deslumbra en este diseño clásico y atemporal que es ideal para esta temporada. 🐚💕 ¿Tu con qué los combinarías?\n\nDescubre en nuestras tiendas y web toda la nueva colección de plata de primera ley con recubrimiento en oro 18 quilates.','https://www.instagram.com/p/DKKYr5zsdvD/',1,20,0,'/storage/posts/cuenta-2-3vivY3MliZ.jpg',NULL,'2025-05-27 13:36:45','2025-08-08 05:40:57','2025-08-08 05:40:57'),
(199,2,'3646917135104572691','Image','Joyas que se complementan entre ellas y contigo 🥰💗\n¡Esta temporada no dejes de brillar! Elige tu joya ideal ✨','https://www.instagram.com/p/DKcc8_rMX0T/',0,24,0,'/storage/posts/cuenta-2-XMdCXlgNZw.jpg',NULL,'2025-06-03 14:00:22','2025-08-08 05:41:00','2025-08-08 05:41:00'),
(200,2,'3650404976875972003','Image','Oro de 18 quilates y un toque vibrante de color para no pasar nunca desapercibida ✨🩵\nDiseños con un brillo único que son inmunes al paso del tiempo.\n\n #joyas #color #colorfull #joyería #oro #elegancia','https://www.instagram.com/p/DKo1_xdAqWj/',0,23,0,'/storage/posts/cuenta-2-LkmshWuxlL.jpg',NULL,'2025-06-08 09:30:06','2025-08-08 05:41:03','2025-08-08 05:41:03'),
(201,2,'3622879214110417840','Video','Regalos aprobados por mamá 💕\nPara ella que está en los malos y en los buenos momentos y que se merece brillar más que nadie.\nCelebra su amor incondicional con una joya que perdure en el tiempo y en sus recuerdos 💘✨','https://www.instagram.com/p/DJHDXNNMqOw/',0,22,2187,'/storage/posts/cuenta-2-LWPnoIJ0fF.jpg',NULL,'2025-05-01 10:01:42','2025-08-08 05:41:05','2025-08-08 05:41:05'),
(202,2,'3626442299979683003','Image','¿Eres más de diseños sencillos o atractivos? 💍🤩\n\nEn nuestro catálogo de anillos encontrarás diseños que se adaptan a cualquier estilo, ¡elige a tus compañeros de look para Mayo! ✨💅','https://www.instagram.com/p/DJTtg7gvVS7/',0,33,0,'/storage/posts/cuenta-2-zMIx0Yy7Cv.jpg',NULL,'2025-05-06 08:00:32','2025-08-08 05:41:06','2025-08-08 05:41:06'),
(203,2,'3617820784751635270','Image','💛 Un regalo para que mamá brille 💛\nGargantillas, pendientes, pulseras y anillos en perfecta armonía.\nPorque su luz merece joyas a la altura.\n\n#DíaDeLaMadre #ConjuntoLeila #RegalosQueBrillan #JoyeríasSánchez #ParaMamáConAmor','https://www.instagram.com/p/DI1FNXwJWtG/',0,44,0,'/storage/posts/cuenta-2-dA5HEjF1cz.jpg',NULL,'2025-04-24 10:31:07','2025-08-08 05:41:07','2025-08-08 05:41:07'),
(204,2,'3678157861738505351','Image','Relajada, auténtica y con estilo 💕\nUn par de anillos dorados y esa inicial que lo dice todo.\n¿Ya sabes qué letra quieres llevar contigo?','https://www.instagram.com/p/DMLcRZou-SH/',0,12,0,'/storage/posts/cuenta-2-1BQVsInoIV.jpg',NULL,'2025-07-16 16:30:07','2025-08-08 05:41:08','2025-08-08 05:41:08'),
(205,2,'3612746871030727296','Image','💍 Plata de primera ley, diseño que marca estilo.\nNuestros anillos combinan simplicidad, tendencia y calidad para que los lleves todos los días.\n\n#Plata925 #AnillosDePlata #JoyasParaCadaDía #EstiloQueDura #JoyeríaActual','https://www.instagram.com/p/DIjDiNXMMKA/',2,36,0,'/storage/posts/cuenta-2-36Vl1eAup1.jpg',NULL,'2025-04-17 10:30:09','2025-08-08 05:41:10','2025-08-08 05:41:10'),
(206,2,'3625053836892390660','Video','Clásicos, modernos, pequeños o con más protagonismo, ¿tú qué estilo prefieres? 😉💕\nEncuentra todos nuestros modelos de aros en oro 18 quilates y plata de primera ley en nuestra web ✨','https://www.instagram.com/p/DJOx0Ifo0UE/',0,66,18228,'/storage/posts/cuenta-2-ule1xRaY9n.jpg',NULL,'2025-05-04 10:02:21','2025-08-08 05:41:13','2025-08-08 05:41:13'),
(207,2,'3663677875568455168','Image','El sol no es lo único que deslumbra esta temporada 🌞✨\nDescubre el poder de lo dorado con piezas grandes en plata de primera ley: elegancia audaz, frescura infinita 🌊\n\n #summer #verano #joyasdeplata','https://www.instagram.com/p/DLX_53oty4A/',0,15,0,'/storage/posts/cuenta-2-4sjF1O1JSh.jpg',NULL,'2025-06-26 17:00:58','2025-08-08 05:41:15','2025-08-08 05:41:15'),
(208,2,'3621383751108747974','Image','⚡ SORTEO CERRADO ⚡\n\nAyer se apagaron todas las luces ¡pero hoy volvemos a brillar! ✨\n¡Y por eso os traemos este SÚPER SORTEO EXPRÉS para mamá! 💗\n\nSorteamos este precioso conjunto recién llegado de anillo, pendientes y gargantilla, fabricado en plata de primera ley con recubrimiento en Oro 18k y valorado en 140€ .\n\n¿Cómo participar? ¡Muy fácil!\n\n1. Sigue a @joyeriassanchez ✅\n2. Dale amor a este post ❤\n3. Etiqueta a mamá o a tus amigas en comentarios las veces que quieras 😍\n¡Cada comentario es una participación!\n\n(Extra: Si quieres más posibilidades, compártelo en tu historia) ✨\n\nSorteo activo hasta mañana 30/04/25 al mediodía. ¡MUCHA SUERTE!\n\nConsulta las bases legales aquí: https://bit.ly/3EMDjgb','https://www.instagram.com/p/DJBvVWwNWLG/',3010,687,0,'/storage/posts/cuenta-2-lPp6c698NJ.jpg',NULL,'2025-04-29 08:30:06','2025-08-08 05:41:15','2025-08-08 05:41:15'),
(209,2,'3631757380005721024','Image','¡Somos fans de esta colección! 🤩❤️‍🔥 \nCon un diseño innovador y vanguardista donde la geometría juega un papel crucial, estos anillos se convierten en piezas únicas que no pasarán desapercibidas y destacarán en cualquiera de tus outfits.','https://www.instagram.com/p/DJmmBhhpPPA/',3,31,0,'/storage/posts/cuenta-2-gdPWmz5EHj.jpg',NULL,'2025-05-13 16:00:39','2025-08-08 05:41:17','2025-08-08 05:41:17'),
(210,2,'3637464977574365891','Image','Haz de cada ocasión un momento especial con nuestra colección de diamantes ✨\nAnillos, pendientes, pulseras y collares creados especialmente para brillar.\n\nCada diamante se entrega acompañado de su correspondiente certificado de calidad, ¡encuentra toda la colección en nuestra web y tiendas físicas!','https://www.instagram.com/p/DJ63x__PorD/',0,252,0,'/storage/posts/cuenta-2-5V5cFWilr1.jpg',NULL,'2025-05-21 13:00:37','2025-08-08 05:41:19','2025-08-08 05:41:19'),
(211,2,'3630111277510544479','Image','Temporada de color en Joyerías Sánchez ☘️💗🌺\nDescubre estas y muchas joyas más en plata de primera ley en nuestras tiendas y web.\n\n¿Cuál es tu color favorito? ¡A nosotros nos gustan todos! 🤩','https://www.instagram.com/p/DJgvvlHJ8xf/',0,29,0,'/storage/posts/cuenta-2-DUPp3sedcF.jpg',NULL,'2025-05-11 09:30:08','2025-08-08 05:41:21','2025-08-08 05:41:21'),
(212,2,'3611297296513573254','Image','✨ Oro de 18 quilates.\nAnillos y pulseras diseñados para acompañarte en cada momento, con la calidad y brillo que marcan la diferencia.\n\n#Oro18k #JoyasQueHablan #PulserasDeOro #AnillosConEstilo #JoyeríaAuténtica','https://www.instagram.com/p/DId58H5BSGG/',1,70,0,'/storage/posts/cuenta-2-Jfr5BODxqy.jpg',NULL,'2025-04-15 10:30:07','2025-08-08 05:41:23','2025-08-08 05:41:23'),
(213,2,'3582340068711388624','Image','Elegancia que se complementa ✨\nDescubre nuestras piezas únicas.\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DG3B0_8MNXQ/',0,30,0,'/storage/posts/cuenta-2-tvTXQ2NZNy.jpg',NULL,'2025-03-06 12:37:16','2025-08-08 05:41:24','2025-08-08 05:41:24'),
(214,2,'3597556758324055419','Image','Conjuntos de joyas perfectos para esta época de año 🌟\n\nDiseños únicos que complementan tu estilo y te acompañan en cada momento\n\nVen a descubrir el conjunto perfecto para ti. 💎\n\n#JoyeríasSánchez #Joyas #EstiloÚnico #oro18k','https://www.instagram.com/p/DHtFs-fNg17/',2,39,0,'/storage/posts/cuenta-2-FuZnl5uRYN.jpg',NULL,'2025-03-27 12:30:07','2025-08-08 05:41:25','2025-08-08 05:41:25'),
(215,2,'3591038822537806693','Image','Elegancia y carácter en cada detalle ✨\nDescubre nuestras cadenas y accesorios en oro de 18 quilates para hombre.\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #cadenas','https://www.instagram.com/p/DHV7shwAMNl/',0,28,0,'/storage/posts/cuenta-2-Xl2Li8GfvP.jpg',NULL,'2025-03-18 12:40:08','2025-08-08 05:41:26','2025-08-08 05:41:26'),
(216,2,'3585960349710653135','Image','Brilla con cada detalle ✨💖 \nLa elegancia se encuentra en los pequeños toques que reflejan tu esencia. \n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DHD4_BXI5bP/',0,277,0,'/storage/posts/cuenta-2-T8HAJ50TqE.jpg',NULL,'2025-03-11 12:30:08','2025-08-08 05:41:27','2025-08-08 05:41:27'),
(217,2,'3606369353196503655','Image','Un toque de verde, una joya con carácter ✨\n\nDiseño elegante, materiales nobles. Para quienes saben que los detalles marcan la diferencia.\n\n#Esmeralda #JoyeríaConEstilo #Oro18k #PiezasConActitud #LujoSutil','https://www.instagram.com/p/DIMZdHCIgJn/',8,194,0,'/storage/posts/cuenta-2-PzEjZ5Frn9.jpg',NULL,'2025-04-08 15:19:10','2025-08-08 05:41:30','2025-08-08 05:41:30'),
(218,2,'3588863693169088431','Image','Brilla con estilo ✨💛 \nDiseños únicos en oro de 18 quilates. \n\n#joyas #joyeriasanchez #oro18k #cadenas','https://www.instagram.com/p/DHONIOqo9ev/',0,31,0,'/storage/posts/cuenta-2-VkyKO6H9iL.jpg',NULL,'2025-03-15 12:38:33','2025-08-08 05:41:33','2025-08-08 05:41:33'),
(219,2,'3584504639155996621','Video','¡Ha dicho que sí! ♥️\nDescubre nuestras alianzas al mejor precio✨\n\n#joyeríassánchez #joyas #oro18k #alianzas #descuentos','https://www.instagram.com/p/DG-t_pQogfN/',0,30,4493,'/storage/posts/cuenta-2-sx9yfkhqJz.jpg',NULL,'2025-03-09 12:20:02','2025-08-08 05:41:35','2025-08-08 05:41:35'),
(220,2,'3614196643951472375','Video','✨ Se acerca el Día de la Madre ✨\nY no hay mejor forma de decir gracias que con una joya que dure para siempre.\nDescubre nuestras ideas para sorprenderla como se merece.\n\n#DíaDeLaMadre #JoyasConSignificado #RegalosConBrillo #JoyeríasSánchez #DetallesQueQuedan','https://www.instagram.com/p/DIoNLLnIu73/',0,36,3181,'/storage/posts/cuenta-2-gtYRh8s3mi.jpg',NULL,'2025-04-19 10:30:00','2025-08-08 05:41:38','2025-08-08 05:41:38'),
(221,2,'3601154476459133811','Image','✨ Brilla con estilo, expresa tu esencia ✨\n\nPorque cada joya cuenta una historia… ¿Cuál es la tuya? 💛\n\n#JoyasConActitud #BrillaSiempre #EstiloÚnico #DetallesQueEnamoran #joyeríasánchez #joyas','https://www.instagram.com/p/DH53uqmp4tz/',2,201,0,'/storage/posts/cuenta-2-191K9KhDyo.jpg',NULL,'2025-04-01 10:38:08','2025-08-08 05:41:39','2025-08-08 05:41:39'),
(222,2,'3596111673944970943','Image','💎 Expresión en cada detalle 💎\nEleva tu estilo con anillos que hablan por sí solos. \nDiseño, elegancia y piedras preciosas que reflejan tu esencia. ✨\n\n #joyeríassanchez #BrillaConEstilo #anillos #joyas #plata #oro18k','https://www.instagram.com/p/DHn9IOyIBa_/',0,57,0,'/storage/posts/cuenta-2-sFG3zwMeNq.jpg',NULL,'2025-03-25 12:39:00','2025-08-08 05:41:42','2025-08-08 05:41:42'),
(223,2,'3592664001254788652','Image','✨ Pendientes \"Grace\" ✨\n\nLos pendientes elaborados en oro blanco de 18 quilates y  con diamantes, son el complemento perfecto para realzar tu belleza.\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DHbtN_YIA4s/',1,39,0,'/storage/posts/cuenta-2-2tIFDnr7Nr.jpg',NULL,'2025-03-20 18:29:05','2025-08-08 05:41:44','2025-08-08 05:41:44'),
(224,2,'3627953488542366556','Video','¿Cuál es tu favorita? ✨\nTodas nuestras joyas hablan por ti, encuentra tu estilo en Joyerías Sánchez 💘','https://www.instagram.com/p/DJZFHniNPtc/',0,32,4370,'/storage/posts/cuenta-2-liKtMwysJ1.jpg',NULL,'2025-05-08 10:03:20','2025-08-08 05:41:45','2025-08-08 05:41:45'),
(225,2,'3566391409013384566','Image','🤍 Un abrazo, una joya, un momento para siempre.\n\nSan Valentín es más que un día, es la oportunidad de recordar lo especial que es esa persona. \n\nEncuentra en Joyerías Sánchez el detalle perfecto para hacerlo inolvidable. 💎✨ \n\n#SanValentín #JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes #sanvalentin2025 #anillos','https://www.instagram.com/p/DF-XhdIP2V2/',0,35,0,'/storage/posts/cuenta-2-K5unbmTt8a.jpg',NULL,'2025-02-12 12:30:08','2025-08-08 05:41:47','2025-08-08 05:41:47'),
(226,2,'3565666629958392573','Image','💕 El detalle más dulce para San Valentín.\n\nUna joya que simboliza amor, dulzura y momentos inolvidables. \n\nEste 14 de febrero, sorprende con un regalo que dure para siempre. ✨💍 \n\n#SanValentín #JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes #sanvalentin2025 #anillos','https://www.instagram.com/p/DF7yuiCIlr9/',2,46,0,'/storage/posts/cuenta-2-b1WQnsRMo7.jpg',NULL,'2025-02-11 12:30:08','2025-08-08 05:41:47','2025-08-08 05:41:47'),
(227,2,'3575264593156723566','Image','Porque los accesorios importan 🖤\n\nNueva colección disponible. \n\n#joyas #joyeriasanchez #oro18k #joyasdeplata #joyashombre #modahombre','https://www.instagram.com/p/DGd5DR1I1Nu/',0,35,0,'/storage/posts/cuenta-2-BJ2BFK7OGY.jpg',NULL,'2025-02-24 18:19:33','2025-08-08 05:41:49','2025-08-08 05:41:49'),
(228,2,'3576712556277948991','Image','Joyas que endulzan cada momento ✨\n\n#joyeriasanchez #joyas #oro18k #pendientes #regalos','https://www.instagram.com/p/DGjCR6koGI_/',0,27,0,'/storage/posts/cuenta-2-7s0NsrhoXr.jpg',NULL,'2025-02-26 18:16:24','2025-08-08 05:41:50','2025-08-08 05:41:50'),
(229,2,'3577992030432861601','Image','Brilla con cada sonrisa ✨💖\n\nDescubre en Joyerías Sánchez el anillo perfecto✨\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DGnlMtvIR2h/',0,91,0,'/storage/posts/cuenta-2-CLQjG4hhMv.jpg',NULL,'2025-02-28 12:38:30','2025-08-08 05:41:53','2025-08-08 05:41:53'),
(230,2,'3564941856350591527','Image','✨ Estilo, amor, joyas y brillo ✨ \n\nSan Valentín es la ocasión perfecta para celebrar el amor con un detalle especial. \n\nEncuentra en Joyerías Sánchez la joya que hará brillar cada momento. 💎❤️ \n\n#SanValentín #JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes #sanvalentin2025 #anillos','https://www.instagram.com/p/DF5N7sAston/',0,48,0,'/storage/posts/cuenta-2-Blm4zQUVtk.jpg',NULL,'2025-02-10 12:30:07','2025-08-08 05:41:56','2025-08-08 05:41:56'),
(231,2,'3574369354686572758','Video','Dulce tentación, puro estilo 🍓✨\nLas joyas y los placeres simples siempre van de la mano.\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DGatf2CIqjW/',1,76,25648,'/storage/posts/cuenta-2-fPku4btFGG.jpg',NULL,'2025-02-23 12:41:22','2025-08-08 05:41:58','2025-08-08 05:41:58'),
(232,2,'3572189615927619277','Image','Tu estilo, tu historia, tu joya 🖤\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DGS94eHtG7N/',2,32,0,'/storage/posts/cuenta-2-Fb1qaHHgK4.jpg',NULL,'2025-02-20 12:30:08','2025-08-08 05:42:01','2025-08-08 05:42:01'),
(233,2,'3567840941347720886','Video','💖 REGÁLATE\n\n Feliz San Valentín ❤️ \n\nPorque el amor propio también se celebra. ✨💍\n\n#SanValentín #RegálateBrillo #JoyeríasSánchez #amor #joyas','https://www.instagram.com/p/DGDhG7UIE62/',6,36,5029,'/storage/posts/cuenta-2-sWmrs3T21g.jpg',NULL,'2025-02-14 12:30:00','2025-08-08 05:42:04','2025-08-08 05:42:04'),
(234,2,'3571464838132684986','Image','Joyas para hoy, mañana y siempre 💖\nPorque cada día es una nueva oportunidad para deslumbrar.\n\n#JoyeríasSánchez #RegalaBrillo #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DGQZFkMsli6/',0,30,0,'/storage/posts/cuenta-2-pTfUBdkz6j.jpg',NULL,'2025-02-19 12:30:08','2025-08-08 05:42:06','2025-08-08 05:42:06'),
(235,2,'3580340802538363974','Video','¿Y tú? ♥️\n¿Aún no tienes tu joyita?\n\n#joyeriasanchez #joyas #oro18k #plata #anillos','https://www.instagram.com/p/DGv7P2OItxG/',1,36,4926,'/storage/posts/cuenta-2-mbzGYO8DAv.jpg',NULL,'2025-03-03 18:26:58','2025-08-08 05:42:09','2025-08-08 05:42:09'),
(236,2,'3557135430966533007','Image','✨ El complemento perfecto para cualquier ocasión.\n\nNuestras joyas están diseñadas para realzar tu estilo y acompañarte en cada momento especial.\n\nEncuentra en Joyerías Sánchez la pieza que mejor se adapte a ti💎\n\n#JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DFde9P0t1uP/',0,50,0,'/storage/posts/cuenta-2-9FmG4NhnJM.jpg',NULL,'2025-01-30 18:00:09','2025-08-08 05:42:11','2025-08-08 05:42:11'),
(237,2,'3559136898492636127','Image','💍 El amor en cada detalle ❤️\n\nLas joyas son símbolos de compromiso, cariño y momentos inolvidables. \n\nCelebra el amor con piezas únicas que reflejen vuestra historia. \n\nDescubre en Joyerías Sánchez el anillo perfecto para compartir el amor✨❤️\n\n#JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes #sanvalentin2025  #anillos','https://www.instagram.com/p/DFkmCbto5vf/',0,82,0,'/storage/posts/cuenta-2-qZD9xCbHQ9.jpg',NULL,'2025-02-02 12:16:43','2025-08-08 05:42:12','2025-08-08 05:42:12'),
(238,2,'3544649338827537236','Image','Joyas hechas para destacar 💖 \n\nDescubre nuestras colecciones en Joyerías Sánchez .\n\n¡Elige la tuya! ✨\n\n#Plata #oro18k #JoyeríasSánchez #BrillaConEstilo #joyas #diamantes','https://www.instagram.com/p/DExH8sWI3tU/',0,32,0,'/storage/posts/cuenta-2-PZeLj2Vdwf.jpg',NULL,'2025-01-13 12:32:31','2025-08-08 05:42:14','2025-08-08 05:42:14'),
(239,2,'3551895926826137553','Image','💍 Un toque especial para cada ocasión.\n\nPiezas únicas con estilo y calidad que reflejan lo mejor de ti. \n\n#Plata #oro18k #JoyeríasSánchez #BrillaConEstilo #joyas #diamantes','https://www.instagram.com/p/DFK3obVoPfR/',0,267,0,'/storage/posts/cuenta-2-d7lCBiUy1k.jpg',NULL,'2025-01-23 12:30:12','2025-08-08 05:42:16','2025-08-08 05:42:16'),
(240,2,'3602602297997141982','Image','✨ Inspiración en la naturaleza, elegancia en cada detalle ✨\n\nLos pendientes perfectos para quienes aman el brillo del oro y la armonía de las formas orgánicas.\n\n#JoyasConArte #BellezaNatural #DetallesQueDeslumbran #LujoAtemporal 💫','https://www.instagram.com/p/DH_A7PfICfe/',2,33,0,'/storage/posts/cuenta-2-vyMTQHmH7s.jpg',NULL,'2025-04-03 10:34:42','2025-08-08 05:42:18','2025-08-08 05:42:18'),
(241,2,'3547532384318868548','Image','Joyas que siempre combinan contigo ✨\n\nDescubre el equilibrio perfecto entre estilo y sofisticación en Joyerías Sánchez. 💎\n\nVisítanos y encuentra las piezas que necesitas. ✨\n\n#Plata #oro18k #JoyeríasSánchez #BrillaConEstilo #joyas #diamantes','https://www.instagram.com/p/DE7XehshUxE/',2,35,0,'/storage/posts/cuenta-2-BeEikvYDxt.jpg',NULL,'2025-01-17 12:00:37','2025-08-08 05:42:19','2025-08-08 05:42:19'),
(242,2,'3562046344386504599','Image','Díselo al oído... 💕 Ya está aquí San Valentín.\n\nEl momento perfecto para expresar lo que sientes con un detalle que dure para siempre. \nEncuentra en Joyerías Sánchez la joya ideal para sorprender a quien más quieres. ✨ 💍\n\n #SanValentín #JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes #sanvalentin2025 #anillos','https://www.instagram.com/p/DFu7kcWoueX/',0,50,0,'/storage/posts/cuenta-2-aZAGQeci8n.jpg',NULL,'2025-02-06 12:37:16','2025-08-08 05:42:23','2025-08-08 05:42:23'),
(243,2,'3555519796833709696','Image','💎 Tu anillo ideal, más cerca que nunca.\n\nEs la última semana de rebajas, y en Joyerías Sánchez tenemos los diseños perfectos para cada ocasión. \n\nNo esperes más, ¡las rebajas están a punto de terminar!\n\n#JoyeríasSánchez #NuevaColección #Joyas #oro18k #diamantes','https://www.instagram.com/p/DFXvmrSJG6A/',1,125,0,'/storage/posts/cuenta-2-7Ieg0of2P9.jpg',NULL,'2025-01-28 12:30:11','2025-08-08 05:42:25','2025-08-08 05:42:25'),
(244,2,'3554068413408226870','Video','✨Últimos días para aprovechar las rebajas ✨\n\nHoy @lorenafdezz29 comparte con nosotros sus piezas favoritas de Joyerías Sánchez. \n\nNo esperes más y encuentra las tuyas antes de que acaben.\n\n#joyeríassánchez #rebajas #joyeríassánchez #oro18k #diamantes #descuentos','https://www.instagram.com/p/DFSlmRIoi42/',3,85,8664,'/storage/posts/cuenta-2-6YJlGgd9df.jpg',NULL,'2025-01-26 12:28:22','2025-08-08 05:42:27','2025-08-08 05:42:27'),
(245,2,'3550442841174262802','Image','💎 Siempre la mejor opción para ti.\n\nEn Joyerías Sánchez, trabajamos para que encuentres joyas versátiles y de calidad que realcen tu estilo personal. \n\nDesde anillos hasta collares, nuestras piezas están pensadas para acompañarte en cada ocasión.\n\n#Plata #oro18k #JoyeríasSánchez #BrillaConEstilo #joyas #diamantes','https://www.instagram.com/p/DFFtPP3hUQS/',0,40,0,'/storage/posts/cuenta-2-lc15wckUvQ.jpg',NULL,'2025-01-21 12:23:10','2025-08-08 05:42:29','2025-08-08 05:42:29'),
(246,2,'3546097685275344527','Sidecar','✨ Detalles que brillan como tú.\n\nNuestras joyas en Joyerías Sánchez son el complemento que necesitas.\n\n#Plata #oro18k #JoyeríasSánchez #BrillaConEstilo #joyas #diamantes','https://www.instagram.com/p/DE2RQ6Fq_6P/',0,37,0,'/storage/posts/cuenta-2-NB2mnEgwBE.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-2-nxRAk2mlsX.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-2-PhHf9YYG2L.jpg\\\"]\"','2025-01-15 12:30:07','2025-08-08 05:42:37','2025-08-08 05:42:37'),
(247,2,'3549000093277577188','Video','💎 Cada joya tiene algo especial.\n\nEn Joyerías Sánchez, diseñamos pensando en lo que realmente importa: tú. \n\nVen a descubrir nuestras colecciones y encuentra esa joya que se convertirá en tu favorita para cualquier momento.\n\n#Plata #oro18k #JoyeríasSánchez #BrillaConEstilo #joyas #diamantes','https://www.instagram.com/p/DFAlMgLo1_k/',0,46,2522,'/storage/posts/cuenta-2-yQeXJi1Mal.jpg',NULL,'2025-01-19 12:37:11','2025-08-08 05:42:40','2025-08-08 05:42:40'),
(248,2,'3526528736448308296','Image','🎁💎 Estas Navidades, regala Joyerías Sánchez.\nHaz que cada detalle cuente con nuestras joyas únicas. Oro, plata y piedras preciosas que brillarán tanto como estas fechas. ✨🎄\n\n#NavidadDeBrillo #JoyeríasSánchez #RegalosConEstilo','https://www.instagram.com/p/DDwvzOSNWRI/',0,29,0,'/storage/posts/cuenta-2-Un8aABswG4.jpg',NULL,'2024-12-19 12:30:07','2025-08-08 05:42:42','2025-08-08 05:42:42'),
(249,2,'3528704123616625923','Video','💎✨ 99 problemas, pero encontrar el regalo perfecto no será uno.\nDescubre en Joyerías Sánchez joyas únicas que harán brillar tu Navidad. 🎄💖\n\n#Navidad #Regalos #JoyeríasSánchez #joyas #Christmas','https://www.instagram.com/p/DD4ebRdoAUD/',0,29,2495,'/storage/posts/cuenta-2-8xIJXIgrLX.jpg',NULL,'2024-12-22 12:33:13','2025-08-08 05:42:43','2025-08-08 05:42:43'),
(250,2,'3541917363314239753','Image','💎 El anillo perfecto para cada ocasión.\nDescubre nuestras colecciones en Joyerías Sánchez y encuentra el que va contigo.\n\n#joyeríassánchez #joyas #oro18k #diamantes #anillos','https://www.instagram.com/p/DEnaxN4IikJ/',0,150,0,'/storage/posts/cuenta-2-5EcHueF4qA.jpg',NULL,'2025-01-09 18:04:35','2025-08-08 05:42:45','2025-08-08 05:42:45'),
(251,2,'3530122434998927271','Image','💖 Esta Navidad, brilla con quienes más quieres.\nEn Joyerías Sánchez, celebramos los abrazos, las sonrisas y los momentos únicos que iluminan estas fiestas. 🎄✨ \n¡Feliz Navidad!\n\n#Navidad #Regalos #JoyeríasSánchez #joyas #Christmas','https://www.instagram.com/p/DD9g6a3v3-n/',1,33,0,'/storage/posts/cuenta-2-yWOHomJiEz.jpg',NULL,'2024-12-24 11:30:09','2025-08-08 05:42:48','2025-08-08 05:42:48'),
(252,2,'3525079204381046762','Image','✨ ¿Buscas el regalo perfecto?\n\nEl Colgante Rizado Oro 18k \"Constanza\" es una joya única que combina elegancia y estilo. \n\n¡Haz que brille esta Navidad! 🎄💖\n\n#RegaloPerfecto #Navidad #JoyeríasSánchez #oro18k #colgante','https://www.instagram.com/p/DDrmNwWP7fq/',0,37,0,'/storage/posts/cuenta-2-IFzmJYIRup.jpg',NULL,'2024-12-17 12:30:09','2025-08-08 05:42:50','2025-08-08 05:42:50'),
(253,2,'3536673112563254427','Image','🎁✨ El mejor regalo siempre es el que te saca una sonrisa.\nEn Joyerías Sánchez, te ayudamos a encontrar ese detalle especial que hará brillar cualquier ocasión. 💎\n\n#Navidad #Regalos #JoyeríasSánchez #joyas #Christmas #diamantes','https://www.instagram.com/p/DEUyXUxAgSb/',0,35,0,'/storage/posts/cuenta-2-PsjReKz8RT.jpg',NULL,'2025-01-02 12:25:10','2025-08-08 05:42:52','2025-08-08 05:42:52'),
(254,2,'3523651615055680095','Video','🎁✨ La magia de la Navidad comienza con el regalo perfecto.\n\nEn Joyerías Sánchez, tenemos las joyas que harán inolvidables estas fiestas. \n\nHaz brillar a quienes más quieres. 💎🎄\n\nGracias @lacasualgranada @hotelcoloncentro por cedernos estos maravillosos espacios ♥️\n\n#regalos #Navidad #JoyeríasSánchez #joyas','https://www.instagram.com/p/DDmhnmLoBJf/',3,47,4665,'/storage/posts/cuenta-2-bSVqT39fX2.jpg',NULL,'2024-12-15 13:15:18','2025-08-08 05:42:53','2025-08-08 05:42:53'),
(255,2,'3564213303479863618','Video','Este Febrero tu cita es con Joyerías Sánchez ♥️ \n\n#sanvalentinesday #sanvalentin #joyas #joyasamor #sanvalentinjewerly #joyeríassánchez #oro18k','https://www.instagram.com/p/DF2oR2Ro4lC/',1,57,4743,'/storage/posts/cuenta-2-kG5GsJhUwd.jpg',NULL,'2025-02-09 12:24:04','2025-08-08 05:42:54','2025-08-08 05:42:54'),
(256,2,'3533781422661762782','Video','Finalizamos este año celebrando los recuerdos que hemos compartido.🎁\n\nEn Joyerías Sánchez, seguimos brillando junto a vosotros y brindando por un futuro lleno de felicidad.🎄\n\n#joyeríassánchez #oro18k #joyas #diamantes #platadeley','https://www.instagram.com/p/DEKg3sroP7e/',2,42,3335,'/storage/posts/cuenta-2-rRKiYzYh8g.jpg',NULL,'2024-12-29 12:41:43','2025-08-08 05:42:57','2025-08-08 05:42:57'),
(257,2,'3521455345932735768','Image','✨ Es momento de brillar, esta Navidad.\nDéjate envolver por la magia de nuestras joyas y encuentra el regalo ideal para los que más quieres. 💛🎁\n\nGracias @lacasualgranada @wildfoodworld @hotelcoloncentro por prestarnos estos maravillosos espacios♥️\n\n#RegalaBrillo #Navidad #JoyeríasSánchez #joyas #oro18k','https://www.instagram.com/p/DDeuPrKuJUY/',1,31,0,'/storage/posts/cuenta-2-ZbyfdJN7eN.jpg',NULL,'2024-12-12 12:30:12','2025-08-08 05:42:58','2025-08-08 05:42:58'),
(258,2,'3516404092952107284','Image','💎✨ Pendientes \"Marizza\": elegancia en su máxima expresión.\nDiseñados en oro de 18k, Aguamarina y Circonitas, son el toque perfecto para tus momentos más especiales. 💖\n\n#PendientesMarizza #Oro18K #JoyeríasSánchez #oro18k','https://www.instagram.com/p/DDMxuRPI9kU/',1,28,0,'/storage/posts/cuenta-2-bg8rNtXA5d.jpg',NULL,'2024-12-05 13:14:16','2025-08-08 05:42:58','2025-08-08 05:42:58'),
(259,2,'3513483147182497628','Video','⏳ ¡El Black Friday está a punto de terminar! 🖤\nNo dejes pasar las joyas de oro, diamantes y plata al mejor precio. 💎\nÚltimas horas para brillar con descuentos increíbles.\n\n#UltimasHoras #BlackFriday2024\n#JoyeríasSánchez #oro18k \n#diamantes  #plata','https://www.instagram.com/p/DDCZk6gIl9c/',2,36,3709,'/storage/posts/cuenta-2-MUDUc5qdPz.jpg',NULL,'2024-12-01 12:30:00','2025-08-08 05:42:59','2025-08-08 05:42:59'),
(260,2,'3520187017038832905','Sidecar','💚 Esmeraldas y oro 18k: la combinación perfecta.\nPiezas exclusivas que capturan la esencia de la elegancia y el lujo. \nBrilla con un diseño tan único como tú. ✨\n\n#JoyeríaDeEnsueño #Oro18kEsmeraldas #JoyeríasSánchez #esmeraldas #oro18k','https://www.instagram.com/p/DDaN3D1iqUJ/',2,527,0,'/storage/posts/cuenta-2-opctMk2ZzI.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-2-xparqilY1J.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-2-doHYgH8F1h.jpg\\\"]\"','2024-12-10 18:30:15','2025-08-08 05:43:05','2025-08-08 05:43:05'),
(261,2,'3514932376153447997','Image','💎 Plata de Primera Ley: donde calidad y diseño se encuentran. \nDesde lo clásico hasta lo moderno, nuestras joyas de plata son perfectas para cualquier ocasión. \n¡Elige la tuya! ✨\n\n#Plata #JoyeríasSánchez #BrillaConEstilo #joyas #navidad2024','https://www.instagram.com/p/DDHjF-KJV49/',2,29,0,'/storage/posts/cuenta-2-OsgviYRbT4.jpg',NULL,'2024-12-03 12:30:13','2025-08-08 05:43:07','2025-08-08 05:43:07'),
(262,2,'3506235040333995053','Image','💖 Plata de Primera Ley: sofisticación al alcance de todos. \nDescubre joyas que iluminan tu estilo y se convierten en tus favoritas en cualquier ocasión. 💍✨\n\n#JoyasDePlata925 #EstiloNatural #JoyeríasSánchez #PlataDeLey','https://www.instagram.com/p/DCopjE-Ipwt/',0,35,0,'/storage/posts/cuenta-2-tajnNQQQxM.jpg',NULL,'2024-11-21 12:30:10','2025-08-08 05:43:09','2025-08-08 05:43:09'),
(263,2,'3508598030587004567','Video','✨ La elegancia de la plata, el brillo que te acompaña siempre. \nDescubre en Joyerías Sánchez joyas de plata diseñadas para realzar tu estilo en cada momento. 💍💖\n\n#JoyasDePlata #JoyeríasSánchez #BrillaConEstilo','https://www.instagram.com/p/DCxC1HIxgaX/',5,65,17974,'/storage/posts/cuenta-2-rb5FXXcY8t.jpg',NULL,'2024-11-24 18:46:08','2025-08-08 05:43:12','2025-08-08 05:43:12'),
(264,2,'3511309980903327267','Image','💛 ¡Nuevas cadenas de oro, nuevos estilos!\nNuestra última colección está pensada para destacar contigo en cualquier ocasión. \n\nEncuentra la tuya en Joyerías Sánchez. ✨\n\n#Joyas #CadenasDeOro #JoyeríasSánchez #oro18k #cadenas','https://www.instagram.com/p/DC6rdLsBsYj/',2,35,0,'/storage/posts/cuenta-2-yUzFvW71vt.jpg',NULL,'2024-11-28 12:33:10','2025-08-08 05:43:14','2025-08-08 05:43:14'),
(265,2,'3508406159279299487','Video','✨ Anoche compartimos una velada inolvidable junto a todo el equipo de Joyerías Sánchez. \n\nUn momento especial lleno de emociones, trabajo en equipo y pasión por la joyería. ♥️✨\n\n¡Gracias por ser parte de esta historia!\n\n#JoyeríasSánchez #EquipoÚnico\n#MomentosEspeciales','https://www.instagram.com/p/DCwXNBDopuf/',2,81,5592,'/storage/posts/cuenta-2-vwHehfhBPZ.jpg',NULL,'2024-11-24 12:35:37','2025-08-08 05:43:16','2025-08-08 05:43:16'),
(266,2,'3559868279464011481','Image','✨Sorteo CERRADO 🛑de San Valentín de Joyerías Sánchez✨\n\nGANADOR: @viajeconsombrero \n\n¡Sorteamos dos Alianzas!\nFabricadas en ORO AMARILLO pulido de 18k, FABRICACIÓN PROPIA\nCon 2.5mm de grosor media caña, interior plano.\n\n¿Cómo participar? ¡Muy fácil!\n\n1. Sigue a @joyeriassanchez ✅ \n\n2. Dale amor a este post ❤\n\n3. Etiqueta a tus amigos en comentarios las veces que quieras 😍\n¡Cada comentario es una participación!\n\n(Extra: Si quieres más posibilidades, compártelo en tu historia) ✨\n\nSorteo activo hasta el día 09/02/25, anunciaremos a los ganadores el Lunes 10/02/25, MUCHA SUERTE!\n\nConsulta las bases legales aquí: https://epr.ms/3L34TUR \n\n#SORTEO #concurso #regalo #sanvalentin\n#Febrero #Enamorados #brillo #shine #gift #jewelry #joyas','https://www.instagram.com/p/DFnMVbUoibZ/',8308,1353,0,'/storage/posts/cuenta-2-OkFRcCCTUz.jpg',NULL,'2025-02-03 12:29:50','2025-08-08 05:43:19','2025-08-08 05:43:19'),
(267,2,'3522916273201802074','Image','💍✨ Nueva colección, nuevas joyas.\nDescubre nuestro nuevos  anillos de plata de primera ley . Diseños únicos pensados para acompañarte en cada momento especial. 💖\n\n#NuevaColección #PlataDePrimeraLey #JoyeríasSánchez','https://www.instagram.com/p/DDj6a9touta/',1,914,0,'/storage/posts/cuenta-2-Hy3uGmp1mx.jpg',NULL,'2024-12-14 12:52:48','2025-08-08 05:43:22','2025-08-08 05:43:22'),
(268,2,'3509858922338414656','Image','✨ Aprovecha el Black Friday y brilla como nunca.\nConsigue joyas de oro y diamantes con descuentos únicos que no querrás dejar escapar. \n¡Solo en Joyerías Sánchez! 💛💎\n\n#BlackFriday2024 #OfertasDeLujo #JoyeríasSánchez #oro18k #diamantes','https://www.instagram.com/p/DC1hhgFt3BA/',0,26,0,'/storage/posts/cuenta-2-59TYRZtOob.jpg',NULL,'2024-11-26 12:30:10','2025-08-08 05:43:25','2025-08-08 05:43:25'),
(269,2,'3535226057066402893','Image','💎 Hoy brindamos para despedir un año inolvidable.\nGracias por confiar en Joyerías Sánchez para hacer brillar vuestros momentos. 🥂✨ ¡Por un nuevo año lleno de luz y felicidad!\n\n#Navidad #Regalos #JoyeríasSánchez #joyas #Christmas #diamantes','https://www.instagram.com/p/DEPpV5UJdRN/',0,35,0,'/storage/posts/cuenta-2-KmtHofokVR.jpg',NULL,'2024-12-31 12:30:08','2025-08-08 05:43:26','2025-08-08 05:43:26'),
(270,2,'3491015168882041226','Image','✨ La combinación perfecta: oro y piedras preciosas. \nPiezas que reflejan sofisticación y belleza natural, ideales para hacer de cada ocasión algo especial. \nDescúbrelas en Joyerías Sánchez. 💍\n\n#JoyasQueBrillan #JoyeríasSánchez #OroYPiedrasPreciosas #oro18k','https://www.instagram.com/p/DByk8zGtuGK/',0,28,0,'/storage/posts/cuenta-2-HXyyxHgce7.jpg',NULL,'2024-10-31 12:31:00','2025-08-08 05:43:27','2025-08-08 05:43:27'),
(271,2,'3483021535745258182','Video','💎 La espera ha terminado. Nueva temporada, nuevas joyas que elevan tu estilo. \nEn Joyerías Sánchez, siempre encontrarás la pieza perfecta para ti. ✨\n\n#JoyeríasSánchez #NuevaColección #JoyasQueInspiran #oro18k #diamantes','https://www.instagram.com/p/DBWLaIHIbLG/',12,51,5924,'/storage/posts/cuenta-2-LGoouozC44.jpg',NULL,'2024-10-20 10:49:46','2025-08-08 05:43:29','2025-08-08 05:43:29'),
(272,2,'3494082479202260338','Image','✨ Descubre la perfección del oro blanco. Tanto la Gargantilla Only con circonita como la Gargantilla “Hugo” en Oro Blanco 18k son símbolos de elegancia que no pasan desapercibidos. Encuentra tu favorita en Joyerías Sánchez. 💎\n#OroBlanco #GargantillasDeLujo #JoyeríasSánchez','https://www.instagram.com/p/DB9eYCcxFVy/',0,50,0,'/storage/posts/cuenta-2-dZW9uA88Eg.jpg',NULL,'2024-11-04 18:05:11','2025-08-08 05:43:30','2025-08-08 05:43:30'),
(273,2,'3489568595826976685','Image','💎 Tres pendientes, un mismo propósito: que brilles. \n\nCon los pendientes Caba, Lovelace y Parks, tienes opciones para cada look y ocasión. \n\nEncuentra el par que te represente en Joyerías Sánchez. ✨\n\n#PendientesExclusivos #JoyasConHistoria #JoyeríasSánchez #pendientes #oro18k','https://www.instagram.com/p/DBtcCY9oCet/',0,33,0,'/storage/posts/cuenta-2-vOvccd4IfU.jpg',NULL,'2024-10-29 12:36:56','2025-08-08 05:43:32','2025-08-08 05:43:32'),
(274,2,'3529615673611638679','Video','¿Buscas ideas para regalar esta Navidad?🎁🎄\n\nHoy, @lorenafdezz29 visita nuestra tienda en el @nevadashopping para mostrarte las joyas que harán brillar tus regalos 🎁 \n\n¡Descúbrelo con nosotros!\n\n#regalos #Navidad #JoyeríasSánchez #joyas','https://www.instagram.com/p/DD7tsEjRdeX/',6,55,5101,'/storage/posts/cuenta-2-Hsm4bbSCF8.jpg',NULL,'2024-12-23 19:08:40','2025-08-08 05:43:35','2025-08-08 05:43:35'),
(275,2,'3532312113226877162','Image','🎄 Navidad y diamantes: el dúo perfecto para deslumbrar estas fiestas.\n\nEncuentra en Joyerías Sánchez el regalo que hará brillar tus momentos más especiales. 💎❤️\n\n#Navidad #Regalos #JoyeríasSánchez #joyas #Christmas #diamantes','https://www.instagram.com/p/DEFSybosojq/',0,37,0,'/storage/posts/cuenta-2-5UsTv7qJK4.jpg',NULL,'2024-12-27 12:00:39','2025-08-08 05:43:37','2025-08-08 05:43:37'),
(276,2,'3495363399064640013','Image','✨ La magia del oro. Regálate una pieza que no solo resalte tu estilo, sino que dure toda la vida. \n\nDescubre nuestras joyas de oro en Joyerías Sánchez y déjate enamorar. 💛💎\n\n#BrillaConOro #JoyeríasSánchez #EstiloEterno #oro18k','https://www.instagram.com/p/DCCBn4CJloN/',0,42,0,'/storage/posts/cuenta-2-jmi6g1CMAf.jpg',NULL,'2024-11-06 12:30:09','2025-08-08 05:43:39','2025-08-08 05:43:39'),
(277,2,'3500430153360727920','Image','💎 Un anillo de diamantes es para siempre. \nEn Joyerías Sánchez te ofrecemos diseños exclusivos para momentos inolvidables. ¡Descubre el tuyo y deja que hable por ti! ✨\n\n#Anillos #JoyeríasSánchez #diamantes','https://www.instagram.com/p/DCUBq2sId9w/',2,37,0,'/storage/posts/cuenta-2-vZU092YSBf.jpg',NULL,'2024-11-13 12:16:54','2025-08-08 05:43:41','2025-08-08 05:43:41'),
(278,2,'3538850066659851754','Video','✨Siempre perfecta, siempre tú, siempre Joyerías Sánchez\n\nEl complemento ideal para cada momento de tu vida\n\n#joyeríassánchez #joyas #oro18k #diamantes #navidad','https://www.instagram.com/p/DEchWLQoL3q/',0,50,5902,'/storage/posts/cuenta-2-7Aj18VZRLW.jpg',NULL,'2025-01-05 12:30:00','2025-08-08 05:43:45','2025-08-08 05:43:45'),
(279,2,'3496979469789388092','Image','✨Para quienes buscan lo mejor, oro de 18 quilates. Encuentra en Joyerias Sánchez piezas que resalten tu estilo y te acompañen toda la vida.\n#JoyasDeOro18K #JoyeríasSánchez\n#oro18k #joyas','https://www.instagram.com/p/DCHxEzLoV08/',2,47,0,'/storage/posts/cuenta-2-a5HG4KM7XQ.jpg',NULL,'2024-11-08 18:00:00','2025-08-08 05:43:47','2025-08-08 05:43:47'),
(280,2,'3485376711638639499','Video','🎉 ¡Hoy salimos a la calle! 🎉\nCon motivo del inicio de los Golden Days, hemos estado regalando premios exclusivos de Joyerías Sánchez para quienes han tenido la suerte de encontrarnos por la calle. \n¡No te pierdas nuestras super ofertas de estos dias! 💎✨\n\n#GoldenDays #JoyeríasSánchez #SorpresasDeOro #PremiosExclusivos','https://www.instagram.com/p/DBei6clo-OL/',12,77,5197,'/storage/posts/cuenta-2-yNMnduzMkP.jpg',NULL,'2024-10-23 16:50:27','2025-08-08 05:43:50','2025-08-08 05:43:50'),
(281,2,'3504785479678716358','Image','✨ Diseño, calidad y exclusividad. \nEn Joyerías Sánchez te ofrecemos alta joyería que destaca por su detalle y distinción. Déjate deslumbrar. 💎\n\n#AltaJoyería #JoyeríasSánchez #LujoQueInspira #joyas #diamantes','https://www.instagram.com/p/DCjf9MaMmnG/',1,712,0,'/storage/posts/cuenta-2-L2fFdQbxMN.jpg',NULL,'2024-11-19 12:30:09','2025-08-08 05:43:53','2025-08-08 05:43:53'),
(282,2,'3501161599378811556','Image','💛 Oro y piedras preciosas: una mezcla que nunca pasa de moda. \nEn Joyerías Sánchez tenemos joyas que combinan la calidez del oro con el brillo de las gemas, para que siempre luzcas radiantes. ✨\n\n#Joyas #piedraspreciosas  #JoyeríasSánchez #oro18k','https://www.instagram.com/p/DCWn-y4Nmqk/',0,38,0,'/storage/posts/cuenta-2-Sr4EGJaLCk.jpg',NULL,'2024-11-14 12:30:09','2025-08-08 05:43:54','2025-08-08 05:43:54'),
(283,2,'3465617416069730604','Image','Nuevas oportunidades para elevar tu estilo. ✨\nDescubre nuestros aros de Joyerías Sánchez que harán brillar cada uno de tus looks esta temporada. 💎\n\n#Estilo #JoyeríasSánchez #joyeria #oro18k','https://www.instagram.com/p/DAYWK2kPlEs/',0,64,0,'/storage/posts/cuenta-2-aS2s9LVMMk.jpg',NULL,'2024-09-26 10:30:12','2025-08-08 05:43:55','2025-08-08 05:43:55'),
(284,2,'3460544037680472810','Image','✨ No es solo una joya, es una expresión de tu estilo. \nOro de 18k y piedras preciosas en Joyerías Sánchez. 💍\n\n#joyeriasanchez #Diamantes #AltaJoyería #Elegancia','https://www.instagram.com/p/DAGUnevimLq/',0,33,0,'/storage/posts/cuenta-2-pse2ZZGo0J.jpg',NULL,'2024-09-19 10:30:18','2025-08-08 05:43:57','2025-08-08 05:43:57'),
(285,2,'3480837752334487741','Image','Los Pendientes Bride de oro 18k con aguamarina y diamantes son la combinación perfecta de lujo y delicadeza. 💎💧\nIdeal para ocasiones especiales. \n\n#JoyeríasSánchez #PendientesBride #Elegancia #oro18k #pendientes #diamantes','https://www.instagram.com/p/DBOa35UqpC9/',0,33,0,'/storage/posts/cuenta-2-YXd8Gage3b.jpg',NULL,'2024-10-17 10:30:18','2025-08-08 05:44:00','2025-08-08 05:44:00'),
(286,2,'3472865379999717131','Video','¿Con cuál te quedas?✨\nEn Joyerías Sánchez tenemos los pendientes que más se adapten a tu estilo. ✨\n\n#joyeriasanchez #tendencias #oro18 #joyas #pendientes','https://www.instagram.com/p/DAyGKm_opcL/',1,29,4243,'/storage/posts/cuenta-2-ErO75jWHw2.jpg',NULL,'2024-10-06 10:30:00','2025-08-08 05:44:01','2025-08-08 05:44:01'),
(287,2,'3470690849883780688','Image','Elige tus joyas en Joyerías Sánchez para acompañarte esta temporada. \nDiamantes naturales, oro de 18 quilates y plata de primera ley💎✨\n\n📍 @fincalamarquesa_ \n\n #JoyeríasSánchez #joyas #oro18k #platadeley #diamantes','https://www.instagram.com/p/DAqXvCAhXZQ/',4,1062,0,'/storage/posts/cuenta-2-yARORG04RA.jpg',NULL,'2024-10-03 10:30:12','2025-08-08 05:44:03','2025-08-08 05:44:03'),
(288,2,'3479388352497463152','Image','💍El Anillo Pantera Oro 18k \"Wakan\"\nAtrévete a brillar y muestra tu lado salvaje con esta pieza de Joyerías Sánchez. 🐆✨\n\n#JoyeríasSánchez #AnilloPantera #oro18k #anillo #joya','https://www.instagram.com/p/DBJRUWiPi9w/',0,30,0,'/storage/posts/cuenta-2-iSmZ7aSFyp.jpg',NULL,'2024-10-15 10:30:35','2025-08-08 05:44:06','2025-08-08 05:44:06'),
(289,2,'3464167894123038704','Sidecar','💍 Piedras preciosas y oro de 18k: la combinación perfecta para momentos especiales. \nElige Joyerías Sánchez. \n\n📍 @fincalamarquesa_ \n\n#joyeriasanchez #AltaJoyería #Elegancia','https://www.instagram.com/p/DATMliDhEfw/',0,266,0,'/storage/posts/cuenta-2-ZGeYwe98C6.jpg','\"[\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-2-9xd7tt2J94.jpg\\\",\\\"\\\\\\/storage\\\\\\/posts\\\\\\/cuenta-2-j9gbOORjaK.jpg\\\"]\"','2024-09-24 10:30:15','2025-08-08 05:44:13','2025-08-08 05:44:13'),
(290,2,'3472140924613849507','Image','Piezas únicas de Joyerías Sánchez. \nPerfectas para acompañarte en tu día a día. ✨💎\n\n #JoyeríasSánchez #JoyasDeTemporada #oro18k #anillo #pulsera','https://www.instagram.com/p/DAvhcZVtHGj/',0,131,0,'/storage/posts/cuenta-2-D3q2mGMZ0S.jpg',NULL,'2024-10-05 10:31:14','2025-08-08 05:44:15','2025-08-08 05:44:15'),
(291,2,'3498268914694199090','Video','✨ Oro, plata, diamantes y gemas preciosas. \nEncuentra en Joyerías Sánchez la joya perfecta para ti o para esa persona especial💎\n#LujoAsequible #JoyeríasSánchez #oro18k #diamantes','https://www.instagram.com/p/DCMWQsVI5cy/',4,34,3681,'/storage/posts/cuenta-2-mySBALyUSy.jpg',NULL,'2024-11-10 12:43:56','2025-08-08 05:44:17','2025-08-08 05:44:17'),
(292,2,'3474481839838629740','Image','Los pendientes y anillos de Joyerías Sánchez son el toque perfecto para cualquier look. \n¡Deja que tus accesorios hablen por ti!✨\n\n#EstiloDeOtoño #PendientesYAnillos\n#JoyeríasSánchez #oro18k','https://www.instagram.com/p/DA31tMiII9s/',0,31,0,'/storage/posts/cuenta-2-QO0kpsKtZt.jpg',NULL,'2024-10-08 16:02:13','2025-08-08 05:44:20','2025-08-08 05:44:20'),
(293,2,'3467791933380813355','Video','🌟 ¿Un secreto? Las mejores historias siempre empiezan con una joya. \nDescubre la tuya en Joyerías Sánchez\n\n📍 @fincalamarquesa_ \n\n#joyeria #joyeriasanchez #oro18k #tendencias','https://www.instagram.com/p/DAgEmPoIOIr/',0,42,2479,'/storage/posts/cuenta-2-Vmxo71U64L.jpg',NULL,'2024-09-29 10:30:00','2025-08-08 05:44:22','2025-08-08 05:44:22'),
(294,2,'3488115647800883211','Image','💛 ¡ÚLTIMO DIA  DE LOS GOLDEN DAYS en Joyerías Sánchez! 💛\n\nEs el momento de darte un gusto con nuestras joyas de ensueño. \nDisfruta de:\n✨ 55% de descuento en Oro 18K\n✨ Hasta 70% de descuento en Plata de Primera Ley y marcas seleccionadas\n\nAprovecha y brilla como nunca. \n¡Solo por tiempo limitado! 💎✨\n\n#GoldenDays #DescuentosDeLujo #JoyeríasSánchez #BrillaConNosotros','https://www.instagram.com/p/DBoRrNqpzgL/',0,40,0,'/storage/posts/cuenta-2-lcTIyNtuCX.jpg',NULL,'2024-10-27 12:30:10','2025-08-08 05:44:23','2025-08-08 05:44:23'),
(295,2,'3455470592591349658','Image','✨ Si buscas lujo y distinción, nuestras joyas de oro de 18k y diamantes son el detalle perfecto. \nEncuentra tu pieza especial en Joyerías Sánchez. 💎\n\n#PerlasCultivadas #EstiloNatural #JoyasConEncanto #joyeriasanchez','https://www.instagram.com/p/C_0TDIzN0ea/',1,215,0,'/storage/posts/cuenta-2-rxJ9UOARK6.jpg',NULL,'2024-09-12 10:30:16','2025-08-08 05:44:25','2025-08-08 05:44:25'),
(296,2,'3438792128651885137','Image','¿Tus joyas imprescindibles para este verano?\nEn Joyerías Sánchez las tenemos 🌊✨\n\n#VacacionesConEstilo #JoyeriasSanchez #joyas #oro18k','https://www.instagram.com/p/C-5Czi0tHpR/',0,33,0,'/storage/posts/cuenta-2-ZZDkimfuSY.jpg',NULL,'2024-08-20 10:13:08','2025-08-08 05:44:27','2025-08-08 05:44:27'),
(297,2,'3459094466085400610','Image','Nuestros pendientes de oro de 18k y circonitas te acompañarán a donde quiera que vayas. 🔥\n¿Lista para elevar tu look? 💫\n\n#Elegancia #JoyeriasSanchez #joyas #oro18kl','https://www.instagram.com/p/DABLBb_ijAi/',4,664,0,'/storage/posts/cuenta-2-rwilZBJzsM.jpg',NULL,'2024-09-17 10:30:16','2025-08-08 05:44:29','2025-08-08 05:44:29'),
(298,2,'3440250285397212493','Image','Descubre las joyas perfectas para cada momento de la temporada en Joyerías Sánchez. Desde piezas delicadas hasta diseños que destacan, tenemos lo que necesitas para completar tu look de verano. ✨💎\n\n#VeranoConEstilo #JoyeríasSánchez #joyasquebrillan','https://www.instagram.com/p/C--OWhHiX1N/',0,43,0,'/storage/posts/cuenta-2-rjUIqdCrqd.jpg',NULL,'2024-08-22 10:30:15','2025-08-08 05:44:30','2025-08-08 05:44:30'),
(299,2,'3442424752531133532','Video','✨ En Joyerías Sánchez sabemos que el fin del verano está cerca, ¡pero aún tienes tiempo de brillar con nuestras joyas! 💎\n\nDale un toque especial a tus últimos looks veraniegos con piezas únicas que reflejan tu estilo. ¡No dejes pasar la oportunidad de lucir increíble! \n\n🌞 #VeranoBrillante #EstiloÚnico #JoyasSánchez #Elegancia','https://www.instagram.com/p/C_F8xLcoVRc/',0,36,2464,'/storage/posts/cuenta-2-SqjS7NujIv.jpg',NULL,'2024-08-25 10:30:00','2025-08-08 05:44:32','2025-08-08 05:44:32'),
(300,2,'3452563940272175797','Image','Pendientes “Bardinetto” de perlas cultivadas, un clásico que nunca falla. 🌿 \nPerfectos para dar un toque sutil y elegante a tu estilo.\n\n#PerlasCultivadas #EstiloNatural #JoyasConEncanto #joyeriasanchez','https://www.instagram.com/p/C_p-Jx4Pvq1/',0,34,0,'/storage/posts/cuenta-2-VYhIb7glct.jpg',NULL,'2024-09-08 10:15:16','2025-08-08 05:44:33','2025-08-08 05:44:33'),
(301,2,'3449672364763489714','Image','💍 ¡Dale un toque especial a tu look con las joyas de Joyerías Sánchez! \nOro de 18k, diamantes y piedras preciosas que te harán destacar. \n\n#Elegancia #JoyeriasSanchez #joyas #oro18k','https://www.instagram.com/p/C_fsr0VNaWy/',0,91,0,'/storage/posts/cuenta-2-QLa4L1w2yR.jpg',NULL,'2024-09-04 10:30:13','2025-08-08 05:44:36','2025-08-08 05:44:36'),
(302,2,'3454021059270112421','Image','Diamantes, tu mejor elección. 💎\nDescubre nuestras joyas que combinan elegancia y sofisticación en cada detalle. \n\n#Diamantes #joyas #Joyeriasanchez','https://www.instagram.com/p/C_vJdpsg3Sl/',0,33,0,'/storage/posts/cuenta-2-QeBDPo6gnq.jpg',NULL,'2024-09-10 10:30:18','2025-08-08 05:44:39','2025-08-08 05:44:39'),
(303,2,'3446773290725863849','Image','Encuentra joyas que combinen con tu frescura y personalidad en Joyerías Sánchez. \n¡La temporada más vibrante del año merece un estilo único! ✨💎\n\n#VeranoConBrillo #JoyeríasSánchez #JoyasDeTemporada','https://www.instagram.com/p/C_VZgvPBPGp/',0,24,0,'/storage/posts/cuenta-2-xXKLjI8xYg.jpg',NULL,'2024-08-31 10:30:17','2025-08-08 05:44:41','2025-08-08 05:44:41'),
(304,2,'3443149422701213542','Image','🌞 El verano es para lucir tu mejor versión. \nEn Joyerías Sánchez tenemos las joyas que añadirán ese toque de brillo y elegancia a cada momento bajo el sol. 💎✨ \n¡Haz que este verano sea inolvidable!\n\n#EstiloDeVerano #JoyeríasSánchez #BrillaConNosotros','https://www.instagram.com/p/C_IhihIsndm/',0,26,0,'/storage/posts/cuenta-2-2mjYTO5NKC.jpg',NULL,'2024-08-26 10:30:18','2025-08-08 05:44:43','2025-08-08 05:44:43'),
(305,2,'3457646926783072748','Video','💎 Porque mereces lo mejor. \nNuestras joyas de oro de 18k con diamantes y piedras preciosas están diseñadas para ti.  #joyeriagranada #joyas #oro18k #joyeriassanchez #diamantes','https://www.instagram.com/p/C_8B499oEns/',0,44,2528,'/storage/posts/cuenta-2-kPllCGv0GE.jpg',NULL,'2024-09-15 10:36:10','2025-08-08 05:44:46','2025-08-08 05:44:46'),
(306,2,'3410534476944873573','Image','¡Atención a todos los amantes de la joyería! 💎✨\n\nEn Joyerías Sánchez estamos de REBAJAS 🤩.\n¡No pierdas esta oportunidad única! \nAprovecha nuestros descuentos espectaculares en una amplia selección de joyas: \n\n🔶 Oro de 18 quilates\n🔶 Plata de Primera Ley\n🔶 Diamantes Naturales\n\n¡Visítanos y encuentra esa pieza especial que siempre has querido al mejor precio! 🛍️✨\n\n#JoyeríasSánchez #Rebajas #Oro18K #PlataDeLey #DiamantesNaturales #Descuentos #JoyasExclusivas #Aprovecha','https://www.instagram.com/p/C9Upwl4hZhl/',0,25,0,'/storage/posts/cuenta-2-YqbweWb7oe.jpg',NULL,'2024-07-12 10:30:14','2025-08-08 05:44:47','2025-08-08 05:44:47'),
(307,2,'3425751736456079806','Image','En Joyerías Sánchez, encontrarás conjuntos de joyas perfectos para esta época. \nDiseños únicos que complementan tu estilo y te acompañan en cada momento \n\nVen a descubrir el conjunto perfecto para ti. 💎\n\n#JoyeríasSánchez #Joyas #EstiloÚnico #oro18k','https://www.instagram.com/p/C-Ktw3MJGm-/',0,73,0,'/storage/posts/cuenta-2-3ula8DpVbJ.jpg',NULL,'2024-08-02 10:24:12','2025-08-08 05:44:49','2025-08-08 05:44:49'),
(308,2,'3433727269903388045','Image','🐚 El accesorio perfecto para tus días de playa está en Joyerías Sánchez. \nNuestras joyas te acompañarán en cada momento bajo el sol. ☀️💍\n\n#EstiloDePlaya #JoyeríasSánchez #verano','https://www.instagram.com/p/C-nDMJiKc2N/',0,33,0,'/storage/posts/cuenta-2-t3T2dCoN91.jpg',NULL,'2024-08-13 10:30:11','2025-08-08 05:44:51','2025-08-08 05:44:51'),
(309,2,'3423031200680444675','Image','💎El conjunto perfecto existe, y lo tenemos en Joyerías Sánchez ✨ \nEncuentra la armonía de nuestra gargantilla, pulsera y pendiente. \nResalta con piezas piezas como estas. \n¡Visítanos !\n\n #JoyeríasSánchez #ConjuntoPerfecto #Elegancia #BrillaConNosotros','https://www.instagram.com/p/C-BDL2zowMD/',0,41,0,'/storage/posts/cuenta-2-kmsDw6ZInV.jpg',NULL,'2024-07-29 16:19:00','2025-08-08 05:44:53','2025-08-08 05:44:53'),
(310,2,'3430242073257964378','Image','Nuestras joyas de playa capturan la esencia de la temporada. \nDescúbrelas en Joyerías Sánchez. 🌅✨\n\n#VeranoElegante #JoyeríasSánchez #oro #diamantes','https://www.instagram.com/p/C-aqv3OI_Na/',0,30,0,'/storage/posts/cuenta-2-zQs4Llp8f2.jpg',NULL,'2024-08-08 15:05:43','2025-08-08 05:44:57','2025-08-08 05:44:57'),
(311,2,'3422121898138486197','Video','¡Completa tus looks de verano con el toque perfecto de Joyerías Sánchez! 🌞✨\n\n Encuentra la joya ideal para brillar esta temporada. \n\n¡Visítanos ! 💎\n\n#JoyeríasSánchez #VeranoBrillante #EstiloPerfecto #JoyasDeVerano','https://www.instagram.com/p/C990bw0oUW1/',2,34,3169,'/storage/posts/cuenta-2-GP1UamahOg.jpg',NULL,'2024-07-28 10:14:10','2025-08-08 05:44:59','2025-08-08 05:44:59'),
(312,2,'3419956587224041473','Image','🌞EL CONJUNTO DEL VERANO🌞\n\nPENDIENTES \"GALAPA\" en Plata de Ley y la Gargantilla \"ARONIA\" en Plata de Ley bañada en Oro de 18k. \n\nPerfectos para cualquier ocasión\n\n ¡Solo en  Joyerías a Sánchez! 💎\n\n#JoyeriasASánchez #PendientesGalapa #GargantillaAronia #PlataDeLey #Oro18k  #EstiloYElegancia','https://www.instagram.com/p/C92IGV4vwgB/',0,34,0,'/storage/posts/cuenta-2-U3KXsGLHf4.jpg',NULL,'2024-07-25 10:30:17','2025-08-08 05:45:02','2025-08-08 05:45:02'),
(313,2,'3424305200671433054','Image','✨ En Joyerías Sánchez tenemos la joya ideal para cada ocasión. 💍 \nDescubre la perfecta para complementar tus looks veraniegos.\n\n#Joyas #JoyeríasSánchez #EleganciaParaCadaOcasion #oro18k','https://www.instagram.com/p/C-Fk2_wiyFe/',1,35,0,'/storage/posts/cuenta-2-OtQ2W5mu3R.jpg',NULL,'2024-07-31 10:30:12','2025-08-08 05:45:04','2025-08-08 05:45:04'),
(314,2,'3411984317455349939','Video','‼️En Joyerías Sánchez estamos de REBAJAS‼️\n\n¡No pierdas esta oportunidad única!\n\n¡Visítanos y encuentra esa pieza especial que siempre has querido al mejor precio!✨\n\nNuestras tiendas: 🛍️\n- CC NEVADA SHOPPING\n- CC JAÉN PLAZA\n- C/ PUENTEZUELAS (Granada)\n- CC SERRALLO PLAZA\n- C/ NUEVA MOTRIL\n- CC CARREFOUR PULIANAS\n- CC CARREFOUR ARMILLA\n\n#JoyeríasSánchez #Rebajas #Oro18K #PlataDeLey\n#DiamantesNaturales #Descuentos #JoyasExclusivas\n#Aprovecha','https://www.instagram.com/p/C9ZzajFITiz/',3,54,5239,'/storage/posts/cuenta-2-Cxlv8Y0KUM.jpg',NULL,'2024-07-14 10:30:00','2025-08-08 05:45:06','2025-08-08 05:45:06'),
(315,2,'3428652816221081950','Image','🌺 Colores vibrantes, días soleados. \n\nEncuentra las joyas perfectas para acompañar tu verano en Joyerías Sánchez. \n\n¡Visítanos! 🌅💎\n\n#JoyasDeVerano #JoyeríasSánchez #oro18k #plata #summer','https://www.instagram.com/p/C-VBZIRABFe/',0,56,0,'/storage/posts/cuenta-2-PDiK2UO9eU.jpg',NULL,'2024-08-06 10:28:08','2025-08-08 05:45:08','2025-08-08 05:45:08'),
(316,2,'3427194622296892048','Video','🌊 Luce radiante este verano🌞\n\nNuestras joyas están aquí para darle un toque especial a tu estilo veraniego. Desde collares hasta pulseras llenas, encuentra las piezas perfectas para complementar tus días de sol.\n\nEste verano, brilla más que nunca. 💎✨\n\n#JoyeríasSánchez #EstiloDeVerano #JoyasDePlata #plata','https://www.instagram.com/p/C-P11nWIqKQ/',2,47,4467,'/storage/posts/cuenta-2-H3tOypcM0f.jpg',NULL,'2024-08-04 10:16:18','2025-08-08 05:45:10','2025-08-08 05:45:10'),
(317,2,'3518556500293542932','Video','🎁✨ El regalo perfecto te espera esta Navidad.\nEn Joyerías Sánchez, encontrarás joyas únicas para sorprender a quienes más quieres. 💎\nHaz que estas fiestas brillen como nunca.\n\n#Regalos #JoyeríasSánchez #Navidad #joyas','https://www.instagram.com/p/DDUbH6yI2QU/',1,38,2939,'/storage/posts/cuenta-2-p2kmCwm1HR.jpg',NULL,'2024-12-08 12:30:00','2025-08-08 05:45:13','2025-08-08 05:45:13'),
(318,2,'3616536839502315127','Image','✨ El conjunto \"Leila\", perfecto para sorprender este Día de la Madre ✨\n\nGargantilla, pendientes y anillo que combinan elegancia y delicadeza.\n\nPorque se merece un regalo que brille tanto como ella.\n\n#DíaDeLaMadre #ConjuntoLeila #JoyasConSignificado #JoyeríasSánchez #RegalosConBrillo','https://www.instagram.com/p/DIwhRgjpj53/',1,40,0,'/storage/posts/cuenta-2-P2UhxbuNGC.jpg',NULL,'2025-04-22 16:00:09','2025-08-08 05:45:16','2025-08-08 05:45:16'),
(319,2,'3475774804578250206','Image','Encuentra las piezas ideales en Joyerías Sánchez y completa tu estilo otoñal con elegancia. 💎✨\n\n#JoyasDeOtoño #ulseras  #JoyeríasSánchez #oro18k','https://www.instagram.com/p/DA8bsTyI63e/',0,37,0,'/storage/posts/cuenta-2-eSiH2qharH.jpg',NULL,'2024-10-10 10:51:07','2025-08-08 05:45:17','2025-08-08 05:45:17'),
(320,2,'3397488628088781418','Image','¡Descubre la Pulsera Oro 18k Eslabones Circulares \"Freja\" de Joyerías Sánchez! ✨\n\nUn diseño único que combina sofisticación y estilo, perfecta para cualquier ocasión. 🌟\n\n#JoyeriasSanchez #Freja #PulseraDeOro #Elegancia #joyas #oro','https://www.instagram.com/p/C8mTegVqTpq/',0,34,0,'/storage/posts/cuenta-2-eoeB2Fwsml.jpg',NULL,'2024-06-24 10:30:28','2025-08-08 05:45:19','2025-08-08 05:45:19'),
(321,2,'3388067431481141320','Image','✨Una promesa de amor empieza con un gesto único.✨\nEn Joyerías Sánchez, cada detalle cuenta. \nDos alianzas que indican el comienzo de una nueva historia.💍\n\n#JoyeríasSánchez #Alianzas #Compromiso #Joyas #oro18k','https://www.instagram.com/p/C8E1WDQgOhI/',0,32,0,'/storage/posts/cuenta-2-Gw8yMWNnQJ.jpg',NULL,'2024-06-11 10:32:13','2025-08-08 05:45:21','2025-08-08 05:45:21'),
(322,2,'3469241345593553685','Image','Este otoño, añade un toque especial a tu estilo con las piezas únicas de Joyerías Sánchez. ✨💎\n\n#OtoñoConEstilo #JoyeríasSánchez #JoyasDeTemporada #oro18k','https://www.instagram.com/p/DAlOJ98M7MV/',3,275,0,'/storage/posts/cuenta-2-wrkIzNowJr.jpg',NULL,'2024-10-01 10:30:18','2025-08-08 05:45:22','2025-08-08 05:45:22'),
(323,2,'3402412568816525534','Image','‼️Empiezan las rebajas en Joyerías Sánchez‼️ \n\nAprovecha descuentos de hasta el 50% en oro de 18K, plata de 1ª ley y diamantes naturales.🌟\n\n¡Es el momento perfecto para adquirir nuestras piezas exclusivas! 💎✨ \n\n#Rebajas #Joyeria #Descuentos #Oro #Plata #Diamantes #joyeriasanchez','https://www.instagram.com/p/C83zDRfoiDe/',1,25,0,'/storage/posts/cuenta-2-KMmLfUfNhy.jpg',NULL,'2024-07-01 05:33:27','2025-08-08 05:45:25','2025-08-08 05:45:25'),
(324,2,'3386832586425981221','Video','¡El verano ya está aquí! ☀️🌴 \nEn Joyerías Sánchez te invitamos a descubrir la joya perfecta que hará brillar tus días más especiales. ✨💍\nVisítanos y encuentra esa joya que te hará destacar. \n¡No esperes más y déjate deslumbrar por nuestra joyas! 🌺🌟 \n\n#JoyeriasSanchez #Verano #Joyas','https://www.instagram.com/p/C8AcksLo1kl/',0,54,7587,'/storage/posts/cuenta-2-vNo4lRAhyT.jpg',NULL,'2024-06-09 17:39:41','2025-08-08 05:45:26','2025-08-08 05:45:26'),
(325,2,'3407635338187102732','Image','¡Las rebajas de verano han llegado a Joyerías Sánchez! 💎\n✨ Aprovecha nuestros increíbles descuentos y encuentra la joya perfecta. \nNo dejes pasar esta oportunidad . \n¡Te esperamos! \n\n#JoyeríasSánchez #Rebajas #Descuentos #Joyas','https://www.instagram.com/p/C9KWkkgtdoM/',0,30,0,'/storage/posts/cuenta-2-eQjKgDOtHK.jpg',NULL,'2024-07-08 10:30:09','2025-08-08 05:45:30','2025-08-08 05:45:30'),
(326,2,'3404004403494505733','Image','‼️Estamos de REBAJAS  en Joyerías Sánchez‼️\n\nAprovecha descuentos de hasta el 50% en oro de 18K, plata de 1ª ley y diamantes naturales.🌟\n\n¡Es el momento perfecto para adquirir nuestras piezas al mejor precio! 💎✨\n\n#Rebajas #Joyeria #Descuentos #Oro #Plata #Diamantes #joyeriasanchez','https://www.instagram.com/p/C89c_hEJ80F/',0,27,0,'/storage/posts/cuenta-2-9uPsGaBjB0.jpg',NULL,'2024-07-03 10:16:08','2025-08-08 05:45:33','2025-08-08 05:45:33'),
(327,2,'3400382151984677378','Image','¡Presentamos el Anillo Eslabones Oro 18K \"Bamberg\" de Joyerías Sánchez! ✨💍\n\nEsta joya combina sofisticación y estilo. \nCon su diseño de eslabones, este anillo es el complemento ideal para quienes buscan destacar.\n\n👉 Disponible en nuestras tiendas y en línea. \n\n#JoyeriasSanchez #AnilloBamberg #Oro18K #Elegancia #Estilo #JoyeriaDeLujo','https://www.instagram.com/p/C8wlY0doAIC/',2,256,0,'/storage/posts/cuenta-2-Kvo58MLsSR.jpg',NULL,'2024-06-28 10:19:23','2025-08-08 05:45:36','2025-08-08 05:45:36'),
(328,2,'3402006154692424768','Video','Hoy en Joyerías Sánchez, nuestra compañera Macarena te lleva de tour por nuestra tienda en el CC Nevada Shopping🌟 \nDescubre nuestras piezas únicas y déjate enamorar por nuestra colecciones y marcas. \n¡Te esperamos! \n\n#JoyeríasSánchez #CCNevadaShopping #joyas','https://www.instagram.com/p/C82WpK2InRA/',0,80,4850,'/storage/posts/cuenta-2-026UvqZFio.jpg',NULL,'2024-06-30 16:08:03','2025-08-08 05:45:39','2025-08-08 05:45:39'),
(329,2,'3392596272131582291','Image','¡Descubre tu joya perfecta en Joyerías Sánchez! 💎✨\n\nSumérgete en el mundo de la elegancia con nuestras exquisitas piezas diseñadas para cada ocasión, tenemos la joya ideal para ti.\n\nVisita nuestras tiendas o visita nuestra web. \n\n#JoyeríasSánchez #oro18k #joyas #Estilo','https://www.instagram.com/p/C8U7FWyt6lT/',2,25,0,'/storage/posts/cuenta-2-fBKqKW7qeH.jpg',NULL,'2024-06-17 16:30:13','2025-08-08 05:45:41','2025-08-08 05:45:41'),
(330,2,'3607839677495927845','Image','Brillo auténtico✨\nOro de 18k y diamantes: una combinación eterna.\n\n#Oro18k #Diamantes #Joyería #anillos #joyeríassánchez','https://www.instagram.com/p/DIRnxJPtGQl/',0,29,0,'/storage/posts/cuenta-2-zuuBTuzhx2.jpg',NULL,'2025-04-10 16:00:26','2025-08-08 05:45:43','2025-08-08 05:45:43'),
(331,2,'3418512716457879551','Image','¡Descubre la elegancia del verano con Joyerías Sánchez! ✨ \n\nNuestras joyas, diseñadas para resaltar tu estilo en la temporada más vibrante del año, son el complemento perfecto para cada ocasión. 🌞\n\n Joyerías Sánchez, joyas perfectas para el verano. \n\n#JoyasDeVerano #JoyeríasSánchez #EstiloVeraniego #BrillaEsteVerano','https://www.instagram.com/p/C9w_zQcoKf_/',0,60,0,'/storage/posts/cuenta-2-RiIlmGMbBF.jpg',NULL,'2024-07-23 10:41:34','2025-08-08 05:45:45','2025-08-08 05:45:45'),
(332,2,'3402413754580177238','Image','‼️Empiezan las rebajas en Joyerías Sánchez‼️ \n\nAprovecha descuentos de hasta el 50% en oro de 18K, plata de 1ª ley y diamantes naturales.🌟\n\n¡Es el momento perfecto para adquirir nuestras piezas exclusivas! 💎✨ \n\n#Rebajas #Joyeria #Descuentos #Oro #Plata #Diamantes','https://www.instagram.com/p/C83zUh0p5FW/',0,40,0,'/storage/posts/cuenta-2-lnHLWP1cFd.jpg',NULL,'2024-07-01 05:35:48','2025-08-08 05:45:48','2025-08-08 05:45:48'),
(333,2,'3402413041999459062','Image','‼️Empiezan las rebajas en Joyerías Sánchez‼️ \n\nAprovecha descuentos de hasta el 50% en oro de 18K, plata de 1ª ley y diamantes naturales.🌟\n\n¡Es el momento perfecto para adquirir nuestras piezas exclusivas! 💎✨ \n\n#Rebajas #Joyeria #Descuentos #Oro #Plata #Diamantes','https://www.instagram.com/p/C83zKKLiLL2/',0,21,0,'/storage/posts/cuenta-2-ix2Rz2edAC.jpg',NULL,'2024-07-01 05:34:24','2025-08-08 05:45:51','2025-08-08 05:45:51'),
(334,2,'3444598951959408185','Image','✨ Sol, naturaleza, verano...\n¡Dale un giro brillante a tu look de verano! 💎🌞\n\n#VeranoElegante #JoyasQueInspiran #joyeriassánchez','https://www.instagram.com/p/C_NrH8dOS45/',0,60,0,'/storage/posts/cuenta-2-AQ9dn8tFtq.jpg',NULL,'2024-08-28 10:30:15','2025-08-08 05:45:52','2025-08-08 05:45:52');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
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
INSERT INTO `sessions` VALUES
('kuOVAgiZyilz3uaem2LPbAIHbYFGK7xa1qGYbnxR',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOUU5ZUx6eFZjOVVxR1NWNTE3cjlpQ1RJVDgyRjZGcVZ2SnFZUVNtaCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vY3VlbnRhcy8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1754671300),
('ZqzNgmGZou18lNKuden7EIEVXrALKo3ZgtxS2v0S',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS3RMU3phOWwwVkZHS3gxWkZ6aGlQUTlONm1SbVFReGVUaWI2b2xiUyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vY3VlbnRhcy8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1754723707);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Jose','josepita@gmail.com',NULL,'$2y$12$0bSIo4Imb3nD2G6BJH9RduSl3UxMFIy.P8cwC.SrVVRB27bC06zOS',NULL,'2025-08-07 13:21:29','2025-08-07 13:21:29');
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

-- Dump completed on 2025-08-09  9:47:28
