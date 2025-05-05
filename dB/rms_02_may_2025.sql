/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.30 : Database - rms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `rms`;

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_foreign` (`country_id`),
  CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cities` */

insert  into `cities`(`id`,`country_id`,`name`,`created_at`,`updated_at`) values 
(1,1,'New York','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(2,1,'Washington','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(3,2,'London','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(4,2,'Birmingham','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(5,3,'Berlin','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(6,3,'Stuttgart','2024-04-18 23:56:54','2024-04-18 23:56:54');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'United States','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(2,'United Kingdom','2024-04-18 23:56:54','2024-04-18 23:56:54'),
(3,'Germany','2024-04-18 23:56:54','2024-04-18 23:56:54');

/*Table structure for table `cron_jobs` */

DROP TABLE IF EXISTS `cron_jobs`;

CREATE TABLE `cron_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cron_name` varchar(50) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cron_jobs` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `total_spent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `visits` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customers` */

/*Table structure for table `item_categories` */

DROP TABLE IF EXISTS `item_categories`;

CREATE TABLE `item_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `item_categories` */

insert  into `item_categories`(`id`,`name`,`created_at`,`updated_at`,`is_active`) values 
(1,'Beverages','2025-01-12 01:40:34','2025-04-15 21:01:12',1),
(3,'BBQ/Grill','2025-01-12 02:27:34','2025-01-12 02:27:34',1),
(4,'Bread/Naan','2025-01-12 02:27:45','2025-01-12 02:27:45',1),
(6,'Salads and Sides','2025-01-12 02:28:30','2025-01-12 02:28:30',1),
(9,'Karhai','2025-04-15 21:34:18','2025-04-15 21:34:18',1),
(10,'Roll','2025-04-16 13:33:35','2025-04-16 13:33:40',1),
(11,'Fast Food','2025-04-16 13:33:48','2025-04-16 13:33:48',1),
(12,'Vendor_products','2025-04-25 21:36:30','2025-04-25 21:36:30',1);

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT '0',
  `category_id` bigint unsigned DEFAULT NULL,
  `unit_type_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL,
  `cost_price` decimal(8,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_category_id_foreign` (`category_id`),
  KEY `items_unit_type_id_foreign` (`unit_type_id`),
  KEY `items_created_by_foreign` (`created_by`),
  CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `items_unit_type_id_foreign` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `items` */

insert  into `items`(`id`,`name`,`order`,`category_id`,`unit_type_id`,`description`,`price`,`cost_price`,`stock_quantity`,`is_available`,`image`,`image_path`,`created_by`,`created_at`,`updated_at`,`deleted_at`) values 
(2,'کوئلہ قیمہ آدھا پاؤ',1,9,7,'qeema',350.00,0.00,0,1,'My9UtNy7JLuCX00uRgJE5dkvqmAXOL1IKfGKleTw.png','items/My9UtNy7JLuCX00uRgJE5dkvqmAXOL1IKfGKleTw.png',1,'2025-04-16 13:32:55','2025-04-16 21:31:58',NULL),
(3,'چکن چٹنی رول',3,10,2,'Chicken Chatni Roll',160.00,0.00,0,1,'bVEjXOZvosKi1wC60MWXQCmuyBmJ8gepqeZWw2dv.jpg','items/bVEjXOZvosKi1wC60MWXQCmuyBmJ8gepqeZWw2dv.jpg',1,'2025-04-16 13:37:04','2025-04-16 21:33:27',NULL),
(4,'وائٹ کڑاہی',4,9,7,'White Karhai',400.00,0.00,0,1,'jZXiMGIrmBSqoFxIiEAFLhHMxhzrzMkIXAWz2LgK.jpg','items/jZXiMGIrmBSqoFxIiEAFLhHMxhzrzMkIXAWz2LgK.jpg',1,'2025-04-16 15:45:50','2025-04-16 21:33:21',NULL),
(5,'کباب رول',2,10,2,'Kbabab Roll',70.00,0.00,0,1,'wyAw0jaMaRHip2CN0PaDeum658A6ZsqJdacnBmMk.jpg','items/wyAw0jaMaRHip2CN0PaDeum658A6ZsqJdacnBmMk.jpg',1,'2025-04-16 15:57:24','2025-04-16 21:32:58',NULL),
(6,'کوئلہ قیمہ پاؤ',1,9,7,'Koyla Qeema Pao',600.00,0.00,0,1,'MXzf9D9raGruDFuCnP9yx3z4FH3IgMnAdjgBsqjv.jpg','items/MXzf9D9raGruDFuCnP9yx3z4FH3IgMnAdjgBsqjv.jpg',1,'2025-04-16 21:31:30','2025-04-16 21:32:42',NULL),
(7,'قیمہ آدھا کلو',1,9,7,'قیمہ آدھا کلو',1200.00,0.00,0,1,'yzZNXDzNYrL6RhmHT3BlboeqHHKP2W1EaEZrXIAh.jpg','items/yzZNXDzNYrL6RhmHT3BlboeqHHKP2W1EaEZrXIAh.jpg',1,'2025-04-16 21:37:46','2025-04-16 21:37:46',NULL),
(8,'کوئلہ قیمہ ایک کلو',1,9,7,'کوئلہ قیمہ ایک کلو',2400.00,0.00,0,1,'2H22EApWN2Hg11cTEkqK6rA1rMZZGtnmk6s25UmP.jpg','items/2H22EApWN2Hg11cTEkqK6rA1rMZZGtnmk6s25UmP.jpg',1,'2025-04-16 21:40:07','2025-04-16 21:40:07',NULL),
(9,'چکن کڑاہی پاؤ',2,9,7,'چکن کڑاہی پاؤ',500.00,0.00,0,1,'4eYVOY9vMHMPIDwTaIUREEg7RRLHjeXQ6DoEsnRM.jpg','items/4eYVOY9vMHMPIDwTaIUREEg7RRLHjeXQ6DoEsnRM.jpg',1,'2025-04-16 21:41:06','2025-04-16 21:41:06',NULL),
(10,'چکن کڑاہی آدھا کلو',2,9,7,'چکن کڑاہی آدھا کلو',1000.00,0.00,0,1,'ZmuBW182xiExPzTW9ixmt7L4n8n9cIA2LbZcB6rz.jpg','items/ZmuBW182xiExPzTW9ixmt7L4n8n9cIA2LbZcB6rz.jpg',1,'2025-04-16 21:41:36','2025-04-16 21:41:36',NULL),
(11,'زِنگر برگر',6,11,2,'زِنگر برگر',400.00,NULL,NULL,1,'3qn6SfzdQnO8cWDF9FaFt75ksvNNnp7Lzem7MkNz.jpg','items/3qn6SfzdQnO8cWDF9FaFt75ksvNNnp7Lzem7MkNz.jpg',1,'2025-04-17 12:18:05','2025-04-17 12:18:05',NULL),
(12,'چکن تکہ چیسٹ',1,3,2,'چکن تکہ چیسٹ',400.00,0.00,50,1,'5CX6Y0747djxYG0ODiITRDzAHUzJmyKxkYNaCSBD.jpg','items/5CX6Y0747djxYG0ODiITRDzAHUzJmyKxkYNaCSBD.jpg',1,'2025-04-19 00:45:16','2025-04-19 00:45:16',NULL),
(14,'Koyla',1,12,1,'Koyla',91.00,91.00,50,1,NULL,NULL,1,'2025-04-25 21:36:56','2025-04-26 03:03:35',NULL);

/*Table structure for table `ledgers` */

DROP TABLE IF EXISTS `ledgers`;

CREATE TABLE `ledgers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledgers_user_id_foreign` (`user_id`),
  CONSTRAINT `ledgers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ledgers` */

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdNames` json DEFAULT NULL,
  `ClassNames` json DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `parent_id` bigint unsigned DEFAULT NULL,
  `permission_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  KEY `menus_permission_id_foreign` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`title`,`icon`,`url`,`IdNames`,`ClassNames`,`order`,`parent_id`,`permission_id`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Dashboard ','fa fa-home','/dashboard','[\"\"]','[\"\"]',1,NULL,12,1,'2024-06-07 22:35:38','2024-07-16 04:24:36',NULL),
(2,'Manage Users','fa fa-group',NULL,'[\"\"]','[\"\"]',2,NULL,1,1,'2024-06-07 17:58:12','2025-04-16 13:45:23',NULL),
(3,'Users',NULL,'/manage_user','[\"\"]','[\"\"]',3,2,13,1,'2024-06-07 18:15:55','2024-06-12 21:27:29',NULL),
(4,'Roles',NULL,'/manage_user/roles/','[\"\"]','[\"\"]',4,2,14,1,'2024-06-07 18:15:55','2024-06-12 21:27:29',NULL),
(5,'Course Category','fa fa-list-alt',NULL,'[\"\"]','[\"\"]',3,NULL,2,1,'2024-06-07 17:35:38','2024-09-09 14:11:21','2024-09-09 14:11:21'),
(6,'Permissions',NULL,'/manage_user/permissions','[\"\"]','[\"\"]',6,2,15,1,'2024-06-07 18:15:55','2024-06-12 21:05:28',NULL),
(7,'Manage Sidebars','','/sidebar','[\"\"]','[\"\"]',7,2,16,1,'2024-06-07 17:35:38','2024-06-12 21:05:28',NULL),
(22,'Video Tutorials',NULL,'/tutorials','[\"\"]','[\"\"]',50,19,NULL,1,'2024-06-08 09:44:35','2025-04-16 13:40:47',NULL),
(39,'Entry','fa fa-inbox','entry_screen','[\"\"]','[\"\"]',2,NULL,60,1,'2024-10-20 00:43:19','2024-10-20 00:44:32','2024-10-20 00:44:32'),
(40,'Item Categories','fa fa-tags','item-category','[\"\"]','[\"\"]',6,NULL,68,1,'2024-10-20 00:43:56','2025-04-16 13:49:44',NULL),
(41,'test','','awd','[\"\"]','[\"\"]',5,2,13,1,'2024-10-20 00:56:07','2024-10-20 01:04:45','2024-10-20 01:04:45'),
(42,'Items','fa fa-cubes','items','[\"\"]','[\"\"]',4,NULL,66,1,'2024-11-01 02:43:28','2025-04-16 13:49:41',NULL),
(43,'Unit Types','fa fa-flask','unit-types','[\"\"]','[\"\"]',5,NULL,67,1,'2025-04-16 12:27:51','2025-04-16 13:49:36',NULL),
(44,'Vendors','fa fa-user-times','vendors','[\"\"]','[\"\"]',7,NULL,69,0,'2025-04-16 13:43:51','2025-04-23 20:57:27','2025-04-23 20:57:27'),
(45,'POS','fa fa-tablet','pos','[\"\"]','[\"\"]',3,NULL,65,1,'2025-04-16 13:45:06','2025-04-16 13:49:23',NULL),
(46,'Customers','fa fa-user-plus','customers','[\"\"]','[\"\"]',8,NULL,70,0,'2025-04-16 13:47:58','2025-04-23 20:57:22','2025-04-23 20:57:22'),
(47,'Ledgers','fa fa-solid fa-book','ledgers','[\"\"]','[\"\"]',7,NULL,71,1,'2025-04-23 20:57:42','2025-04-25 20:11:42',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Created For Laravel Framework';

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(146,'2019_12_14_000001_create_personal_access_tokens_table',1),
(149,'2024_09_09_125348_create_alter_user_table',2),
(150,'2025_01_12_002525_create_item_categories_table',3),
(153,'2025_04_16_123457_create_unit_types_table',5),
(156,'2025_04_15_210948_create_item_table',6),
(159,'2025_04_16_144536_create_customer_table',8),
(161,'2025_04_16_140502_create_receipt_table',9),
(162,'2025_04_18_204159_create_receipt_items_table',10),
(164,'2025_04_19_025127_create_vendor_items_table',12),
(166,'2025_04_18_212800_create_ledgers_table',13);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `messagebody` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `multicast_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `user_uploader_id` bigint unsigned DEFAULT NULL,
  `instructor_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `sub_department_id` bigint unsigned DEFAULT NULL,
  `zone_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `shift_time_id` bigint unsigned DEFAULT NULL,
  `upload_csv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_csv_json_data` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `zone_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  KEY `notifications_user_uploader_id_foreign` (`user_uploader_id`),
  KEY `notifications_instructor_id_foreign` (`instructor_id`),
  KEY `notifications_employee_id_foreign` (`employee_id`),
  KEY `notifications_department_id_foreign` (`department_id`),
  KEY `notifications_sub_department_id_foreign` (`sub_department_id`),
  KEY `notifications_city_id_foreign` (`city_id`),
  KEY `notifications_branch_id_foreign` (`branch_id`),
  KEY `notifications_role_id_foreign` (`role_id`),
  KEY `notifications_shift_time_id_foreign` (`shift_time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

/*Table structure for table `notifications_status` */

DROP TABLE IF EXISTS `notifications_status`;

CREATE TABLE `notifications_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_status_notification_id_foreign` (`notification_id`),
  KEY `notifications_status_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications_status` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Created For Laravel Framework';

/*Data for the table `password_resets` */

/*Table structure for table `permission_role_pivot` */

DROP TABLE IF EXISTS `permission_role_pivot`;

CREATE TABLE `permission_role_pivot` (
  `role_id` bigint unsigned DEFAULT NULL,
  `permission_id` bigint unsigned NOT NULL,
  KEY `permission_role_pivot_role_id_foreign` (`role_id`),
  KEY `permission_role_pivot_permission_id_foreign` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role_pivot` */

insert  into `permission_role_pivot`(`role_id`,`permission_id`) values 
(1,1),
(3,4),
(3,7),
(1,12),
(2,1),
(2,3),
(4,11),
(1,13),
(1,14),
(1,15),
(1,16),
(2,13),
(2,14),
(2,15),
(2,19),
(2,20),
(3,11),
(3,25),
(1,25),
(2,25),
(6,25),
(1,27),
(1,28),
(1,29),
(1,30),
(1,31),
(1,32),
(1,33),
(1,34),
(5,6),
(5,8),
(2,27),
(2,28),
(8,47),
(8,48),
(8,52),
(1,53),
(1,54),
(8,54),
(10,1),
(10,12),
(10,13),
(10,14),
(10,15),
(10,27),
(10,28),
(10,29),
(10,30),
(10,31),
(10,32),
(10,53),
(8,58),
(1,52),
(10,33),
(10,34),
(8,51),
(8,49),
(10,54),
(10,55),
(13,60),
(1,60),
(14,62),
(14,63),
(14,64),
(15,1),
(28,12),
(1,61),
(1,65),
(1,66),
(1,67),
(1,68),
(1,69),
(1,70),
(1,71);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`title`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'user_management',1,'2024-06-26 21:17:54','2024-06-12 20:53:12',NULL),
(2,'category_management',1,'2024-06-09 22:17:09','2024-08-02 01:39:31','2024-08-02 01:39:31'),
(3,'department_management',1,'2024-06-09 23:00:10','2024-08-02 01:39:34','2024-08-02 01:39:34'),
(4,'manage_course',1,'2024-06-09 23:00:20','2024-08-02 01:39:36','2024-08-02 01:39:36'),
(5,'manage_align_course',1,'2024-06-09 23:00:45','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(6,'manage_my_course',1,'2024-06-09 23:00:51','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(7,'manage_lecture',1,'2024-06-09 23:01:04','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(8,'manage_notification',1,'2024-06-09 23:01:41','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(9,'manage_city',1,'2024-06-09 23:01:49','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(10,'manage_zone',1,'2024-06-09 23:01:55','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(11,'manage_time',1,'2024-06-09 23:02:01','2024-08-02 02:50:26','2024-08-02 02:50:26'),
(12,'manage_dashboard',1,'2024-06-10 01:16:50','2024-06-10 01:16:50',NULL),
(13,'manage_users',1,'2024-06-12 20:23:16','2024-06-12 20:53:22',NULL),
(14,'manage_roles',1,'2024-06-12 20:23:25','2024-06-12 20:53:31',NULL),
(15,'manage_permissions',1,'2024-06-12 20:23:33','2024-06-27 14:59:02',NULL),
(16,'manage_sidebar',1,'2024-06-12 20:23:43','2024-06-12 20:23:43',NULL),
(17,'manage_categoires',1,'2024-06-12 20:54:04','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(18,'manage_sub_categories',1,'2024-06-12 20:54:13','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(19,'manage_departments',1,'2024-06-12 20:54:22','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(20,'manage_sub_departments',1,'2024-06-12 20:54:31','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(21,'delete_course',1,'2024-06-12 21:21:17','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(22,'manage_haris updated',1,'2024-06-13 10:18:15','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(23,'arshad',1,'2024-06-18 15:14:54','2024-06-18 15:15:12','2024-06-18 15:15:12'),
(24,'HR_DATA',1,'2024-06-25 20:22:11','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(25,'dashboard_view',1,'2024-06-26 21:52:48','2024-06-26 22:09:24',NULL),
(26,'Course creation',1,'2024-06-27 16:59:36','2024-08-02 02:50:08','2024-08-02 02:50:08'),
(27,'user_listing',1,'2024-06-27 18:41:55','2024-06-27 18:41:55',NULL),
(28,'user_add',1,'2024-06-27 18:41:59','2024-06-27 18:41:59',NULL),
(29,'role_add',1,'2024-06-27 18:42:03','2024-06-27 18:42:03',NULL),
(30,'role_listing',1,'2024-06-27 18:42:07','2024-06-27 18:42:07',NULL),
(31,'permission_listing',1,'2024-06-27 18:42:12','2024-06-27 18:42:12',NULL),
(32,'permission_add',1,'2024-06-27 18:42:20','2024-06-27 18:42:20',NULL),
(33,'sidebar_operation_add',1,'2024-06-27 18:42:26','2024-06-27 18:42:26',NULL),
(34,'sidebar_operation_listing',1,'2024-06-27 18:42:30','2024-06-27 18:42:30',NULL),
(35,'course_category_add',1,'2024-06-27 18:42:34','2024-08-02 02:49:40','2024-08-02 02:49:40'),
(36,'course_category_listing',1,'2024-06-27 18:42:38','2024-08-02 01:56:43','2024-08-02 01:56:43'),
(37,'course_subcategory_add',1,'2024-06-27 18:42:42','2024-08-02 01:56:32','2024-08-02 01:56:32'),
(38,'course_subcategory_listing',1,'2024-06-27 18:42:46','2024-08-02 01:40:36','2024-08-02 01:40:36'),
(39,'city_listing',1,'2024-06-27 18:42:50','2024-08-02 01:40:34','2024-08-02 01:40:34'),
(40,'zone_listing',1,'2024-06-27 18:42:53','2024-08-02 01:40:32','2024-08-02 01:40:32'),
(41,'schedule_listing',1,'2024-06-27 18:42:58','2024-08-02 01:40:30','2024-08-02 01:40:30'),
(42,'course_sub_category_add',1,'2024-06-27 19:06:39','2024-08-02 01:40:28','2024-08-02 01:40:28'),
(43,'create_notification',1,'2024-06-27 20:03:40','2024-08-02 01:40:26','2024-08-02 01:40:26'),
(44,'Testing done ',1,'2024-06-28 21:25:37','2024-08-02 01:40:23','2024-08-02 01:40:23'),
(45,'create_lecture',1,'2024-07-19 00:34:49','2024-08-02 01:39:20','2024-08-02 01:39:20'),
(46,'select_instructor',1,'2024-07-24 23:47:14','2024-08-02 01:39:17','2024-08-02 01:39:17'),
(47,'cod_payment',1,'2024-08-02 05:34:39','2024-10-19 20:32:38','2024-10-19 20:32:38'),
(48,'day_end_payments',1,'2024-08-02 07:10:57','2024-10-19 20:32:42','2024-10-19 20:32:42'),
(49,'deposit_slips',1,'2024-08-02 07:11:04','2024-10-19 20:32:45','2024-10-19 20:32:45'),
(50,'courer_payment_recieves',1,'2024-08-02 07:11:12','2024-10-19 20:32:48','2024-10-19 20:32:48'),
(51,'transactions',1,'2024-08-02 07:11:16','2024-10-19 20:32:52','2024-10-19 20:32:52'),
(52,'cod_reports',1,'2024-08-02 07:11:20','2024-08-02 07:11:20',NULL),
(53,'locations',1,'2024-08-02 07:57:52','2024-08-02 11:28:54',NULL),
(54,'location_listing',1,'2024-08-02 07:59:49','2024-08-03 03:51:51',NULL),
(55,'add_location',1,'2024-08-03 03:50:46','2024-10-19 20:32:57','2024-10-19 20:32:57'),
(56,'awdawd',1,'2024-08-03 05:52:45','2024-08-03 05:55:11','2024-08-03 05:55:11'),
(57,'awd',1,'2024-08-03 06:20:57','2024-08-03 06:21:01','2024-08-03 06:21:01'),
(58,'COD_list',1,'2024-08-03 07:01:05','2024-10-19 20:32:27','2024-10-19 20:32:27'),
(59,'add_location',1,'2024-10-19 20:33:05','2024-10-19 20:33:05',NULL),
(60,'data_entry_screen',1,'2024-10-19 22:03:26','2024-10-19 22:03:26',NULL),
(61,'entry',1,'2024-10-20 00:42:56','2024-10-20 00:42:56',NULL),
(62,'test_permission1',1,'2024-11-01 02:41:12','2025-04-16 13:48:14','2025-04-16 13:48:14'),
(63,'test_permission2',1,'2024-11-01 02:41:15','2025-04-16 13:48:12','2025-04-16 13:48:12'),
(64,'test_permission3',1,'2024-11-01 02:41:19','2025-04-16 13:48:10','2025-04-16 13:48:10'),
(65,'pos_screen',1,'2025-04-16 13:48:30','2025-04-16 13:48:30',NULL),
(66,'items_screen',1,'2025-04-16 13:48:36','2025-04-16 13:48:36',NULL),
(67,'unit_type_screen',1,'2025-04-16 13:48:43','2025-04-16 13:48:43',NULL),
(68,'item_categories',1,'2025-04-16 13:48:52','2025-04-16 13:48:52',NULL),
(69,'vendors',1,'2025-04-16 13:48:55','2025-04-16 13:48:55',NULL),
(70,'customers',1,'2025-04-16 13:48:59','2025-04-16 13:48:59',NULL),
(71,'vendor_ledger',1,'2025-04-23 20:57:55','2025-04-23 20:57:55',NULL);

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Created For Laravel Frameowrk';

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values 
(6174,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','1cf2fb6a556d5566d3f5dda072e63e50109c73f62d1d73c11679a76e3849a9b4','[\"*\"]',NULL,NULL,'2024-04-10 20:19:09','2024-04-10 20:19:09'),
(6175,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','62835db7fd954701c2bd052eb7ac5d6b7aa4bdbdb3bf7bf1ac150f807dfdb382','[\"*\"]',NULL,NULL,'2024-04-10 20:19:23','2024-04-10 20:19:23'),
(6176,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','6fe3a1231bc2210db76de28abefa8651d1b602635262f0863d358b026aeb4469','[\"*\"]',NULL,NULL,'2024-04-10 20:19:54','2024-04-10 20:19:54'),
(6177,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','dfca60646f43968b9739076518d3c8d75c560d0342d2dff36b0da04cd91df3c8','[\"*\"]',NULL,NULL,'2024-04-12 13:07:44','2024-04-12 13:07:44'),
(6178,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','28451e52fdf8528415bd11ece9a75bfb4905041cc978befc5f3d731edaac0929','[\"*\"]',NULL,NULL,'2024-04-12 16:09:48','2024-04-12 16:09:48'),
(6179,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','2b84739e438c7c9d2aaa385ae1345ce5a80f9bb8c1b69b72f7b4f77e6c3345e5','[\"*\"]',NULL,NULL,'2024-04-16 11:38:51','2024-04-16 11:38:51'),
(6180,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','b4c30ad12e121b00dcfbc19afee922d6f4a7fa8553eea5d8bc32ea562b3b631a','[\"*\"]',NULL,NULL,'2024-04-16 13:03:48','2024-04-16 13:03:48'),
(6181,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','28099fd36923a62cd806c48be17645dff87239c188baf10919c3212d6deb1510','[\"*\"]',NULL,NULL,'2024-04-19 16:15:01','2024-04-19 16:15:01'),
(6182,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','778f44db2226ce20991666fe8d127556ad521d61138a23096926986b042f8bc6','[\"*\"]',NULL,NULL,'2024-04-19 16:16:57','2024-04-19 16:16:57'),
(6183,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','57cc8856c0e8b898ca68bbd6bf629cf8ca393ff710b93f25385f64db9c18c12d','[\"*\"]',NULL,NULL,'2024-04-19 16:17:04','2024-04-19 16:17:04'),
(6184,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','e2ba9c5a1cfc940a8e153c3714e2ede969a99017a0afe0d0d5299c4d5c911e88','[\"*\"]',NULL,NULL,'2024-04-19 16:17:23','2024-04-19 16:17:23'),
(6185,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','f2ef99c6fca42b93c22b71757651814f5416f65d629b8d2b9ede6225e3d4d84e','[\"*\"]',NULL,NULL,'2024-04-19 16:30:49','2024-04-19 16:30:49'),
(6186,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','cb68299efb76c3f423b7dc4e88475d075b8d4f3e82ed02dbc492aa9d68f01928','[\"*\"]',NULL,NULL,'2024-04-19 16:30:56','2024-04-19 16:30:56'),
(6187,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','a28c96bc97a4fa04c78f94516733ac474ef2a7c45fe4fbf554730e22d082c61d','[\"*\"]',NULL,NULL,'2024-04-19 16:31:11','2024-04-19 16:31:11'),
(6188,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','ee037070ed25a93e06aeb29c3788f4a1ec6a22b5664c20ebdf6a8fc366c6f900','[\"*\"]',NULL,NULL,'2024-04-19 17:05:28','2024-04-19 17:05:28'),
(6189,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','b07259af90d7abaf1c1e91f51beb386e723dff16aa506a0b445f6c4f5fdfcc04','[\"*\"]',NULL,NULL,'2024-04-19 17:05:42','2024-04-19 17:05:42'),
(6190,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','6aa068c55db20c41d9c5cd6115f4c2166a741cbf5e03579386c7f6a4aae7ff99','[\"*\"]',NULL,NULL,'2024-04-19 23:08:55','2024-04-19 23:08:55'),
(6191,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','7e87c1bdf67fa91c7a7c3f20807131f5724edab170b1ac4da3842ea93fe90477','[\"*\"]',NULL,NULL,'2024-04-21 14:16:04','2024-04-21 14:16:04'),
(6192,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','1cf066e05bdf5a99c32e3eb0f7407116d77121b2f77ffb84902197aa75203688','[\"*\"]',NULL,NULL,'2024-04-22 10:27:46','2024-04-22 10:27:46'),
(6193,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','49769412af05e1bee74dbd08dd5936597fb3759cc316aaa63368c5e8f6ccda63','[\"*\"]',NULL,NULL,'2024-04-22 13:39:15','2024-04-22 13:39:15'),
(6194,'App\\Models\\Admin\\ecom_admin_user',83128,'MyApp','b99e6a2661328656fe51a9e646185ca44771f7eba10556d3a69065c69401a8c9','[\"*\"]',NULL,NULL,'2024-04-22 18:51:57','2024-04-22 18:51:57'),
(6195,'App\\Models\\Admin\\ecom_admin_user',83128,'MyApp','74d11e8fd010dbb7835273d9f05689e117c6c58eeca294f69f8079dbc4c9f83d','[\"*\"]',NULL,NULL,'2024-04-22 18:52:28','2024-04-22 18:52:28'),
(6196,'App\\Models\\Admin\\ecom_admin_user',83125,'MyApp','427ca80ee48bed61a22968d68e37ab03aeddcdcd4d30cebc8ce8361464407060','[\"*\"]',NULL,NULL,'2024-04-22 19:11:36','2024-04-22 19:11:36'),
(6197,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','0b25fc388f4ae63be23c75f7c4b9a7fc911e76918c9753a73908faa13a98ad4c','[\"*\"]',NULL,NULL,'2024-04-23 10:17:09','2024-04-23 10:17:09'),
(6198,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','4b91cf3fda8a66f6f165360cc1aa70667d17c7ed8ec5ed1082c7ceb30d53a4a6','[\"*\"]',NULL,NULL,'2024-04-23 19:39:41','2024-04-23 19:39:41'),
(6199,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','9dd3040bf277464171b8b3071b3241729ceedd3a182d3ee8cb1e52ef296de40d','[\"*\"]',NULL,NULL,'2024-04-24 10:24:53','2024-04-24 10:24:53'),
(6200,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','124a13aa6388df5d79fcfd8c1b8849b9d6c14636ce66340a5fde53b3d611b18a','[\"*\"]',NULL,NULL,'2024-04-25 11:48:08','2024-04-25 11:48:08'),
(6201,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','ce77e5150f4aea44302a9f47bc117b871b1dace72438b13a8372573163aaf804','[\"*\"]',NULL,NULL,'2024-04-26 10:41:23','2024-04-26 10:41:23'),
(6202,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','63bdaff029aa647f2e9e90b8dddb1681ca82f223a0c9cc4b30b49abfe554ee9f','[\"*\"]',NULL,NULL,'2024-04-29 11:12:19','2024-04-29 11:12:19'),
(6203,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','0eb2e507bf3326baca901c74e8894b6e3ce55fe0121d64288e56f2baa316bb2b','[\"*\"]',NULL,NULL,'2024-04-30 11:20:18','2024-04-30 11:20:18'),
(6204,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','486dcca5a5595e4f2cb1536fae037d4a5fa663975ad258d9673cc825b0425d76','[\"*\"]',NULL,NULL,'2024-05-01 00:08:17','2024-05-01 00:08:17'),
(6205,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','e5b93d1dbc2fe287f34b4c5be3078dd8139fb7a10f5d70fe0c7c38124b4f4a63','[\"*\"]',NULL,NULL,'2024-05-01 12:35:47','2024-05-01 12:35:47'),
(6206,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','14dd3103c074c650290f8191ee88cc388440f6a36f9ca8ff29567014369f2d7e','[\"*\"]',NULL,NULL,'2024-05-02 10:57:18','2024-05-02 10:57:18'),
(6207,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','4a9e0ee121255dde750ac78d9d126456c888d9af2ad16ea0eb7f5e631d865ac5','[\"*\"]',NULL,NULL,'2024-05-03 10:27:23','2024-05-03 10:27:23'),
(6208,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','60defe2f290a4e661eee81a64484476d31f98d30c98103dbb9d5b25824f5af2d','[\"*\"]',NULL,NULL,'2024-05-06 12:40:05','2024-05-06 12:40:05'),
(6209,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','5c66c8ca319d3b33b970d7ce7869c50f13b0847682006b7bedd890a17d84e6f1','[\"*\"]',NULL,NULL,'2024-05-06 22:01:35','2024-05-06 22:01:35'),
(6210,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','546d43bc61223ff7a22aeefc3fc36b81dadeae30ad3ba62257241fc106d9fe69','[\"*\"]',NULL,NULL,'2024-05-07 13:10:17','2024-05-07 13:10:17'),
(6211,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','11a3906a8a2eae06e47e2f2cbad0a09bee27ed4bb9fdaced8124069c660fe0aa','[\"*\"]',NULL,NULL,'2024-05-07 17:04:35','2024-05-07 17:04:35'),
(6212,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','7aa8fa593db09949e1809bf11aa005a9fddb6db0d891c8b663416540d9301f97','[\"*\"]',NULL,NULL,'2024-05-07 20:49:21','2024-05-07 20:49:21'),
(6213,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','aef22b80c8be39925a8451905cbb686b05274458d9a037fd0fbf7993c3ee2ffd','[\"*\"]',NULL,NULL,'2024-05-08 10:53:36','2024-05-08 10:53:36'),
(6214,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','88ad710ff1eca9be5c83b1a2a300bf6a6e5f70395d8bc551366a12445aa23d6c','[\"*\"]',NULL,NULL,'2024-05-08 13:16:00','2024-05-08 13:16:00'),
(6215,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','f9c50ddb2579430d5d99a55f9d664e3539c46f850c9db68204642822406f6738','[\"*\"]',NULL,NULL,'2024-05-08 16:52:07','2024-05-08 16:52:07'),
(6216,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','279d2ab96e5d0e724b24e9aa4aa5f9669234bd3a053a037efe35c0408df9be3f','[\"*\"]',NULL,NULL,'2024-05-08 16:56:11','2024-05-08 16:56:11'),
(6217,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','849cfffddf0c74852426b205ae89eb93f1930af4b9ec739714a1e77b8a2b37f2','[\"*\"]',NULL,NULL,'2024-05-08 21:53:27','2024-05-08 21:53:27'),
(6218,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','a93ffeb42d9ed55c43b66b61e54a0e7d1220fcf6429050e137b7e05059d223b4','[\"*\"]',NULL,NULL,'2024-05-09 11:05:41','2024-05-09 11:05:41'),
(6219,'App\\Models\\Admin\\ecom_admin_user',83131,'MyApp','d2820747e0dc31569c24cbce151f60476eb582fe0badf273ee8cb2bacfbe3ed3','[\"*\"]',NULL,NULL,'2024-05-09 11:13:17','2024-05-09 11:13:17'),
(6220,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','ffe2604e26418e08ac17d7309f06607152e2211a08e376ab100b0b85635d092d','[\"*\"]',NULL,NULL,'2024-05-09 12:30:02','2024-05-09 12:30:02'),
(6221,'App\\Models\\Admin\\ecom_admin_user',83131,'MyApp','a6f222b7f84c214d70fea050e1c6f1566c1ee3e6c5c3787e135eec7d88bc3e6c','[\"*\"]',NULL,NULL,'2024-05-09 12:41:31','2024-05-09 12:41:31'),
(6222,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','3b46c898650bf909996a52c401714c6e3ee2aa2965d8f72b01a9d93e134e6f33','[\"*\"]',NULL,NULL,'2024-05-09 12:48:31','2024-05-09 12:48:31'),
(6223,'App\\Models\\Admin\\ecom_admin_user',83131,'MyApp','f6b0b78f3d6f95a651bcf2427eaa1bf20306d306eab3bf59b76603d20c02e7e8','[\"*\"]',NULL,NULL,'2024-05-09 12:49:12','2024-05-09 12:49:12'),
(6224,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','af3b3afc1d98f9c58554a113e28501ae6e34b42ec9b0db25302d71ae30a7c4b4','[\"*\"]',NULL,NULL,'2024-05-09 12:49:56','2024-05-09 12:49:56'),
(6225,'App\\Models\\Admin\\ecom_admin_user',83131,'MyApp','3e044e83679ec658bf1fc6b8b1df852ea2df97320ed8b80fadd60f1b5e2dc56a','[\"*\"]',NULL,NULL,'2024-05-09 12:51:04','2024-05-09 12:51:04'),
(6226,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','545442873cea049fcac6b4c3d62471ecfbb5028f85d7cc2ed6e654a2ce60b91b','[\"*\"]',NULL,NULL,'2024-05-09 12:59:25','2024-05-09 12:59:25'),
(6227,'App\\Models\\Admin\\ecom_admin_user',83131,'MyApp','14a979af22692ae8b7667b94ea4d4f9363152246a4a063cebdb00b2713c07a0c','[\"*\"]',NULL,NULL,'2024-05-09 12:59:54','2024-05-09 12:59:54'),
(6228,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','0fa2445a57256030dd2ed85e7d92c70fdf095e567993c495e790a44f5b0ba592','[\"*\"]',NULL,NULL,'2024-05-09 13:01:23','2024-05-09 13:01:23'),
(6229,'App\\Models\\Admin\\ecom_admin_user',83131,'MyApp','8e70e506090c6ae5d3ce0f5020e03f9b493d8ffa474c1092b58062a26a307a7b','[\"*\"]',NULL,NULL,'2024-05-09 13:02:16','2024-05-09 13:02:16'),
(6230,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','3bb5069ac64fcd3544cc64af69a434bb8101e1eeb435f0a89d4f83e4816042f6','[\"*\"]',NULL,NULL,'2024-05-09 13:07:32','2024-05-09 13:07:32'),
(6231,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','494d1b9fe44056303217329e389c2fa8446032bf9a7134eeaadc9b06597b8c86','[\"*\"]',NULL,NULL,'2024-05-09 16:51:06','2024-05-09 16:51:06'),
(6232,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','b1e686fde7db9f8c8868aa206c86213f1bced714bed8a938e770e9249e5339e9','[\"*\"]',NULL,NULL,'2024-05-09 20:01:49','2024-05-09 20:01:49'),
(6233,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','083253852deeea39a49c7da1c09b6b095e034253f06a15bd5289883f2aaceba3','[\"*\"]',NULL,NULL,'2024-05-09 20:02:06','2024-05-09 20:02:06'),
(6234,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','d5739965d624e620e866915cd7c9deeda592e25df6c0dcc8a322f577088d086a','[\"*\"]',NULL,NULL,'2024-05-09 20:34:56','2024-05-09 20:34:56'),
(6235,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','4efbe60d188a210a9ec3f646781ecebb891f3eec0e1926d50ef0aebef4529be8','[\"*\"]',NULL,NULL,'2024-05-10 02:47:19','2024-05-10 02:47:19'),
(6236,'App\\Models\\Admin\\ecom_admin_user',83128,'MyApp','5bd56ec795db02b0fb6c7a1d500ba858c90b76b8f0d46680c87f3899bd50cd6f','[\"*\"]',NULL,NULL,'2024-05-10 02:49:48','2024-05-10 02:49:48'),
(6237,'App\\Models\\Admin\\ecom_admin_user',83128,'MyApp','93533b55f680c2731f7aa56a4c5707d7f34025b728a0c4df9942679aba0c193a','[\"*\"]',NULL,NULL,'2024-05-10 10:06:29','2024-05-10 10:06:29'),
(6238,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','4b236125be7e522c73702132bf753d443c994932ffef43d298c8566959062871','[\"*\"]',NULL,NULL,'2024-05-10 10:09:38','2024-05-10 10:09:38'),
(6239,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','2f74a98fee29ba1aa3915af3d488e80231da2ab42b7f65d499cf28e6b754cbda','[\"*\"]',NULL,NULL,'2024-05-10 10:32:31','2024-05-10 10:32:31'),
(6240,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','f9ed2128253d48d996ac7332cfcd793a23403e25b87d510690743c8d9cd6af09','[\"*\"]',NULL,NULL,'2024-05-10 10:50:35','2024-05-10 10:50:35'),
(6241,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','171a404cd360e84d577125c332b3cb561abf8f6e651369eaf112d025141c72ce','[\"*\"]',NULL,NULL,'2024-05-10 12:18:59','2024-05-10 12:18:59'),
(6242,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','7e8df085247d4825073aa71cf949a9580a3b91f27b633464af3e21ca75cd6cda','[\"*\"]',NULL,NULL,'2024-05-10 16:26:39','2024-05-10 16:26:39'),
(6243,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','1f6a4b84601314ce0e860b1df4cd465bded8ecf45f5dc06935112da16c2fdae4','[\"*\"]',NULL,NULL,'2024-05-11 21:40:05','2024-05-11 21:40:05'),
(6244,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','f85811ff8894cdc46683429099c5baaaa5aa4b7801495be137769a83aef5cb89','[\"*\"]',NULL,NULL,'2024-05-13 10:33:06','2024-05-13 10:33:06'),
(6245,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','0f62d6aea9d4543a24bdb57bbc81596f9a2766842dc8685ba2a0569651460183','[\"*\"]',NULL,NULL,'2024-05-13 12:47:59','2024-05-13 12:47:59'),
(6246,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','8460bae689a5ff681f829feaeeb4a3bcc0c0d1038ca8ef19fb1244037abcc8c3','[\"*\"]',NULL,NULL,'2024-05-13 12:48:58','2024-05-13 12:48:58'),
(6247,'App\\Models\\Admin\\ecom_admin_user',83128,'MyApp','e34519711c6077f7a0e0e72c548cc6e805bb800f25e94b9b426b23fb8f5a2cb8','[\"*\"]',NULL,NULL,'2024-05-13 16:53:09','2024-05-13 16:53:09'),
(6248,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','51c01438115c2e69979dc95ce1fed2dc72dc58001814ecc1694fe160c2f34e49','[\"*\"]',NULL,NULL,'2024-05-13 20:37:53','2024-05-13 20:37:53'),
(6249,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','4e1608b9671a1a520a454cc305bbc2b1739665cae95780ac8b525e776240822c','[\"*\"]',NULL,NULL,'2024-05-14 11:20:13','2024-05-14 11:20:13'),
(6250,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','1a45a07f976ae14e0a8271f9acd2014e4f7fca1faf871d0c3d8e05f26307ecaf','[\"*\"]',NULL,NULL,'2024-05-14 11:24:45','2024-05-14 11:24:45'),
(6251,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','248ea33408baa3a22fe4bbeb4fd8104a6f389cc6bb6c20023c4e2a5081921cd1','[\"*\"]',NULL,NULL,'2024-05-15 10:39:30','2024-05-15 10:39:30'),
(6252,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','ef49df8d7b8b3458858f0dccf870bec04cda928f8c4b5a1b70d5ea5ff1801238','[\"*\"]',NULL,NULL,'2024-05-15 10:45:15','2024-05-15 10:45:15'),
(6253,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','c270746dc29850b44e64ebd5a63b661e670eba07f9024c053de29339026308f1','[\"*\"]',NULL,NULL,'2024-05-15 10:45:44','2024-05-15 10:45:44'),
(6254,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','404d5e569a99f97e8c3a5726f15ce03e0a9cff68cd031acf685fd12b6716c2e0','[\"*\"]',NULL,NULL,'2024-05-15 11:25:19','2024-05-15 11:25:19'),
(6255,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','0147ba1e6b8f617443c4e5a9ffa410cd789dd9e14ae5ac0808d9eb8c99d37b90','[\"*\"]',NULL,NULL,'2024-05-16 12:21:03','2024-05-16 12:21:03'),
(6256,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','435dfc806d2f583c66ce15254d490cf3bb8726b02b716d0b2faefbb89714c5ba','[\"*\"]',NULL,NULL,'2024-05-17 10:10:19','2024-05-17 10:10:19'),
(6257,'App\\Models\\Admin\\ecom_admin_user',83127,'MyApp','e6b3316a5df52026e34a4f3a1b4cef9c71359950a9eea4ce76ecbb9f202ece74','[\"*\"]',NULL,NULL,'2024-05-17 12:21:37','2024-05-17 12:21:37'),
(6258,'App\\Models\\Admin\\ecom_admin_user',83132,'MyApp','9b457ae99e8973b4580e1d91f1516b78a315512acbdb22b9d7dd7cf68c0fece1','[\"*\"]',NULL,NULL,'2024-05-17 12:21:47','2024-05-17 12:21:47'),
(6259,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','0df2c5db783f50e67e01023e03060303fc68897590e10cc8b04b39e0760ae35b','[\"*\"]',NULL,NULL,'2024-05-19 00:30:46','2024-05-19 00:30:46'),
(6260,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','bb1830e76772428f947340b91e16bea281892d77bddf08175d0e322fe2ff800f','[\"*\"]',NULL,NULL,'2024-05-19 11:23:41','2024-05-19 11:23:41'),
(6261,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','ac4340cefb7b7670eb4a3b7c85d2ec24359cbd4a1cda07de0e6cab092d116702','[\"*\"]',NULL,NULL,'2024-05-19 11:51:51','2024-05-19 11:51:51'),
(6262,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','c660382a8383c7f23023a112cba8abf608e0bc2ff199c4bad46568363513ec87','[\"*\"]',NULL,NULL,'2024-05-20 11:22:18','2024-05-20 11:22:18'),
(6263,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','341fc34bfb727ef7df1076e194bc444d3bd33f62d8223fd27b95cbd328a188a5','[\"*\"]',NULL,NULL,'2024-05-21 16:47:42','2024-05-21 16:47:42'),
(6264,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','3c022e1777aea620cdddcf7b11aee274d9e90349d3a9ed46f086da1ffde36413','[\"*\"]',NULL,NULL,'2024-05-22 10:39:35','2024-05-22 10:39:35'),
(6265,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','170b83396424898014b982e4079f2e527f35395e9a1d91511492f307ff3a52e3','[\"*\"]',NULL,NULL,'2024-05-23 12:57:01','2024-05-23 12:57:01'),
(6266,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','e2f530022b2e6db3b9f365efc1a2eaf1c52e6d3ff5c4f095f62fd6e32fe32a04','[\"*\"]',NULL,NULL,'2024-05-24 16:57:47','2024-05-24 16:57:47'),
(6267,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','ea62f634d53c32684582ff484f808622c2034efcaa970aadec011048eaebcfe3','[\"*\"]',NULL,NULL,'2024-05-27 10:10:20','2024-05-27 10:10:20'),
(6268,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','6af5d8dc0dda6d7a320e59a89c359a279d42e0e4b2bd037b16a9acb461ec0a83','[\"*\"]',NULL,NULL,'2024-05-29 11:03:00','2024-05-29 11:03:00'),
(6269,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','7597caddb613d0885e71d68d54053d855b71e5d8b3eb12e799c8b9fd9f65814c','[\"*\"]',NULL,NULL,'2024-05-31 12:23:31','2024-05-31 12:23:31'),
(6270,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','262b3d6268477816478bb515639b987adec5014378aebffbeca643290b8eb645','[\"*\"]',NULL,NULL,'2024-05-31 17:05:27','2024-05-31 17:05:27'),
(6271,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','eb415af000da842e2bc03cd0d20a4412f0766baf3b65032bc44a36a83edf76c1','[\"*\"]',NULL,NULL,'2024-05-31 17:26:18','2024-05-31 17:26:18'),
(6272,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','f0fff9b3922389d6710b90cf53beed6e2471c8f6d4f814a31150095cacde0d22','[\"*\"]',NULL,NULL,'2024-05-31 19:17:41','2024-05-31 19:17:41'),
(6273,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','b827ee044857e1236ead40be8af7a2fbde3d4e502886fa7823ec6c2074ad16d3','[\"*\"]',NULL,NULL,'2024-06-01 12:18:48','2024-06-01 12:18:48'),
(6274,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','2acf9d142283777089f4ac6e33d9cc0b48bcb8fc964e2fc1e0355ccd8a2ee395','[\"*\"]',NULL,NULL,'2024-06-02 21:50:02','2024-06-02 21:50:02'),
(6275,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','2db164d5b716914f7d4d33bfb65f33f7c401bb7092f052a8ad5c87644729f9b8','[\"*\"]',NULL,NULL,'2024-06-03 11:13:46','2024-06-03 11:13:46'),
(6276,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','58b37704796b88aebbb00c70e967a8dcc31252d18954a17f8bb11bee85b3ec42','[\"*\"]',NULL,NULL,'2024-06-03 13:18:04','2024-06-03 13:18:04'),
(6277,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','05f4536d9a869a6534137175d6533f51787c57f6ec7f85b5b73f51a0ec537114','[\"*\"]',NULL,NULL,'2024-06-04 11:14:57','2024-06-04 11:14:57'),
(6278,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','2d0bee25f15cb65907020ae8ac23105daf27a72bdf30b9161cc4f7a3df84c212','[\"*\"]',NULL,NULL,'2024-06-04 12:48:58','2024-06-04 12:48:58'),
(6279,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','f550684c5b193ce0480088fd5e57e3881cb1fc722c0f05740eee3af57da30829','[\"*\"]',NULL,NULL,'2024-06-05 11:50:54','2024-06-05 11:50:54'),
(6280,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','14049fe52822e3bc436509fc030aaa05badf19433d0f03d0ca394a738cadea23','[\"*\"]',NULL,NULL,'2024-06-06 00:53:14','2024-06-06 00:53:14'),
(6281,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','7c2c6fb32ef8b1ba7738ffbf46ad6b18cbca320719ae3e7ae6c95e6e91da7ee7','[\"*\"]',NULL,NULL,'2024-06-06 10:43:00','2024-06-06 10:43:00'),
(6282,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','90b3035220d936ec3c01585b076b4d6ea140f21034223d3e661d19d379efe365','[\"*\"]',NULL,NULL,'2024-06-06 14:07:10','2024-06-06 14:07:10'),
(6283,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','b70616303a1c8303e78610952e71aea3db1a029305e16a42e47c9180a84934bc','[\"*\"]',NULL,NULL,'2024-06-07 10:43:33','2024-06-07 10:43:33'),
(6284,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','e7dec251a66d26c15a4a25b21853f0d17d81f518c6fb24ddad785526167abac4','[\"*\"]',NULL,NULL,'2024-06-07 11:02:48','2024-06-07 11:02:48'),
(6285,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','e4e78984d395d154678414d88270dd271bb422da060becf816c19789d550da43','[\"*\"]',NULL,NULL,'2024-06-07 11:21:37','2024-06-07 11:21:37'),
(6286,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','d9327d66dd8d5f581988c4c96d99f472b309e09baa4dc22aaccf4d2b2a21d1ab','[\"*\"]',NULL,NULL,'2024-06-07 11:21:41','2024-06-07 11:21:41'),
(6287,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','c58b52cde6268a1f0597553da60d6052a88019de3a84b577a55bf5108f0eda8f','[\"*\"]',NULL,NULL,'2024-06-07 11:22:44','2024-06-07 11:22:44'),
(6288,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','1729681d24961133746b1e708667a465b0683f709a674f453173be8b52a37623','[\"*\"]',NULL,NULL,'2024-06-07 21:34:30','2024-06-07 21:34:30'),
(6289,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','537c04a23281ea331f6a42c0e542cbdb2b776d8e498bf2786bb3a10d9a8776b0','[\"*\"]',NULL,NULL,'2024-06-08 09:11:41','2024-06-08 09:11:41'),
(6290,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','5773575c52fa2a988c753804eab0e0c6c69cceabfc4eab67aeb6e15de809acb4','[\"*\"]',NULL,NULL,'2024-06-09 12:23:44','2024-06-09 12:23:44'),
(6291,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','ba2eef4a11ea0c88e20d89dafc9739682722e6b61a205175fbe12ef8df39e791','[\"*\"]',NULL,NULL,'2024-06-09 15:20:33','2024-06-09 15:20:33'),
(6292,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','8d19674e89176a0da3801957e0e8e993a3e0c07f0f3067bf1fd9203d3adae384','[\"*\"]',NULL,NULL,'2024-06-09 15:48:27','2024-06-09 15:48:27'),
(6293,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','2493f503f3df9594655bd62f3a78f652506c38ec19b6e1d3877b28797e21a84a','[\"*\"]',NULL,NULL,'2024-06-09 15:49:14','2024-06-09 15:49:14'),
(6294,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','0058a57504225b3d4135c276c91a4b58c5181475853bf169b22290ac92192ee7','[\"*\"]',NULL,NULL,'2024-06-10 00:52:48','2024-06-10 00:52:48'),
(6295,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','c41e0823f3b46d0eb36533d8f6bee9f8a5859e038fd7582983880aed97630b59','[\"*\"]',NULL,NULL,'2024-06-10 01:44:17','2024-06-10 01:44:17'),
(6296,'App\\Models\\Admin\\ecom_admin_user',166197,'MyApp','62f486dfedd9ca9620e5413dbd37f08ed93fd1b356dcd5bf371bfbbc6a05abf8','[\"*\"]',NULL,NULL,'2024-06-10 01:51:00','2024-06-10 01:51:00'),
(6297,'App\\Models\\Admin\\ecom_admin_user',166196,'MyApp','47af36a6321237dcf1adfed5960414e7cecad07455fc15f0d180b6763c6ad157','[\"*\"]',NULL,NULL,'2024-06-10 01:53:18','2024-06-10 01:53:18'),
(6298,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','dfeacbb845b94ad27eacff6f2c62e7b4797e6811fe520904b44dad9fd3474e0b','[\"*\"]',NULL,NULL,'2024-06-11 05:02:38','2024-06-11 05:02:38'),
(6299,'App\\Models\\Admin\\ecom_admin_user',166196,'MyApp','4a8b8336bb9308055c92316020c38f76a0757e3790061458569037e8f3586f9f','[\"*\"]',NULL,NULL,'2024-06-11 05:05:44','2024-06-11 05:05:44'),
(6300,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','c39a459e5278756c15a59d015845f99176cb0250b6d7f68dd18b8aab3d5b154c','[\"*\"]',NULL,NULL,'2024-06-11 23:58:47','2024-06-11 23:58:47'),
(6301,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','e7968bc148d426a4da870c3472c809297717ee8ee067a467e82148321de94500','[\"*\"]',NULL,NULL,'2024-06-12 07:33:38','2024-06-12 07:33:38'),
(6302,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','dd329b2f0a87176890bf99fd389710f69a16d33d5824276bf7a9dfc1423d6abe','[\"*\"]',NULL,NULL,'2024-06-12 08:03:21','2024-06-12 08:03:21'),
(6303,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','dc90f81ada3f3f90e4d06b24d897d56fcca4594c36b38d5f3191bcfaa9a22365','[\"*\"]',NULL,NULL,'2024-06-12 13:02:26','2024-06-12 13:02:26'),
(6304,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','129e3e537061efd3f5e54dc9a3c55462189e5102ea50bf81af07005f14c51547','[\"*\"]',NULL,NULL,'2024-06-12 19:06:37','2024-06-12 19:06:37'),
(6305,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','a92e4857131ed6e5af3643dcfbbd7ab33a3f511d2f3ad3fcd3141399d660467c','[\"*\"]',NULL,NULL,'2024-06-12 19:30:50','2024-06-12 19:30:50'),
(6306,'App\\Models\\Admin\\ecom_admin_user',166198,'MyApp','d67de35c7fb7a8b66f2af549c40d0d30cf8afedab8a216804b91ce9ebec8715f','[\"*\"]',NULL,NULL,'2024-06-12 19:31:25','2024-06-12 19:31:25'),
(6307,'App\\Models\\Admin\\ecom_admin_user',166196,'MyApp','4d09db80091ee249b01139a831c256147067d8d52957399d127de54567b04dfd','[\"*\"]',NULL,NULL,'2024-06-12 19:59:46','2024-06-12 19:59:46'),
(6308,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','f995ea0c013f3a23360d94a9fe2e24bf823d38e1c5bef2dccf84b595c2628b4c','[\"*\"]',NULL,NULL,'2024-06-13 10:05:15','2024-06-13 10:05:15'),
(6309,'App\\Models\\Admin\\ecom_admin_user',166197,'MyApp','268491c156751aa245a0d079af41bea5b55f5608d57eb6b9efa990d89700ff46','[\"*\"]',NULL,NULL,'2024-06-13 10:06:56','2024-06-13 10:06:56'),
(6310,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','d5748dbb551dc3fe61ca79fd66af8cd01a17cb17796919bc093676b18b00ea7c','[\"*\"]',NULL,NULL,'2024-06-13 13:46:37','2024-06-13 13:46:37'),
(6311,'App\\Models\\Admin\\ecom_admin_user',83124,'MyApp','5f2a369e196f64823c9c79d6a0d45d0ea2faed0b1d41fa8e55f45818242df71c','[\"*\"]',NULL,NULL,'2024-06-13 18:39:35','2024-06-13 18:39:35');

/*Table structure for table `receipt_items` */

DROP TABLE IF EXISTS `receipt_items`;

CREATE TABLE `receipt_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `receipt_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned DEFAULT NULL,
  `item_qty` int NOT NULL,
  `item_price` decimal(8,2) NOT NULL,
  `item_sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_items_receipt_id_foreign` (`receipt_id`),
  KEY `receipt_items_item_id_foreign` (`item_id`),
  CONSTRAINT `receipt_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `receipt_items_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `receipt_items` */

insert  into `receipt_items`(`id`,`receipt_id`,`item_id`,`item_qty`,`item_price`,`item_sub_total`,`created_at`,`updated_at`,`deleted_at`) values 
(1,4,2,1,350.00,350.00,NULL,NULL,NULL),
(2,4,3,2,160.00,320.00,NULL,NULL,NULL),
(3,4,5,2,70.00,140.00,NULL,NULL,NULL),
(4,4,6,1,600.00,600.00,NULL,NULL,NULL),
(5,4,7,1,1200.00,1200.00,NULL,NULL,NULL),
(6,5,2,1,350.00,350.00,NULL,'2025-04-18 21:16:30','2025-04-18 21:16:30'),
(7,6,3,3,160.00,480.00,NULL,NULL,NULL),
(8,6,5,2,70.00,140.00,NULL,NULL,NULL),
(9,6,7,1,1200.00,1200.00,NULL,NULL,NULL),
(10,6,11,2,400.00,800.00,NULL,NULL,NULL),
(11,7,3,2,160.00,320.00,'2025-04-18 21:17:35',NULL,NULL),
(12,7,6,2,600.00,1200.00,'2025-04-18 21:17:35',NULL,NULL),
(13,7,8,2,2400.00,4800.00,'2025-04-18 21:17:35',NULL,NULL),
(14,7,9,2,500.00,1000.00,'2025-04-18 21:17:35',NULL,NULL),
(15,7,11,1,400.00,400.00,'2025-04-18 21:17:35',NULL,NULL),
(16,8,2,1,350.00,350.00,'2025-04-18 21:33:53',NULL,NULL),
(17,8,6,1,600.00,600.00,'2025-04-18 21:33:53',NULL,NULL),
(18,8,7,1,1200.00,1200.00,'2025-04-18 21:33:53',NULL,NULL),
(19,9,2,2,350.00,700.00,'2025-04-19 00:46:00',NULL,NULL),
(20,9,12,1,400.00,400.00,'2025-04-19 00:46:00',NULL,NULL),
(21,10,5,1,70.00,70.00,'2025-04-19 00:47:48',NULL,NULL),
(22,10,6,1,600.00,600.00,'2025-04-19 00:47:48',NULL,NULL),
(23,10,11,1,400.00,400.00,'2025-04-19 00:47:48',NULL,NULL),
(24,10,12,2,400.00,800.00,'2025-04-19 00:47:48',NULL,NULL),
(25,11,2,2,350.00,700.00,'2025-04-19 02:16:30',NULL,NULL),
(26,12,11,1,400.00,400.00,'2025-04-19 02:19:50',NULL,NULL),
(27,13,4,1,400.00,400.00,'2025-04-19 02:22:17',NULL,NULL),
(28,13,6,2,600.00,1200.00,'2025-04-19 02:22:17',NULL,NULL),
(29,13,11,1,400.00,400.00,'2025-04-19 02:22:17',NULL,NULL),
(30,14,7,1,1200.00,1200.00,'2025-04-19 02:23:57',NULL,NULL),
(31,15,2,1,350.00,350.00,'2025-04-19 02:36:14',NULL,NULL),
(32,15,5,2,70.00,140.00,'2025-04-19 02:36:14',NULL,NULL),
(33,15,6,1,600.00,600.00,'2025-04-19 02:36:14',NULL,NULL),
(34,15,11,3,400.00,1200.00,'2025-04-19 02:36:14',NULL,NULL),
(35,15,12,4,400.00,1600.00,'2025-04-19 02:36:14',NULL,NULL),
(36,16,2,1,350.00,350.00,'2025-04-19 03:04:15',NULL,NULL),
(37,16,3,1,160.00,160.00,'2025-04-19 03:04:15',NULL,NULL),
(38,16,5,3,70.00,210.00,'2025-04-19 03:04:15',NULL,NULL),
(39,16,11,1,400.00,400.00,'2025-04-19 03:04:15',NULL,NULL),
(40,16,12,1,400.00,400.00,'2025-04-19 03:04:15',NULL,NULL),
(41,17,11,3,400.00,1200.00,'2025-04-26 02:17:48',NULL,NULL),
(42,18,2,2,350.00,700.00,'2025-04-29 01:12:11',NULL,NULL),
(43,18,3,3,160.00,480.00,'2025-04-29 01:12:11',NULL,NULL),
(44,18,9,1,500.00,500.00,'2025-04-29 01:12:11',NULL,NULL),
(45,18,12,1,400.00,400.00,'2025-04-29 01:12:11',NULL,NULL),
(46,19,2,2,350.00,700.00,'2025-05-01 02:07:02',NULL,NULL),
(47,19,3,3,160.00,480.00,'2025-05-01 02:07:02',NULL,NULL),
(48,19,5,2,70.00,140.00,'2025-05-01 02:07:02',NULL,NULL);

/*Table structure for table `receipts` */

DROP TABLE IF EXISTS `receipts`;

CREATE TABLE `receipts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `total_amount` decimal(10,2) NOT NULL,
  `entry_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipts_entry_by_foreign` (`entry_by`),
  CONSTRAINT `receipts_entry_by_foreign` FOREIGN KEY (`entry_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `receipts` */

insert  into `receipts`(`id`,`total_amount`,`entry_by`,`created_at`,`updated_at`,`deleted_at`) values 
(4,2610.00,1,'2025-04-18 20:51:55','2025-04-18 20:51:55',NULL),
(5,350.00,1,'2025-04-18 21:00:52','2025-04-18 21:16:30','2025-04-18 21:16:30'),
(6,2620.00,1,'2025-04-18 21:11:08','2025-04-18 21:11:08',NULL),
(7,7720.00,1,'2025-04-18 21:17:35','2025-04-18 21:17:35',NULL),
(8,2150.00,1,'2025-04-18 21:33:53','2025-04-18 21:33:53',NULL),
(9,1100.00,1,'2025-04-19 00:46:00','2025-04-19 00:46:00',NULL),
(10,1870.00,1,'2025-04-19 00:47:48','2025-04-19 00:47:48',NULL),
(11,700.00,1,'2025-04-19 02:16:30','2025-04-19 02:16:30',NULL),
(12,400.00,1,'2025-04-19 02:19:50','2025-04-19 02:19:50',NULL),
(13,2000.00,1,'2025-04-19 02:22:17','2025-04-19 02:22:17',NULL),
(14,1200.00,1,'2025-04-19 02:23:57','2025-04-19 02:23:57',NULL),
(15,3890.00,1,'2025-04-19 02:36:14','2025-04-19 02:36:14',NULL),
(16,1520.00,1,'2025-04-19 03:04:15','2025-04-19 03:04:15',NULL),
(17,1200.00,1,'2025-04-26 02:17:48','2025-04-26 02:17:48',NULL),
(18,2080.00,1,'2025-04-29 01:12:11','2025-04-29 01:12:11',NULL),
(19,1320.00,1,'2025-05-01 02:07:02','2025-05-01 02:07:02',NULL);

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `user_id` bigint unsigned DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_user` */

insert  into `role_user`(`user_id`,`role_id`) values 
(1,1),
(1,8),
(2,12),
(3,12),
(4,10),
(5,12),
(5,13),
(5,14),
(6,10),
(7,13),
(12,12),
(14,12),
(15,12),
(9,12),
(13,12),
(11,12),
(8,12),
(16,14),
(17,15),
(18,14);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`title`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Super Admin',1,'2024-06-09 21:20:02','2024-06-26 23:05:06',NULL),
(8,'Manager',1,'2024-08-02 06:53:26','2024-08-28 05:06:37',NULL),
(12,'Employee',1,'2024-10-19 20:36:16','2025-04-28 19:38:29',NULL),
(13,'Cashier',1,'2024-10-19 22:03:37','2025-01-10 19:55:24',NULL),
(14,'Customer',1,'2024-11-01 02:41:35','2025-01-10 19:54:57',NULL),
(15,'Vendor',1,'2025-01-10 19:45:45','2025-01-10 19:55:52',NULL);

/*Table structure for table `unit_types` */

DROP TABLE IF EXISTS `unit_types`;

CREATE TABLE `unit_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `unit_types` */

insert  into `unit_types`(`id`,`name`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'KiloGram',1,'2025-04-16 12:37:32','2025-04-16 12:43:10',NULL),
(2,'Pieces',1,'2025-04-16 12:38:22','2025-04-16 12:38:22',NULL),
(3,'Plate',1,'2025-04-16 12:38:26','2025-04-16 12:38:26',NULL),
(4,'Glass',1,'2025-04-16 12:38:29','2025-04-16 12:38:29',NULL),
(5,'Bottle',1,'2025-04-16 12:38:32','2025-04-16 12:38:32',NULL),
(6,'Litre',1,'2025-04-16 12:38:40','2025-04-16 12:38:40',NULL),
(7,'Grams',1,'2025-04-16 12:38:48','2025-04-16 12:38:48',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`is_active`,`created_at`,`updated_at`,`last_activity`,`designation`) values 
(1,'super_admin','Waqar Mughal','super_admin@gmail.com',NULL,'$2a$12$ZkhVPyp1c31RcmiJWDs7BuBUXLqcxHbc3vcptjziNv/cCRzBJ7upe',NULL,1,'2024-09-09 13:05:51','2025-05-01 20:21:56','2025-05-01 20:21:56',NULL),
(6,NULL,'testing user','waqar@gmail.com',NULL,'$2y$10$0QaRsiSRS3eCYurkxJpVduYjFcXFCFfXi/59LMhFwFazm11GWfNT2',NULL,1,'2025-01-10 19:44:47','2025-01-10 19:44:47',NULL,NULL),
(7,NULL,'Aaamir','aamir@gmail.com',NULL,'$2y$10$x4.kQaRTfiqAYIy/TsmQh.QXrT7HRVU5m1e22tRY9mowVyiAjkFIq',NULL,1,'2025-01-10 20:20:42','2025-01-10 20:20:42',NULL,NULL),
(8,NULL,'Shan','shan@gmail.com',NULL,'$2y$10$.PTZUcEhgkiVPIVq/cu7QOAa9zbkiXK0YEVW8OorQ/aYjGQTyqltC',NULL,1,'2025-01-10 20:21:43','2025-04-15 20:59:52',NULL,'bartan dhulai'),
(9,NULL,'Naseeb Gul ','naseeb@gmail.com',NULL,'$2y$10$J3wxJg3uqNaqJgkDYjJNLOSfJDq5gIsLTskDuL9/eUxRtzk6TDrYm',NULL,1,'2025-01-10 20:22:28','2025-04-15 20:59:23',NULL,'Table man'),
(11,NULL,'naseeb','naseeb@gmail.com',NULL,'$2y$10$SJyiR.hUdr0LVLto/iWvuOvIcFl17oC6LuftesRFA5csycfs4r1yC',NULL,1,'2025-01-11 16:49:37','2025-04-15 20:59:41',NULL,'ustad'),
(12,NULL,'MOhammad Saleem','m.saleem@gmail.com',NULL,'$2y$10$3KB1dZtrpaSBB9dK7/Krgu097hZ1mGRUzZ8ui7ypoIb2T7.EU0zwi',NULL,1,'2025-01-11 16:50:40','2025-04-15 20:58:46',NULL,'Table man'),
(13,NULL,'Mohammad Raaz ','m.raaz@gmail.com',NULL,'$2y$10$GAmdruANqkndiWzn2GJLPeQn5gPhLV9WfdVRnBWkON5zYqH1yBwkC',NULL,1,'2025-01-11 16:51:06','2025-04-15 20:59:31',NULL,'Table man'),
(14,NULL,'Shabby','shabby@gmail.com',NULL,'$2y$10$Iz6dxAdrbY8eaOpkcxQJSeiohVh4vyLC/1pzjFo9Uk1yzU2jnbLPu',NULL,1,'2025-01-11 16:51:23','2025-04-15 20:59:02',NULL,'Table man'),
(15,NULL,'Ahsan','ahsan@gmail.com',NULL,'$2y$10$ZIdunJwn2mgT/eIrkTqfye6l3zcbJGCS4xzwd5PgWHVhaKZSSdvXy',NULL,1,'2025-01-11 16:51:48','2025-04-15 20:59:16',NULL,'Table man'),
(17,NULL,'Koyla wala',NULL,NULL,'$2y$10$CwQ.4APy.9VQOqhaIluSleWqlfrSPIuAxPP82i3vJtzbuGB4/pnYi',NULL,1,'2025-04-16 15:10:10','2025-04-16 15:10:10',NULL,'Koyla wala'),
(18,NULL,'Rehan Bhai',NULL,NULL,'$2y$10$ERnO740X7uXJJB/pOqOpjePBzriw7G9rMhFsDhNutbBJ7jX261KQ6',NULL,1,'2025-04-16 15:10:29','2025-04-16 15:10:29',NULL,NULL);

/*Table structure for table `vendor_items` */

DROP TABLE IF EXISTS `vendor_items`;

CREATE TABLE `vendor_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `purchase_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_items_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `vendor_items_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `vendor_items` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
