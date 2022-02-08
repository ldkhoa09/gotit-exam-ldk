-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for gotit-exam
CREATE DATABASE IF NOT EXISTS `gotit-exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `gotit-exam`;

-- Dumping structure for table gotit-exam.activity_log
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.activity_log: ~6 rows (approximately)
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
REPLACE INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'created', 'App\\Models\\User', 'created', 1, NULL, NULL, '{"attributes":{"id":1,"first_name":"Lyric","last_name":"Emmerich","phone":"+1 (270) 629-5942","department_id":1,"email":"demo@demo.com","email_verified_at":"2022-02-07T17:54:20.000000Z","password":"$2y$10$24pKxBsxxU9e5Gmw0hHslOH3BUxBG52wQiQL5WMXUrGdhv2Tidz8W","api_token":null,"remember_token":null,"created_at":"2022-02-07T17:54:20.000000Z","updated_at":"2022-02-07T17:54:20.000000Z"}}', NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(2, 'default', 'created', 'App\\Models\\UserInfo', 'created', 1, NULL, NULL, '{"attributes":{"id":1,"user_id":1,"avatar":null,"company":"Ullrich LLC","website":"http:\\/\\/mertz.com\\/ut-ipsa-et-exercitationem-aperiam-dolores-asperiores","country":"MH","language":"lt","timezone":null,"currency":null,"communication":null,"marketing":null,"created_at":"2022-02-07T17:54:20.000000Z","updated_at":"2022-02-07T17:54:20.000000Z"}}', NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(3, 'default', 'created', 'App\\Models\\User', 'created', 2, NULL, NULL, '{"attributes":{"id":2,"first_name":"Amani","last_name":"Cummings","phone":"+1-909-809-0782","department_id":2,"email":"demo1@demo.com","email_verified_at":"2022-02-07T17:54:20.000000Z","password":"$2y$10$5UzHWEp6mwpAw519Iwms.eKRXd7I8843k627rLZZEIYMXJEoGLK9e","api_token":null,"remember_token":null,"created_at":"2022-02-07T17:54:20.000000Z","updated_at":"2022-02-07T17:54:20.000000Z"}}', NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(4, 'default', 'created', 'App\\Models\\UserInfo', 'created', 2, NULL, NULL, '{"attributes":{"id":2,"user_id":2,"avatar":null,"company":"Hand-Balistreri","website":"http:\\/\\/mante.org\\/nihil-debitis-ut-vel-qui-quasi-aperiam-ipsum-sunt","country":"CY","language":"ku","timezone":null,"currency":null,"communication":null,"marketing":null,"created_at":"2022-02-07T17:54:20.000000Z","updated_at":"2022-02-07T17:54:20.000000Z"}}', NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(5, 'default', 'created', 'App\\Models\\User', 'created', 3, NULL, NULL, '{"attributes":{"id":3,"first_name":"Allan","last_name":"Blick","phone":"+1.614.200.2159","department_id":3,"email":"demo2@demo.com","email_verified_at":"2022-02-07T17:54:20.000000Z","password":"$2y$10$F94M5JOnaMwhsnLTb1Zn4e9jOG8oa2gLgRdjPNjJkQXs9oJHPv1Y2","api_token":null,"remember_token":null,"created_at":"2022-02-07T17:54:20.000000Z","updated_at":"2022-02-07T17:54:20.000000Z"}}', NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(6, 'default', 'created', 'App\\Models\\UserInfo', 'created', 3, NULL, NULL, '{"attributes":{"id":3,"user_id":3,"avatar":null,"company":"Harvey PLC","website":"http:\\/\\/goyette.biz\\/est-fuga-quam-corporis-eum-debitis-veniam-voluptas-doloribus.html","country":"ZW","language":"tn","timezone":null,"currency":null,"communication":null,"marketing":null,"created_at":"2022-02-07T17:54:20.000000Z","updated_at":"2022-02-07T17:54:20.000000Z"}}', NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.gifts
CREATE TABLE IF NOT EXISTS `gifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `ratio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.gifts: ~3 rows (approximately)
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
REPLACE INTO `gifts` (`id`, `name`, `quantity`, `ratio`, `created_at`, `updated_at`) VALUES
	(1, 'Iphone 13 Promax', 10, 5, '2022-02-07 17:54:20', '2022-02-08 14:46:33');
REPLACE INTO `gifts` (`id`, `name`, `quantity`, `ratio`, `created_at`, `updated_at`) VALUES
	(2, '1 triệu tiên mặt', 30, 30, '2022-02-07 17:54:20', '2022-02-08 15:12:58');
REPLACE INTO `gifts` (`id`, `name`, `quantity`, `ratio`, `created_at`, `updated_at`) VALUES
	(3, 'Vé xem phim', 60, 65, '2022-02-07 17:54:20', '2022-02-08 17:34:12');
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.migrations: ~12 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(2, '2014_10_12_100000_create_password_resets_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(3, '2019_08_19_000000_create_failed_jobs_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(4, '2021_03_22_144618_create_permission_tables', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2021_04_14_044507_create_settings_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(6, '2021_06_15_022916_create_user_infos_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(7, '2021_06_23_041411_create_activity_log_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(8, '2021_06_23_041412_add_event_column_to_activity_log_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(9, '2021_06_23_041413_add_batch_uuid_column_to_activity_log_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(10, '2021_11_04_200820_add_api_token_column', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(11, '2022_02_07_171859_create_gifts_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(12, '2022_02_07_174324_create_vouchers_table', 1);
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(14, '2022_02_08_151931_create_results_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.model_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.model_has_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.role_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số điện thoại',
  `department_id` int(11) NOT NULL DEFAULT 3 COMMENT 'Mã cửa hàng',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `first_name`, `last_name`, `phone`, `department_id`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Lyric', 'Emmerich', '0903121123', 1, 'demo@demo.com', '2022-02-07 17:54:20', '$2y$10$24pKxBsxxU9e5Gmw0hHslOH3BUxBG52wQiQL5WMXUrGdhv2Tidz8W', NULL, NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `users` (`id`, `first_name`, `last_name`, `phone`, `department_id`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Amani', 'Cummings', '0905141221', 2, 'demo1@demo.com', '2022-02-07 17:54:20', '$2y$10$5UzHWEp6mwpAw519Iwms.eKRXd7I8843k627rLZZEIYMXJEoGLK9e', NULL, NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `users` (`id`, `first_name`, `last_name`, `phone`, `department_id`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(3, 'Allan', 'Blick', '0902787212', 3, 'demo2@demo.com', '2022-02-07 17:54:20', '$2y$10$F94M5JOnaMwhsnLTb1Zn4e9jOG8oa2gLgRdjPNjJkQXs9oJHPv1Y2', NULL, NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.user_infos
CREATE TABLE IF NOT EXISTS `user_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.user_infos: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
REPLACE INTO `user_infos` (`id`, `user_id`, `avatar`, `company`, `website`, `country`, `language`, `timezone`, `currency`, `communication`, `marketing`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Ullrich LLC', 'http://mertz.com/ut-ipsa-et-exercitationem-aperiam-dolores-asperiores', 'MH', 'lt', NULL, NULL, NULL, NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `user_infos` (`id`, `user_id`, `avatar`, `company`, `website`, `country`, `language`, `timezone`, `currency`, `communication`, `marketing`, `created_at`, `updated_at`) VALUES
	(2, 2, NULL, 'Hand-Balistreri', 'http://mante.org/nihil-debitis-ut-vel-qui-quasi-aperiam-ipsum-sunt', 'CY', 'ku', NULL, NULL, NULL, NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `user_infos` (`id`, `user_id`, `avatar`, `company`, `website`, `country`, `language`, `timezone`, `currency`, `communication`, `marketing`, `created_at`, `updated_at`) VALUES
	(3, 3, NULL, 'Harvey PLC', 'http://goyette.biz/est-fuga-quam-corporis-eum-debitis-veniam-voluptas-doloribus.html', 'ZW', 'tn', NULL, NULL, NULL, NULL, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;

-- Dumping structure for table gotit-exam.vouchers
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `code` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table gotit-exam.vouchers: ~100 rows (approximately)
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 11691, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(2, 2, 10937, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(3, 2, 11875, 0, '2022-02-07 17:54:20', '2022-02-08 17:30:05');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(4, 2, 13139, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(5, 1, 12619, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(6, 1, 17605, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(7, 2, 10186, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(8, 3, 15152, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(9, 1, 10293, 0, '2022-02-07 17:54:20', '2022-02-08 15:12:58');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(10, 3, 13490, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(11, 3, 11904, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(12, 2, 13602, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(13, 3, 16849, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(14, 1, 13137, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(15, 2, 18125, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(16, 1, 15481, 0, '2022-02-07 17:54:20', '2022-02-08 14:45:26');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(17, 2, 10664, 0, '2022-02-07 17:54:20', '2022-02-08 17:33:50');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(18, 2, 12421, 0, '2022-02-07 17:54:20', '2022-02-08 17:34:12');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(19, 1, 17116, 0, '2022-02-07 17:54:20', '2022-02-08 14:43:50');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(20, 2, 10219, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(21, 3, 13321, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(22, 1, 13933, 0, '2022-02-07 17:54:20', '2022-02-08 14:45:40');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(23, 2, 11172, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(24, 1, 17538, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(25, 1, 16082, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(26, 1, 13081, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(27, 1, 17850, 0, '2022-02-07 17:54:20', '2022-02-08 14:45:47');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(28, 3, 13994, 0, '2022-02-07 17:54:20', '2022-02-08 06:20:28');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(29, 3, 19792, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(30, 3, 16754, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(31, 2, 12906, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(32, 1, 12178, 0, '2022-02-07 17:54:20', '2022-02-08 14:45:54');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(33, 1, 18078, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(34, 3, 10336, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(35, 3, 16351, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(36, 2, 11799, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(37, 1, 19312, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(38, 3, 13059, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(39, 1, 13897, 0, '2022-02-07 17:54:20', '2022-02-08 14:46:01');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(40, 3, 10992, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(41, 1, 17180, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(42, 3, 17560, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(43, 3, 13615, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(44, 3, 13110, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(45, 1, 16169, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(46, 2, 11721, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(47, 2, 13284, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(48, 1, 12058, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(49, 3, 15290, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(50, 1, 18237, 0, '2022-02-07 17:54:20', '2022-02-08 14:46:07');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(51, 2, 10142, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(52, 1, 16853, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(53, 1, 12789, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(54, 2, 19806, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(55, 3, 14513, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(56, 2, 13663, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(57, 3, 10983, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(58, 3, 16650, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(59, 3, 16605, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(60, 3, 11721, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(61, 1, 15407, 0, '2022-02-07 17:54:20', '2022-02-08 14:46:14');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(62, 1, 11500, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(63, 3, 19107, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(64, 1, 15599, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(65, 1, 13763, 0, '2022-02-07 17:54:20', '2022-02-08 14:46:21');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(66, 1, 11908, 0, '2022-02-07 17:54:20', '2022-02-08 14:46:27');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(67, 1, 17213, 0, '2022-02-07 17:54:20', '2022-02-08 14:46:33');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(68, 2, 18960, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(69, 2, 11393, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(70, 3, 10618, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(71, 3, 12113, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(72, 3, 18302, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(73, 3, 18041, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(74, 2, 13374, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(75, 1, 16543, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(76, 3, 12785, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(77, 3, 11567, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(78, 2, 18180, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(79, 1, 17425, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(80, 1, 12820, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(81, 1, 12431, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(82, 3, 14601, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(83, 3, 18019, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(84, 2, 12167, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(85, 3, 15530, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(86, 1, 10979, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(87, 3, 16643, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(88, 3, 15606, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(89, 1, 14002, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(90, 3, 12378, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(91, 3, 11265, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(92, 3, 16055, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(93, 2, 14023, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(94, 1, 12375, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(95, 2, 18572, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(96, 1, 14532, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(97, 2, 15045, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(98, 1, 10479, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(99, 3, 18398, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
REPLACE INTO `vouchers` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(100, 1, 19313, 0, '2022-02-07 17:54:20', '2022-02-07 17:54:20');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
