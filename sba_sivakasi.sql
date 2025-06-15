-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2025 at 10:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sba_sivakasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_image` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `slug`, `image`, `status`, `created_at`, `updated_at`, `home_image`) VALUES
(1, 'Rice', 'Rice-7492', 'pngtree-taobao-tmall-rice-poster-banner-home-poster-template-image_189319 (1)-891584659-01_20_2023_11_27_am.jpg', 'Active', NULL, '2023-01-20 11:27:04', 'istockphoto-491090528-612x612-1632622560-01_20_2023_11_27_am.jpg'),
(2, 'Dhals and grains', 'Dhals-and-grains-6614', 'legumes-panorama-shot-top-on-260nw-1682187793-669676575-01_20_2023_11_28_am.webp', 'Active', '2023-01-20 11:28:49', '2023-01-20 11:29:30', 'arranged-white-bowls-uncooked-pulses-grains-seeds-w-wood-above-95734816-116408624-01_20_2023_11_29_am.jpg'),
(3, 'Oils', 'Oils-8834', 'rural-stilllife-banner-sunflower-oil-260nw-1353066737-358576114-01_20_2023_11_30_am.webp', 'Active', '2023-01-20 11:30:37', '2023-01-20 11:35:35', 'istockphoto-576732962-170667a-333557141-01_20_2023_11_35_am.jpg'),
(4, 'Flours', 'Flours-181', 'bread-grains-ears-wheat-flour-wooden-background-bakery-advertising-banner_206268-2094-1673207452-01_20_2023_11_31_am.webp', 'Active', '2023-01-20 11:31:57', '2023-01-20 11:31:57', 'bread-grains-ears-wheat-flour-wooden-background-bakery-advertising-banner_206268-2094-2141957473-01_20_2023_11_31_am.webp'),
(5, 'Masala powders', 'Masala-powders-5320', 'various-indian-spices-nuts-herbs-wooden-spoons-metal-bowls-seeds-dark-stone-table-colorful-top-view-banner-94022646-319922349-01_20_2023_11_32_am.jpg', 'Active', '2023-01-20 11:32:44', '2023-01-20 11:32:44', 'various-indian-spices-nuts-herbs-wooden-spoons-metal-bowls-seeds-dark-stone-table-colorful-top-view-banner-94022646-209301474-01_20_2023_11_32_am.jpg'),
(6, 'Dry fruits and nuts', 'Dry-fruits-and-nuts-6413', 'set-different-dry-fruits-white-background-top-view-banner-design-180785486-1187389748-01_20_2023_11_33_am.jpg', 'Active', '2023-01-20 11:33:59', '2023-01-20 11:33:59', 'set-different-dry-fruits-white-background-top-view-banner-design-180785486-1829292051-01_20_2023_11_33_am.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `daybooks`
--

CREATE TABLE `daybooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading_id` bigint(20) UNSIGNED NOT NULL,
  `subheading_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `description_1` text DEFAULT NULL,
  `description_2` text DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daybooks`
--

INSERT INTO `daybooks` (`id`, `heading_id`, `subheading_id`, `date`, `description_1`, `description_2`, `type`, `amount`, `payment_mode`, `created_at`, `updated_at`) VALUES
(3, 67, NULL, '2023-08-14', 'Test', NULL, 'C', '5000', 'cash', '2023-08-14 13:25:47', '2023-08-14 13:25:47'),
(4, 100, NULL, '2023-08-14', 'Test', NULL, 'D', '500', 'cash', '2023-08-14 13:27:56', '2023-08-14 13:32:17'),
(5, 61, NULL, '2023-08-14', NULL, NULL, 'C', '1000', 'cash', '2023-08-14 13:30:49', '2023-08-14 13:30:49'),
(6, 59, NULL, '2023-08-14', NULL, NULL, 'C', '500', 'cash', '2023-08-14 13:31:10', '2023-08-14 13:31:10'),
(7, 96, NULL, '2023-08-14', NULL, NULL, 'D', '3000', 'cash', '2023-08-14 13:31:43', '2023-08-14 13:31:43'),
(8, 67, NULL, '2023-08-16', 'Test', NULL, 'C', '6000', 'cash', '2023-08-16 05:16:27', '2023-08-16 05:32:33'),
(9, 57, NULL, '2023-08-16', 'Test', NULL, 'D', '500', 'cash', '2023-08-16 05:21:13', '2023-08-16 05:33:02'),
(10, 98, NULL, '2023-08-16', NULL, NULL, 'C', '3000', 'cash', '2023-08-16 05:31:30', '2023-08-16 05:31:30'),
(11, 65, NULL, '2023-08-16', NULL, NULL, 'C', '500', 'cash', '2023-08-16 05:31:47', '2023-08-16 05:31:47'),
(16, 59, NULL, '2023-12-11', NULL, NULL, 'C', '500', 'cash', '2023-12-12 04:57:50', '2023-12-12 04:57:50'),
(17, 98, NULL, '2024-04-01', NULL, NULL, 'C', '88095', 'cash', '2024-04-03 07:20:30', '2024-04-03 07:20:30'),
(18, 98, NULL, '2024-04-01', 'Coins', NULL, 'C', '71', 'cash', '2024-04-03 07:20:59', '2024-04-03 07:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_areas`
--

CREATE TABLE `delivery_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pin_code` bigint(20) NOT NULL,
  `area` varchar(191) NOT NULL,
  `delivery_charge` double NOT NULL DEFAULT 0,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_areas`
--

INSERT INTO `delivery_areas` (`id`, `pin_code`, `area`, `delivery_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 625001, 'Town Area', 20, 'Active', '2023-01-12 16:15:56', '2023-04-27 18:34:29'),
(2, 625402, 'Samayanallur', 20, 'Active', '2023-01-21 18:04:10', '2023-04-27 18:34:05'),
(3, 625016, 'Bye Pass Road', 0, 'Active', '2023-04-17 16:45:10', '2023-04-27 17:26:37'),
(4, 625019, 'Nagamalai', 25, 'Active', '2023-04-18 11:30:23', '2023-04-27 18:22:02'),
(5, 625018, 'Vilangudi', 10, 'Active', '2023-04-21 14:48:05', '2023-04-27 18:21:17'),
(6, 611111, 'Anna Nagar', 25, 'Active', '2023-05-01 17:27:51', '2023-05-05 17:55:47'),
(7, 614701, 'Athirampattinam', 25, 'Active', '2023-05-10 13:34:18', '2023-05-10 13:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_days`
--

CREATE TABLE `delivery_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_area_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_days`
--

INSERT INTO `delivery_days` (`id`, `delivery_area_id`, `day`, `created_at`, `updated_at`) VALUES
(47, 3, 'sunday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(48, 3, 'monday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(49, 3, 'tuesday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(50, 3, 'wednesday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(51, 3, 'thursday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(52, 3, 'friday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(53, 3, 'saturday', '2023-04-27 17:26:37', '2023-04-27 17:26:37'),
(54, 5, 'monday', '2023-04-27 18:21:17', '2023-04-27 18:21:17'),
(55, 5, 'tuesday', '2023-04-27 18:21:17', '2023-04-27 18:21:17'),
(56, 5, 'wednesday', '2023-04-27 18:21:17', '2023-04-27 18:21:17'),
(57, 5, 'thursday', '2023-04-27 18:21:17', '2023-04-27 18:21:17'),
(58, 5, 'friday', '2023-04-27 18:21:17', '2023-04-27 18:21:17'),
(59, 5, 'saturday', '2023-04-27 18:21:17', '2023-04-27 18:21:17'),
(60, 4, 'monday', '2023-04-27 18:22:02', '2023-04-27 18:22:02'),
(61, 4, 'tuesday', '2023-04-27 18:22:02', '2023-04-27 18:22:02'),
(62, 4, 'wednesday', '2023-04-27 18:22:02', '2023-04-27 18:22:02'),
(63, 4, 'thursday', '2023-04-27 18:22:02', '2023-04-27 18:22:02'),
(64, 4, 'friday', '2023-04-27 18:22:02', '2023-04-27 18:22:02'),
(65, 4, 'saturday', '2023-04-27 18:22:02', '2023-04-27 18:22:02'),
(79, 2, 'monday', '2023-04-27 18:34:05', '2023-04-27 18:34:05'),
(80, 2, 'tuesday', '2023-04-27 18:34:05', '2023-04-27 18:34:05'),
(81, 2, 'wednesday', '2023-04-27 18:34:05', '2023-04-27 18:34:05'),
(82, 2, 'thursday', '2023-04-27 18:34:05', '2023-04-27 18:34:05'),
(83, 2, 'friday', '2023-04-27 18:34:05', '2023-04-27 18:34:05'),
(84, 2, 'saturday', '2023-04-27 18:34:05', '2023-04-27 18:34:05'),
(85, 1, 'monday', '2023-04-27 18:34:29', '2023-04-27 18:34:29'),
(86, 1, 'tuesday', '2023-04-27 18:34:29', '2023-04-27 18:34:29'),
(87, 1, 'wednesday', '2023-04-27 18:34:29', '2023-04-27 18:34:29'),
(88, 1, 'thursday', '2023-04-27 18:34:29', '2023-04-27 18:34:29'),
(89, 1, 'friday', '2023-04-27 18:34:29', '2023-04-27 18:34:29'),
(90, 1, 'saturday', '2023-04-27 18:34:29', '2023-04-27 18:34:29'),
(110, 6, 'sunday', '2023-05-05 17:55:47', '2023-05-05 17:55:47'),
(111, 6, 'monday', '2023-05-05 17:55:47', '2023-05-05 17:55:47'),
(112, 6, 'tuesday', '2023-05-05 17:55:47', '2023-05-05 17:55:47'),
(113, 6, 'thursday', '2023-05-05 17:55:47', '2023-05-05 17:55:47'),
(114, 6, 'friday', '2023-05-05 17:55:47', '2023-05-05 17:55:47'),
(115, 6, 'saturday', '2023-05-05 17:55:47', '2023-05-05 17:55:47'),
(117, 7, 'monday', '2023-05-10 13:45:03', '2023-05-10 13:45:03'),
(118, 7, 'friday', '2023-05-10 13:45:03', '2023-05-10 13:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_slots`
--

CREATE TABLE `delivery_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `deliveries` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_slots`
--

INSERT INTO `delivery_slots` (`id`, `delivery_area_id`, `day`, `start`, `end`, `deliveries`, `status`, `created_at`, `updated_at`, `default`) VALUES
(1, 2, 'Sunday', '12:44:31', '12:44:31', 1000, 'Active', '2023-01-12 12:44:31', '2023-01-12 12:44:31', 'Yes'),
(2, 3, 'Wednesday', '10:00:00', '18:00:00', 12, 'Active', '2023-01-12 16:16:45', '2023-04-27 18:10:11', 'No'),
(3, 1, 'Monday', '10:00:00', '18:00:00', 20, 'Active', '2023-01-12 16:17:52', '2023-04-27 18:27:44', 'No'),
(4, 3, 'Saturday', '10:00:00', '18:00:00', 12, 'Active', '2023-04-21 10:57:50', '2023-04-27 18:09:36', 'No'),
(5, 3, 'Monday', '10:00:00', '13:00:00', 10, 'Active', '2023-04-21 14:48:51', '2023-04-27 19:31:50', 'No'),
(6, 3, 'Tuesday', '10:00:00', '18:00:00', 10, 'Active', '2023-04-27 17:27:39', '2023-04-27 18:07:46', 'No'),
(7, 3, 'Friday', '10:00:00', '13:00:00', 10, 'Active', '2023-04-27 17:27:59', '2023-04-27 19:33:24', 'No'),
(8, 3, 'Thursday', '10:00:00', '18:00:00', 10, 'Active', '2023-04-27 17:28:22', '2023-04-27 17:42:20', 'No'),
(9, 4, 'Monday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:22:30', '2023-04-27 18:22:30', 'No'),
(10, 4, 'Tuesday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:22:54', '2023-04-27 18:22:54', 'No'),
(11, 4, 'Wednesday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:23:20', '2023-04-27 18:23:20', 'No'),
(12, 4, 'Thursday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:23:44', '2023-04-27 18:23:44', 'No'),
(13, 4, 'Friday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:24:08', '2023-04-27 18:24:08', 'No'),
(14, 4, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:24:31', '2023-04-27 18:24:31', 'No'),
(15, 1, 'Tuesday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:27:11', '2023-04-27 18:27:44', 'No'),
(16, 1, 'Wednesday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:27:37', '2023-04-27 18:27:37', 'No'),
(17, 1, 'Thursday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:28:26', '2023-04-27 18:28:26', 'No'),
(18, 1, 'Friday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:28:50', '2023-04-27 18:28:50', 'No'),
(19, 1, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2023-04-27 18:29:11', '2023-04-27 18:29:11', 'No'),
(20, 3, 'Monday', '14:00:00', '19:00:00', 10, 'Active', '2023-04-27 19:31:50', '2023-04-27 19:31:50', 'No'),
(21, 3, 'Friday', '14:00:00', '19:00:00', 10, 'Active', '2023-04-27 19:33:24', '2023-04-27 19:33:24', 'No'),
(22, 6, 'Monday', '11:00:00', '15:17:00', 1, 'Active', '2023-05-05 10:17:53', '2023-05-05 10:17:53', 'No'),
(23, 7, 'Monday', '13:48:00', '19:48:00', 2, 'Active', '2023-05-10 13:48:35', '2023-05-10 13:48:35', 'No'),
(24, 7, 'Friday', '13:55:00', '18:55:00', 2, 'Active', '2023-05-10 13:55:47', '2023-05-10 13:55:47', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `denominations`
--

CREATE TABLE `denominations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `front_office_daybook_id` varchar(255) DEFAULT NULL,
  `godown_daybook_id` varchar(255) DEFAULT NULL,
  `online_daybook_id` varchar(255) DEFAULT NULL,
  `denomination_1` int(255) DEFAULT NULL,
  `denomination_2` int(255) DEFAULT NULL,
  `denomination_5` int(255) DEFAULT NULL,
  `denomination_10` int(255) DEFAULT NULL,
  `denomination_20` int(255) DEFAULT NULL,
  `denomination_50` int(255) DEFAULT NULL,
  `denomination_100` int(255) DEFAULT NULL,
  `denomination_200` int(255) DEFAULT NULL,
  `denomination_500` int(255) DEFAULT NULL,
  `denomination_2000` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `denominations`
--

INSERT INTO `denominations` (`id`, `front_office_daybook_id`, `godown_daybook_id`, `online_daybook_id`, `denomination_1`, `denomination_2`, `denomination_5`, `denomination_10`, `denomination_20`, `denomination_50`, `denomination_100`, `denomination_200`, `denomination_500`, `denomination_2000`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 1, 1, 1, NULL, '2023-08-14 10:31:15', '2023-08-14 10:31:15'),
(2, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, NULL, NULL, NULL, '2023-08-14 10:31:41', '2023-08-14 10:31:41'),
(3, '3', NULL, NULL, 200, 100, 20, 10, 5, 4, 1, 5, 6, NULL, '2023-08-14 13:25:47', '2023-08-14 13:25:47'),
(4, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -5, NULL, NULL, NULL, '2023-08-14 13:27:56', '2023-08-14 13:32:17'),
(5, '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, '2023-08-14 13:30:49', '2023-08-14 13:30:49'),
(6, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, '2023-08-14 13:31:10', '2023-08-14 13:31:10'),
(7, '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -6, NULL, '2023-08-14 13:31:43', '2023-08-14 13:31:43'),
(8, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, '2023-08-14 13:35:26', '2023-08-14 13:36:36'),
(9, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2023-08-14 13:35:43', '2023-08-14 13:35:43'),
(10, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, -2, NULL, NULL, '2023-08-14 13:36:06', '2023-08-14 13:37:18'),
(11, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, 2, NULL, '2023-08-14 13:40:10', '2023-08-14 13:40:10'),
(12, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, -3, NULL, NULL, NULL, '2023-08-14 13:40:27', '2023-08-14 13:41:46'),
(13, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 2, 5, NULL, NULL, '2023-08-14 13:40:54', '2023-08-14 13:42:08'),
(14, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2023-08-14 13:41:13', '2023-08-14 13:41:13'),
(15, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, -1, NULL, '2023-08-14 13:41:29', '2023-08-14 13:41:29'),
(16, '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, NULL, '2023-08-16 05:16:27', '2023-08-16 05:32:33'),
(17, '9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, NULL, '2023-08-16 05:21:13', '2023-08-16 05:33:02'),
(18, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, '2023-08-16 05:31:30', '2023-08-16 05:31:30'),
(19, '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2023-08-16 05:31:47', '2023-08-16 05:31:47'),
(20, '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -3, NULL, NULL, NULL, '2023-08-16 05:32:05', '2023-08-16 05:32:05'),
(21, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, 4, NULL, '2023-08-16 05:36:10', '2023-08-16 05:36:10'),
(22, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -2, NULL, '2023-08-16 05:36:33', '2023-08-16 05:37:55'),
(23, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, -2, NULL, NULL, '2023-08-16 05:37:00', '2023-08-16 05:37:00'),
(24, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, '2023-08-16 05:37:22', '2023-08-16 05:37:22'),
(25, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -3, NULL, NULL, '2023-08-16 05:37:36', '2023-08-16 05:37:36'),
(26, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2023-08-16 05:38:38', '2023-08-16 05:38:38'),
(27, NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, NULL, '2023-08-16 05:39:01', '2023-08-16 05:39:01'),
(28, NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, 2, NULL, '2023-08-16 05:39:33', '2023-08-16 05:39:33'),
(29, NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -2, NULL, '2023-08-16 05:39:46', '2023-08-16 05:40:01'),
(36, NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-12 04:54:53', '2023-12-12 04:54:53'),
(38, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-12 04:57:13', '2023-12-12 04:57:13'),
(39, '16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-12 04:57:50', '2023-12-12 04:57:50'),
(40, NULL, NULL, '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-12 04:58:30', '2023-12-12 04:58:30'),
(41, '17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 07:20:30', '2024-04-03 07:20:30'),
(42, '18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 07:20:59', '2024-04-03 07:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Manager', 'Y', '2023-03-25 05:29:30', '2023-06-07 08:52:15'),
(14, 'Salesman', 'Y', '2023-04-01 06:25:10', '2023-04-01 06:25:10'),
(16, 'Front Office', 'Y', '2023-04-02 13:18:00', '2023-04-02 13:20:37'),
(17, 'Coordinator', 'Y', '2023-04-02 13:18:32', '2023-04-02 13:18:32'),
(18, 'Accounts', 'Y', '2023-04-02 13:18:51', '2023-04-02 13:20:46'),
(19, 'Commercial', 'Y', '2023-04-02 13:19:17', '2023-04-02 13:20:55'),
(20, 'Hobey', 'Y', '2023-04-02 13:20:05', '2023-04-02 13:21:07'),
(21, 'Mechanics', 'Y', '2023-04-02 13:20:29', '2023-04-02 13:20:29'),
(22, 'Mandatory Inspection', 'Y', '2023-04-02 13:21:31', '2023-04-02 13:21:31'),
(23, 'Truck drivers', 'Y', '2023-04-02 13:22:07', '2023-04-02 13:22:07'),
(24, 'Van drivers', 'Y', '2023-04-02 13:22:19', '2023-04-02 13:22:19'),
(25, 'Godown incharge', 'Y', '2023-04-02 13:22:52', '2023-04-02 13:22:52'),
(26, 'Godown watchman', 'Y', '2023-04-02 13:23:05', '2023-05-26 05:05:59'),
(27, 'Scheduling', 'Y', '2023-04-02 13:23:35', '2023-04-02 13:23:35'),
(28, 'HR', 'Y', '2023-04-02 13:24:01', '2023-04-02 13:24:01'),
(29, 'Reticulated', 'Y', '2023-04-02 13:24:30', '2023-04-02 13:24:30'),
(30, 'Madurai Kadai Anaiyur', 'Y', '2023-04-02 13:24:44', '2023-04-02 13:24:44'),
(31, 'Shri Balaji Sivakasi Bharatgas', 'Y', '2023-04-02 13:25:05', '2023-04-02 13:25:05'),
(32, 'House Keeping', 'Y', '2023-04-02 13:25:24', '2023-04-02 13:25:24'),
(33, 'External consultant', 'Y', '2023-04-02 13:25:41', '2023-04-02 13:25:41'),
(35, 'DRIVER', 'Y', '2023-04-28 07:39:49', '2023-04-28 07:39:49'),
(36, 'CLERK', 'Y', '2023-04-28 07:39:59', '2023-04-28 07:39:59'),
(38, 'Customer Connect', 'Y', '2023-06-07 11:20:17', '2023-06-07 11:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `device_type` enum('Android','iOS','Web') NOT NULL DEFAULT 'Android',
  `device_token` varchar(191) DEFAULT NULL,
  `device_name` varchar(191) DEFAULT NULL,
  `status` enum('Login','LogOut') NOT NULL DEFAULT 'Login',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_tokens`
--

INSERT INTO `device_tokens` (`id`, `user_id`, `device_type`, `device_token`, `device_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Android', 'eoQSyWL0RrGYnsbwJsw8PN:APA91bHsnkVRtMe5ksEqKwMTm5OFDqnZhGsgKNC7vzy-ATbC28aqTD41-p6RyKeGP60edzsXM7rtYklZ0c26yADI4n118gGBj-MFnIL3oF32CmfhRcmopCX8oNZkyVhZmoTpQbzAiyr4', 'Vivo V2036', 'Login', '2023-01-12 20:16:22', '2023-05-08 18:17:21'),
(2, 3, 'Android', 'czDYQavCSC27bdKNr_icuZ:APA91bF4SLd3ehhosbeTjDzG3WrJn_8eqQXVM_HalGnpNauRLdKuokwIPVNCTqd89bINUs2cFLCqo9N6UywshsuhdL25Fkgk2sRmiEKCKqjb_G93pWiUJxWyHd5g6vHoUMhx2gwmtfwC', 'Vivo V2036', 'Login', '2023-01-20 10:15:07', '2023-01-20 11:03:53'),
(3, 4, 'Android', 'eoQSyWL0RrGYnsbwJsw8PN:APA91bHsnkVRtMe5ksEqKwMTm5OFDqnZhGsgKNC7vzy-ATbC28aqTD41-p6RyKeGP60edzsXM7rtYklZ0c26yADI4n118gGBj-MFnIL3oF32CmfhRcmopCX8oNZkyVhZmoTpQbzAiyr4', 'Vivo V2036', 'LogOut', '2023-01-20 10:56:35', '2023-05-08 18:16:52'),
(4, 2, 'Android', 'chl6W7EESwykUHOT-nVBmY:APA91bGZlrJFt22VMPdnH2P_fpYVU6FKtFfV5mk2W5IGhgBgc7u1TmXPv4EQAYoBMToSOoVaXUfzvSSfhkqsRNcZep2wTg4a1Q69ijqwT_TmGGXfsK1GQnQeCGir9v9G1PvgYUZzuolC', 'Motorola moto e(7) power', 'Login', '2023-01-21 11:27:54', '2023-01-21 11:27:54'),
(5, 4, 'Android', 'eVin8j9GTk2L3ocXLGvFl6:APA91bFi2Pg-sddZSjuW8yHakfX31GIU49FbhzVb4zE2IEFYVRF3DkmXETc0I0ASD1tjoe1t_x8Rz8rclCjAKzGebA5TrFnCjyJLhBT3HYPc4Wj9QXHDcOuE4iU29isU0cvpxvgbzVav', 'OPPO CPH2127', 'LogOut', '2023-01-23 12:46:24', '2023-05-09 17:31:28'),
(6, 6, 'Android', 'fN2M6s1ST6CKtYvljJzI4S:APA91bGgQJzSKEOU21qZQS-yyz6EfMKCNpSjeuBaZgQUtMts_1-9grFaXb6Lz3selP9t_mQzFT-xodLQYkDa1XcZYhTk6cZG8DJivUYKxxLl28J5S0ODgcmdU2ALQJtsaGRynL8jEEWC', 'OPPO CPH1901', 'Login', '2023-02-15 12:17:17', '2023-05-26 12:05:43'),
(7, 11, 'Android', 'cwWy9IhPQP2D5uFUP3NVrE:APA91bF5uoIC3kBi_P5TOjxcgzpSb7friWAV4NYgmyR5RRZvfNrRd6O2zTBnjl-qv2Vv3dOKWOAGGfhIFXYFP5L-_OkWTY-u40GqGnKlTQ8Iy5buaaHKq3TMn-84nfomcZdxpioPjKRN', 'OPPO CPH2127', 'Login', '2023-04-01 13:12:28', '2023-04-01 13:12:28'),
(8, 13, 'Android', 'fTReP0MsQL6SMNQBznDbHy:APA91bE7zUBHVFPd4-rz9zP_sWuEOLCfx2N5MF0dkJenqyFsjHpBEnak3cJyP9M0bgV_pZl1oydctmFRXXMTOGxBDHhllO0948sy5fRz4Ah13J_onVy5iEW1Smi2SpfKgbuS0rZfYL3N', 'Lenovo K8 Plus', 'Login', '2023-04-01 14:31:37', '2023-04-19 11:18:49'),
(9, 14, 'Android', 'dNGtLnEgTyy0_3aJD0l-7M:APA91bG3fMu7gid2jBEad8rzON3h51ePkJrc2OGOi4ZKj-TQ-E5SaiUktu7vWvXBcM9yGxy6-Gq1PkoJuJ1hOmoSh3pgPqNfvzqNq6d8rjRws6mLrdkOJ0ISAl8wTbpIuLceQ5daK3T3', 'Samsung SM-M127G', 'Login', '2023-04-15 08:51:25', '2023-04-15 08:51:25'),
(10, 15, 'Android', 'eyVizq1ZS4uT86EkqPEOHI:APA91bEqSa9kwj0HwuofWjwqeXv-rX6yGRJbl7xBpHqwDCIQn7t0Wk8R3ZWoso7e624U9MUnCPfWJxm0mfZdGJN-EtEm98zQbsE9nhf_woi8Qhuc-SmKerOOhCoXSBQYfccXOZs0WZoR', 'Google Pixel 4a', 'Login', '2023-04-17 17:47:12', '2023-04-17 17:47:12'),
(11, 16, 'Android', 'cX5QHwZ2SmW7Xpev5CVqcP:APA91bEe5Ixx3TLqYZDQEk0POnRjYrDQSty1FSSSE7Fb3X3G_s9wo17cKDYl9sLkStMFZ5GIXE0dvCyRxfZ2hwkOFHqMCZF-V19Z1tqWwV2sqY9PSA_fN9nIohteyVlNvR_cOrA6yS5r', 'Xiaomi M2006C3LI', 'Login', '2023-04-18 11:33:58', '2023-04-18 11:33:58'),
(12, 8, 'Android', 'fLdPLw40T56ca5HrBy3XGn:APA91bF5K_Au7Oq72MHxye_dB-wSP80jnStjxPsTBRxeWQhqxye63WEPcCn2wLkkex0bE8iXQo5VCP7H-IadVnk-AEF6hIDoWKvinMagKAfvmjT1OtKgK4cHvgGb0xaaB5n1Eb8a68XV', 'OPPO CPH1901', 'Login', '2023-04-18 13:29:43', '2023-04-18 13:33:08'),
(13, 13, 'Android', 'c_aGfl9rSOCK5XdDuQx2fZ:APA91bEO7KIH8buKslYK5zyTMadkR2dU3JceNcFNG5mJ4lX-Ye_MkzYayZEojR7rux94qc2h3vzAQXqDupdY6ejEDaBv1AIdZFOuxkeJ11lj7-1Ar6ABw1g0bnCWqwkta1zbjjJUhr5m', 'Xiaomi M2004J19C', 'Login', '2023-04-18 20:15:15', '2023-04-18 20:15:15'),
(14, 18, 'Android', 'eVin8j9GTk2L3ocXLGvFl6:APA91bFi2Pg-sddZSjuW8yHakfX31GIU49FbhzVb4zE2IEFYVRF3DkmXETc0I0ASD1tjoe1t_x8Rz8rclCjAKzGebA5TrFnCjyJLhBT3HYPc4Wj9QXHDcOuE4iU29isU0cvpxvgbzVav', 'OPPO CPH2127', 'LogOut', '2023-05-09 17:32:30', '2023-05-09 17:34:39'),
(15, 19, 'Android', 'fkIvVo6AQZ-2kj9pVF5JZI:APA91bGtRDgWwigVhWK5MrgQoTtu09f5W3gC7-F1Tu1RGdCIPxvfm0i4iwjeqQvkQtcSktJy84_Tb1LMTuxbH-7Hi4NcvMmlaj9RrnoLjhGceMvDgzLubtsQ66qB1ufEfSZCj6pYEFqB', 'OPPO CPH2127', 'LogOut', '2023-05-09 17:35:33', '2023-05-10 13:05:05'),
(16, 20, 'Android', 'fkIvVo6AQZ-2kj9pVF5JZI:APA91bGtRDgWwigVhWK5MrgQoTtu09f5W3gC7-F1Tu1RGdCIPxvfm0i4iwjeqQvkQtcSktJy84_Tb1LMTuxbH-7Hi4NcvMmlaj9RrnoLjhGceMvDgzLubtsQ66qB1ufEfSZCj6pYEFqB', 'OPPO CPH2127', 'LogOut', '2023-05-10 13:06:22', '2023-05-10 15:45:28'),
(17, 21, 'Android', 'fgEFcSn1SyulAq2J1KQK1h:APA91bEY3ijisAPgk6iZfyMDZ6P_r3xMUrcj4kg1v0hRX-ODUc-WrlW_0eNBRfppxpjkofqKj1Qif157wdo1lEHS-kxKTrhZQq_MAyXgefi_yObS7TS3jWIAH9XhocJ_quSb93hPBHwZ', 'OPPO CPH2127', 'Login', '2023-05-10 15:46:11', '2023-05-10 16:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `godown_day_books`
--

CREATE TABLE `godown_day_books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading_id` bigint(20) UNSIGNED NOT NULL,
  `subheading_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `description_1` text DEFAULT NULL,
  `description_2` text DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `payment_mode` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `godown_day_books`
--

INSERT INTO `godown_day_books` (`id`, `heading_id`, `subheading_id`, `date`, `description_1`, `description_2`, `type`, `amount`, `payment_mode`, `created_at`, `updated_at`) VALUES
(1, 56, NULL, '2023-08-14', 'Test', NULL, 'C', '1500', 'cash', '2023-08-14 13:35:26', '2023-08-14 13:36:36'),
(2, 71, NULL, '2023-08-14', NULL, NULL, 'C', '1000', 'cash', '2023-08-14 13:35:43', '2023-08-14 13:35:43'),
(3, 101, NULL, '2023-08-14', NULL, NULL, 'D', '500', 'cash', '2023-08-14 13:36:06', '2023-08-14 13:37:18'),
(4, 56, NULL, '2023-08-16', NULL, NULL, 'C', '3500', 'cash', '2023-08-16 05:36:10', '2023-08-16 05:36:10'),
(5, 57, NULL, '2023-08-16', NULL, NULL, 'D', '1000', 'cash', '2023-08-16 05:36:33', '2023-08-16 05:37:55'),
(6, 57, NULL, '2023-08-16', NULL, NULL, 'D', '500', 'cash', '2023-08-16 05:37:00', '2023-08-16 05:37:00'),
(7, 59, NULL, '2023-08-16', NULL, NULL, 'C', '650', 'cash', '2023-08-16 05:37:22', '2023-08-16 05:37:22'),
(11, 57, NULL, '2023-12-11', NULL, NULL, 'C', '500', 'cash', '2023-12-12 04:57:13', '2023-12-12 04:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `headings`
--

CREATE TABLE `headings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `headings`
--

INSERT INTO `headings` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(57, '19 kg Commercial Cylinder Sales', 'active', '2023-05-11 05:22:45', '2023-10-27 12:36:36'),
(59, '5 kg FTL NC Sales', 'active', '2023-05-11 05:23:42', '2023-10-27 12:36:52'),
(61, '5 kg FTL Refill Sales', 'active', '2023-05-11 05:24:40', '2023-10-27 12:37:04'),
(65, 'Showroom Maintenance', 'active', '2023-05-11 05:29:30', '2023-10-27 12:37:27'),
(67, 'Godown Maintenance', 'active', '2023-05-11 05:36:20', '2023-10-27 12:35:22'),
(96, 'Tax', 'active', '2023-05-11 06:36:51', '2023-10-27 12:47:20'),
(98, 'OB', 'active', '2023-05-11 06:37:35', '2023-10-27 12:38:01'),
(100, 'CB', 'active', '2023-05-11 06:37:45', '2023-05-11 06:37:45'),
(121, 'Salary', 'active', '2023-10-27 12:38:10', '2023-10-27 12:38:10'),
(122, 'Van 9865', 'active', '2023-10-27 12:44:22', '2023-10-27 12:44:22'),
(123, 'Van 6486', 'active', '2023-10-27 12:45:11', '2023-10-27 12:45:11'),
(124, 'Staff Welfare', 'active', '2023-10-27 12:45:28', '2023-10-27 12:45:28'),
(125, 'BPCL Charges', 'active', '2023-10-27 12:47:04', '2023-10-27 12:47:04'),
(126, 'Bank Charges', 'active', '2023-10-27 12:52:47', '2023-10-27 12:52:47'),
(127, 'BLPG Sales', 'active', '2023-10-27 12:52:56', '2023-10-27 12:52:56'),
(128, 'Advertisement', 'active', '2023-10-27 13:21:20', '2023-10-27 13:21:20'),
(130, 'Computer Maintenance', 'active', '2023-10-27 13:31:09', '2023-10-27 13:31:24'),
(131, 'Internal Transfer', 'active', '2023-10-27 13:33:47', '2023-10-27 13:33:47'),
(132, 'Manivannan', 'active', '2023-10-27 13:34:30', '2023-10-27 13:34:30'),
(133, 'Phone', 'active', '2023-10-27 13:34:40', '2023-10-27 13:34:40'),
(134, 'Pooja Expences', 'active', '2023-10-27 13:34:57', '2023-10-27 13:34:57'),
(135, 'Postage / Courier / Cartage', 'active', '2023-10-27 13:35:09', '2023-10-27 13:35:09'),
(136, 'Stationaries', 'active', '2023-10-27 13:35:32', '2023-10-27 13:35:32'),
(137, 'Van 0482', 'active', '2024-04-03 07:06:54', '2024-04-03 07:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `inspections`
--

CREATE TABLE `inspections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consumer_number` varchar(255) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `date_of_inspection` date NOT NULL,
  `form_number` varchar(255) NOT NULL,
  `file_number` varchar(255) NOT NULL,
  `person_inspected` varchar(255) NOT NULL,
  `allowed_for_inspection` varchar(255) NOT NULL,
  `deviations_observed` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_062329_create_revisions_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2021_03_12_142839_create_customers_table', 1),
(11, '2021_03_12_142901_create_categories_table', 1),
(12, '2021_03_12_142942_create_subcategories_table', 1),
(13, '2021_03_12_143010_create_products_table', 1),
(14, '2021_03_12_143021_create_product_images_table', 1),
(15, '2021_03_12_143033_create_product_prices_table', 1),
(16, '2021_03_12_143052_create_product_specifications_table', 1),
(17, '2021_03_12_143106_create_product_features_table', 1),
(18, '2021_03_12_143122_create_product_reviews_table', 1),
(19, '2021_03_14_012024_create_carts_table', 1),
(20, '2021_04_11_171601_create_delivery_areas_table', 1),
(21, '2021_04_11_171617_create_delivery_slots_table', 1),
(22, '2021_04_11_174423_create_promo_codes_table', 1),
(23, '2021_04_11_174433_create_addresses_table', 1),
(24, '2021_04_11_174447_create_orders_table', 1),
(25, '2021_04_11_174500_create_order_details_table', 1),
(26, '2021_04_12_184050_add_status_to_addresses_table', 1),
(27, '2021_04_27_000958_create_banners_table', 1),
(28, '2021_05_16_004549_add_home_image_to_categories_table', 1),
(29, '2021_05_24_162341_add_show_in_home_to_products_table', 1),
(30, '2021_06_23_140952_create_wishlists_table', 1),
(31, '2021_06_24_092157_create_delivery_days_table', 1),
(32, '2021_07_10_175551_create_settings_table', 1),
(33, '2021_07_27_004413_create_device_tokens_table', 1),
(34, '2021_10_26_221034_create_social_accounts_table', 1),
(35, '2021_11_11_110440_create_news_table', 1),
(36, '2021_11_12_014442_create_mobile_banners_table', 1),
(37, '2021_11_23_155829_add_short_name_to_addresses_table', 1),
(38, '2021_12_04_132329_create_order_pickups_table', 1),
(39, '2021_12_04_132406_create_order_deliveries_table', 1),
(40, '2021_12_04_134059_add_origin_to_orders_table', 1),
(41, '2021_12_04_151613_change_role_in_users_table', 1),
(42, '2021_12_04_234059_add_order_time_to_orders_table', 1),
(43, '2021_12_05_141700_add_login_type_in_users_table', 1),
(44, '2021_12_12_153741_create_notifications_table', 1),
(45, '2021_12_12_154513_create_user_notifications_table', 1),
(46, '2021_12_12_203931_create_user_tags_table', 1),
(47, '2021_12_14_114043_add_reached_time_to_orders_table', 1),
(48, '2021_12_16_121425_add_offer_to_products_table', 1),
(49, '2021_12_21_200037_create_transactions_table', 1),
(50, '2022_01_11_162649_add_delivery_charge_to_delivery_areas_table', 1),
(51, '2022_01_26_195611_add_deliery_area_id_to_delivery_slots_table', 1),
(52, '2022_01_28_190521_add_online_payment_in_settings_table', 1),
(53, '2022_02_20_140456_add_offer_expiry_date_to_carts_table', 1),
(54, '2022_02_21_021424_add_shipping_excluded_to_customers_table', 1),
(55, '2022_03_06_184837_add_bill_user_in_users_table', 1),
(56, '2022_06_05_204122_add_default_to_delivery_slots_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_banners`
--

CREATE TABLE `mobile_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `type` enum('Top','Middle') NOT NULL DEFAULT 'Top',
  `button_text` varchar(191) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_banners`
--

INSERT INTO `mobile_banners` (`id`, `title`, `description`, `image`, `url`, `type`, `button_text`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'hand-drawn-supermarket-twitch-banner_23-2149365586-1616062214-01_20_2023_11_45_am.webp', NULL, 'Top', NULL, 1, 'Active', '2023-01-20 11:45:16', '2023-01-20 11:45:16'),
(2, NULL, NULL, 'vegetable-fruit-grocery-delivery-social-media-instagram-cover-template_677506-33-1567776769-01_20_2023_11_46_am.webp', NULL, 'Middle', NULL, 1, 'Active', '2023-01-20 11:45:29', '2023-01-20 11:46:50'),
(3, NULL, NULL, 'flat-supermarket-twitch-banner_23-2149379618-1392535418-01_20_2023_11_47_am.webp', NULL, 'Top', NULL, 2, 'Inactive', '2023-01-20 11:47:17', '2023-01-20 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_reports`
--

CREATE TABLE `monthly_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `leave_days` double(8,2) NOT NULL DEFAULT 0.00,
  `ot_hours` double(8,2) NOT NULL DEFAULT 0.00,
  `holiday_work_days` double(8,2) NOT NULL DEFAULT 0.00,
  `advance_received` double(8,2) NOT NULL DEFAULT 0.00,
  `month` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monthly_reports`
--

INSERT INTO `monthly_reports` (`id`, `staff_id`, `leave_days`, `ot_hours`, `holiday_work_days`, `advance_received`, `month`, `created_at`, `updated_at`) VALUES
(41, 34, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:21:39', '2023-05-04 06:44:20'),
(42, 35, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:31:40', '2023-05-03 13:31:40'),
(43, 36, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:36:04', '2023-05-03 13:36:04'),
(44, 37, 1.00, 0.00, 0.00, 350.00, 'April 2023', '2023-05-03 13:36:28', '2023-05-04 06:28:24'),
(45, 38, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:37:17', '2023-05-03 13:37:17'),
(46, 39, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:38:02', '2023-05-03 13:38:02'),
(47, 42, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:39:02', '2023-05-04 06:47:36'),
(48, 45, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:43:05', '2023-05-04 06:42:47'),
(49, 40, 12.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:44:13', '2023-05-03 13:44:13'),
(50, 46, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:48:26', '2023-05-03 13:48:26'),
(51, 47, 2.00, 0.00, 0.00, 1500.00, 'April 2023', '2023-05-03 13:54:19', '2023-05-03 13:54:19'),
(52, 48, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:55:10', '2023-05-03 13:55:10'),
(53, 51, 1.00, 0.00, 0.00, 2500.00, 'April 2023', '2023-05-03 13:57:38', '2023-05-03 13:57:38'),
(54, 52, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:58:42', '2023-05-03 13:58:42'),
(55, 53, 0.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 13:59:22', '2023-05-03 13:59:22'),
(56, 54, 3.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-03 14:02:29', '2023-05-04 06:43:34'),
(57, 55, 1.00, 1.00, 0.00, 1215.00, 'April 2023', '2023-05-03 14:07:11', '2023-05-04 06:30:09'),
(66, 70, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 06:22:54', '2023-05-16 11:06:14'),
(67, 71, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 06:24:14', '2023-05-04 06:24:14'),
(68, 72, 2.00, 0.00, 0.00, 2000.00, 'April 2023', '2023-05-04 06:25:11', '2023-05-04 06:25:11'),
(69, 73, 3.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 06:31:11', '2023-05-04 12:10:02'),
(70, 114, 1.00, 0.00, 0.00, 1537.00, 'April 2023', '2023-05-04 06:35:33', '2023-05-04 11:02:29'),
(71, 120, 1.00, 0.00, 0.00, 500.00, 'April 2023', '2023-05-04 06:46:49', '2023-05-04 06:46:49'),
(72, 115, 5.00, 0.00, 0.00, 694.00, 'April 2023', '2023-05-04 08:48:20', '2023-05-04 08:48:20'),
(73, 50, 3.00, 6.00, 0.00, 0.00, 'April 2023', '2023-05-04 08:51:40', '2023-05-04 12:07:43'),
(74, 49, 2.00, 1.00, 2.00, 0.00, 'April 2023', '2023-05-04 09:05:11', '2023-05-04 09:05:11'),
(75, 43, 1.00, 5.00, 0.00, 0.00, 'April 2023', '2023-05-04 09:17:52', '2023-05-04 09:17:52'),
(76, 57, 4.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:18:57', '2023-05-04 12:18:57'),
(77, 59, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:47:10', '2023-05-04 12:47:10'),
(78, 60, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:48:00', '2023-05-04 12:48:00'),
(79, 61, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:48:22', '2023-05-04 12:48:22'),
(80, 62, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:48:54', '2023-05-04 12:48:54'),
(81, 64, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:49:27', '2023-05-04 12:49:27'),
(82, 63, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:50:42', '2023-05-04 12:50:42'),
(83, 58, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:56:28', '2023-05-04 12:56:28'),
(84, 116, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-04 12:56:59', '2023-05-04 12:56:59'),
(85, 44, 1.00, 0.00, 1.00, 867.00, 'April 2023', '2023-05-04 13:01:58', '2023-05-04 13:02:33'),
(89, 41, 1.00, 82.00, 5.00, 0.00, 'April 2023', '2023-05-06 08:54:40', '2023-05-06 08:54:40'),
(109, 33, 1.00, 0.00, 0.00, 0.00, 'April 2023', '2023-05-15 10:30:20', '2023-05-15 10:30:20'),
(144, 33, 5.00, 0.00, 0.00, 0.00, 'June 2023', '2023-06-02 07:57:37', '2023-07-03 12:42:57'),
(145, 34, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 07:59:42', '2023-06-21 11:39:57'),
(146, 35, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:00:18', '2023-06-02 08:00:18'),
(147, 36, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:00:48', '2023-06-02 08:00:48'),
(148, 37, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:01:27', '2023-06-02 08:01:27'),
(149, 38, 2.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:01:54', '2023-06-02 08:01:54'),
(150, 39, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:02:25', '2023-06-02 08:02:25'),
(151, 40, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:04:33', '2023-06-02 08:04:33'),
(152, 41, 1.00, 68.00, 5.50, 0.00, 'May 2023', '2023-06-02 08:06:03', '2023-06-02 08:06:03'),
(153, 42, 1.00, 0.00, 0.00, 8264.00, 'May 2023', '2023-06-02 08:07:05', '2023-06-02 08:24:01'),
(154, 43, 1.00, 1.00, 0.00, 3013.00, 'May 2023', '2023-06-02 08:08:49', '2023-06-02 08:29:05'),
(155, 44, 0.00, 6.00, 2.50, 3000.00, 'May 2023', '2023-06-02 08:11:23', '2023-06-02 08:11:23'),
(156, 45, 3.00, 1.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:12:34', '2023-06-21 11:46:18'),
(157, 46, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:13:28', '2023-06-02 08:13:28'),
(158, 47, 1.00, 0.00, 0.00, 1500.00, 'May 2023', '2023-06-02 08:14:27', '2023-06-02 08:14:27'),
(159, 48, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:15:03', '2023-06-02 08:15:03'),
(160, 49, 2.00, 1.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:17:27', '2023-06-02 08:58:58'),
(161, 50, 2.50, 3.50, 0.00, 209.00, 'May 2023', '2023-06-02 08:19:58', '2023-06-02 08:57:12'),
(162, 51, 1.00, 0.00, 0.00, 2500.00, 'May 2023', '2023-06-02 08:23:17', '2023-06-02 08:23:17'),
(163, 52, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:26:15', '2023-06-02 08:26:15'),
(164, 53, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 08:27:21', '2023-06-02 08:27:21'),
(165, 54, 6.50, 0.00, 0.00, 3777.00, 'May 2023', '2023-06-02 08:28:15', '2023-06-03 05:08:31'),
(166, 55, 1.00, 0.00, 0.00, 1500.00, 'May 2023', '2023-06-02 08:29:37', '2023-06-02 08:29:37'),
(167, 56, 0.00, 1.00, 0.00, 3089.00, 'May 2023', '2023-06-02 08:32:18', '2023-06-02 08:32:18'),
(168, 57, 5.00, 0.00, 0.00, 64.00, 'May 2023', '2023-06-02 08:33:11', '2023-06-29 11:15:56'),
(170, 70, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 09:11:50', '2023-06-02 09:11:50'),
(171, 71, 2.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 09:12:38', '2023-06-02 09:12:38'),
(172, 72, 6.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 09:14:20', '2023-06-02 09:14:20'),
(173, 73, 4.00, 0.00, 0.00, 500.00, 'May 2023', '2023-06-02 09:16:37', '2023-06-02 12:24:48'),
(174, 114, 0.50, 0.00, 0.00, 1404.00, 'May 2023', '2023-06-02 09:18:11', '2023-06-02 09:18:11'),
(175, 115, 2.00, 0.00, 0.00, 560.00, 'May 2023', '2023-06-02 09:19:16', '2023-06-02 09:19:16'),
(176, 120, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 09:19:57', '2023-06-02 09:19:57'),
(177, 161, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 11:32:07', '2023-06-02 11:32:07'),
(178, 162, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 11:32:55', '2023-06-02 11:32:55'),
(179, 163, 2.00, 0.00, 0.00, 795.00, 'May 2023', '2023-06-02 11:34:29', '2023-06-02 11:34:29'),
(180, 164, 3.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 11:51:50', '2023-06-02 11:51:50'),
(181, 165, 2.00, 0.00, 0.00, 168.00, 'May 2023', '2023-06-02 11:52:39', '2023-06-02 11:52:39'),
(182, 166, 2.00, 0.00, 0.00, 320.00, 'May 2023', '2023-06-02 11:56:54', '2023-06-02 11:56:54'),
(183, 167, 1.00, 0.00, 0.00, 433.00, 'May 2023', '2023-06-02 11:57:47', '2023-06-02 11:57:47'),
(184, 168, 8.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 11:59:06', '2023-06-02 12:12:59'),
(185, 169, 23.50, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:14:35', '2023-06-02 12:16:57'),
(186, 170, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:17:36', '2023-06-02 12:17:36'),
(187, 171, 3.50, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:19:00', '2023-06-02 12:19:00'),
(188, 172, 1.00, 0.00, 0.00, 3000.00, 'May 2023', '2023-06-02 12:24:04', '2023-06-02 12:24:04'),
(189, 173, 1.00, 0.00, 0.00, 3000.00, 'May 2023', '2023-06-02 12:26:04', '2023-06-02 12:26:04'),
(190, 174, 7.00, 0.00, 0.00, 2500.00, 'May 2023', '2023-06-02 12:27:06', '2023-06-02 12:27:06'),
(191, 177, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:33:39', '2023-06-02 12:33:39'),
(192, 58, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:38:08', '2023-06-02 12:38:08'),
(193, 59, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:41:15', '2023-06-02 12:41:15'),
(194, 60, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:42:16', '2023-06-02 12:42:16'),
(195, 61, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:49:06', '2023-06-02 12:49:06'),
(196, 62, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:49:37', '2023-06-02 12:49:37'),
(197, 63, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:50:04', '2023-06-02 12:50:04'),
(198, 64, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:50:34', '2023-06-02 12:50:34'),
(199, 116, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 12:51:15', '2023-06-02 12:51:15'),
(200, 178, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 13:10:10', '2023-06-02 13:10:10'),
(201, 179, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 13:10:55', '2023-06-02 13:10:55'),
(202, 180, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 13:11:31', '2023-06-02 13:11:31'),
(203, 181, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 13:11:59', '2023-06-02 13:11:59'),
(204, 182, 1.00, 0.00, 0.00, 0.00, 'May 2023', '2023-06-02 13:12:22', '2023-06-02 13:12:22'),
(205, 183, 0.00, 0.00, 2.50, 0.00, 'May 2023', '2023-06-02 13:20:23', '2023-06-02 13:25:34'),
(206, 184, 21.00, 0.00, 0.50, 0.00, 'May 2023', '2023-06-02 13:26:36', '2023-06-02 13:27:30'),
(207, 175, 1.00, 0.00, 0.00, 1000.00, 'May 2023', '2023-06-02 14:05:10', '2023-06-02 14:05:10'),
(226, 34, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 07:29:41', '2023-07-03 07:29:41'),
(227, 35, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 08:35:41', '2023-07-03 08:35:41'),
(228, 36, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 08:36:34', '2023-07-03 08:40:52'),
(229, 37, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 08:38:01', '2023-07-03 08:40:34'),
(230, 38, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 08:38:29', '2023-07-03 08:40:10'),
(231, 39, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 08:39:42', '2023-07-03 08:39:42'),
(232, 40, 3.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 08:41:59', '2023-07-03 08:41:59'),
(233, 41, 1.00, 32.00, 2.00, 0.00, 'June 2023', '2023-07-03 11:07:35', '2023-07-03 11:07:35'),
(234, 42, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:10:01', '2023-07-03 11:10:01'),
(235, 43, 2.50, 4.00, 0.00, 1433.00, 'June 2023', '2023-07-03 11:12:51', '2023-07-04 07:17:54'),
(236, 44, 1.00, 0.00, 0.00, 1500.00, 'June 2023', '2023-07-03 11:13:56', '2023-07-03 11:14:40'),
(237, 45, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:16:03', '2023-07-03 11:16:03'),
(238, 46, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:16:42', '2023-07-03 11:16:42'),
(239, 47, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:17:58', '2023-07-03 11:17:58'),
(240, 48, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:19:06', '2023-07-03 11:19:06'),
(241, 51, 1.00, 0.00, 0.00, 2500.00, 'June 2023', '2023-07-03 11:20:02', '2023-07-03 11:20:24'),
(242, 52, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:22:02', '2023-07-03 11:22:02'),
(243, 53, 2.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:25:28', '2023-07-03 11:25:28'),
(244, 54, 0.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:26:17', '2023-07-03 11:26:17'),
(245, 55, 3.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:27:08', '2023-07-03 11:27:08'),
(246, 56, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 11:28:14', '2023-07-03 11:28:14'),
(247, 57, 6.00, 0.00, 0.00, 30.00, 'June 2023', '2023-07-03 12:33:25', '2023-07-03 13:38:59'),
(248, 114, 1.00, 0.00, 0.00, 1000.00, 'June 2023', '2023-07-03 12:44:36', '2023-07-03 13:37:23'),
(249, 115, 0.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 12:45:23', '2023-07-03 12:45:23'),
(250, 120, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:21:35', '2023-07-03 13:21:48'),
(251, 161, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:23:48', '2023-07-03 13:23:48'),
(252, 58, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:24:54', '2023-07-03 13:24:54'),
(253, 59, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:26:04', '2023-07-03 13:26:04'),
(254, 60, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:30:53', '2023-07-03 13:30:53'),
(255, 61, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:31:57', '2023-07-03 13:31:57'),
(256, 62, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:32:24', '2023-07-03 13:32:24'),
(257, 63, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:32:56', '2023-07-03 13:32:56'),
(258, 64, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:33:34', '2023-07-03 13:33:34'),
(259, 162, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:35:20', '2023-07-03 13:35:20'),
(260, 163, 1.00, 0.00, 0.00, 907.00, 'June 2023', '2023-07-03 13:36:09', '2023-07-03 13:36:44'),
(261, 164, 2.00, 0.00, 0.00, 230.00, 'June 2023', '2023-07-03 13:50:25', '2023-07-04 07:08:03'),
(262, 165, 0.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:51:35', '2023-07-03 13:51:35'),
(263, 166, 14.00, 0.00, 0.00, 246.00, 'June 2023', '2023-07-03 13:53:55', '2023-07-03 13:53:55'),
(264, 167, 23.50, 0.00, 0.00, 1757.00, 'June 2023', '2023-07-03 13:57:06', '2023-07-03 13:57:06'),
(265, 168, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:58:21', '2023-07-03 13:58:21'),
(266, 169, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:59:13', '2023-07-03 13:59:13'),
(267, 170, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 13:59:58', '2023-07-03 13:59:58'),
(268, 171, 1.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 14:00:45', '2023-07-03 14:00:45'),
(269, 172, 1.00, 0.00, 0.00, 1500.00, 'June 2023', '2023-07-03 14:01:31', '2023-07-03 14:01:31'),
(270, 179, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 14:02:12', '2023-07-03 14:02:12'),
(271, 180, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 14:02:36', '2023-07-03 14:02:36'),
(272, 181, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 14:02:58', '2023-07-03 14:02:58'),
(273, 182, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-03 14:03:28', '2023-07-03 14:03:28'),
(274, 184, 1.00, 22.00, 1.00, 0.00, 'June 2023', '2023-07-04 05:54:41', '2023-07-04 05:54:41'),
(275, 70, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 05:57:08', '2023-07-04 05:57:08'),
(276, 183, 0.00, 0.00, 2.00, 0.00, 'June 2023', '2023-07-04 06:02:29', '2023-07-04 06:02:29'),
(277, 175, 1.00, 0.00, 0.00, 2000.00, 'June 2023', '2023-07-04 06:05:12', '2023-07-04 06:05:12'),
(278, 73, 4.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 06:24:13', '2023-07-04 06:24:13'),
(279, 173, 1.00, 0.00, 0.00, 5000.00, 'June 2023', '2023-07-04 06:30:47', '2023-07-04 06:30:47'),
(280, 174, 17.00, 0.00, 0.00, 2500.00, 'June 2023', '2023-07-04 06:31:59', '2023-07-04 06:31:59'),
(281, 71, 2.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 06:32:42', '2023-07-04 06:32:42'),
(282, 72, 4.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 06:33:35', '2023-07-04 06:33:35'),
(283, 177, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 12:33:46', '2023-07-04 12:33:46'),
(284, 178, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 12:43:09', '2023-07-04 12:43:09'),
(285, 176, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 12:46:09', '2023-07-04 12:46:09'),
(286, 87, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 12:57:55', '2023-07-04 12:57:55'),
(287, 89, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 12:59:01', '2023-07-04 12:59:01'),
(288, 101, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 13:01:40', '2023-07-04 13:01:40'),
(289, 90, 3.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 13:02:31', '2023-07-04 13:03:03'),
(290, 80, 4.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 13:07:18', '2023-07-04 13:07:58'),
(291, 91, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 13:27:08', '2023-07-04 13:27:08'),
(292, 107, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-04 13:28:38', '2023-07-04 13:28:38'),
(293, 104, 7.00, 0.00, 0.00, 2500.00, 'June 2023', '2023-07-04 13:30:15', '2023-07-04 13:34:02'),
(294, 95, 5.50, 0.00, 0.00, 2500.00, 'June 2023', '2023-07-04 13:37:47', '2023-07-04 13:41:36'),
(295, 83, 15.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 05:28:13', '2023-07-05 05:29:40'),
(296, 103, 1.00, 0.00, 0.00, 2500.00, 'June 2023', '2023-07-05 05:43:04', '2023-07-05 05:44:41'),
(297, 99, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 05:47:25', '2023-07-05 05:47:25'),
(298, 105, 4.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 05:49:46', '2023-07-05 05:50:25'),
(299, 88, 1.00, 0.00, 0.00, 2000.00, 'June 2023', '2023-07-05 06:07:38', '2023-07-05 06:07:38'),
(300, 85, 1.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:10:37', '2023-07-05 06:46:48'),
(301, 81, 2.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:15:55', '2023-07-05 06:15:55'),
(302, 106, 7.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:20:34', '2023-07-05 06:21:10'),
(303, 100, 7.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:25:15', '2023-07-05 06:25:15'),
(304, 82, 6.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:31:55', '2023-07-05 06:31:55'),
(305, 94, 3.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:38:01', '2023-07-05 06:38:35'),
(306, 98, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:41:31', '2023-07-05 06:41:31'),
(307, 109, 6.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:55:37', '2023-07-05 06:55:37'),
(308, 108, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:58:35', '2023-07-05 06:58:35'),
(309, 84, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 06:59:53', '2023-07-05 06:59:53'),
(310, 97, 5.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:00:37', '2023-07-05 07:00:55'),
(311, 96, 1.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:03:13', '2023-07-05 07:03:13'),
(312, 79, 2.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:05:55', '2023-07-05 07:06:57'),
(313, 92, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:09:22', '2023-07-05 07:09:22'),
(314, 86, 3.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:10:04', '2023-07-05 07:10:33'),
(315, 102, 11.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:13:01', '2023-07-05 07:13:27'),
(316, 93, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:17:23', '2023-07-05 07:17:23'),
(317, 74, 7.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:18:00', '2023-07-05 07:18:00'),
(318, 77, 1.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:29:09', '2023-07-05 07:29:09'),
(319, 75, 4.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:30:10', '2023-07-05 07:30:29'),
(320, 117, 5.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:33:15', '2023-07-05 07:33:57'),
(321, 76, 7.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:36:50', '2023-07-05 07:36:50'),
(322, 111, 14.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:38:24', '2023-07-05 07:38:52'),
(323, 110, 5.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:42:14', '2023-07-05 07:42:26'),
(324, 113, 6.50, 0.00, 0.00, 0.00, 'June 2023', '2023-07-05 07:44:34', '2023-07-05 07:44:48'),
(325, 50, 7.00, 0.00, 0.00, 108.00, 'June 2023', '2023-07-05 07:48:32', '2023-07-05 07:52:12'),
(327, 49, 20.00, 0.00, 0.00, 0.00, 'June 2023', '2023-07-06 13:15:23', '2023-07-06 13:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` longtext NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `posted_on` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `body`, `image`, `posted_on`, `created_at`, `updated_at`) VALUES
(1, 'New Products', 'Hurry up', '', '2023-04-27 18:50:51', '2023-04-27 18:50:51', '2023-04-27 18:50:51'),
(2, 'New Product', 'Hurry Up', '', '2023-04-27 18:52:00', '2023-04-27 18:52:00', '2023-04-27 18:52:00'),
(3, 'New Product', 'Hurry Up', '', '2023-04-27 18:52:09', '2023-04-27 18:52:09', '2023-04-27 18:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('17e76b033f00523414977e9b7e7068ddf37690d3bf75cb97929d1e152b488790b024c3a3bdc5591f', 6, 1, 'token', '[]', 0, '2023-05-26 12:05:43', '2023-05-26 12:05:43', '2024-05-26 12:05:43'),
('2b86bc99e0fe6f10f2ed3c12c829d9e93896b695b989f080827987337966b6c160d98ddf4c66da3c', 2, 1, 'token', '[]', 0, '2023-05-08 18:17:21', '2023-05-08 18:17:21', '2024-05-08 18:17:21'),
('317e512bd8c81432cd9efeac4c8f09dfd0810217e3f99885897cdf91b87de1f6f4ae99908030ad4f', 13, 1, 'token', '[]', 0, '2023-04-02 11:26:12', '2023-04-02 11:26:12', '2024-04-02 11:26:12'),
('323c55e24bc4286d25c950d4b95f85cf1e461692a1f302bac0553c744b907c3117a1f40d2985637a', 2, 1, 'token', '[]', 0, '2023-01-12 19:48:44', '2023-01-12 19:48:44', '2024-01-12 19:48:44'),
('32912d1eec0d6d8a17cb2067943679ab5dcc73c4761276483f013803c12d8352e1438ed9ae37d580', 8, 1, 'token', '[]', 0, '2023-04-18 13:31:32', '2023-04-18 13:31:32', '2024-04-18 13:31:32'),
('39cdb00f2a35ac241990d09f34e01ebe6e90a9dbe31042850fb5515a8e1574a5cac70a8407025f91', 6, 1, 'token', '[]', 0, '2023-02-15 12:17:17', '2023-02-15 12:17:17', '2024-02-15 12:17:17'),
('3fae62493786ba794d6ecf2aba1e9a25460a78eea8b36827a6416fd9ece963508d085816f39ef05c', 3, 1, 'token', '[]', 0, '2023-01-20 11:03:53', '2023-01-20 11:03:53', '2024-01-20 11:03:53'),
('46f179a6725835806e7c7da59879419a0ba57c81ca7fe03b2a59ae4e4b6313a0ebd0ae19082aa0c5', 4, 1, 'token', '[]', 0, '2023-04-01 17:14:34', '2023-04-01 17:14:34', '2024-04-01 17:14:34'),
('48590962aad6f45fe47cd20e345bbbc16503e677bbf48c0060b35f6d90d9c683a7415a1a81749bd9', 14, 1, 'token', '[]', 0, '2023-04-15 08:51:25', '2023-04-15 08:51:25', '2024-04-15 08:51:25'),
('4cffc82f81c7e2b1cf369f6b099802e71d6f6d949c52f33e1809955d87f4bca262b65d27f7d0f185', 13, 1, 'token', '[]', 0, '2023-04-19 11:18:49', '2023-04-19 11:18:49', '2024-04-19 11:18:49'),
('4ff8f0b5f090b7c4df14d63cbe93abd530c70b3ced34525eb1a734dfc1ed89027d3cccf6fb3c7821', 3, 1, 'token', '[]', 1, '2023-01-20 10:15:07', '2023-01-20 10:15:07', '2024-01-20 10:15:07'),
('52d2ac44782ec394586a088c17b10bcb7f500a34c39b2ca17b4ad2a7f9c800536ff7a6a7627ab1a7', 4, 1, 'token', '[]', 0, '2023-01-20 10:56:35', '2023-01-20 10:56:35', '2024-01-20 10:56:35'),
('570642e8448fb9e6190aba080a06e9a1431490e0f4c866ff4ebeb50f8ed45b0bf26c016f2994c987', 18, 1, 'token', '[]', 1, '2023-05-09 17:32:30', '2023-05-09 17:32:30', '2024-05-09 17:32:30'),
('58e104cc5e38ed90e25e20fabe6f23f1e8278865dd62151ad239ea714c31cc740238a6be349973ec', 13, 1, 'token', '[]', 0, '2023-04-01 14:31:37', '2023-04-01 14:31:37', '2024-04-01 14:31:37'),
('5bd97e4a35d48202fea6d5dec61df96695bb7ffc45d6cbb37b984a31aa63dfb07e8016c2f5131f7e', 4, 1, 'token', '[]', 1, '2023-01-23 12:46:24', '2023-01-23 12:46:24', '2024-01-23 12:46:24'),
('5f85e2a95b01da34e066e8b7eaac9997c0af3986c9c5edba10ed1ff6c1c50452329857ba6f32420e', 2, 1, 'token', '[]', 0, '2023-01-12 20:16:22', '2023-01-12 20:16:22', '2024-01-12 20:16:22'),
('634ea6cd40e16e4b561be4ddbfd3d31ea2987294c4bbcac86cfb25566e24f4d03c61ce9a7b807dbe', 15, 1, 'token', '[]', 0, '2023-04-17 17:47:12', '2023-04-17 17:47:12', '2024-04-17 17:47:12'),
('791e9f5de39cf5c9c1385c452f7044d0b8d821ef5b1b227b32f0b098df2f5901ebe4316f7a987325', 2, 1, 'token', '[]', 0, '2023-01-12 20:22:04', '2023-01-12 20:22:04', '2024-01-12 20:22:04'),
('79ae41381f7be12ebb69d721bc4cb24114067ca82aa6adc6b29535ae5972a95e66f156049aff509b', 2, 1, 'token', '[]', 1, '2023-04-20 16:15:59', '2023-04-20 16:15:59', '2024-04-20 16:15:59'),
('7cb8c3e2d2effc51fe6e5ca11e7d8bb1eda2c1587e040164e8dc6f8922536eb35c6b7236136f7994', 20, 1, 'token', '[]', 1, '2023-05-10 13:06:22', '2023-05-10 13:06:22', '2024-05-10 13:06:22'),
('7e17341e9105384bb2f4816bee10c1527818fb605dc0b3609be9b4f9903aa6a808e61bedc9727488', 6, 1, 'token', '[]', 0, '2023-04-17 16:28:26', '2023-04-17 16:28:26', '2024-04-17 16:28:26'),
('80beec4212053a7170c7f4987897f78f4575f0f9f376325e4bcdf90b41f7073cde8a3609beb2dcc4', 3, 1, 'token', '[]', 1, '2023-01-20 10:16:49', '2023-01-20 10:16:49', '2024-01-20 10:16:49'),
('841b67993c0b5f2e0f804dd00f8e5053c0154a5c9580e5589d79ef78f3e0c981fd7d45e0684c671a', 16, 1, 'token', '[]', 0, '2023-04-18 11:33:58', '2023-04-18 11:33:58', '2024-04-18 11:33:58'),
('86a7f805e4a3b7cb8bbe1da79bdb5311cd21e43156c3cbf3976917faf5087feb99c61e2c4c226685', 13, 1, 'token', '[]', 1, '2023-04-01 17:05:23', '2023-04-01 17:05:23', '2024-04-01 17:05:23'),
('8ca50d8ad0639977398db71632698977681c18bc94bc954f470e4f701963e0d967c22840a2e6bc61', 3, 1, 'token', '[]', 0, '2023-01-20 10:17:27', '2023-01-20 10:17:27', '2024-01-20 10:17:27'),
('8f2ffce2a85c032a58fbf683b9b9b781458c7a64df946a0c8280cfde2d3242e2b20945664d6a00fd', 11, 1, 'token', '[]', 0, '2023-04-01 13:12:28', '2023-04-01 13:12:28', '2024-04-01 13:12:28'),
('92f5bd591b9d127a7af6b4b6a4d616b3b683c0189bab2553af748dd723d3ad8fa1948dedde0e9da6', 4, 1, 'token', '[]', 1, '2023-05-08 16:19:15', '2023-05-08 16:19:15', '2024-05-08 16:19:15'),
('9845de34d782caa42efe9138aba31444a3b6294c5ecafdbe80d92920cd44575b7f067bb5c0543b14', 8, 1, 'token', '[]', 0, '2023-04-18 13:33:08', '2023-04-18 13:33:08', '2024-04-18 13:33:08'),
('98a8b2f202bc4d97e20d39e51c98c478b7013c356dd8f6b772d07c5d9b2c5527cec5e7f85e34c2b7', 4, 1, 'token', '[]', 0, '2023-05-05 17:44:58', '2023-05-05 17:44:58', '2024-05-05 17:44:58'),
('a0daa8a7ba6b273e54bd09664a3e6c4982bd31590b792cd5dc4f152f4738304f852e5e73a3eb89e7', 2, 1, 'token', '[]', 0, '2023-01-12 20:18:03', '2023-01-12 20:18:03', '2024-01-12 20:18:03'),
('a104ea71ca5f60ef5104bcc9640d6d70c01547c43f0b77c0bc52d8d633a6931118a5cdac9e1943b8', 21, 1, 'token', '[]', 0, '2023-05-10 16:00:56', '2023-05-10 16:00:56', '2024-05-10 16:00:56'),
('b708b2bc7fa8be65efe846ce8328141af44706d4f131afed2e4019e2283d63c5ec33f46e97781ecf', 4, 1, 'token', '[]', 0, '2023-05-05 17:52:53', '2023-05-05 17:52:53', '2024-05-05 17:52:53'),
('b98ce6e9e4863efcf289fb11007f7d4cfbc665b478daf8eaddeef8d53f7a58d3d41ff97a19b5c523', 4, 1, 'token', '[]', 1, '2023-05-08 15:30:14', '2023-05-08 15:30:14', '2024-05-08 15:30:14'),
('d06febeffa1ca4f19ee8b4b50465fea802f7034c036b099be49cf529e924afd2c57b39fbcb158f63', 2, 1, 'token', '[]', 1, '2023-01-19 12:42:38', '2023-01-19 12:42:38', '2024-01-19 12:42:38'),
('dcc89f840dd762935f0f9298935d93dee49e16b724f6050285c78415f78d33491bb72c789f001159', 19, 1, 'token', '[]', 1, '2023-05-10 13:04:30', '2023-05-10 13:04:30', '2024-05-10 13:04:30'),
('de77bc4e3e7428e17878f6c5171fadfa197b5e0e0b1651b9d7bf64fb4cd5abb2353a251993a8d7ac', 13, 1, 'token', '[]', 0, '2023-04-18 20:15:15', '2023-04-18 20:15:15', '2024-04-18 20:15:15'),
('deb3e063ecadbd2bf36eeb4dab0c43b4bc9cbe740eb1cf4699f63843d084dbb11f07a59298ed80fe', 19, 1, 'token', '[]', 0, '2023-05-09 17:35:33', '2023-05-09 17:35:33', '2024-05-09 17:35:33'),
('e0ff8ba02afea7da5556bc9624fcb2e34799415a56561a4ee124f2211b791f5e32374ff9ca3ca91b', 21, 1, 'token', '[]', 1, '2023-05-10 15:46:11', '2023-05-10 15:46:11', '2024-05-10 15:46:11'),
('e6f24b1fc8b24fae250cab09096743d007d69d843341398499f780e058f6fdca6faa70ebbdb1142b', 8, 1, 'token', '[]', 0, '2023-04-18 13:29:43', '2023-04-18 13:29:43', '2024-04-18 13:29:43'),
('eaf01272ac4de2a5c295e05167c2d2cd0bb9cb72d3e87daaa68fe8db0bf81bb5eb64595d4c9262cf', 2, 1, 'token', '[]', 0, '2023-01-21 11:27:54', '2023-01-21 11:27:54', '2024-01-21 11:27:54'),
('fb8b9bb757e4a9af734357a51069ca7c8796e5a7c6bed430fc34e9c7d680d16c971acab6540c2755', 21, 1, 'token', '[]', 0, '2023-05-10 16:09:27', '2023-05-10 16:09:27', '2024-05-10 16:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'personal', '69mld67KyDqvkxYe3f9ciJKG6HYycsraLpNa9pF4', NULL, 'http://localhost', 1, 0, 0, '2023-01-12 19:48:35', '2023-01-12 19:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-01-12 19:48:35', '2023-01-12 19:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` int(11) NOT NULL,
  `occasion` varchar(255) NOT NULL,
  `occasion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_day_books`
--

CREATE TABLE `online_day_books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading_id` bigint(20) UNSIGNED NOT NULL,
  `subheading_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `description_1` text DEFAULT NULL,
  `description_2` text DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `payment_mode` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_day_books`
--

INSERT INTO `online_day_books` (`id`, `heading_id`, `subheading_id`, `date`, `description_1`, `description_2`, `type`, `amount`, `payment_mode`, `created_at`, `updated_at`) VALUES
(1, 100, NULL, '2023-08-14', 'Test', NULL, 'C', '2500', 'cash', '2023-08-14 13:40:10', '2023-08-14 13:40:10'),
(2, 100, NULL, '2023-08-14', NULL, NULL, 'D', '300', 'cash', '2023-08-14 13:40:27', '2023-08-14 13:41:46'),
(3, 57, NULL, '2023-08-14', NULL, NULL, 'C', '1200', 'cash', '2023-08-14 13:40:54', '2023-08-14 13:42:08'),
(4, 62, NULL, '2023-08-14', NULL, NULL, 'C', '200', 'cash', '2023-08-14 13:41:13', '2023-08-14 13:41:13'),
(5, 62, NULL, '2023-08-14', NULL, NULL, 'D', '700', 'cash', '2023-08-14 13:41:29', '2023-08-14 13:41:29'),
(6, 56, NULL, '2023-08-16', NULL, NULL, 'C', '2500', 'cash', '2023-08-16 05:38:38', '2023-08-16 05:38:38'),
(7, 100, NULL, '2023-08-16', NULL, NULL, 'D', '500', 'cash', '2023-08-16 05:39:01', '2023-08-16 05:39:01'),
(8, 56, NULL, '2023-08-16', NULL, NULL, 'C', '2500', 'cash', '2023-08-16 05:39:33', '2023-08-16 05:39:33'),
(12, 59, NULL, '2023-12-12', NULL, NULL, 'C', '2', 'cash', '2023-12-12 04:54:53', '2023-12-12 04:54:53'),
(13, 57, NULL, '2023-12-11', 'test', NULL, 'C', '500', 'cash', '2023-12-12 04:58:30', '2023-12-12 04:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `origin` enum('App','Web','Bill') NOT NULL DEFAULT 'Web',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rider_status` enum('Pending Collection','On Job','Delivered') NOT NULL DEFAULT 'Pending Collection',
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `items` int(11) NOT NULL,
  `sub_total` double NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_percent` double NOT NULL DEFAULT 0,
  `discount_amount` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_charge` double NOT NULL DEFAULT 0,
  `net_amount` double NOT NULL,
  `delivery_date` date NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `on_job_time` datetime DEFAULT NULL,
  `reached_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `delivery_slot_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_mode` enum('COD','Online') NOT NULL DEFAULT 'COD',
  `change_required` double NOT NULL DEFAULT 0,
  `status` enum('Created','Placed','Cancelled') NOT NULL DEFAULT 'Created',
  `delivery_status` enum('Not Applicable','Order Received','Packed','Out for Delivery','Delivered') NOT NULL DEFAULT 'Not Applicable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslips`
--

CREATE TABLE `payslips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `month` varchar(255) DEFAULT NULL,
  `per_day_salary` varchar(255) DEFAULT NULL,
  `per_hour_salary` varchar(255) DEFAULT NULL,
  `ot_pay` varchar(255) DEFAULT NULL,
  `holiday_working_pay` varchar(255) DEFAULT NULL,
  `deduction_leave` varchar(255) DEFAULT NULL,
  `gross_salary` varchar(255) DEFAULT NULL,
  `net_salary` varchar(255) DEFAULT NULL,
  `ctc` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslipwithpf`
--

CREATE TABLE `payslipwithpf` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` int(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `total` double(8,2) NOT NULL,
  `no_of_working_days` int(11) NOT NULL,
  `per_day_salary` double(8,2) NOT NULL,
  `per_hour_salary` double(8,2) NOT NULL,
  `deduction_for_leave` double(8,2) NOT NULL,
  `gross_salary` double(8,2) NOT NULL,
  `employee_contribution_to_pf` double(8,2) NOT NULL,
  `employee_contribution_to_esi` double(8,2) NOT NULL,
  `net_salary` double(8,2) NOT NULL,
  `net_amount` double(8,2) NOT NULL,
  `pension_contribution` double(8,2) NOT NULL,
  `pf_contribution` double(8,2) NOT NULL,
  `edl_insurance_contribution` double(8,2) NOT NULL,
  `pf_administration_charges` double(8,2) NOT NULL,
  `employers_contribution_to_pf` double(8,2) NOT NULL,
  `employers_contribution_to_esi` double(8,2) NOT NULL,
  `total_amount_paid_to_pf` double(8,2) NOT NULL,
  `total_amount_paid_to_esi` double(8,2) NOT NULL,
  `incentive` double(8,2) NOT NULL,
  `ot_pay` double(8,2) NOT NULL,
  `holiday_pay` double(8,2) NOT NULL,
  `total_cash` double(8,2) NOT NULL,
  `ctc` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `thumbnail` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `matrix1` varchar(191) DEFAULT NULL,
  `matrix2` varchar(191) DEFAULT NULL,
  `gst` double NOT NULL DEFAULT 0,
  `lot_number` varchar(255) DEFAULT NULL,
  `average_ratings` double NOT NULL,
  `ratings_count` int(11) NOT NULL DEFAULT 0,
  `nonreturnable` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_offer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_top_selling` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_in_home` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remainders`
--

CREATE TABLE `remainders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activity` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `reminder_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_payslipwithpf`
--

CREATE TABLE `report_payslipwithpf` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` varchar(255) NOT NULL,
  `month` varchar(200) DEFAULT NULL,
  `uan_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gross_salary` decimal(10,2) NOT NULL,
  `epf_wages` decimal(10,2) NOT NULL,
  `eps_wages` decimal(10,2) NOT NULL,
  `edli_wages` decimal(10,2) NOT NULL,
  `epf_contri_remitted` decimal(10,2) NOT NULL,
  `eps_contri_remitted` decimal(10,2) NOT NULL,
  `epf_eps_difference_remitted` decimal(10,2) NOT NULL,
  `ncp_days` varchar(255) NOT NULL,
  `refund_of_advances` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_calculations`
--

CREATE TABLE `salary_calculations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `gross_salary` decimal(10,2) DEFAULT NULL,
  `basic` decimal(10,2) DEFAULT NULL,
  `da` decimal(10,2) DEFAULT NULL,
  `other_allowances` decimal(10,2) DEFAULT NULL,
  `hra` decimal(10,2) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `minimum_order_amount` double NOT NULL DEFAULT 0,
  `online_payment` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `minimum_order_amount`, `online_payment`, `created_at`, `updated_at`) VALUES
(1, 100, 'Yes', NULL, NULL),
(2, 200, 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_name` varchar(191) NOT NULL,
  `provider_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sops`
--

CREATE TABLE `sops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(11) NOT NULL,
  `field_1` longtext DEFAULT NULL,
  `field_2` longtext DEFAULT NULL,
  `field_3` longtext DEFAULT NULL,
  `field_4` longtext DEFAULT NULL,
  `field_5` longtext DEFAULT NULL,
  `field_6` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `actual_date_of_joining` date NOT NULL,
  `date_of_incorporation_in_pf` date DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `age` varchar(200) DEFAULT NULL,
  `wedding_day` date DEFAULT NULL,
  `supply_zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supply_area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_active_customers` int(11) DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `emergency_contact_name2` varchar(255) DEFAULT NULL,
  `relation2` varchar(255) DEFAULT NULL,
  `contact_number2` varchar(255) DEFAULT NULL,
  `pf_or_esi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `subcategory`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Brown Rice', 'Brown-Rice-3062', 'Active', '2023-01-20 11:38:42', '2023-01-20 16:42:17'),
(2, 1, 'Basmati rice', 'Basmati-rice-5137', 'Active', '2023-01-20 11:38:50', '2023-01-20 11:38:50'),
(3, 1, 'Seeraga Samba Rice', 'Seeraga-Samba-Rice-2835', 'Inactive', '2023-01-20 11:39:00', '2023-01-20 16:42:48'),
(4, 1, 'Ponni Rice', 'Ponni-Rice-5094', 'Active', '2023-01-20 11:39:09', '2023-01-20 11:39:09'),
(5, 2, 'Mung daal', 'Mung-daal-718', 'Active', '2023-01-20 11:39:37', '2023-01-20 11:39:37'),
(6, 2, 'Masoor daal', 'Masoor-daal-9889', 'Active', '2023-01-20 11:39:49', '2023-01-20 11:39:49'),
(7, 3, 'Coconut oil', 'Coconut-oil-4298', 'Active', '2023-01-20 11:40:27', '2023-01-20 11:40:27'),
(8, 3, 'Peanut oil', 'Peanut-oil-6541', 'Active', '2023-01-20 11:40:38', '2023-01-20 11:40:38'),
(9, 4, 'Ragi flour', 'Ragi-flour-1448', 'Active', '2023-01-20 11:41:04', '2023-01-20 11:41:04'),
(10, 4, 'Rice flour', 'Rice-flour-5104', 'Active', '2023-01-20 11:41:14', '2023-01-20 11:41:14'),
(11, 5, 'Coriander', 'Coriander-7944', 'Active', '2023-01-20 11:41:47', '2023-01-20 11:41:47'),
(12, 5, 'Turmeric', 'Turmeric-6506', 'Active', '2023-01-20 11:41:55', '2023-01-20 11:41:55'),
(13, 6, 'Pistachios', 'Pistachios-6339', 'Active', '2023-01-20 11:42:18', '2023-01-20 11:42:18'),
(14, 6, 'Almonds', 'Almonds-3945', 'Active', '2023-01-20 11:42:26', '2023-01-20 11:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `subheadings`
--

CREATE TABLE `subheadings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `heading_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subheadings`
--

INSERT INTO `subheadings` (`id`, `name`, `heading_id`, `status`, `created_at`, `updated_at`) VALUES
(183, 'GST', 96, 'active', '2023-10-27 13:12:24', '2023-10-27 13:12:24'),
(184, 'Diesel', 122, 'active', '2023-10-27 13:13:06', '2023-10-27 13:13:06'),
(185, 'FasTag', 122, 'active', '2023-10-27 13:17:30', '2023-10-27 13:17:30'),
(186, 'Maintenance', 122, 'active', '2023-10-27 13:17:41', '2023-10-27 13:17:41'),
(187, 'Insurance', 122, 'active', '2023-10-27 13:17:51', '2023-10-27 13:17:51'),
(188, 'FC Work', 122, 'active', '2023-10-27 13:18:00', '2023-10-27 13:18:00'),
(189, 'Road Tax', 122, 'active', '2023-10-27 13:18:12', '2023-10-27 13:18:12'),
(190, 'Diesel', 123, 'active', '2023-10-27 13:18:44', '2023-10-27 13:18:44'),
(191, 'FasTag', 123, 'active', '2023-10-27 13:18:53', '2023-10-27 13:18:53'),
(192, 'Maintenance', 123, 'active', '2023-10-27 13:19:03', '2023-10-27 13:19:03'),
(193, 'Insurance', 123, 'active', '2023-10-27 13:19:16', '2023-10-27 13:19:16'),
(194, 'FC Work', 123, 'active', '2023-10-27 13:19:26', '2023-10-27 13:19:26'),
(195, 'Road Tax', 123, 'active', '2023-10-27 13:19:37', '2023-10-27 13:19:37'),
(196, 'Domestic stoves', 127, 'active', '2023-10-27 13:22:06', '2023-10-27 13:22:06'),
(197, 'Commercial Stoves', 127, 'active', '2023-10-27 13:22:16', '2023-10-27 13:22:16'),
(198, 'Spares for Domestic stoves', 127, 'active', '2023-10-27 13:22:32', '2023-10-27 13:22:32'),
(199, 'Spares for Commercial stoves', 127, 'active', '2023-10-27 13:22:43', '2023-10-27 13:22:43'),
(200, 'Kitchenwares', 127, 'active', '2023-10-27 13:22:53', '2023-10-27 13:22:53'),
(201, 'Suraksha', 127, 'active', '2023-10-27 13:23:02', '2023-10-27 13:23:02'),
(202, 'Lighter', 127, 'active', '2023-10-27 13:23:24', '2023-10-27 13:23:24'),
(203, 'DPR', 127, 'active', '2023-10-27 13:25:53', '2023-10-27 13:25:53'),
(204, 'LPG iron box', 127, 'active', '2023-10-27 13:28:35', '2023-10-27 13:28:35'),
(205, 'Showroom to Bank', 131, 'active', '2023-10-27 13:34:14', '2023-10-27 13:34:14'),
(206, 'Cream N Kulfi', 57, 'active', '2023-10-30 08:31:02', '2023-10-30 08:31:02'),
(207, 'DEVENDRAN PLASTICS', 57, 'active', '2023-10-30 09:11:34', '2023-10-30 09:11:34'),
(208, 'PANDIAN GRANITES', 57, 'active', '2023-10-30 09:13:51', '2023-10-30 09:13:51'),
(209, 'RADHABAI MARVELS', 57, 'active', '2023-10-30 09:14:31', '2023-10-30 09:14:31'),
(210, 'SALEM CHICKEN CORNER', 57, 'active', '2023-10-30 09:15:57', '2023-10-30 09:15:57'),
(211, 'DOSA INFINITY', 57, 'active', '2023-10-30 09:16:24', '2023-10-30 09:16:24'),
(212, 'HOTT SPOTT', 57, 'active', '2023-10-30 09:17:30', '2023-10-30 09:17:30'),
(213, 'RAJ MAHAL', 57, 'active', '2023-10-30 09:18:05', '2023-10-30 09:18:05'),
(214, 'SSM PAPER TUBES', 57, 'active', '2023-10-30 09:20:19', '2023-10-30 09:20:19'),
(215, 'PAVITHRA HOTEL', 57, 'active', '2023-10-30 09:21:15', '2023-10-30 09:21:15'),
(216, 'VEL MURUGAN', 57, 'active', '2023-10-30 09:21:45', '2023-10-30 09:21:45'),
(217, 'HOTEL ANANDA VEG &NON-VEG', 57, 'active', '2023-10-30 09:29:50', '2023-10-30 09:29:50'),
(218, 'VIGNESH M', 57, 'active', '2023-10-30 10:47:39', '2023-10-30 10:47:39'),
(219, 'KURUNJI RESERVELINE', 57, 'active', '2023-10-30 11:07:17', '2023-10-30 11:07:17'),
(220, 'SHAWARMA BOX', 57, 'active', '2023-10-30 11:07:40', '2023-10-30 11:07:40'),
(221, 'KUTTY BRIYANI KADAI', 57, 'active', '2023-10-30 11:08:10', '2023-10-30 11:08:10'),
(222, 'SRI DEVI BAKERY', 57, 'active', '2023-10-30 11:08:45', '2023-10-30 11:08:45'),
(223, 'SRI BALAJI BAKERY', 57, 'active', '2023-10-30 11:09:05', '2023-10-30 11:09:05'),
(224, 'AVINISH', 57, 'active', '2023-10-30 11:09:28', '2023-10-30 11:09:28'),
(225, 'MUTHUSAMY', 57, 'active', '2023-10-30 11:09:52', '2023-10-30 11:09:52'),
(226, 'THANGAM TEA STALL', 57, 'active', '2023-10-30 11:10:22', '2023-10-30 11:10:22'),
(227, 'GOMATHI MESS', 57, 'active', '2023-10-30 11:10:47', '2023-10-30 11:10:47'),
(228, 'AL MISIRIYA HOTEL', 57, 'active', '2023-10-30 11:11:07', '2023-10-30 11:11:07'),
(229, 'MISIRIYA HOTEL', 57, 'active', '2023-10-30 11:11:25', '2023-10-30 11:11:25'),
(230, 'K.P.HOTEL', 57, 'active', '2023-10-30 11:11:43', '2023-10-30 11:11:43'),
(231, 'METTUR TRANSPORT', 57, 'active', '2023-10-30 11:12:08', '2023-10-30 11:12:08'),
(232, 'KAMALIYA VEG', 57, 'active', '2023-10-30 11:13:29', '2023-10-30 11:13:29'),
(233, 'KAMALIYA CHETTINADU', 57, 'active', '2023-10-30 11:14:05', '2023-10-30 11:14:05'),
(234, 'KAMALIYA CLASSIC', 57, 'active', '2023-10-30 11:14:28', '2023-10-30 11:14:28'),
(235, 'KURUNJI TEA STALL', 57, 'active', '2023-10-30 11:14:57', '2023-10-30 11:14:57'),
(236, 'MATHI INTEGRATED HEALTH CENTRE', 57, 'active', '2023-10-30 11:19:49', '2023-10-30 11:19:49'),
(237, 'KHAGEN SATNAMI', 57, 'active', '2023-10-30 11:20:27', '2023-10-30 11:20:27'),
(238, 'SRI HARI PRIYA HOTEL', 57, 'active', '2023-10-30 11:23:21', '2023-10-30 11:23:21'),
(239, 'VENKATESWARA TIFFIN CENTRE', 57, 'active', '2023-10-30 11:23:59', '2023-10-30 11:23:59'),
(240, 'SAI BALAJI BAKERY', 57, 'active', '2023-10-30 11:24:59', '2023-10-30 11:24:59'),
(241, 'J.T.PARG', 57, 'active', '2023-10-30 11:25:17', '2023-10-30 11:25:17'),
(242, 'GOWATHAM HOTEL', 57, 'active', '2023-10-30 11:26:12', '2023-10-30 11:26:12'),
(243, 'SIRUMALAI ANNAI SHRINE', 57, 'active', '2023-10-30 11:29:24', '2023-10-30 11:29:24'),
(244, 'AZARUDEEN BRIYANI', 57, 'active', '2023-10-30 11:29:44', '2023-10-30 11:29:44'),
(245, 'UMA JEWELLERY', 57, 'active', '2023-10-30 11:31:19', '2023-10-30 11:31:19'),
(246, 'VISKHA SPORTS CLUB', 57, 'active', '2023-10-30 11:32:14', '2023-10-30 11:32:14'),
(247, 'VISAKA SPORTS CLUB', 57, 'active', '2023-10-30 11:32:52', '2023-10-30 11:32:52'),
(248, 'JAGANNATHA CHEMICALS', 57, 'active', '2023-10-30 11:35:05', '2023-10-30 11:35:05'),
(249, 'ASHA M', 57, 'active', '2023-10-30 11:35:24', '2023-10-30 11:35:24'),
(250, 'MUTHU MARI M', 57, 'active', '2023-10-30 11:38:09', '2023-10-30 11:38:09'),
(251, 'SODEXO INDIA SERVICES PVT LTD', 57, 'active', '2023-10-30 11:47:09', '2023-10-30 11:47:09'),
(252, 'SODEXO INDIA SERVICES PVT LTD RETAIL', 57, 'active', '2023-10-30 12:14:27', '2023-10-30 12:14:27'),
(253, 'AMBUR BRIYANI', 57, 'active', '2023-10-30 12:14:48', '2023-10-30 12:14:48'),
(254, 'CHERMAKANI', 57, 'active', '2023-10-30 12:15:06', '2023-10-30 12:15:06'),
(255, 'JT PARG', 57, 'active', '2023-11-07 11:38:02', '2023-11-07 11:38:02'),
(256, 'SRI DEVI BAKERY', 57, 'active', '2023-11-07 11:38:38', '2023-11-07 11:38:38'),
(257, 'SIRUMALAI ANNAI SHRINE', 57, 'active', '2023-11-07 11:39:16', '2023-11-07 11:39:16'),
(259, 'UMA JEWELLERY', 57, 'active', '2023-11-07 11:40:17', '2023-11-07 11:40:17'),
(260, 'VISKHA SPORTS CLUB', 57, 'active', '2023-11-07 11:40:52', '2023-11-07 11:40:52'),
(261, 'VISAKA SPORTS CLUB', 57, 'active', '2023-11-07 11:41:31', '2023-11-07 11:41:31'),
(262, 'JAGANNATH CHEMICALS', 57, 'active', '2023-11-07 11:42:23', '2023-11-07 11:42:23'),
(263, 'ASHA M', 57, 'active', '2023-11-07 11:42:42', '2023-11-07 11:42:42'),
(264, 'MUTHU MARI M', 57, 'active', '2023-11-07 11:43:06', '2023-11-07 11:43:06'),
(265, 'SODEXO INDIA SERVICES PVT LTD RETAIL', 57, 'active', '2023-11-07 11:53:13', '2023-11-07 11:53:13'),
(266, 'AMBUR BRIYANI', 57, 'active', '2023-11-07 11:54:28', '2023-11-07 11:54:28'),
(267, 'CHERMAKANI', 57, 'active', '2023-11-07 11:54:46', '2023-11-07 11:54:46'),
(268, 'KALASALINGAM MEDICIAL COLLEGE', 57, 'active', '2023-11-07 12:06:40', '2023-11-07 12:06:40'),
(269, 'KALASALINGAM UNIVERSITY COLLEGE', 57, 'active', '2023-11-07 12:07:19', '2023-11-07 12:07:19'),
(270, 'DHANALAKSHMI TIFFIN CENTRE', 57, 'active', '2023-11-07 12:08:24', '2023-11-07 12:08:24'),
(271, 'SRI VELAVAN TEA STALL', 57, 'active', '2023-11-07 12:08:54', '2023-11-07 12:08:54'),
(272, 'HANU SRI PACKAGE AYYAN GODOWN', 57, 'active', '2023-11-07 12:13:24', '2023-11-07 12:13:24'),
(273, 'HARINI COFFEE BAR', 57, 'active', '2023-11-07 12:13:48', '2023-11-07 12:13:48'),
(274, 'PALAGAM & SITRUNDI', 57, 'active', '2023-11-07 12:16:22', '2023-11-07 12:16:22'),
(275, 'KAVITHA COFFEE BAR', 57, 'active', '2023-11-07 12:16:45', '2023-11-07 12:16:45'),
(276, 'KEERTHANA AGALIYA FOOD', 57, 'active', '2023-11-07 12:19:56', '2023-11-07 12:19:56'),
(277, 'SFR IDLY KADAI', 57, 'active', '2023-11-07 12:20:31', '2023-11-07 12:20:31'),
(278, 'SBK HOTEL', 57, 'active', '2023-11-07 12:20:49', '2023-11-07 12:20:49'),
(279, 'SFR IDLY KADAI', 57, 'active', '2023-11-07 12:21:09', '2023-11-07 12:21:09'),
(280, 'RAIHAN STORE', 57, 'active', '2023-11-07 12:24:17', '2023-11-07 12:24:17'),
(281, 'PAVUNRAJ', 57, 'active', '2023-11-07 12:24:42', '2023-11-07 12:24:42'),
(282, 'INIYA MESS', 57, 'active', '2023-11-07 12:25:35', '2023-11-07 12:25:35'),
(283, 'PANDI R', 57, 'active', '2023-11-07 12:26:01', '2023-11-07 12:26:01'),
(284, 'GURU MURUGA TEA STALL', 57, 'active', '2023-11-07 12:26:31', '2023-11-07 12:26:31'),
(285, 'MUTHU SELVI HOTEL', 57, 'active', '2023-11-07 12:27:02', '2023-11-07 12:27:02'),
(286, 'RUSHI MESS', 57, 'active', '2023-11-07 12:27:19', '2023-11-07 12:27:19'),
(287, 'GANESH KUMAR N', 57, 'active', '2023-11-07 12:27:39', '2023-11-07 12:27:39'),
(288, 'VELMURUGAN', 57, 'active', '2023-12-06 15:01:05', '2023-12-06 15:01:05'),
(289, 'RAFIK', 57, 'active', '2023-12-06 15:01:27', '2023-12-06 15:01:27'),
(290, 'VASANTH HOTEL(SRV)', 57, 'active', '2023-12-06 15:02:03', '2023-12-06 15:02:03'),
(291, 'JOHN FRIED RICE SHOP', 57, 'active', '2023-12-06 15:02:51', '2023-12-06 15:02:51'),
(292, 'SRI AKSHYA HOTEL', 57, 'active', '2023-12-06 15:03:14', '2023-12-06 15:03:14'),
(293, 'SAKTHIVEL', 57, 'active', '2023-12-06 15:03:30', '2023-12-06 15:03:30'),
(294, 'RAVICHANDRAR BROILER', 57, 'active', '2023-12-06 15:06:19', '2023-12-06 15:06:19'),
(295, 'SRI JEYALAKSHMI CHETTINADU(GOMATHI)', 57, 'active', '2023-12-06 15:08:05', '2023-12-06 15:08:05'),
(296, 'CORNER MILAN', 57, 'active', '2023-12-06 15:08:46', '2023-12-06 15:08:46'),
(297, 'MAYILVAKANARAJ', 57, 'active', '2023-12-06 15:09:13', '2023-12-06 15:09:13'),
(298, 'Income Tax', 96, 'active', '2024-04-03 07:17:11', '2024-04-03 07:17:11'),
(299, 'Bata', 121, 'active', '2024-04-03 07:34:50', '2024-04-03 07:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `supply_areas`
--

CREATE TABLE `supply_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supply_areas`
--

INSERT INTO `supply_areas` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Ponmeni', 'Y', '2023-04-02 13:33:54', '2023-04-02 13:33:54'),
(9, 'Thenur', 'Y', '2023-04-02 13:34:10', '2023-04-02 13:34:10'),
(10, 'Paravai', 'Y', '2023-04-02 13:34:19', '2023-04-02 13:34:19'),
(11, 'Samayanallur', 'Y', '2023-04-02 13:34:29', '2023-04-02 13:34:29'),
(14, 'Vakkil New street', 'Y', '2023-04-27 12:13:50', '2023-04-27 12:13:50'),
(15, 'North Masi Street', 'Y', '2023-04-27 12:14:24', '2023-04-27 12:14:24'),
(16, 'Mahal (o)', 'Y', '2023-04-27 12:14:44', '2023-04-27 12:14:44'),
(17, 'Panthadi (O)', 'Y', '2023-04-27 12:15:13', '2023-04-27 12:15:13'),
(18, 'South veli st', 'Y', '2023-04-27 12:15:38', '2023-04-27 12:15:38'),
(19, 'South marret st', 'Y', '2023-04-27 12:15:59', '2023-04-27 12:15:59'),
(20, 'Avaniyapuram', 'Y', '2023-04-27 12:16:14', '2023-04-27 12:16:14'),
(21, 'Villapuram', 'Y', '2023-04-27 12:16:26', '2023-04-27 12:16:26'),
(22, 'Chinnakadai', 'Y', '2023-04-27 12:16:45', '2023-04-27 12:16:45'),
(23, 'Mahal', 'Y', '2023-04-27 12:16:55', '2023-04-27 12:16:55'),
(24, 'Panthadi', 'Y', '2023-04-27 12:17:03', '2023-04-27 12:17:03'),
(25, 'Pasumalai', 'Y', '2023-04-27 12:17:20', '2023-04-27 12:17:20'),
(26, 'TVS Nagar', 'Y', '2023-04-27 12:17:34', '2023-04-27 12:17:34'),
(27, 'Jaihindpuram', 'Y', '2023-04-27 12:17:55', '2023-04-27 12:17:55'),
(28, 'Subramaniyapuram', 'Y', '2023-04-27 12:18:21', '2023-04-27 12:18:21'),
(29, 'Bye pass road', 'Y', '2023-04-27 12:18:53', '2023-04-27 12:18:53'),
(30, 'Bye pass road 1', 'Y', '2023-04-27 12:19:09', '2023-04-27 12:19:09'),
(31, 'Ellis Nagar', 'Y', '2023-04-27 12:19:24', '2023-04-27 12:19:24'),
(32, 'Mahaboopalayam', 'Y', '2023-04-27 12:19:44', '2023-04-27 12:19:44'),
(33, 'Mahaboopalayam 1', 'Y', '2023-04-27 12:19:54', '2023-04-27 12:19:54'),
(34, 'Doak Nagar', 'Y', '2023-04-27 12:20:46', '2023-04-27 12:20:46'),
(35, 'Doak Nagar 1', 'Y', '2023-04-27 12:20:58', '2023-04-27 12:20:58'),
(36, 'H M S Colony', 'Y', '2023-04-27 12:21:17', '2023-04-27 12:21:17'),
(37, 'Mettu Street', 'Y', '2023-04-27 12:21:41', '2023-04-27 12:21:41'),
(38, 'Mettu Street  1', 'Y', '2023-04-27 12:21:50', '2023-04-27 12:21:50'),
(39, 'Bethaniyapuram', 'Y', '2023-04-27 12:22:09', '2023-04-27 12:22:09'),
(40, 'Mudakkusalai', 'Y', '2023-04-27 12:22:29', '2023-04-27 12:22:29'),
(41, 'P P Chavadi', 'Y', '2023-04-27 12:23:01', '2023-04-27 12:23:01'),
(42, 'Chokkalinga Nagar', 'Y', '2023-04-27 12:23:21', '2023-04-27 12:23:21'),
(43, 'Sammattipuram', 'Y', '2023-04-27 12:23:49', '2023-04-27 12:23:49'),
(44, 'Ponnagaram', 'Y', '2023-04-27 12:24:01', '2023-04-27 12:24:01'),
(45, 'Karimedu', 'Y', '2023-04-27 12:24:13', '2023-04-27 12:24:13'),
(46, 'Thathaneri', 'Y', '2023-04-27 12:24:34', '2023-04-27 12:24:34'),
(47, 'Simmakkal', 'Y', '2023-04-27 12:24:49', '2023-04-27 12:24:49'),
(48, 'West ponnagaram', 'Y', '2023-04-27 12:25:01', '2023-04-27 12:25:01'),
(49, 'Visuwasapuri', 'Y', '2023-04-27 12:25:20', '2023-04-27 12:37:39'),
(50, 'Koodal Nagar', 'Y', '2023-04-27 12:25:34', '2023-04-27 12:25:34'),
(51, 'Railway Colony', 'Y', '2023-04-27 12:25:56', '2023-04-27 12:25:56'),
(52, 'Vilangudi', 'Y', '2023-04-27 12:26:11', '2023-04-27 12:26:11'),
(53, 'Nagamalai', 'Y', '2023-04-27 12:26:35', '2023-04-27 12:26:35'),
(54, 'Nagamalai 1', 'Y', '2023-04-27 12:27:02', '2023-04-27 12:27:02'),
(55, 'Nagamalai 2', 'Y', '2023-04-27 12:27:10', '2023-04-27 12:27:10'),
(56, 'Nagamalai 3', 'Y', '2023-04-27 12:27:18', '2023-04-27 12:27:18'),
(57, 'Kodimangalam', 'Y', '2023-04-27 12:27:47', '2023-04-27 12:27:47'),
(58, 'Thuvariman', 'Y', '2023-04-27 12:27:58', '2023-04-27 12:27:58'),
(59, 'Perayur 1', 'Y', '2023-04-27 12:28:18', '2023-04-27 12:28:18'),
(60, 'Perayur', 'Y', '2023-04-27 12:28:35', '2023-04-27 12:28:35'),
(61, 'Perayur 2', 'Y', '2023-04-27 12:28:43', '2023-04-27 12:28:43'),
(62, 'Perayur 3', 'Y', '2023-04-27 12:28:51', '2023-04-27 12:28:51'),
(63, 'Perayur 4', 'Y', '2023-04-27 12:29:04', '2023-04-27 12:29:04'),
(64, 'Perayur 5', 'Y', '2023-04-27 12:29:12', '2023-04-27 12:29:12'),
(65, 'Perayur 6', 'Y', '2023-04-27 12:29:19', '2023-04-27 12:29:19'),
(66, 'Kallupatti', 'Y', '2023-04-27 12:29:35', '2023-04-27 12:29:35'),
(67, 'Kallupatti 1', 'Y', '2023-04-27 12:29:43', '2023-04-27 12:29:43'),
(68, 'Local Ujwala', 'Y', '2023-04-27 12:29:57', '2023-04-27 12:29:57'),
(69, 'Per Ujwala', 'Y', '2023-04-27 12:30:16', '2023-04-27 12:30:16'),
(70, 'Per Ujwala 1', 'Y', '2023-04-27 12:30:24', '2023-04-27 12:30:24'),
(71, 'Per Ujwala 2', 'Y', '2023-04-27 12:30:33', '2023-04-27 12:30:33'),
(72, 'Per Ujwala 3', 'Y', '2023-04-27 12:30:43', '2023-04-27 12:30:43'),
(73, 'Per Exempted', 'Y', '2023-04-27 12:30:58', '2023-04-27 12:30:58'),
(74, 'CKN', 'Y', '2023-04-27 12:33:31', '2023-04-27 12:33:31'),
(75, 'CKN 1', 'Y', '2023-04-27 12:33:40', '2023-04-27 12:33:40'),
(76, 'CKN 2', 'Y', '2023-04-27 12:33:49', '2023-04-27 12:33:49'),
(77, 'CKN 3', 'Y', '2023-04-27 12:33:57', '2023-04-27 12:33:57'),
(78, 'CKN 4', 'Y', '2023-04-27 12:34:06', '2023-04-27 12:34:06'),
(79, 'CKN 5', 'Y', '2023-04-27 12:34:16', '2023-04-27 12:34:16'),
(80, 'CKN 6', 'Y', '2023-04-27 12:34:25', '2023-04-27 12:34:25'),
(81, 'CKN Ujwala', 'Y', '2023-04-27 12:35:01', '2023-04-27 12:35:01'),
(82, 'CKN Ujwala 1', 'Y', '2023-04-27 12:35:19', '2023-04-27 12:35:19'),
(83, 'CKN Ujwala 2', 'Y', '2023-04-27 12:35:30', '2023-04-27 12:35:30'),
(84, 'CKN Ujwala 3', 'Y', '2023-04-27 12:35:39', '2023-04-27 12:35:39'),
(85, 'CKN Ujwala 4', 'Y', '2023-04-27 12:35:49', '2023-04-27 12:35:49'),
(86, 'CKN Ujwala 5', 'Y', '2023-04-27 12:35:59', '2023-04-27 12:35:59'),
(87, 'CKN Ujwala 6', 'Y', '2023-04-27 12:36:08', '2023-04-27 12:36:08'),
(88, 'CKN Exempted', 'Y', '2023-04-27 12:36:45', '2023-04-27 12:36:45'),
(89, 'Exempted', 'Y', '2023-04-27 12:36:56', '2023-04-27 12:36:56'),
(90, 'North', 'Y', '2023-04-27 12:38:27', '2023-04-27 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `supply_zones`
--

CREATE TABLE `supply_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supply_zones`
--

INSERT INTO `supply_zones` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Kovil Area', 'Y', '2023-04-02 13:28:22', '2023-04-02 13:28:22'),
(8, 'TPK road', 'Y', '2023-04-02 13:28:40', '2023-04-02 13:28:40'),
(9, 'SS Colony', 'Y', '2023-04-02 13:29:08', '2023-04-27 11:51:39'),
(10, 'West ponnagaram', 'Y', '2023-04-02 13:29:26', '2023-04-27 11:57:07'),
(11, 'PP Chavadi', 'Y', '2023-04-02 13:29:35', '2023-04-02 13:29:35'),
(12, 'Doak Nagar', 'Y', '2023-04-02 13:29:49', '2023-04-02 13:29:49'),
(13, 'Samayanallur', 'Y', '2023-04-02 13:30:05', '2023-04-02 13:30:05'),
(14, 'Nagamalai', 'Y', '2023-04-02 13:30:12', '2023-04-02 13:30:12'),
(15, 'CKN', 'Y', '2023-04-02 13:30:25', '2023-04-02 13:30:25'),
(16, 'Perayur', 'Y', '2023-04-02 13:30:33', '2023-04-02 13:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `social` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`social`)),
  `login_type` enum('Web','Social') NOT NULL DEFAULT 'Web',
  `bill_user` enum('Yes','No') NOT NULL DEFAULT 'No',
  `bill_password` varchar(191) DEFAULT NULL,
  `role` enum('Super Admin','Admin','Executive','Customer','Rider','Accountant') NOT NULL DEFAULT 'Customer',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `mobile_otp` varchar(191) DEFAULT NULL,
  `mobile_otp_expired_at` datetime DEFAULT NULL,
  `is_mobile_verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `email_otp` varchar(191) DEFAULT NULL,
  `email_otp_expired_at` datetime DEFAULT NULL,
  `is_email_verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `social`, `login_type`, `bill_user`, `bill_password`, `role`, `status`, `mobile_otp`, `mobile_otp_expired_at`, `is_mobile_verified`, `email_otp`, `email_otp_expired_at`, `is_email_verified`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@sbamadurai.com', '$2y$10$5M/4pTqxNJpIQm2n9giWiehhJ7XEht2xYVdpbWdWt8htypi1uzxoe', '898989897', NULL, 'Web', 'No', NULL, 'Super Admin', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, 'JIYvM6MTufLnxPPe0VMvvMpXnm3ZxdairICyqxX7bEQ1Tas6FByqKZKU2c3U', '2020-10-14 17:26:08', '2023-02-08 10:34:29'),
(2, 'Rajesh', 'rajesh@mailinator.com', '$2y$10$O1aKPDGBMfzBRlkpC7PzOe1Gb0om0Knzonj1A6259MH2EslHO3P4i', '8610292918', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-01-12 20:28:04', 'Yes', '1234', '2023-01-12 20:21:45', 'Yes', NULL, NULL, '2023-01-12 16:14:40', '2023-01-12 20:18:04'),
(3, 'Raj', 'raj@mailinator.com', '$2y$10$vezHyBW0wnBiAdwNXvNVweE9it/LP8RzHU76GDmzvzQJeviPNwHGW', '7777777777', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-01-20 11:13:47', 'Yes', '1234', '2023-01-20 11:13:47', 'Yes', NULL, NULL, '2023-01-20 11:03:47', '2023-01-20 11:03:53'),
(4, 'Anu', 'anu@mailinator.com', '$2y$10$AiMXMY7wmUQRw6WquPZJNOqTBoUWDPOsbZCLUtSBdhP5UBSuoL6sy', '6523985527', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-01-23 12:56:12', 'Yes', '1234', '2023-01-23 12:56:12', 'Yes', NULL, NULL, '2023-01-23 12:46:12', '2023-02-08 10:34:09'),
(5, 'Pari', 'pari@yahoo.com', '$2y$10$LNlb4se3dUqXhfzSqZ5TjuGaOZieD2B4R08oN93yfDHnMObvuew1.', '9090898789', NULL, 'Web', 'No', NULL, 'Executive', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-02-08 10:31:45', '2023-02-10 18:29:50'),
(6, 'Shri Balaji Agencies Madurai', 'sbahobey@gmail.com', '$2y$10$lGJosw7ofIihAplwCpOEjuUWA9VWdeA7wK7oMv/MlG2VSFogrrVPS', '8012555969', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-02-15 11:50:39', 'Yes', '1234', '2023-02-15 11:50:39', 'Yes', NULL, NULL, '2023-02-15 11:40:39', '2023-04-18 13:16:25'),
(7, 'Shri Balaji Agencies Madurai', 'shribalajiagenciesmdu@gmail.com', '$2y$10$QZD3r8QRAHNXSLSCfHQmKOGQJXi5NKW5sn2RGacmndbfZrOF55piO', '6369893419', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-02-15 11:52:38', 'Yes', '1234', '2023-02-15 11:52:38', 'Yes', NULL, NULL, '2023-02-15 11:42:38', '2023-02-15 11:42:38'),
(8, 'Prabavathi K', 'maduraikadai2023@gmail.com', '$2y$10$XLurUx7gLmzw9KThT6dXK.Qbf/0eKFCRu3zA9gYm7asHvAyfUnKI.', '8012555969', NULL, 'Web', 'No', NULL, 'Admin', 'Active', '1234', '2023-04-18 13:41:33', 'Yes', NULL, NULL, 'No', NULL, 'iPTc2aAZVsXqJHLbcSkD0tOvrgL13tz8vuh064TpV6d3nVxY84oWmyKBX8lD', '2023-03-11 18:27:01', '2023-04-18 13:33:07'),
(9, 'aaa', 'aaa@mailinator.com', '$2y$10$LwaGt2Yu4u8FvSUjNvnp6ehFTlXwngUL/77r1wYZOaoPnURXrdYny', '9638527410', NULL, 'Web', 'No', NULL, 'Admin', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-03-24 12:56:41', '2023-03-24 12:56:41'),
(10, 'abc', 'abc@mailinator.com', '$2y$10$.iQtaetXQr/Y89oOsK30VeMZZElQIZi/hzFlRjkkH/drMVevhF.aO', '1234567890', NULL, 'Web', 'No', NULL, 'Rider', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-03-24 13:16:37', '2023-03-24 13:16:37'),
(11, 'Test', 'test@mailinator.com', '$2y$10$ShMN0FjMGbB9h2LBNtnzaO114yL3lFhH/KfufwsqK64ek9rYCPgBy', '1234569842', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-01 13:18:34', 'Yes', '1234', '2023-04-01 13:18:34', 'Yes', NULL, NULL, '2023-04-01 13:08:34', '2023-04-01 13:08:34'),
(12, 'Test', 'test1@mailinator.com', '$2y$10$cRMEfI865KHvrYgyx7x4oe0FS.qPV7ECVN2UMzHcJSOQuQXlo/mZS', '9163836140', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-01 13:19:34', 'Yes', '1234', '2023-04-01 13:19:12', 'Yes', NULL, NULL, '2023-04-01 13:09:12', '2023-04-01 13:09:34'),
(13, 'Sumit Dalakiya', 'sumitdalakiya@gmail.com', '$2y$10$vwcXoUHkO4tGdz.WOSCMzOEVY4cHVkHxHLBnqpDReg6GedNs92c4e', '9033073049', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-01 14:41:31', 'Yes', '1234', '2023-04-01 14:41:31', 'Yes', NULL, NULL, '2023-04-01 14:31:31', '2023-04-01 14:31:37'),
(14, 'Arvinth', 'vasudevanarvinth@gmail.com', '$2y$10$.pcAkTX3afwefClstz/y1eLwbNMdFgtK5Jsx4lnYqmxgdn9nfxF2G', '6369893419', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-15 09:01:10', 'Yes', '1234', '2023-04-15 09:01:10', 'Yes', NULL, NULL, '2023-04-15 08:51:10', '2023-04-15 08:51:24'),
(15, 'Rajesh Rathod', 'rajesh.rathod@gmail.com', '$2y$10$rSUCiOA0u8XSnsyKiRNcguDx1kyfzMTp9MRkJbPisaUnvM3bLevXe', '9662590621', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-17 17:57:06', 'Yes', '1234', '2023-04-17 17:57:06', 'Yes', NULL, NULL, '2023-04-17 17:47:06', '2023-04-17 17:47:12'),
(16, 'Aakash', 'aakashlll@gmail.com', '$2y$10$k9gKvshRtASHLKcFDuOqseatvEolN.6Daal7nFIXji9j5pVc9svky', '1258963456', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-18 11:43:46', 'Yes', '1234', '2023-04-18 11:43:46', 'Yes', NULL, NULL, '2023-04-18 11:33:46', '2023-04-18 11:33:57'),
(17, 'Shri Balaji Agencies Madurai', 'prabamuthu77@gmail.com', '$2y$10$PLa5aKlJ6svRV18JHV0mvuTVv3y.Z4JbxdQFptvzgwG4xbP9adnZq', '9199407578', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-18 13:34:23', 'Yes', '1234', '2023-04-18 13:34:23', 'Yes', NULL, NULL, '2023-04-18 13:24:23', '2023-04-18 13:24:23'),
(18, 'Abi', 'abi@mailinator.com', '$2y$10$fCWeOl7qstYHOQ1sfco40.UxDLHxxvi7bd.rUXywPksZmC1R7PXpu', '9163836140', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-09 17:42:00', 'Yes', '1234', '2023-05-09 17:42:00', 'Yes', NULL, NULL, '2023-05-09 17:32:00', '2023-05-09 17:32:00'),
(19, 'Aathi', 'aathi@mailinator.com', '$2y$10$EVtYimquj9qYts04t2BECus0.3dzzKJt7GT6d10OuCjUAL3Xzl.Dq', '3216547890', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-09 17:45:14', 'Yes', '1234', '2023-05-09 17:45:14', 'Yes', NULL, NULL, '2023-05-09 17:35:14', '2023-05-09 17:35:14'),
(20, 'Anil', 'anil@mailinator.com', '$2y$10$kYYWBQmLP7luFvNsdIpG7u9zLyLVAbEpu/Z11XkaitoQ6fzgPfME2', '9638527410', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-10 13:16:04', 'Yes', '1234', '2023-05-10 13:16:04', 'Yes', NULL, NULL, '2023-05-10 13:06:04', '2023-05-10 13:06:04'),
(21, 'Banu', 'banu@mailinator.com', '$2y$10$qUIfmcal55UAeXTFpz1dRuFda88hBs7vMZflbb1GM7DFzvrQ4Iy5C', '6325897410', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-10 15:55:56', 'Yes', '1234', '2023-05-10 15:55:56', 'Yes', NULL, NULL, '2023-05-10 15:45:56', '2023-05-10 15:46:11'),
(22, 'Hello World! https://racetrack.top/go/hezwgobsmq5dinbw?hs=44f6e2394925ef9c4af645e4296a1d8d&', 'yhfee@chitthi.in', '$2y$10$8K4arJv/QiflOcRLnd.BjuooLb2nh0BRpKnEQmjqvqBwUojOvrT8a', '779172110040', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-05-17 18:09:48', '2023-05-17 18:09:48'),
(23, 'Operations', 'adminops@sbamadurai.com', '$2y$10$5M/4pTqxNJpIQm2n9giWiehhJ7XEht2xYVdpbWdWt8htypi1uzxoe', '898989897', NULL, 'Web', 'No', NULL, 'Accountant', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, 'ILx1zdjEnSutqdQRx5J4T6fpqZ26ffq94S1ebwwqSs7lsgCWWz4mckjlkc6C', '2023-11-10 10:47:08', '2023-11-10 10:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

CREATE TABLE `working_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `month` varchar(255) NOT NULL,
  `total_days` int(11) NOT NULL,
  `sundays` int(11) NOT NULL,
  `holidays` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `working_days`
--

INSERT INTO `working_days` (`id`, `month`, `total_days`, `sundays`, `holidays`, `created_at`, `updated_at`) VALUES
(8, 'April 2023', 30, 5, 0, '2023-04-15 05:13:57', '2023-05-03 05:51:10'),
(14, 'May 2023', 31, 4, 2, '2023-04-24 07:48:09', '2023-04-29 06:42:00'),
(15, 'June 2023', 30, 4, 0, '2023-04-29 06:42:25', '2023-04-29 06:42:25'),
(16, 'July 2023', 31, 5, 0, '2023-04-29 06:42:47', '2023-04-29 06:42:47'),
(17, 'August 2023', 31, 4, 1, '2023-04-29 06:43:06', '2023-04-29 06:43:06'),
(18, 'September 2023', 30, 4, 0, '2023-04-29 06:43:22', '2023-04-29 06:43:22'),
(19, 'October 2023', 31, 5, 2, '2023-04-29 06:43:55', '2023-04-29 06:43:55'),
(20, 'November 2023', 30, 4, 2, '2023-04-29 06:44:12', '2023-04-29 06:44:12'),
(21, 'December 2023', 30, 3, 0, '2023-04-29 06:44:30', '2023-05-03 02:45:50'),
(22, 'March 2023', 30, 4, 2, '2023-05-03 09:26:10', '2023-05-03 10:58:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `daybooks`
--
ALTER TABLE `daybooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daybooks_heading_id_foreign` (`heading_id`),
  ADD KEY `daybooks_subheading_id_foreign` (`subheading_id`);

--
-- Indexes for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_days`
--
ALTER TABLE `delivery_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_slots`
--
ALTER TABLE `delivery_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `denominations`
--
ALTER TABLE `denominations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `godown_day_books`
--
ALTER TABLE `godown_day_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daybooks_heading_id_foreign` (`heading_id`),
  ADD KEY `daybooks_subheading_id_foreign` (`subheading_id`);

--
-- Indexes for table `headings`
--
ALTER TABLE `headings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspections`
--
ALTER TABLE `inspections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_banners`
--
ALTER TABLE `mobile_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_reports`
--
ALTER TABLE `monthly_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monthly_reports_staff_id_foreign` (`staff_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occasions`
--
ALTER TABLE `occasions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_day_books`
--
ALTER TABLE `online_day_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daybooks_heading_id_foreign` (`heading_id`),
  ADD KEY `daybooks_subheading_id_foreign` (`subheading_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payslips`
--
ALTER TABLE `payslips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslipwithpf`
--
ALTER TABLE `payslipwithpf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `remainders`
--
ALTER TABLE `remainders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_payslipwithpf`
--
ALTER TABLE `report_payslipwithpf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_calculations`
--
ALTER TABLE `salary_calculations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_calculation_staff_id_foreign` (`staff_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sops`
--
ALTER TABLE `sops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_department_id_foreign` (`department_id`),
  ADD KEY `staff_supply_zone_id_foreign` (`supply_zone_id`),
  ADD KEY `staff_supply_area_id_foreign` (`supply_area_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_slug_unique` (`slug`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `subheadings`
--
ALTER TABLE `subheadings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subheadings_heading_id_foreign` (`heading_id`);

--
-- Indexes for table `supply_areas`
--
ALTER TABLE `supply_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supply_zones`
--
ALTER TABLE `supply_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `daybooks`
--
ALTER TABLE `daybooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_days`
--
ALTER TABLE `delivery_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `delivery_slots`
--
ALTER TABLE `delivery_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `denominations`
--
ALTER TABLE `denominations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `godown_day_books`
--
ALTER TABLE `godown_day_books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `headings`
--
ALTER TABLE `headings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `inspections`
--
ALTER TABLE `inspections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `mobile_banners`
--
ALTER TABLE `mobile_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `monthly_reports`
--
ALTER TABLE `monthly_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_day_books`
--
ALTER TABLE `online_day_books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslips`
--
ALTER TABLE `payslips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslipwithpf`
--
ALTER TABLE `payslipwithpf`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remainders`
--
ALTER TABLE `remainders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_payslipwithpf`
--
ALTER TABLE `report_payslipwithpf`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_calculations`
--
ALTER TABLE `salary_calculations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sops`
--
ALTER TABLE `sops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subheadings`
--
ALTER TABLE `subheadings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `supply_areas`
--
ALTER TABLE `supply_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `supply_zones`
--
ALTER TABLE `supply_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daybooks`
--
ALTER TABLE `daybooks`
  ADD CONSTRAINT `daybooks_heading_id_foreign` FOREIGN KEY (`heading_id`) REFERENCES `headings` (`id`),
  ADD CONSTRAINT `daybooks_subheading_id_foreign` FOREIGN KEY (`subheading_id`) REFERENCES `subheadings` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
