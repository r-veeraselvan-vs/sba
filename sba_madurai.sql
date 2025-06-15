-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2025 at 10:44 AM
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
-- Database: `sba_madurai`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `short_name` varchar(191) DEFAULT NULL,
  `building_name` varchar(191) DEFAULT NULL,
  `route` varchar(191) DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `latitude` double(12,8) DEFAULT NULL,
  `longitude` double(12,8) DEFAULT NULL,
  `default` enum('No','Yes') NOT NULL DEFAULT 'No',
  `city` varchar(191) NOT NULL,
  `postcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Deleted') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `short_name`, `building_name`, `route`, `contact_number`, `address`, `latitude`, `longitude`, `default`, `city`, `postcode`, `created_at`, `updated_at`, `status`) VALUES
(1, 13, 'Home', 'Test', 'Test', '9033073049', 'Test Test Test', 21.63188290, 69.61869970, 'No', 'Porbandar', '625001', '2023-05-10 15:58:39', '2023-09-16 10:43:59', 'Active'),
(2, 2, 'Home', '18/9 tnagar', 'near siva temple', '8610292918', 'first main road', 10.76654130, 78.68366000, 'Yes', 'Tiruchirappalli', '625001', '2023-05-10 16:11:07', '2023-07-04 17:12:13', 'Active'),
(3, 21, 'Home', '63, Subhiksha apartment', 'Murugan temple', '6325897410', 'South Street', 10.51269790, 79.63249000, 'Yes', 'Madurai', '625001', '2023-05-10 16:12:28', '2023-05-17 19:06:04', 'Active'),
(4, 4, 'Work', '65', 'perumal temple', '6523985527', 'South Street', 10.52050560, 79.63134290, 'Yes', 'Nagamalai', '625019', '2023-06-19 18:07:03', '2023-11-03 19:20:02', 'Active'),
(5, 6, 'Home', '99,Raj Nagar,', 'Back to Midland theatre', '8012555969', 'Sammattipuram', 9.92784750, 78.09924270, 'Yes', 'Madurai', '625016', '2023-06-23 11:42:00', '2024-06-21 13:28:34', 'Active'),
(6, 8, 'Home', '99', 'Sammattipuram', '8012555969', 'raj nagar cross St', 9.92729840, 78.09863670, 'Yes', 'Madurai', '625016', '2023-07-03 12:13:56', '2023-07-03 12:13:56', 'Active'),
(7, 19, 'Home', '102', NULL, NULL, '65,', NULL, NULL, 'No', 'Nagamalai', '625019', '2023-07-04 12:35:33', '2023-07-04 12:35:33', 'Active'),
(8, 21, 'home', '120', 'vinayagar temple', NULL, '65', NULL, NULL, 'No', 'Nagamalai', '625019', '2023-07-05 11:18:12', '2023-07-05 11:18:12', 'Active'),
(9, 18, 'home', '120', 'vinayagar temple', NULL, '65', NULL, NULL, 'No', 'Nagamalai', '625019', '2023-07-05 11:19:04', '2023-07-05 11:19:04', 'Active'),
(10, 19, 'home', '120', NULL, NULL, '65', NULL, NULL, 'No', 'Nagamalai', '625019', '2023-07-05 13:25:47', '2023-07-05 13:25:47', 'Active'),
(11, 23, 'Work', '65,Anna Nagar', 'Anna Nagar', '6383614062', 'Town area', 10.52518300, 79.63249000, 'Yes', 'Thruthuraipoondi', '625001', '2023-09-15 14:54:43', '2024-05-08 16:58:52', 'Active'),
(12, 13, 'Home', 'Vearavali Krupa', 'Paradise Fountain', '9033073049', 'Behind Pragaji bapa ashram, Laxminagar', 21.63178020, 69.61940440, 'Yes', 'Porbandar', '625001', '2023-09-15 16:37:17', '2023-09-16 10:43:59', 'Active'),
(13, 28, 'Home', '65', 'vinayagar temple', '6383614062', 'Anna Nagar', 10.52057990, 79.63142730, 'Yes', 'Nadubalam', '611111', '2023-09-22 12:39:27', '2023-09-22 12:57:16', 'Active'),
(14, 30, 'Home', 'A2', 'Behind SBI', '9843162347', 'Rams Apartments, Bharathiyar 5th street, S.S.Colony', 9.91990720, 78.09769770, 'Yes', 'Madurai', '625016', '2023-10-17 05:32:36', '2023-10-17 05:32:36', 'Active'),
(15, 31, 'Home', 'Jubilee apartments', 'opposite to gears and pedals', '6369893419', '4 North gate ss colony', 12.81223280, 80.07602410, 'Yes', 'Madurai', '625016', '2023-10-17 08:26:05', '2023-10-17 08:29:42', 'Active'),
(16, 35, 'Dye', 'vaithiyanatha puram', 'madruai', NULL, 'No 12', NULL, NULL, 'No', 'madurai', '625016', '2023-10-30 13:09:01', '2023-10-30 13:09:01', 'Active'),
(17, 25, 'Home', '152', 'Meenakshiamman temple', '8529836553', 'Meenakshi Amman temple opposite', 10.76502760, 78.68290640, 'No', 'madurai', '625001', '2023-11-10 19:23:10', '2023-11-10 19:23:10', 'Active'),
(18, 39, 'Home', '65', 'vinayagar temple', '6383614062', 'thiruthuraipoondi', 10.52069970, 79.63143220, 'Yes', 'Nadubalam', '625514', '2023-11-17 16:42:38', '2024-03-11 13:30:47', 'Active'),
(19, 40, 'Home', '12', 'Mettustreet', '9585263093', 'Bethaniyapuram, Madurai', 9.92745800, 78.09869940, 'Yes', 'Madurai', '625016', '2023-11-28 17:03:59', '2023-11-28 17:03:59', 'Active'),
(20, 42, 'Work', '10', 'northgate', '9195144755', 'ss colony', 9.92737520, 78.09868800, 'Yes', 'Madurai', '625016', '2023-11-28 17:21:48', '2023-11-28 17:37:19', 'Active'),
(21, 43, 'Work', '10,', 'north gate', '9500893704', 's s colony', 9.92739930, 78.09865190, 'Yes', 'madurai', '625016', '2023-11-28 17:30:44', '2023-11-28 17:36:09', 'Active'),
(22, 45, 'Work', '10', 'North gate', '9514475543', 'S. S. Colony', 9.92737000, 78.09868970, 'Yes', 'Madurai', '625016', '2023-11-28 18:30:33', '2023-12-14 12:02:58', 'Active'),
(23, 47, 'Home', '166', 'Chennai hot puffs turning', '9514283482', 'Ashok nagar 1 St Street 2nd cross street\nAnjal nagar madurai', 9.95225340, 78.10066870, 'Yes', 'Madurai', '625018', '2023-12-01 08:29:45', '2023-12-01 08:29:45', 'Active'),
(24, 48, 'Home', '22, vaishnavi bhavan', 'seethalakshmi nagar', '9444673043', 'nehruji street \nkalainagar 2 nd main road', 9.95923430, 78.12312450, 'Yes', 'Madurai', '625017', '2023-12-01 09:06:17', '2023-12-01 09:06:17', 'Active'),
(25, 51, 'Work', '7,', 'opp to Devaki scan', '9842150943', 'North Gate SS colony', 9.92728780, 78.09858910, 'Yes', 'Madurai', '625016', '2023-12-01 13:22:25', '2023-12-01 13:22:25', 'Active'),
(26, 52, 'Home', '8-16-8', 'shenbahamalar 2nd cross street', '6374942887', 'viswanathapuram', 9.95332590, 78.12425910, 'Yes', 'Madurai', '625014', '2023-12-01 14:57:10', '2023-12-01 14:58:42', 'Active'),
(27, 54, 'Home', 'E22', 'old C3 police station near', '9181898779', 'Rajeev Gandhi Nagar, SS Colony', 9.92729860, 78.09860390, 'Yes', 'Madurai', '625016', '2023-12-01 16:56:23', '2023-12-02 17:41:24', 'Active'),
(28, 55, 'Home', '152', 'vanamettu st,', '7010486979', 'east vaithyanayathapuram', 9.92729350, 78.09859800, 'Yes', 'Madurai', '625016', '2023-12-02 14:35:00', '2023-12-02 14:35:00', 'Active'),
(29, 56, 'Home', '109', 'opposite to vegetable market', '9445599472', 'Desiya vinayakar koil Street, K.pudur', 9.94647000, 78.14365730, 'Yes', 'Madurai', '625007', '2023-12-03 20:53:12', '2023-12-03 20:53:12', 'Active'),
(30, 59, 'Home', '55,', 'meiyappan 2nd st,', '9092043173', 'gnanaolivupuram', 9.92737390, 78.09869050, 'Yes', 'Madurai', '625016', '2023-12-04 15:34:37', '2023-12-04 16:12:14', 'Active'),
(31, 61, 'Home', '91/3', 'Samayanallur bustand', '9629693088', 'second Street, sokkar nagar', 9.97299250, 78.03646050, 'Yes', 'Samayanallur', '625402', '2023-12-07 16:46:01', '2023-12-07 16:46:01', 'Active'),
(32, 65, 'Home', '11, Sivasakthi Nagar,', 'near jayapal sports club', '9944188779', 'ponmeni Jainagar,', 9.92015340, 78.08721250, 'Yes', 'Madurai', '625016', '2023-12-11 15:03:02', '2024-02-05 17:47:19', 'Active'),
(33, 66, 'Home', '16-A,East Anna Thopu ,', 'Sri Muniyandi kovil near', '9080480571', 'East Anna Thopu Street.', 9.93106700, 78.11590320, 'Yes', 'Madurai', '625001', '2023-12-12 13:06:23', '2023-12-12 13:06:23', 'Active'),
(34, 68, 'Home', 'B2', 'ESI QUATROUS', '9600371842', 'ESI HOSPITAL', 9.94093110, 78.10400550, 'Yes', 'Thathaneri', '625018', '2023-12-17 20:09:06', '2023-12-17 20:09:06', 'Active'),
(35, 69, 'Home', '42/2 immanuvel combund', 'near ss colony old police station', '9677414909', '42/2immanuvel combund\nannsari nager 7th street\nmahoobupalayam\nmadurai', 9.91968020, 78.10102520, 'Yes', 'Madurai', '625016', '2023-12-20 14:45:24', '2024-03-11 08:58:45', 'Active'),
(36, 70, 'Home', '4/263', 'iyerbangalow', '7339447780', 'lake avenue street, chakra nager,E.B colony,Iyerbangalow', 9.96807870, 78.12995030, 'Yes', 'Madurai', '625016', '2024-01-05 10:01:33', '2024-01-05 10:54:53', 'Active'),
(37, 76, 'Home', 'Plot no 10, Ammai natchi agam', 'pudhukulam 2nd pit', '8870764652', 'Ganapathy street\npudhukulam 2nd pit', 9.89232490, 78.09353880, 'Yes', 'Madurai', '625003', '2024-01-05 15:16:54', '2024-01-05 15:16:54', 'Active'),
(38, 77, 'Home', 'shahin gouzar, 2a', 'surendran nagar main road', '8883354070', 'ponmeni', 20.27933060, 86.67469360, 'Yes', 'madurai', '625016', '2024-01-10 23:30:34', '2024-03-04 23:55:01', 'Active'),
(39, 6, '.', 'North Gate', 'S S Colony', NULL, 'No 7', NULL, NULL, 'No', 'Madurai', '625016', '2024-01-11 13:43:25', '2024-06-21 13:28:34', 'Active'),
(40, 79, 'Bye pass road', 'Meenakshi Fan House first floor,', 'Madurai', NULL, 'Kotak Mahindra Bank', NULL, NULL, 'No', 'Madurai', '625016', '2024-01-11 16:48:57', '2024-01-11 16:48:57', 'Active'),
(41, 78, 'Home', '12 mayadevar compound', 'kumaran salai kellethoopu', '9750162211', 'sellur madurai', 9.93041230, 78.12400520, 'Yes', 'Madurai', '625002', '2024-01-11 23:39:35', '2024-01-12 10:30:31', 'Active'),
(42, 82, 'Home', '121', 'muthuramanpatti', '6382599427', 'seena', 9.57535610, 77.95840000, 'Yes', 'madurai', '625001', '2024-01-18 10:58:47', '2024-01-18 10:59:22', 'Active'),
(43, 17, 'Home', '99,Raj nagar 1st cross street', 'Sammattipuram', '9199407578', 'Madurai', 9.92729650, 78.09854140, 'No', 'Madurai', '625016', '2024-02-08 10:27:47', '2024-03-12 18:28:05', 'Active'),
(44, 85, 'Home', 'No85-5', 'King Store and epg school', '9597211302', 'Pandian Nagar 2 nd street surveyor colony k pudur Madurai _625 007.', 9.95724890, 78.15029600, 'Yes', 'K.Pudur', '625007', '2024-02-08 12:59:09', '2024-02-08 12:59:09', 'Active'),
(45, 86, 'Home', '26/1', 'chinnakadai street south gate', '9629550767', 'periyar', 9.41471680, 77.92232260, 'Yes', 'madurai', '625001', '2024-02-09 06:29:05', '2024-02-09 06:29:05', 'Active'),
(46, 87, 'Home', '65', 'sourastra College Backside', '9344457794', 'Kurunji Nagar sourastra College Backside Gopalipuram', 9.91997640, 78.10098700, 'Yes', 'Madurai', '625016', '2024-02-09 12:03:28', '2024-02-22 21:14:22', 'Active'),
(47, 88, 'Home', '4/549', 'Ganesh nagar main road, Teachers colony,Anuppanadi, madurai -625009', '9489101773', 'M .SAKTHIVEL ILLAM. Ganesh nagar main road, Teachers colony,Anuppanadi, madurai -625009', 9.90446800, 78.14914200, 'Yes', 'anuppanadi', '625009', '2024-02-09 20:33:49', '2024-02-09 20:33:49', 'Active'),
(48, 91, 'Home', 'A3, First floor, Max Residency apartment', 'opp Balaji gas', '9443571836', 'Arunachalam Street, SS Colony North gate', 9.92708240, 78.09805950, 'Yes', 'Navalar Nagar', '625016', '2024-02-20 17:17:27', '2024-02-20 17:17:27', 'Active'),
(49, 92, 'Home', '50B', 'pillayakovil', 'teenamathi', '50b indhra nagar North streetputukara santhu  kamarajapuram madhurai 625009', 9.91174350, 78.12847050, 'Yes', 'Kamrajapuram', '625009', '2024-02-20 22:56:14', '2024-02-20 22:56:53', 'Active'),
(50, 93, 'Home', '63 IINTUC COLONY 3rd Street pethaniyapuram Madurai 16', 'Guru cinema 0p rood', '9894717743', '63 IINTUC COLONY 3rd Street pethaniyapuram Madurai 16', 9.93790330, 78.09305420, 'Yes', 'Madurai', '625016', '2024-02-21 07:52:08', '2024-02-21 07:52:08', 'Active'),
(51, 94, 'Home', '30', 'Sri Ram Nagar', '8870704835', 'Sri Ram Nagar', 9.92860300, 78.08871720, 'Yes', 'Madurai', '625016', '2024-02-21 13:16:15', '2024-02-21 13:16:15', 'Active'),
(52, 95, 'Home', '210 house no sabari garden', 'siruvali pirivu road', '9087818939', 'sabari garden siruvali pirivu road kumaram post madurai', 12.95411950, 80.13640330, 'Yes', 'madurai', '625018', '2024-02-22 06:22:14', '2024-02-22 06:22:14', 'Active'),
(53, 96, 'Home', '17A,ambigai nagar', 'muthupatti pudukulam2nd bit', '8072759857', 'Senthilmurugan T 17A,ambigai nagar pudukulam2nd bit', 9.92303760, 78.08644060, 'Yes', 'Madurai', '625003', '2024-02-23 10:28:53', '2024-02-23 10:30:02', 'Active'),
(54, 98, 'Home', '4, ourladyschoolstreet, duraisamynagar,', 'near ourladyschool', '9942361554', 'ourladyschool street duraisamynagar', 9.91854660, 78.08747160, 'Yes', 'madurai', '625016', '2024-02-25 10:15:22', '2024-03-02 11:17:38', 'Active'),
(55, 99, 'Home', 'Door No 21 E, Kandhan Servai 5th South Street', 'Madakulam', '9003453255', 'Madakulam', 9.91037150, 78.08520110, 'Yes', 'Madurai', '625003', '2024-02-28 16:05:06', '2024-03-13 07:18:33', 'Active'),
(56, 101, 'Home', '58/2', 'Surya hotel', '9994134428', 'Bharathiyar 2nd street ss colony Madurai', 9.92089510, 78.09987600, 'Yes', 'Madurai', '625016', '2024-02-29 00:15:16', '2024-03-02 21:34:50', 'Active'),
(57, 104, 'Home', 'p6', 'aparjit apartment', '9791420004', 'p6 aparjit apartment ponmeni madurai', 9.92514040, 78.09068680, 'Yes', 'Madurai', '625016', '2024-03-01 17:02:47', '2024-03-01 17:02:47', 'Active'),
(58, 106, 'Home', '2/928, Ayyappa Nagar 4th Street, othakadai, Madurai', 'Ayyappa Nagar 4th Street, othakadai,', '+918838906', 'Ayyappa Nagar 4th Street, othakadai, Madurai', 9.96235170, 78.19117590, 'Yes', 'othakadai, Madurai', '625107', '2024-03-05 08:17:00', '2024-03-05 08:17:00', 'Active'),
(59, 109, 'Home', '52, KNA selvameena illam', 'Indian bank', '9095808095', 'kovalanagar 1 street, kannagi street', 9.89907390, 78.10046110, 'Yes', 'Alagappan Nagar', '625003', '2024-03-10 00:01:41', '2024-03-10 16:12:33', 'Active'),
(60, 110, 'Home', '26 PERIYAVAR STREET SV NAGAR SS COLONY', 'NEAR BY PASS', '9443138126', 'ss colony', 9.92428730, 78.09625990, 'Yes', 'Madurai', '625016', '2024-03-10 15:10:05', '2024-03-10 15:11:40', 'Active'),
(61, 111, 'Home', '53', 'Yadava', '9244151513', '53,NSK 1STREET BHARATYAR ROAD LAST JAIHINDPURAM MADURAI-11', 9.89980630, 78.11265330, 'No', 'Solai Alagupuram', '625011', '2024-03-12 18:11:45', '2024-03-12 19:25:08', 'Active'),
(62, 111, 'Home', '53', 'Yadava kailyanam', '9244151513', 'bharathiyar road jaihindpuram madurai', 9.89980630, 78.11265330, 'No', 'Solai Alagupuram', '625011', '2024-03-12 18:15:05', '2024-03-12 19:25:08', 'Active'),
(63, 111, 'Home', '53', '...', '9244151513', 'nsk 1st bharathiyar road last madurai 11', 9.89980630, 78.11265330, 'No', 'Solai Alagupuram', '625011', '2024-03-12 18:25:28', '2024-03-12 19:25:08', 'Active'),
(64, 17, 'Home', 'No.7', 'North Gate', '9199407578', 'DD colony', 9.92732610, 78.09871560, 'No', 'Madurai', '625016', '2024-03-12 18:26:38', '2024-03-12 18:28:05', 'Active'),
(65, 17, 'Home', 'No:8', 'SS colony', '9199407578', 'North Gate', 9.92732610, 78.09871560, 'Yes', 'Madurai', '625016', '2024-03-12 18:28:05', '2024-03-12 18:28:05', 'Active'),
(66, 111, 'Home', 'No:53', 'NSK 1STREET', '9244151513', 'bharathiyar road jaihindpuram', 9.89980970, 78.11265290, 'No', 'Madurai', '625011', '2024-03-12 19:13:54', '2024-03-12 19:25:08', 'Active'),
(67, 112, 'Home', 'No:53', 'NSK 1ST STREET', '9244151513', 'bharathiyar road last jaihindipuram', 9.89980500, 78.11265090, 'Yes', 'madurai', '625011', '2024-03-12 19:16:37', '2024-03-12 19:33:16', 'Active'),
(68, 111, 'Home', 'No:53', 'NSK 1street', '9244151513', 'bharathiyar road last jaihindpuram', 9.89980970, 78.11265290, 'Yes', 'Madurai', '625011', '2024-03-12 19:18:59', '2024-03-12 19:25:08', 'Active'),
(69, 114, 'Home', 'c13/9 housing board', 'holyfamily school', '7094517747', 'C13/9 housing board\nMelaponnagaram5th street\nArapalayam\nMadurai - 16', 9.93173340, 78.10489400, 'Yes', 'Madurai', '625016', '2024-03-13 14:59:31', '2024-03-13 15:02:39', 'Active'),
(70, 116, 'Home', 'B7, Subiksha apartment', 'Near Raj Hospital', '9994810488', 'Duraisamy nagar, Bypass road', 9.91572650, 78.08955380, 'Yes', 'Madurai', '625016', '2024-03-14 09:55:05', '2024-03-14 09:55:05', 'Active'),
(71, 118, 'Home', '89 sonaiya kovil second Street', 'jeeva nagar', '8248189732', 'jeeva nagar', 9.89824280, 78.10565930, 'Yes', 'Madurai', '625011', '2024-03-16 20:39:06', '2024-03-16 20:39:06', 'Active'),
(72, 122, 'Home', 'plat no 5', 'saravana store', '8838724531', 'puthukulam 2nd pit ambikai nagar muthupatti', 9.89229840, 78.09031710, 'Yes', 'Madurai', '625003', '2024-03-20 12:36:52', '2024-03-20 12:40:58', 'Active'),
(73, 122, 'Home', 'plat no 5', 'Saravanan selvarathanam', '8838724531', 'puthukulam 2nd pit ambikai muthupatti', 9.89207960, 78.09038250, 'No', 'Madurai', '625005', '2024-03-20 12:38:06', '2024-03-20 12:40:58', 'Active'),
(74, 125, 'Home', '65,', NULL, NULL, 'Vinayagar temple', NULL, NULL, 'No', 'Nadumbalam', '625019', '2024-03-27 10:51:18', '2024-03-27 10:51:18', 'Active'),
(75, 126, 'Chennai', NULL, NULL, NULL, '65', NULL, NULL, 'No', 'Alandur', '625011', '2024-03-27 11:10:45', '2024-03-27 11:10:45', 'Active'),
(76, 127, 'Home', '91', NULL, NULL, '65', NULL, NULL, 'No', 'Alandur', '625011', '2024-03-27 15:26:53', '2024-03-27 15:28:03', 'Active'),
(77, 140, 'Home', 'Test', 'Test', '9924165042', 'Test address to test', 21.63200150, 69.61912040, 'Yes', 'Porbandar', '360575', '2024-04-03 11:46:27', '2024-04-03 11:46:27', 'Active'),
(78, 144, 'Home', 'Test', 'test', '9924165041', 'test address test', 21.63205950, 69.61909520, 'Yes', 'Porbandar', '360575', '2024-04-05 19:38:31', '2024-04-05 19:38:34', 'Active'),
(79, 155, 'Home', 'Test', 'test', '9924165043', 'test address test', 21.63199710, 69.61911870, 'No', 'Porbandar', '625002', '2024-04-05 19:41:48', '2024-04-09 16:18:34', 'Active'),
(80, 155, 'Home', 'New Test', 'test', '9924165043', 'test address to test', 21.63199730, 69.61911800, 'Yes', 'Porbandar', '625011', '2024-04-08 17:00:21', '2024-04-09 16:18:34', 'Active'),
(81, 156, 'Home', 'Test', 'test', '9924165044', 'test address to test', 21.63199700, 69.61911870, 'Yes', 'Porbandar', '625011', '2024-04-09 16:22:06', '2024-04-09 16:23:47', 'Active'),
(82, 157, 'Home', 'Test', 'test', '9033073043', 'test address to test', 21.63206220, 69.61909670, 'Yes', 'Porbandar', '625011', '2024-04-10 14:17:46', '2024-04-10 14:18:53', 'Active'),
(83, 158, 'Home', 'Test', 'test', '9033073045', 'test address to test', 21.63199820, 69.61911530, 'Yes', 'Porbandar', '625011', '2024-04-10 15:32:50', '2024-04-10 16:14:09', 'Active'),
(84, 159, 'Home', '65', 'murugan temple', '9952073789', 'South Street', 13.00027210, 80.20458140, 'Yes', 'jaihindpuram', '625011', '2024-04-10 18:32:03', '2024-04-10 18:38:50', 'Active'),
(85, 9, 'Home', '65', 'near temple', '9638527410', 'South Street', 13.00026850, 80.20458430, 'Yes', 'madurai', '625011', '2024-04-11 16:52:13', '2024-04-11 16:53:57', 'Active'),
(86, 161, 'Home', '99', 'Raj nagar', '9940757877', 'Sammattipuram', 9.92732120, 78.09856530, 'Yes', 'Madurai', '625016', '2024-04-17 12:22:03', '2024-04-17 12:22:03', 'Active'),
(87, 128, 'Home', '12', 'ICICI', '9176860274', 'Town Area', 13.00027470, 80.20457960, 'Yes', 'Madurai', '625001', '2024-05-08 16:43:55', '2024-05-08 16:53:53', 'Active'),
(88, 166, 'Work', '65', 'South Street', '9345445421', 'Anupanadi', 10.52068590, 79.63145310, 'Yes', 'Thiruthuraipoondi', '625703', '2024-05-08 17:34:02', '2024-05-08 18:14:38', 'Active'),
(89, 167, 'Home', '65', 'Sivan koivil street', '6383614062', 'Nafumbalam', 10.52068400, 79.63145160, 'Yes', 'Nadubalam', '625001', '2024-05-08 18:23:06', '2024-05-22 15:07:39', 'Active'),
(90, 168, 'Home', 'Test', 'Test', '9033073048', 'testing to test address', 21.63206900, 69.61910780, 'Yes', 'Porbandar', '625011', '2024-05-09 17:32:13', '2024-05-09 17:33:27', 'Active'),
(91, 169, 'Work', '65', 'South Street', '7826041579', 'Town area', 10.52068280, 79.63145270, 'Yes', 'Nadubalam', '625001', '2024-05-10 10:33:58', '2024-05-10 10:36:03', 'Active'),
(92, 170, 'Home', 'Test', 'test', '9033073047', 'test address for testing', 21.63200830, 69.61911310, 'Yes', 'Porbandar', '625011', '2024-05-10 16:48:41', '2024-05-10 17:34:54', 'Active'),
(93, 172, 'Work', '43', 'South Street', '3692581447', 'Town area', 10.52068080, 79.63144920, 'Yes', 'Nadubalam', '625001', '2024-05-13 15:17:31', '2024-05-13 15:17:31', 'Active'),
(94, 10, 'Work', '65', 'North Street', '1234567890', 'Town area', 10.52068570, 79.63145310, 'Yes', 'Nadubalam', '625001', '2024-05-13 17:25:46', '2024-05-13 17:25:46', 'Active'),
(95, 173, 'Home', '32', 'North Street', '9685743210', 'Town area', 10.52068490, 79.63145510, 'Yes', 'Madurai', '625001', '2024-05-13 18:11:35', '2024-05-13 18:11:35', 'Active'),
(96, 174, 'Work', '92', 'North Street', '2345678900', 'Town area', 10.52068650, 79.63145210, 'Yes', 'Nadubalam', '625001', '2024-05-14 10:50:17', '2024-05-14 11:40:22', 'Active'),
(97, 175, 'Home', '75', 'Bank pnb', '1235648790', 'address', 10.73316790, 78.68436260, 'Yes', 'chennai', '625001', '2024-05-14 10:59:56', '2024-05-14 11:35:23', 'Active'),
(98, 177, 'Home', 'Test', 'test', '9033073050', 'testing to test', 21.63204850, 69.61912320, 'Yes', 'Porbandar', '625011', '2024-05-14 12:40:49', '2024-05-18 12:53:22', 'Active'),
(99, 179, 'Work', '95', 'Murugan temple', '6938527410', 'Town area', 10.52063970, 79.63143720, 'Yes', 'Nadubalam', '625001', '2024-05-16 11:42:40', '2024-05-16 11:42:40', 'Active'),
(100, 180, 'Home', '65', 'Near temple', '3214569870', 'Town area', 10.51570380, 79.62898050, 'Yes', 'Nadubalam', '625001', '2024-05-16 16:05:08', '2024-05-16 16:10:18', 'Active'),
(101, 181, 'Work', '92', 'murugan temple', '9638635274', 'Town area', 10.51570380, 79.62898050, 'Yes', 'Nadubalam', '625001', '2024-05-16 16:47:09', '2024-05-16 16:50:27', 'Active'),
(102, 182, 'Work', '55', 'route', '5236147890', 'address', 10.73319230, 78.68436550, 'Yes', 'Tiruchirappalli', '625001', '2024-05-17 11:15:59', '2024-05-17 19:29:38', 'Active'),
(103, 183, 'Work', '89', 'North Street', '9512369580', 'Town area', 10.52069100, 79.63144990, 'Yes', 'Nadubalam', '625001', '2024-05-17 15:41:05', '2024-05-17 15:47:16', 'Active'),
(104, 184, 'Home', '65', 'North Street', '9512365480', 'Town area', 10.52069100, 79.63144990, 'Yes', 'Nadubalam', '625001', '2024-05-17 16:24:18', '2024-05-17 19:39:47', 'Active'),
(105, 185, 'Home', '98', 'Temple', '6547890321', 'Town area', 10.52068890, 79.63145030, 'Yes', 'Nadubalam', '625011', '2024-05-17 19:46:05', '2024-05-18 09:13:09', 'Active'),
(106, 186, 'Home', '65,', 'Temple Street', '6985321447', 'Town area', 10.52068800, 79.63145190, 'Yes', 'Nadubalam', '625011', '2024-05-18 09:34:45', '2024-05-18 09:35:15', 'Active'),
(107, 187, 'Home', 'bdbd', 'dhdhd', '7010970099', 'shdhd', 13.00027790, 80.20458660, 'Yes', 'Chennai', '625001', '2024-05-21 12:59:11', '2024-05-21 17:25:57', 'Active'),
(108, 188, 'Home', '87', 'Murugan temple', '8976543210', 'Town area', 10.52068710, 79.63145150, 'Yes', 'Nadubalam', '625011', '2024-05-21 14:55:03', '2024-05-21 15:13:17', 'Active'),
(109, 189, 'Work', '57', 'temple', '8765432190', 'Town area', 10.52068360, 79.63144350, 'Yes', 'Nadubalam', '625001', '2024-05-21 16:43:18', '2024-05-21 17:54:25', 'Active'),
(110, 190, 'Home', 'bdhd', 'bdhd', '6134257896', 'bdhdj', 13.00026310, 80.20458520, 'Yes', 'Chennai', '625001', '2024-05-21 17:27:17', '2024-05-21 17:37:57', 'Active'),
(111, 191, 'Work', 'ge', 'dvd', '2518486434', 'address', 13.00026490, 80.20458210, 'Yes', 'Chennai', '625011', '2024-05-21 17:56:25', '2024-05-21 18:01:14', 'Active'),
(112, 192, 'Work', '93', 'Temple', '8563290741', 'Town area', 10.52067860, 79.63145100, 'Yes', 'Nadubalam', '625001', '2024-05-21 18:02:23', '2024-05-21 18:03:10', 'Active'),
(113, 193, 'Work', '55', 'gsh', '3698521478', 'bdhdudb', 13.00027270, 80.20457800, 'Yes', 'Chennai', '625011', '2024-05-21 18:02:37', '2024-05-21 18:03:52', 'Active'),
(114, 194, 'Work', 'vd', 'vd', '3256981470', 'fgjsid', 13.00027190, 80.20458470, 'Yes', 'Chennai', '625001', '2024-05-21 18:08:03', '2024-05-21 18:08:17', 'Active'),
(115, 195, 'Home', 'Test', 'test', '9033073044', 'test address test', 21.63227740, 69.61910840, 'Yes', 'Porbandar', '625011', '2024-05-21 18:17:44', '2024-05-21 18:18:00', 'Active'),
(116, 196, 'Work', '55', 'land', '2580147369', 'address', 13.00027050, 80.20458200, 'Yes', 'Chennai', '625011', '2024-05-22 10:19:15', '2024-05-22 10:27:43', 'Active'),
(117, 197, 'Home', '22', 'tt', '3571592684', 'tttttt', 13.00027890, 80.20461390, 'Yes', 'Chennai', '625011', '2024-05-22 10:30:52', '2024-05-22 12:53:55', 'Active'),
(118, 198, 'Work', '98', 'Temple town', '7896543210', 'Town area, madurai', 10.52068640, 79.63145370, 'Yes', 'Nadubalam', '625001', '2024-05-22 15:00:44', '2024-05-22 15:03:16', 'Active'),
(119, 16, 'Home', '65', NULL, NULL, 'South street', NULL, NULL, 'No', 'Madurai', '600016', '2024-06-04 12:32:32', '2024-06-04 12:32:32', 'Active'),
(120, 199, 'Home', 'south', 'near temple', '9056237890', 'Thirumangalam', 10.52059590, 79.63144660, 'Yes', 'Nadubalam', '625001', '2024-06-21 15:38:21', '2024-06-21 15:40:16', 'Active'),
(121, 200, 'Home', '65', 'near temple', '9809609680', 'Thirumangalam', 10.52059590, 79.63144660, 'Yes', 'Nadubalam', '625001', '2024-06-21 15:47:44', '2024-06-21 15:47:44', 'Active'),
(122, 201, 'Home', '65', 'near temple', '9634596800', 'Thirumangalam', 10.51958770, 79.63108620, 'Yes', 'Nadubalam', '625001', '2024-06-24 11:10:49', '2024-06-24 11:10:49', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'பெ. மணியரசன்', 'Active', '2022-02-11 02:00:14', '2022-02-11 02:00:14'),
(2, 'கி. வெங்கட்ராமன்', 'Active', '2022-02-11 02:00:23', '2022-02-11 02:00:23'),
(3, 'க. அருணபாரதி', 'Active', '2022-02-11 02:00:33', '2022-02-11 02:00:33'),
(4, 'கதிர்நிலவன்', 'Active', '2022-02-11 02:00:41', '2022-02-11 02:00:41'),
(5, 'கவிபாஸ்கர்', 'Active', '2022-02-11 02:00:48', '2022-02-11 02:00:48'),
(6, 'முழுநிலவன்', 'Active', '2022-02-11 02:00:55', '2022-02-11 02:00:55'),
(7, 'தமிழ்த்தேசியப் பேரியக்கம்', 'Active', '2022-02-11 02:01:03', '2022-02-11 02:01:03'),
(8, 'கீழடிவாணன்', 'Active', '2022-07-28 22:16:06', '2022-07-28 22:16:06'),
(9, 'ஆ. குபேரன்', 'Active', '2023-10-18 15:50:11', '2023-10-18 16:02:03'),
(10, 'முனைவர் வே. சுப்பிரமணிய சிவா', 'Active', '2023-10-18 15:51:40', '2023-10-18 15:51:40'),
(11, 'அண்ணல் தங்கோ', 'Active', '2023-10-18 15:51:56', '2023-10-18 15:51:56'),
(12, 'நலங்கிள்ளி', 'Active', '2023-10-18 15:52:15', '2023-10-18 15:52:15'),
(13, 'தவத்திரு குன்றக்குடி அடிகளார்', 'Active', '2023-10-18 15:52:55', '2023-10-18 15:52:55'),
(14, 'ம.பொ.சிவஞானம்', 'Active', '2023-10-18 15:53:23', '2023-10-27 10:30:27'),
(15, 'சு. உமா மகேசுவரி', 'Active', '2023-10-18 15:53:46', '2023-12-23 21:11:15'),
(16, 'தொகுப்பு', 'Active', '2023-10-18 15:54:01', '2023-10-18 15:54:01'),
(17, 'டாக்டர் மா. இராசமாணிக்கனார்', 'Active', '2023-10-18 15:54:31', '2023-10-18 15:54:31'),
(18, 'தஞ்சை அ. இராமமூர்த்தி', 'Active', '2023-10-18 15:55:12', '2023-11-16 02:47:05'),
(19, 'ரா.பி. சேதுப்பிள்ளை', 'Active', '2023-10-18 15:55:36', '2023-10-18 15:55:36'),
(20, 'இலரா. மோகன்', 'Active', '2023-10-18 15:55:50', '2023-10-18 15:55:50'),
(21, 'கா. சு. பிள்ளை', 'Active', '2023-10-18 15:56:09', '2023-10-18 15:56:09'),
(22, 'தேவநேயப் பாவாணர்', 'Active', '2023-10-18 15:56:28', '2023-10-28 11:23:59'),
(23, 'பத்மஸ்ரீ ஔவை டி.கே. சண்முகம்', 'Active', '2023-10-18 15:56:49', '2024-01-11 16:49:46'),
(24, 'பேராசிரியர் நா. வானமாமலை', 'Active', '2023-10-18 15:57:30', '2023-10-18 15:57:30'),
(25, 'சுப. உதயகுமாரன்', 'Active', '2023-10-18 15:57:53', '2023-12-23 21:13:33'),
(26, 'மறைமலை அடிகளார்', 'Active', '2023-10-18 15:59:36', '2023-10-28 15:51:59'),
(27, 'முனைவர் பி. தமிழகன்', 'Active', '2023-10-18 16:00:15', '2023-10-18 16:00:15'),
(28, 'பேராசிரியர் அ. ராமசாமி', 'Active', '2023-10-18 16:01:02', '2023-10-18 16:01:02'),
(29, 'ராசின்', 'Active', '2023-10-18 16:01:13', '2023-10-31 19:24:35'),
(30, 'கவி கா.மு. ஷெரீப்', 'Active', '2023-10-18 16:01:29', '2024-01-07 08:21:30'),
(31, 'புலவர் செ. இராசு', 'Active', '2023-10-18 16:01:44', '2023-10-18 16:01:44'),
(32, 'சாலஸ் அன்ரனி சிறப்பு படையணி', 'Active', '2023-10-18 16:03:45', '2023-10-18 16:03:45'),
(33, 'கணி ஆதன்', 'Active', '2023-10-18 16:03:55', '2023-10-18 16:03:55'),
(34, 'தூயவன்', 'Active', '2023-10-18 16:04:06', '2023-10-18 16:04:06'),
(35, 'அன்ரன் பாலசிங்கம்', 'Active', '2023-10-18 16:04:28', '2023-10-18 16:04:28'),
(36, 'லெப். மாலதி படையணி', 'Active', '2023-10-18 16:04:51', '2023-10-18 16:08:02'),
(37, 'தமிழீழம் காப்பகம்', 'Active', '2023-10-18 16:05:09', '2023-10-18 16:05:09'),
(38, 'வ. கௌதமன்', 'Active', '2023-10-19 10:53:43', '2023-10-19 10:53:43'),
(39, 'பிரகாஷ் பாரதி', 'Active', '2023-10-27 11:06:16', '2023-12-23 21:11:49'),
(40, 'பேராசிரியர் முனைவர் பி. யோகீசுவரன்', 'Active', '2023-10-28 15:43:14', '2023-10-28 15:43:14'),
(41, 'அமரந்த்தா', 'Active', '2024-01-02 10:39:49', '2024-01-02 10:39:49'),
(42, 'க. குணராசா', 'Active', '2024-01-17 12:11:43', '2024-01-17 12:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `button_text` varchar(191) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `image`, `url`, `button_text`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Madurai Kadai', NULL, 'WhatsApp Image 2023-10-19 at 5.24.47 PM-1894205043-10_19_2023_06_58_pm.jpeg', NULL, NULL, 1, 'Active', '2023-01-20 11:44:36', '2023-10-19 18:58:04'),
(2, NULL, NULL, 'flat-supermarket-twitch-banner_23-2149379618-2137189076-01_20_2023_11_44_am.webp', NULL, NULL, 2, 'Inactive', '2023-01-20 11:44:45', '2023-09-23 17:33:49'),
(3, 'அந்த கடை இந்த கடை இல்ல, இது நம்ம மதுரை கடை.', 'Free Door Delivery . Contact No: 80125 55950', 'WhatsApp Image 2023-10-19 at 5.24.47 PM-2027210398-10_19_2023_06_23_pm.jpeg', NULL, NULL, 1, 'Active', '2023-01-20 11:44:53', '2023-10-19 18:23:01'),
(4, 'Nature Products', 'The Nature Farmer Pure Coconut Oil 500ml', 'H.Picture39-2016061170-07_03_2023_05_00_pm.png', NULL, NULL, 1, 'Active', '2023-07-03 17:00:59', '2023-07-03 17:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price_id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `offer_price` double NOT NULL DEFAULT 0,
  `offer_expiry_date` date DEFAULT NULL,
  `weight` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `total_weight` varchar(255) NOT NULL,
  `gst_percent` double NOT NULL DEFAULT 0,
  `gst_amount` double NOT NULL DEFAULT 0,
  `sgst_percent` double NOT NULL DEFAULT 0,
  `sgst_amount` double NOT NULL DEFAULT 0,
  `cgst_percent` double NOT NULL DEFAULT 0,
  `cgst_amount` double NOT NULL DEFAULT 0,
  `igst_percent` double NOT NULL DEFAULT 0,
  `igst_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Sweets', 'Sweets-2842', 'IMG-20221017-WA0051-308978644-10_09_2024_01_03_pm.jpg', 'Active', '2024-10-09 07:33:57', '2024-10-09 07:33:57', 'IMG-20221017-WA0051-2043471186-10_09_2024_01_03_pm.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `home` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `home`, `status`, `created_at`, `updated_at`) VALUES
(1, 'India', 'Yes', 'Active', '2022-05-15 20:20:56', '2022-05-15 20:20:56'),
(2, 'Malaysia', 'No', 'Active', '2022-06-03 21:28:40', '2022-06-03 21:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_excluded` enum('Yes','No') NOT NULL DEFAULT 'No',
  `gst` varchar(191) NOT NULL,
  `retails` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `shipping_excluded`, `gst`, `retails`, `created_at`, `updated_at`) VALUES
(1, 3, 'Yes', '0', 'No', '2023-02-08 10:29:08', '2023-03-24 13:33:50'),
(2, 7, 'No', '0', 'No', '2023-03-24 13:14:48', '2023-03-24 13:14:48'),
(3, 21, 'No', '0', 'No', '2023-05-11 16:15:29', '2023-05-11 16:15:29'),
(4, 4, 'No', '0', 'No', '2023-07-04 16:06:23', '2023-07-04 16:06:23'),
(5, 33, 'No', '0', 'No', '2023-10-19 19:05:11', '2023-10-19 19:05:11'),
(6, 34, 'No', '0', 'No', '2023-10-26 19:17:18', '2023-10-26 19:17:18'),
(7, 24, 'No', '0', 'No', '2023-10-26 19:17:39', '2023-10-26 19:17:49'),
(8, 14, 'No', '0', 'No', '2023-10-26 19:18:18', '2023-10-26 19:18:18'),
(9, 25, 'No', '0', 'No', '2023-10-27 15:08:56', '2023-10-27 15:08:56'),
(10, 37, 'No', '0', 'No', '2023-11-08 20:12:23', '2023-11-08 20:12:23'),
(11, 68, 'No', '0', 'No', '2023-12-18 11:35:32', '2023-12-18 11:35:32'),
(12, 117, 'No', '0', 'No', '2024-03-16 17:42:11', '2024-03-16 17:42:11'),
(13, 167, 'No', '0', 'No', '2024-05-08 19:29:25', '2024-05-08 19:29:25'),
(14, 172, 'No', '0', 'No', '2024-05-13 15:31:12', '2024-05-13 15:31:12'),
(15, 168, 'No', '0', 'No', '2024-05-13 15:45:59', '2024-05-13 15:45:59'),
(16, 198, 'No', '0', 'No', '2024-05-22 15:20:49', '2024-05-22 15:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `cust_required_product`
--

CREATE TABLE `cust_required_product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `required_product` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cust_required_product`
--

INSERT INTO `cust_required_product` (`id`, `user_id`, `required_product`, `created_at`, `updated_at`) VALUES
(1, 155, 'rava', '2024-04-09 12:29:37', '2024-04-09 16:18:44'),
(2, 128, 'Wheat rice, Fruits', '2024-04-09 13:06:27', '2024-04-09 13:06:27'),
(3, 156, 'Wheat rice, Fruits', '2024-04-09 16:22:46', '2024-04-09 16:23:24'),
(4, 157, 'rava', '2024-04-10 14:18:27', '2024-04-10 14:18:27'),
(5, 23, 'thinai, kuthiraivali,ragi flour', '2024-04-10 15:32:19', '2024-04-11 16:56:27'),
(6, 158, 'rava', '2024-04-10 15:33:27', '2024-04-10 16:14:31'),
(7, 9, 'jaggery,\noil,\nsugar', '2024-04-11 16:52:19', '2024-04-11 16:54:06'),
(8, 6, 'Tresseme shampoos', '2024-04-18 10:22:13', '2024-04-18 10:22:13'),
(9, 167, 'Rock salt', '2024-05-08 19:39:19', '2024-05-08 19:39:19'),
(10, 127, 'Wheat rice, Fruits', '2024-05-10 19:00:07', '2024-05-10 19:00:07'),
(11, 171, 'Wheat rice, Fruits', '2024-05-10 19:02:33', '2024-05-10 19:02:33'),
(12, 146, 'Wheat rice, Fruits', '2024-05-14 13:17:43', '2024-05-14 13:17:43'),
(13, 178, 'Wheat rice, Fruits', '2024-05-14 13:27:38', '2024-05-14 13:27:38');

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
(1, 625001, 'Town Area', 0, 'Active', '2023-01-12 16:15:56', '2023-10-30 13:26:54'),
(2, 625402, 'Samayanallur', 0, 'Active', '2023-01-21 18:04:10', '2023-10-30 13:26:59'),
(3, 625016, 'Bye Pass Road', 0, 'Active', '2023-04-17 16:45:10', '2023-10-30 13:27:03'),
(4, 625019, 'Nagamalai', 0, 'Active', '2023-04-18 11:30:23', '2023-10-30 13:27:11'),
(5, 625018, 'Vilangudi', 0, 'Active', '2023-04-21 14:48:05', '2023-10-30 13:26:04'),
(6, 625003, 'Palanganatham', 0, 'Active', '2023-05-01 17:27:51', '2023-10-30 13:27:26'),
(7, 625514, 'Chekkanurani', 0, 'Active', '2023-05-10 13:34:18', '2023-12-01 16:43:54'),
(8, 625703, 'Peraiyur', 0, 'Active', '2023-10-30 13:29:17', '2023-12-01 16:43:43'),
(9, 625011, 'Jaihindpuram', 0, 'Active', '2024-03-12 19:24:46', '2024-03-12 19:24:46');

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
(132, 5, 'monday', '2023-10-30 13:26:04', '2023-10-30 13:26:04'),
(133, 5, 'tuesday', '2023-10-30 13:26:04', '2023-10-30 13:26:04'),
(134, 5, 'wednesday', '2023-10-30 13:26:04', '2023-10-30 13:26:04'),
(135, 5, 'thursday', '2023-10-30 13:26:04', '2023-10-30 13:26:04'),
(136, 5, 'friday', '2023-10-30 13:26:04', '2023-10-30 13:26:04'),
(137, 5, 'saturday', '2023-10-30 13:26:04', '2023-10-30 13:26:04'),
(156, 1, 'sunday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(157, 1, 'monday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(158, 1, 'tuesday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(159, 1, 'wednesday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(160, 1, 'thursday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(161, 1, 'friday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(162, 1, 'saturday', '2023-10-30 13:26:54', '2023-10-30 13:26:54'),
(163, 2, 'sunday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(164, 2, 'monday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(165, 2, 'tuesday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(166, 2, 'wednesday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(167, 2, 'thursday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(168, 2, 'friday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(169, 2, 'saturday', '2023-10-30 13:26:59', '2023-10-30 13:26:59'),
(170, 3, 'sunday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(171, 3, 'monday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(172, 3, 'tuesday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(173, 3, 'wednesday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(174, 3, 'thursday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(175, 3, 'friday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(176, 3, 'saturday', '2023-10-30 13:27:03', '2023-10-30 13:27:03'),
(177, 4, 'sunday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(178, 4, 'monday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(179, 4, 'tuesday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(180, 4, 'wednesday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(181, 4, 'thursday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(182, 4, 'friday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(183, 4, 'saturday', '2023-10-30 13:27:11', '2023-10-30 13:27:11'),
(184, 6, 'sunday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(185, 6, 'monday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(186, 6, 'tuesday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(187, 6, 'wednesday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(188, 6, 'thursday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(189, 6, 'friday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(190, 6, 'saturday', '2023-10-30 13:27:26', '2023-10-30 13:27:26'),
(197, 8, 'tuesday', '2023-12-01 16:43:43', '2023-12-01 16:43:43'),
(198, 8, 'saturday', '2023-12-01 16:43:43', '2023-12-01 16:43:43'),
(199, 7, 'monday', '2023-12-01 16:43:54', '2023-12-01 16:43:54'),
(200, 7, 'friday', '2023-12-01 16:43:54', '2023-12-01 16:43:54'),
(201, 9, 'monday', '2024-03-12 19:24:46', '2024-03-12 19:24:46'),
(202, 9, 'tuesday', '2024-03-12 19:24:46', '2024-03-12 19:24:46'),
(203, 9, 'wednwsday', '2024-03-12 19:24:46', '2024-03-12 19:24:46'),
(204, 9, 'thursday', '2024-03-12 19:24:46', '2024-03-12 19:24:46'),
(205, 9, 'friday', '2024-03-12 19:24:46', '2024-03-12 19:24:46'),
(206, 9, 'saturday', '2024-03-12 19:24:46', '2024-03-12 19:24:46');

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
(5, 3, 'Monday', '10:00:00', '18:00:00', 10, 'Active', '2023-04-21 14:48:51', '2023-10-30 13:32:35', 'No'),
(6, 3, 'Tuesday', '10:00:00', '18:00:00', 10, 'Active', '2023-04-27 17:27:39', '2023-04-27 18:07:46', 'No'),
(7, 3, 'Friday', '10:00:00', '18:00:00', 10, 'Active', '2023-04-27 17:27:59', '2023-10-30 13:32:45', 'No'),
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
(19, 1, 'Saturday', '10:00:00', '18:00:00', 200, 'Active', '2023-04-27 18:29:11', '2023-07-04 16:18:48', 'No'),
(20, 6, 'Tuesday', '10:00:00', '18:00:00', 10, 'Active', '2023-04-27 19:31:50', '2023-10-30 13:34:04', 'No'),
(21, 6, 'Wednesday', '10:00:00', '19:00:00', 10, 'Active', '2023-04-27 19:33:24', '2023-10-30 13:34:22', 'No'),
(22, 6, 'Monday', '10:00:00', '18:00:00', 1, 'Active', '2023-05-05 10:17:53', '2023-10-30 13:33:48', 'No'),
(23, 6, 'Thursday', '10:00:00', '18:00:00', 2, 'Active', '2023-05-10 13:48:35', '2023-10-30 13:34:42', 'No'),
(24, 6, 'Friday', '10:00:00', '18:00:00', 2, 'Active', '2023-05-10 13:55:47', '2023-10-30 13:34:56', 'No'),
(25, 6, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:35:14', '2023-10-30 13:35:14', 'No'),
(26, 5, 'Monday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:36:08', '2023-10-30 13:36:08', 'No'),
(27, 5, 'Tuesday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:36:19', '2023-10-30 13:36:19', 'No'),
(28, 5, 'Wednesday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:36:38', '2023-10-30 13:36:38', 'No'),
(29, 5, 'Thursday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:36:51', '2023-10-30 13:36:51', 'No'),
(30, 5, 'Friday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:37:02', '2023-10-30 13:37:02', 'No'),
(31, 5, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:38:53', '2023-10-30 13:38:53', 'No'),
(32, 2, 'Monday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:39:30', '2023-10-30 13:39:30', 'No'),
(33, 2, 'Tuesday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:39:42', '2023-10-30 13:39:42', 'No'),
(34, 2, 'Wednesday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:39:58', '2023-10-30 13:39:58', 'No'),
(35, 2, 'Thursday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:40:16', '2023-10-30 13:40:16', 'No'),
(36, 2, 'Friday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:40:33', '2023-10-30 13:40:33', 'No'),
(37, 2, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:40:44', '2023-10-30 13:40:44', 'No'),
(38, 8, 'Tuesday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:42:02', '2023-10-30 13:42:02', 'No'),
(39, 8, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:42:13', '2023-10-30 13:42:13', 'No'),
(40, 7, 'Monday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:42:28', '2023-10-30 13:42:28', 'No'),
(41, 7, 'Friday', '10:00:00', '18:00:00', 20, 'Active', '2023-10-30 13:42:39', '2023-10-30 13:42:39', 'No'),
(42, 9, 'Monday', '10:00:00', '18:00:00', 100, 'Active', '2024-03-12 19:26:03', '2024-03-12 19:26:03', 'No'),
(43, 9, 'Tuesday', '10:00:00', '18:00:00', 20, 'Active', '2024-03-12 19:26:17', '2024-03-12 19:26:17', 'No'),
(44, 9, 'Wednesday', '10:00:00', '18:00:00', 20, 'Active', '2024-03-12 19:26:30', '2024-03-12 19:26:30', 'No'),
(45, 9, 'Thursday', '10:00:00', '18:00:00', 20, 'Active', '2024-03-12 19:26:48', '2024-03-12 19:26:48', 'No'),
(46, 9, 'Friday', '10:00:00', '18:00:00', 20, 'Active', '2024-03-12 19:26:57', '2024-03-12 19:26:57', 'No'),
(47, 9, 'Saturday', '10:00:00', '18:00:00', 20, 'Active', '2024-03-12 19:27:10', '2024-03-12 19:27:10', 'No');

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
(1, 2, 'Android', 'd_CexnXaQwmAexDjncS4Wo:APA91bGLoq0cH83VhuU4GQDuJToEaJvosucDtkwsw5Vln7-VLAAdAOaUUkaFT0qhcZA2Q2iUFJqW5DXTaOMdpHMWvFjHK__uSxJpa0VOTchCf5JZ9qdFrD5YxmZFXHLzwohYWwxECyMO', 'Vivo V2036', 'Login', '2023-01-12 20:16:22', '2023-07-04 17:11:39'),
(2, 3, 'Android', 'czDYQavCSC27bdKNr_icuZ:APA91bF4SLd3ehhosbeTjDzG3WrJn_8eqQXVM_HalGnpNauRLdKuokwIPVNCTqd89bINUs2cFLCqo9N6UywshsuhdL25Fkgk2sRmiEKCKqjb_G93pWiUJxWyHd5g6vHoUMhx2gwmtfwC', 'Vivo V2036', 'Login', '2023-01-20 10:15:07', '2023-01-20 11:03:53'),
(3, 4, 'Android', 'eoQSyWL0RrGYnsbwJsw8PN:APA91bHsnkVRtMe5ksEqKwMTm5OFDqnZhGsgKNC7vzy-ATbC28aqTD41-p6RyKeGP60edzsXM7rtYklZ0c26yADI4n118gGBj-MFnIL3oF32CmfhRcmopCX8oNZkyVhZmoTpQbzAiyr4', 'Vivo V2036', 'LogOut', '2023-01-20 10:56:35', '2023-05-08 18:16:52'),
(4, 2, 'Android', 'chl6W7EESwykUHOT-nVBmY:APA91bGZlrJFt22VMPdnH2P_fpYVU6FKtFfV5mk2W5IGhgBgc7u1TmXPv4EQAYoBMToSOoVaXUfzvSSfhkqsRNcZep2wTg4a1Q69ijqwT_TmGGXfsK1GQnQeCGir9v9G1PvgYUZzuolC', 'Motorola moto e(7) power', 'Login', '2023-01-21 11:27:54', '2023-01-21 11:27:54'),
(5, 4, 'Android', 'eia5mBuKSRaHQTBNN3bs8W:APA91bHtU_7nyxjfP-Ezsi5YyQ1mDKAGyb895ImuOmRpo3wfJqFH5yOfHxp8Lum480XjkAcXp_tgQ_QyEw8559-YQzirQWqlvu4pZPnk1e38jCyzD-LgxZgad4OwinFnoIWHXauxw-ip', 'OPPO CPH2127', 'LogOut', '2023-01-23 12:46:24', '2023-11-07 09:55:25'),
(6, 6, 'Android', 'eDimz9wPTd2w7sd7xFrYcO:APA91bGskGVtg1Q5EYOzKImzonjuPtxQx_UXlQHCPZzfTk69J9cFVKapJMcQ040qv1fsftzDKk5DXasBaNPMgvziYGjkC_a10UjV4TWNfyaSgSnOI5I2P5juisgE_5xKa-dS3obvP8jT', 'OPPO CPH1901', 'LogOut', '2023-02-15 12:17:17', '2024-04-18 10:23:00'),
(7, 11, 'Android', 'cwWy9IhPQP2D5uFUP3NVrE:APA91bF5uoIC3kBi_P5TOjxcgzpSb7friWAV4NYgmyR5RRZvfNrRd6O2zTBnjl-qv2Vv3dOKWOAGGfhIFXYFP5L-_OkWTY-u40GqGnKlTQ8Iy5buaaHKq3TMn-84nfomcZdxpioPjKRN', 'OPPO CPH2127', 'Login', '2023-04-01 13:12:28', '2023-04-01 13:12:28'),
(8, 13, 'Android', 'fTReP0MsQL6SMNQBznDbHy:APA91bE7zUBHVFPd4-rz9zP_sWuEOLCfx2N5MF0dkJenqyFsjHpBEnak3cJyP9M0bgV_pZl1oydctmFRXXMTOGxBDHhllO0948sy5fRz4Ah13J_onVy5iEW1Smi2SpfKgbuS0rZfYL3N', 'Lenovo K8 Plus', 'Login', '2023-04-01 14:31:37', '2023-09-15 15:32:37'),
(9, 14, 'Android', 'dNGtLnEgTyy0_3aJD0l-7M:APA91bG3fMu7gid2jBEad8rzON3h51ePkJrc2OGOi4ZKj-TQ-E5SaiUktu7vWvXBcM9yGxy6-Gq1PkoJuJ1hOmoSh3pgPqNfvzqNq6d8rjRws6mLrdkOJ0ISAl8wTbpIuLceQ5daK3T3', 'Samsung SM-M127G', 'Login', '2023-04-15 08:51:25', '2023-04-15 08:51:25'),
(10, 15, 'Android', 'eyVizq1ZS4uT86EkqPEOHI:APA91bEqSa9kwj0HwuofWjwqeXv-rX6yGRJbl7xBpHqwDCIQn7t0Wk8R3ZWoso7e624U9MUnCPfWJxm0mfZdGJN-EtEm98zQbsE9nhf_woi8Qhuc-SmKerOOhCoXSBQYfccXOZs0WZoR', 'Google Pixel 4a', 'Login', '2023-04-17 17:47:12', '2023-04-17 17:47:12'),
(11, 16, 'Android', 'cX5QHwZ2SmW7Xpev5CVqcP:APA91bEe5Ixx3TLqYZDQEk0POnRjYrDQSty1FSSSE7Fb3X3G_s9wo17cKDYl9sLkStMFZ5GIXE0dvCyRxfZ2hwkOFHqMCZF-V19Z1tqWwV2sqY9PSA_fN9nIohteyVlNvR_cOrA6yS5r', 'Xiaomi M2006C3LI', 'Login', '2023-04-18 11:33:58', '2023-04-18 11:33:58'),
(12, 8, 'Android', 'fLdPLw40T56ca5HrBy3XGn:APA91bF5K_Au7Oq72MHxye_dB-wSP80jnStjxPsTBRxeWQhqxye63WEPcCn2wLkkex0bE8iXQo5VCP7H-IadVnk-AEF6hIDoWKvinMagKAfvmjT1OtKgK4cHvgGb0xaaB5n1Eb8a68XV', 'OPPO CPH1901', 'Login', '2023-04-18 13:29:43', '2023-04-18 13:33:08'),
(13, 13, 'Android', 'c_aGfl9rSOCK5XdDuQx2fZ:APA91bEO7KIH8buKslYK5zyTMadkR2dU3JceNcFNG5mJ4lX-Ye_MkzYayZEojR7rux94qc2h3vzAQXqDupdY6ejEDaBv1AIdZFOuxkeJ11lj7-1Ar6ABw1g0bnCWqwkta1zbjjJUhr5m', 'Xiaomi M2004J19C', 'Login', '2023-04-18 20:15:15', '2023-04-18 20:15:15'),
(14, 18, 'Android', 'eVin8j9GTk2L3ocXLGvFl6:APA91bFi2Pg-sddZSjuW8yHakfX31GIU49FbhzVb4zE2IEFYVRF3DkmXETc0I0ASD1tjoe1t_x8Rz8rclCjAKzGebA5TrFnCjyJLhBT3HYPc4Wj9QXHDcOuE4iU29isU0cvpxvgbzVav', 'OPPO CPH2127', 'LogOut', '2023-05-09 17:32:30', '2023-05-09 17:34:39'),
(15, 19, 'Android', 'fkIvVo6AQZ-2kj9pVF5JZI:APA91bGtRDgWwigVhWK5MrgQoTtu09f5W3gC7-F1Tu1RGdCIPxvfm0i4iwjeqQvkQtcSktJy84_Tb1LMTuxbH-7Hi4NcvMmlaj9RrnoLjhGceMvDgzLubtsQ66qB1ufEfSZCj6pYEFqB', 'OPPO CPH2127', 'LogOut', '2023-05-09 17:35:33', '2023-05-10 13:05:05'),
(16, 20, 'Android', 'fkIvVo6AQZ-2kj9pVF5JZI:APA91bGtRDgWwigVhWK5MrgQoTtu09f5W3gC7-F1Tu1RGdCIPxvfm0i4iwjeqQvkQtcSktJy84_Tb1LMTuxbH-7Hi4NcvMmlaj9RrnoLjhGceMvDgzLubtsQ66qB1ufEfSZCj6pYEFqB', 'OPPO CPH2127', 'LogOut', '2023-05-10 13:06:22', '2023-05-10 15:45:28'),
(17, 21, 'Android', 'eia5mBuKSRaHQTBNN3bs8W:APA91bHtU_7nyxjfP-Ezsi5YyQ1mDKAGyb895ImuOmRpo3wfJqFH5yOfHxp8Lum480XjkAcXp_tgQ_QyEw8559-YQzirQWqlvu4pZPnk1e38jCyzD-LgxZgad4OwinFnoIWHXauxw-ip', 'OPPO CPH2127', 'Login', '2023-05-10 15:46:11', '2023-11-07 09:55:53'),
(18, 6, 'Android', 'f5t08p8MSZ6flaTdqbNkjL:APA91bEZsNPqWpu2xChfR0TAB7xTmCjvHNXN_j5o7hvhDRFPBwRzCwS9XRPXEVO8dJlW98Jy3CkD9VGWblrzJk_Au1IldQ6nY9aMapApr1fM98ts4I1SmH0cEtoi5WYMYXLlzvquK77E', 'Samsung SM-C900F', 'Login', '2023-06-23 11:38:14', '2023-06-23 11:38:14'),
(19, 23, 'Android', 'ebbyjtu1R2qPCYGeN7hhvH:APA91bEsCkT4wgyiJqU3i2KczcFqpSJTeSde2XPmik-yZJit5bUbDezyDm2zisLbOC1ddyBzWrDQyAnevRYqQmX04vHA8yiuJ_-y_go_H_BCycY66hs6JACVlIshUZmXylYrLaJj5jmf', 'OPPO CPH2127', 'LogOut', '2023-09-15 13:41:50', '2024-05-08 17:22:49'),
(20, 23, 'Android', 'eqW9__ClSk2bBMiVSiDP8a:APA91bEswUXAMg22soNjm78AlzN4VTB8vlPuK6wRFksAEw1jdFpWsF9Fc3HQ1Qu6nLT9UV-BwzKQj064EQW82TJ16vK-aWWGJYHkVxw1iODrl3MP8JZxg_Zm1sCwue0oLZ_-zGwD-2Vp', 'Vivo V2036', 'Login', '2023-09-15 15:11:10', '2023-09-15 15:11:10'),
(21, 24, 'Android', 'f_SZj7eySX22EjZ-M8dYux:APA91bHvnqZzYj_a6X9KIw7EDiL1HnLW2NsGfIh0U6yX6MATi3budvTqx9C1sfeHree4xYxATcHpQoyLXbYbnVjBTzXsdQh1y_KvJHSd8vWDyRlS7UdPlI8mqGXkgySPgRnDy9QWOEA7', 'Lenovo K33a42', 'LogOut', '2023-09-21 17:13:13', '2023-09-21 17:13:19'),
(22, 28, 'Android', 'dfXN1UThRGGO8JFoxGBoKQ:APA91bHr7TrtjpWrbr4b3zeaR2bUt7_Je1D4upmy952JRC7EeyFPBg5JCP8wY4MgnjgHtTkPatLXMm4Xi4cqnt0-SFuwSdplRIbbASz4xZSihHnns7q9NFZltbXgDOli3NBPhiBCmnqC', 'OPPO CPH2127', 'LogOut', '2023-09-22 12:37:19', '2023-09-22 13:01:03'),
(23, 28, 'Android', 'c14uXTmAQZOP6toNa1qUrU:APA91bGifZyO_49VX6utjDNmbIpzznaWDzYR-mIYDDeiOsD2DAyszFObyZec9FIklEEjHlfLrkresaJYFHgYtTQDsaV6RcOjJXOa9-j0pgmcPQEd-qiMi53Q6sENT88nq9u3QgSLQlW5', 'Vivo V2036', 'Login', '2023-09-22 19:31:44', '2023-09-22 19:31:44'),
(24, 30, 'Android', 'dT9uFH7IRo-CTNXV-KCEni:APA91bGPeLNyEs50xOqxLN4AHikOEcE8CGn9DrWfraEjbs4VZ3acvAlypI74cXyDg4TUPPh4MKXjerUPMCe4aW6RLfZlnvYowDaTXsVnYsNWteHTFPj6ENcK6AsjuAz2Kal106mZ0Emv', 'Samsung SM-A315F', 'Login', '2023-10-17 05:30:01', '2023-10-17 05:30:01'),
(25, 31, 'Android', 'c-ew0EinS-WqetRYtT61v4:APA91bEQnNPZcThYsFGtzYcMSNtjcBEUcwrwiPbqw1YtlQ1LFHZkLTtloTcvGxIwh9mCZ2tFdfqZize_h15V4CpnwGqglsz6RIYsbObIyV0MV_OMH4fE9wUf-k1GAPZ6qq_QbsRGdE70', 'Samsung SM-S918B', 'Login', '2023-10-17 08:24:07', '2023-10-17 08:24:07'),
(26, 32, 'Android', 'euEBfelDSdWoJswl2yilI7:APA91bH6UjhFN2RQDRGTCsrJSnYhK6wTLdK4H8JViAdjdeNWYAGPSsxhGB4WIGCbzSvPUcpKxsESZENdlK3cEoSMOoqbVbDO4FGM_QnYqFMBbOUFr4K3zFXqKebWimrFUQw0kLYU_vcQ', 'Samsung SM-M305F', 'Login', '2023-10-17 18:32:24', '2023-10-17 18:32:24'),
(27, 33, 'Android', 'dR559zmVR9iXPXqUMAFcGp:APA91bE6u0txXIVzjLV_81aXiwpIW88zP0tTPpVDFCimBN9R7KhL9HcFI2BhdXN2Rp1umCWS_GjX_bzJUJSWIlR80jLihtFo3OueIZKcHzhocrSN5DYCBy0aFgC4wiDfl4TWvH85vFV7', 'Vivo V2225', 'Login', '2023-10-17 18:33:29', '2023-10-17 18:33:29'),
(28, 34, 'Android', 'fGrvyOB7Q6K0EKWKr-_gJ6:APA91bE1gsI9hBfjO6HVzplmnXAgwBj0SI7me53aEC-dVwhU-bUuL6gb6txOGpHbWhUlxhJGuPZz6ELG-jhyPzuDEIIPMLYhlPU3cZ9HBlJ7ORVe_o3EWTLeyjtKk3F-dI8Fk6tV-wkr', 'Vivo 2018', 'Login', '2023-10-18 20:42:45', '2023-10-18 20:42:45'),
(29, 25, 'Android', 'dhx9xhrPSbKbCQfYsFTljd:APA91bEANwiHy72MYSE-vYBG4lJgRc2YIXjpKp-lm3MhSDzKtYAgz8WKRRidCRIv4X89yZuMU_Hgc4GrGqRiH17wvVWTPKXV0OjX7X-lZiyG37DKM4YPoLbjQ3Yk5ln3X3NB4JUZnnDj', 'Realme RMX3516', 'Login', '2023-11-10 15:54:52', '2023-11-10 19:21:21'),
(30, 39, 'Android', 'ePXDGeIOQeK3KT-ac_MWq6:APA91bFY6zgv99VgyivrWnAPt9hX5niJLP4qsMTVDiP0rT4uq0BHDLrs_e1NAE5O7KJyRl6Si090OcVY5C2oKqGMvkYIvJV_7eCqc52qAvWZMeSf0Tvf_jTp61a_VVkgy0tVfeiNO5g1', 'OPPO CPH2127', 'Login', '2023-11-17 16:41:33', '2024-03-11 13:27:15'),
(31, 40, 'Android', 'czjyVN01SE-i8TGaOacaKe:APA91bE64GwZZxkGUJZuT91bw5NkdZ-NgR7NXIyB74dp7UkhV8yjoHohV_-qmrWQHGjhdUNzozCCKLQk4Z8wfEqYZ6rGBHhb-9dkOR-l50wBnomSn-5yrewSRErhpmqhB-lYJm33kwFD', 'Samsung SM-A307FN', 'Login', '2023-11-27 11:29:32', '2023-11-27 11:29:32'),
(32, 41, 'Android', 'fhoNUvK1SN6yI3burUASd7:APA91bFXLBKihLVaHQi2cGLLRi3PKIgOHdpjrLH7DnO0oySN0m6zX4pWXOXE2SwVG30NiWgkJU2iiwNVP08bV3x4dsODCKM9sP8_8nDMLJhvHPa0OCZ02meK2wcjX1CmX5wM8RE8x7Sp', 'Vivo 1904', 'Login', '2023-11-28 00:14:55', '2023-11-28 00:14:55'),
(33, 42, 'Android', 'fuh9vJdyR3uTcs2xzvrZwn:APA91bG2YroZS6GjvJVdZBxtyJc4xEsh88FqNanjkXiu7TQPYrc0_r6HJ74ztKpjYAhDRCgJmf6n-AQuA909P5DLPlodgoq532e8mtxvD9zIRSHNxm57oMeyugFBtLoAxX9ic186C22B', 'Realme RMX3231', 'Login', '2023-11-28 17:18:02', '2023-11-28 17:36:26'),
(34, 43, 'Android', 'fLWaL4xeQRC2hBdcOmljSs:APA91bELXfjL5qWwrWMjPdCN9mLUmjaXewuE5NE9fJmS89L6SgVGmxc9coOe71VXaOZe71iHZhuX5FD6e0kAVLPE6mROyN307v-OyBOFL8_BlXcCWQJbd15ufCmN2gPn-xfMCuj7pyFL', 'Xiaomi 22120RN86I', 'Login', '2023-11-28 17:28:23', '2023-11-28 17:28:23'),
(35, 44, 'Android', 'eurXx3GeTlijiBW4rplQDo:APA91bFAzxu8ZBRBcQDVMDFxBUIrUgzfy3R97L6f8W82KBYsSbDkE451p80yQ_NHqy-bBTUVUQhyiKqUCby1Dvke_t4zQei9Z6MCllyEK9t8g_Ij7zdFCY5ixXPo2pSNjJfhaAaSEGuh', 'Xiaomi Redmi 6', 'Login', '2023-11-28 18:24:36', '2023-11-28 18:24:36'),
(36, 45, 'Android', 'cv5GZawWQrmGSL6wYrFNql:APA91bGG7ty9-YuiJtsAJJR5jxVF-lCLR8j0mNtETbSUCGzWBr4YTbP2-icoqJkGyMOZSiDeQxfvRejoJDbr4o8fbMS6OoBENvmoNXaJkIz_jc-Cug7h1GzB35Dym8nozChm16m4vM_x', 'Realme RMX3231', 'Login', '2023-11-28 18:28:33', '2024-01-17 15:46:10'),
(37, 46, 'Android', 'fe5ku4gqQn6UjahC65P_3w:APA91bHx_u1cBsBR3f9ix-tZGGPkAIotsrPZEKCN9kkCFUeDO3RcPc-hjlGIeXRyDrKWXGjOdDeZrpxnm9VnWIePN1L58lj0H9Xgqd2Lx2c2JKE9DG4I2xiAsvmhSHAsDseERF1ZmVCx', 'Samsung SM-E225F', 'Login', '2023-12-01 07:24:04', '2023-12-18 17:56:54'),
(38, 47, 'Android', 'edUt4VAxRmWQNanImuxjIS:APA91bECl0aYeahdD2MsA67nXYVFTmvThc0qoTIfU2YcYAgCmzYg4_NNo0LU9axgpdXKmJomYA5cVk8uegDqzndsejONaYdOk6l0OgcD-7fjF5dfU2GzZKsQjvtFbDsegvKkRuhl42-5', 'OPPO CPH2095', 'Login', '2023-12-01 08:28:31', '2023-12-01 08:28:31'),
(39, 48, 'Android', 'dBolWdQbSTODroG0z8TV0b:APA91bHdO3IsVCBeOibWj3N-q82fQtDU77vsg7HHkci_h2bdwDCim0yQST5N1SH095GiyV1773ErbeNqFxYhl-RqagWWjmJoB3D4z5BL4TvHhBaBoGDO39m7eseql3Q_hin62whaXfj5', 'Xiaomi M2004J19C', 'Login', '2023-12-01 09:03:22', '2023-12-01 09:03:22'),
(40, 49, 'Android', 'cLCxplP4R1qslZjIAqr_67:APA91bFPgQxyi6bk6qlyV_hMwrn-gDOs6H1yqMYbqmiUWJj_dbKYFUNgYhehvf_wwhY-ckdc41N8XQFqRvyNBs1PsscpGRZ8QpvWPcJ5HR8RJRxzOgLKIZoet2CAg4kKOSdVdDAhNYwf', 'Samsung SM-G975F', 'Login', '2023-12-01 11:19:54', '2023-12-01 11:19:54'),
(41, 50, 'Android', 'deX9gJYyQxKexm8sosPwkZ:APA91bHLncl_NsOUC4mTgJJAPiaEUq9QsHKTQ1Vidv2VmQz2F8iZ24-9kVPu5sCTGAml-KJDrrPvpHuNFfKfNWP8hwqYBKxSXbz826LCs4rfmJh8vCsSeNu8Ng1QyydsOQIUhAVAfces', 'Samsung SM-A546E', 'Login', '2023-12-01 12:00:27', '2023-12-01 12:00:27'),
(42, 51, 'Android', 'fMZy_C6CSxqtIdOpmOxfsu:APA91bF1Wm1aOtNDmcWToJzF_-ifrB1UizOs1IVRavDElfOccOaqTqF_Wh2Fr9xYUs9FgZ_4B2LGNl8uI9oLhi1ZPl_35SGYonwkj8Kxwvpqh_wk0S_OkC8StijymGEx2HCIjSlKmwup', 'Samsung SM-A346E', 'Login', '2023-12-01 13:20:58', '2023-12-01 13:20:58'),
(43, 52, 'Android', 'dLQiz-JvQ9CCJLMYJRZafq:APA91bGsVPRoogsNoxUICqY_UnpNd1lpcPnALgjkM7kB618S4Ka7ye-JWeTSHx5YuhFBl8aK32XN9hNO7w6q-m8WHsAcBduRWBFQDnIibo1hx8Aa1u0H8OiOw4A5j-KQD-hjkSJI6jzu', 'Samsung SM-S906E', 'LogOut', '2023-12-01 14:50:09', '2023-12-01 15:00:04'),
(44, 53, 'Android', 'dHkKPfWqTXacFD8-l1CWHK:APA91bGSvyIKz2hMgnioEpMYPzn1Ahnkje9wersxHUP6EJxqAay3yEQfDXHKSq2cZxzSnWrxi2fTWtd8ikj64JZCv1F0ZM07mX7roAUcix8snN-CjEEs1yD477XJ1Z9RN8csFowJZgxy', 'Vivo 1820', 'LogOut', '2023-12-01 15:42:29', '2023-12-01 15:43:43'),
(45, 54, 'Android', 'flEYKJ-9RGumw3Yyq_ncsl:APA91bH_3Y7Zk7KO5wBddIiXWfOCkWrAkl5-AD6Zb3TajtINa8zQZtS8sxZIgpCxsxN09tOpYw4EZUy5UDpCm1I8GIRbpgCfl3020UEymjmw5B7uzaMr1pS4eQlG-RV9mWnO-eHWnmvD', 'Vivo V2033', 'Login', '2023-12-01 16:52:27', '2023-12-01 16:52:27'),
(46, 55, 'Android', 'dcdC_2rMQuuqQX9T-p7QCt:APA91bGENWJJAmpZJmt-v8_QLe0dMszI2CP84mlQIEZ2ayDsa9hOCau6z_b_pc6ZuiBu5pACH3aUIPLTGcFeZcYAJ6p4Q9pxgHI24lWe8X4hENUL9djRoTkwn2UVFGx8Xg9ls4ltxAaZ', 'Xiaomi M2103K19I', 'Login', '2023-12-02 14:33:37', '2023-12-02 14:33:37'),
(47, 56, 'Android', 'duC3UWjxT4ixpe60YrYX1q:APA91bG5m4wUXpn9PI18c3sGQ3dTO7jxrvN9lUKsl2bbRdIspDwZDJWhXmrr7nYe0B5ktSG8sE9vPY7Y7Jr1o44WuJ8CuOM-nERMblRv-M07Hx82K0EUYRlCbgNcJcIW7uy204bdFxll', 'Motorola Moto G (5S) Plus', 'LogOut', '2023-12-03 20:50:58', '2023-12-03 20:53:48'),
(48, 57, 'Android', 'dSSc-WRcQA2wreO5gS7Zuv:APA91bF3pm5hykYdvZNPq_vqu12M0Bqfn5g59p5Yv09Upozm1Wyk1ZkKDql_mRRg3aJftY6RPdc7-Gi2qIz0p_ZeR-CHTfoS8dE2QyZBfac5N16rzUK-vV5nRbdFVxiJBPX8fAxNwRpc', 'Samsung SM-A032F', 'Login', '2023-12-04 10:55:01', '2023-12-04 10:55:01'),
(49, 59, 'Android', 'd2SVRz3IQDOEBdwAuyXBUR:APA91bGwPtyfXxMkWvTVibRJ_rJTuP3BktF8F6GyHd8DJAgqN6bIKD1xuFDQzRo8i7TzoNCCKUIp6MGiPXjQvsgBLTH0HGYIJ8YCSrpVJYsBWiOM81wmzC-aVqXZqVAe0WZvNnIzWbfx', 'Vivo V2118', 'Login', '2023-12-04 15:33:19', '2023-12-04 15:33:19'),
(50, 61, 'Android', 'cjZOg-JRR6GiB_8eJTnzUw:APA91bGNliGBnKMgfo-KcNSBFdKLm_2PfPnup5UmBMGLJsnOWoRFKKgFTAsdpMPizcSTvAwfGK4aHahLZMOumU1qw3ncvmt3s_5Lbn4CGUHC7Jqk7gAVethhhj-yBzst4VuUZpLChg_1', 'OnePlus AC2001', 'Login', '2023-12-07 16:44:57', '2023-12-07 16:44:57'),
(51, 62, 'Android', 'fwBF5gu0SiO2btUnGPkKwG:APA91bEi7h_oVGayLVwbr1epplaVBeBCTuNdG7GgeKVQIUBLLKFw2gI5waL7lAYPflZ8zYzzsZyFC993VB1NDEs7-4fu3FtP7BjN_YAoLD6BrHBCVWMA_XVz1oF6y-GYshRwSFBkoVQk', 'OPPO CPH2127', 'Login', '2023-12-08 11:59:26', '2023-12-08 11:59:26'),
(52, 17, 'Android', 'fJyHEcZKSrCvhi8iWv0JMd:APA91bF5kp2KW5ECkl3iC4EdbYJmoVfNPgaPMVL06uwUsAbCqIu6siiBLPILbpkE-b6YfW1p1SrWIb1pvERnREgRaGiCWFErwSYsbZdMIe--OYgmyVhQP2u5Vyc9w5LWHnf9SumRtkc0', 'OPPO CPH1901', 'Login', '2023-12-08 14:16:01', '2024-03-12 18:20:54'),
(53, 64, 'Android', 'cQg4TAT-R5-5b6mnWO8oXR:APA91bEDPnkyYkGMxrbqK1d6AHtuUjQGx8a52lTVnJJrMR5VPihkc5JeDsl5UNFYarklUu11ZBkFVnINIY3TBzRi4i9Hn0Bx-O5WY3PRvBzuvuL2Rg2TJYAZJcoGmAbz0_hrIV44JAfO', 'Vivo 1907', 'Login', '2023-12-11 13:41:08', '2023-12-11 13:41:08'),
(54, 65, 'Android', 'drnMJQnlS6WMtcIklWCb8x:APA91bECwIxdjpg1GQRuSUZY8vOIRFwqLduem6umRl_nmpiTVusetMn1db_0NFvcTZGzHcVMoV0fi1Pk1tVTho1bsXQf4x0dX6EOrwp8aTzfZxublXVRurOeIXDyHpjD_V8SBS2LJ7Io', 'OnePlus CPH2381', 'Login', '2023-12-11 15:00:11', '2023-12-11 15:00:11'),
(55, 66, 'Android', 'ea4XKfE9TmqQ3HCOAkOc_Q:APA91bERqal5OU_OTilNEPqk1PM95D31sC0CyI6vQwQqZu9E0NEg6ZonyLo2Lf6JvVWqlJW6tmI4rvxZcqrZKr8vdY5qW9l-8zExjrmNgt1_XrETv1GLGT8z35Z7WRu0mcbkdFujMBHU', 'Samsung SM-M022G', 'Login', '2023-12-12 13:01:47', '2023-12-12 13:01:47'),
(56, 8, 'Android', 'e87lwyEgSQWbgtmwpf3huH:APA91bEu-Tycsj1bXco9MLILlYBRHGqRiY-EzTe1tvmLZT2epK02uW-LjyXvoM5qRgqncnnHuKqXbpc4gJi-K31P5XfqpbyKx_A4t-4rnTXTApQMMlyI2SbyaqMMIO442QFmtNzSfmsf', 'Samsung SM-C900F', 'Login', '2023-12-14 10:39:10', '2023-12-14 10:39:10'),
(57, 67, 'Android', 'eQRfIOimQhaCZMG9bQ7P14:APA91bFJaa7nfoSbN_xy8xTNhle9JpWJWYDwr1fAyU624mwzDzD5pzz7AmKp-7nLRqH2Gwl7etE7H9a8kavPi7RNclHTrs4QsnWgOjA83VL4XWKdimri88EAxYwFPN7A9jSa36FrXBVe', 'Xiaomi 22101316I', 'Login', '2023-12-14 10:39:19', '2023-12-14 10:39:19'),
(58, 68, 'Android', 'eU6ou3ldTo277_cfKGDWKh:APA91bF1VoWGPt4Ut9YUzytSUTbSuDCasoHgRQv1Kij3-r8vQfuKCQUnvVK47I1xZGh-ZbAW30A1At0ZNPGfE5n2VZW5ubioVdby2NQaRB5qdYcXqiqupvmIkSTZzO07qYP4W6c_DmGo', 'OnePlus CPH2381', 'Login', '2023-12-17 20:08:26', '2023-12-17 20:08:26'),
(59, 69, 'Android', 'dmmvru50Qdic9r-f8xpJzQ:APA91bFrdX2E5nA_7psuG7dlQ7OckDPJ2Zykg40s5wRw3dVjGVAFthG-56ghG22UE16lUaNuTpDRDQnkVt1ksNAtAOd0jO7XUdhIYi6XuqJ6bCb6dsBiSFKi0tJylbr71Mb-4xXMzik3', 'Vivo 1907', 'Login', '2023-12-20 14:42:08', '2023-12-20 14:42:08'),
(60, 70, 'Android', 'eol2XZQoSqSUtKj7yiUweo:APA91bEcc7opUH5LCELRiFqOaTsgbUu5abcj6ONok1mStz7whE-GHxYVwAXhEVd-rI_tSNggkMSIFvNuEvB4hplb4fT3k0WWz7cFyfsGU5-w5_rets1xF4hyAFz1tJgpvYgwpw5h4Csh', 'Vivo 1907', 'Login', '2023-12-20 16:19:49', '2023-12-20 16:19:49'),
(61, 71, 'Android', 'fxN9phx4T7ehhrp5_h9saX:APA91bGgBfMrsg2XIkHZ7e92fy2WLDXjgUssIlu-FaOAzV-GcVDpLWZ8BlcwyTFQLvumH42b1SGLWJH72rpA-GJMqB_2mec2EFsXtMs_OoPno63XfdrfJhXVN_lCfcpk-zUWJswKPljL', 'Xiaomi Redmi Note 5 Pro', 'LogOut', '2023-12-21 13:13:38', '2023-12-22 00:45:54'),
(62, 72, 'Android', 'fMQbg1LeTsq8WTcnQqQ2pV:APA91bE1HFkMHvRqUWAA-Wqmb0lA8ixEDGuLqrRGAlb30_-htlxwYfoJcyPNIGdfZv0ExGOsb6HvGHnnXgnK1eVWWCkOqfzDKYDpchBkYA3mke65zO3W1DoqKidQ5ZVGTrgfsxjnEu1x', 'Realme RMX3171', 'Login', '2023-12-22 15:16:50', '2023-12-22 15:16:50'),
(63, 73, 'Android', 'ce3psKXJTdOvT2VH0hd_Ix:APA91bFSHHFAw8CDo35PrZb0qCwn3aPDuW-ENhyW8-VKDAwMS207F9XDPxBHbYX6kDqIkVaejyVv1ppQ-qU38jj_brmUGp4xdeIQblfYZFgqPIHTtFOp__UH7bKxKfLJxzSWZVH8J3nk', 'Samsung SM-A235F', 'Login', '2023-12-25 19:39:46', '2023-12-25 19:39:46'),
(64, 74, 'Android', 'eGdsG__sRzqz1MGZEMGSsM:APA91bF01a8Eql51o8DcT9lj77p7u4aUWnJRDLmbwr_XhrW5WvqxcByKud4izMTM1Q6O5kqRMxJtF41mg4MuFPCN_kqCbbsEaV6tMjWZrU2X_l2oQK58Ceah70PDM7lR2sOytfvA26Tg', 'Vivo V2126', 'Login', '2023-12-27 15:48:10', '2023-12-27 15:48:10'),
(65, 76, 'Android', 'dLbuMkYKSnKIVb8nKg1ND2:APA91bE9E_xpBkZEFgu7Wr5vIzgAPm1_P4Kz61eWVBJNO0RQi2KdMiiXgEhcRN8LSK1489BXOPCaTk_cKY-kwN-MlP__iJPnyC9CG3JOI808h3svYdyhXrmOmOzT5TK1vJnxj20rh3CS', 'Vivo V2058', 'Login', '2024-01-02 10:19:35', '2024-01-02 10:19:35'),
(66, 77, 'Android', 'fpKBvbSlTjO1TurCxcBH0p:APA91bFEaL6dmfu0NaKADlSPNFL_2fbdL4Bp4yg4vgTpjhWAuvdsoiDrMFKH7sOiz3PKS2xY3bGO9zBmK-9NXP-etZ1sdA1WWJtzd7UqRCX4rlGyGtveHmo0cAXCQR-hrsVjpx9H27I7', 'Vivo V2120', 'Login', '2024-01-10 23:07:05', '2024-01-10 23:33:30'),
(67, 78, 'Android', 'dDYsZDmUTcW89uTYMZY8t2:APA91bEu9apqR-QywAx2rHBTqq62qaATt2aS7Z6VLcDWOWDMJzaFay2c2SoO9mOzJKwkkgfk1jepdmUmls403pieiFedvPHWFoNeuNBUlvLCF8aZZavI16Rv3tVw-2V4ebCW9-Dgd3B3', 'Vivo V2240', 'Login', '2024-01-11 14:14:50', '2024-01-11 14:14:50'),
(68, 81, 'Android', 'f7RM95dRQMKCrxLKQ_8CQn:APA91bFzerUEPww0FZl5xxPp4UWnzE4V2Q15QXReKGLPTxUtip53jBk_oNv-2YGmDNjt0GbwSnK7S1X-XQJR2I_1fCPGlWuKnCBaX83taLuXlkG2LJD8kjwS6SrT_4hxNrW5EJUbz3Ae', 'Vivo 1938', 'Login', '2024-01-17 15:55:13', '2024-01-17 15:55:13'),
(69, 82, 'Android', 'cHT6Hke2ToaQ1nF-3QZhIP:APA91bH7JpG2PBtnq2gTfwvGvRKIHgkNM33QO2_k-lsgzYvTkQ05U8pA2snD-33Zjfoii-R9rl67Ev0gnYyeGeywXAWHcf4LAfjdGLVG9mz1KtfoiSVuRfeJqk5fI3vC_4T-HnTk7hcE', 'Samsung SM-A146B', 'Login', '2024-01-17 23:36:29', '2024-01-17 23:36:29'),
(70, 83, 'Android', 'daWo_OrvT0iOnMw34JW_2c:APA91bFxMMeK0YWZM0XWUSkzyn26OCHldpPLICtch2CUibJeEooKkb4-m1zlj6CIzCArGooDkGqqUojqXDjm6XqRMnl44f9w8x95YG-Edb112GxN4QtEf1XMferMBc-57sM_VHRGiYrM', 'Xiaomi Redmi Note 8 Pro', 'Login', '2024-01-21 20:46:07', '2024-01-21 20:46:07'),
(71, 84, 'Android', 'eTvCz7PbR7m8FmJ-H9IqMr:APA91bFLidUTvYhHwMA3JJImBfXBubt8-kbPFqim1-wxhinedsELoMM1sX-RnH0Fy56vCXmvheOpHs02Yz09AlTSJKTAKR7R7vvHkWDJ_uAaXFc7mvJ1Bmo6Njzfd1W2l2j4_reBZndw', 'Samsung SM-M115F', 'Login', '2024-02-07 18:09:20', '2024-02-07 18:09:20'),
(72, 85, 'Android', 'fwIVC7WiSL2lQN88eid5eI:APA91bEP2A6fELrwR0DksRFzWiblDcIpqxQWBXziuOci01jCFWuVZYFAuY_yOfWbr4fxcpcQbFjJHbs-Ndyk3em3x8KVRiShZWtgHJCf0njIuLqIGyT8IJJAvFc36512wd-2NnuvGG2l', 'Samsung SM-A135F', 'Login', '2024-02-08 12:57:48', '2024-02-08 12:57:48'),
(73, 86, 'Android', 'ewguby0LQ5uCVhJYwdJM_U:APA91bFYOTDiPEQForv5mWRRnT2D5cDY9jViSsKDz5nRbYf0LKkZXcgrZyHJI9FGmaP7P7Jx_dMsfYf8m8m2KfD3TdVxg8PXGg4_godD1RcnUaOBb7--kvSU6YLnaI-xV8ueUcdNci0w', 'OPPO CPH2363', 'Login', '2024-02-09 06:25:47', '2024-02-09 06:25:47'),
(74, 87, 'Android', 'fa8PvZBsTRCzgSSGQmsb1u:APA91bEyWcrNSfbpXY4l_FFb9QuQlsqrbr1nHBlNqnYaUJmDbREGIRqDFsRC1OxE3fmxJbkJC9hO9vmBatbXsrHbMTOl4qmgu16cCRy-hIfLCXWbsn1h68TCj3C9niwk3jULuUrPZLRX', 'Samsung SM-A528B', 'Login', '2024-02-09 11:45:41', '2024-02-09 11:45:41'),
(75, 88, 'Android', 'fD7S2WdiTzexDsNPfWKkma:APA91bFB32jZM2XF0EB-GwVJRQvvJ8FZvBFbUbBIXPpqX5Bn8nFkeRbBcL_kXXEvWPcd4eGFMQRugQhNwTmvoIaGPpaAoieROF91a39sY08yYPBD3easPOXeIpZ_PXwEIEzun1hMYi8Q', 'Vivo V2031', 'Login', '2024-02-09 20:29:07', '2024-02-09 20:29:07'),
(76, 89, 'Android', 'cf8aCl5PSi-lMdQ8_P3wac:APA91bFMgZQgEYRuCEU6KoerwUlHOHtvGYTm6K5vi-pzHGt7xmSoQA6h8BQaENA-wLep4jS3zx959Hxm7BSm36FCjCj4J5ndtFQ2cH_PpgP0ZZYYz-BV7kq8ggM4-6OA4TkL2O9jcoh0', 'OPPO CPH2477', 'Login', '2024-02-13 16:38:09', '2024-02-13 16:38:09'),
(77, 90, 'Android', 'dJ9T_azkRmqZLsM3Tq_ghA:APA91bEQcrfKxZA8Ird9hub-1-VTvlg9UbOG8Y682uLSpuvJFysQsYg-08gmGtmjRLeCqGQD1iJenXP2C-twZrXaOCiFPT6JMyuS6Dfr3clfjONMfeVxTv4qIuwFT4wrp1CjiSa__vcF', 'OPPO CPH2477', 'Login', '2024-02-18 13:44:43', '2024-02-18 13:44:43'),
(78, 91, 'Android', 'e8DrfncETHisoNsxmVJlXb:APA91bGMnCVDTvZcAQw3ls6p719B7sYrfrhHmsbe9-fbsoEGrbDxf-G3C7DOYNJagCMhm6IovwZ0YP6C1l_MYT-Cm97_jD7WTzKJ6h9sTlNwhftjDzIOP1YjQDoRWp6SjoXXdVuftVEz', 'OnePlus CPH2467', 'Login', '2024-02-18 18:09:59', '2024-02-18 18:09:59'),
(79, 92, 'Android', 'cGhvn_KxR--c8kZJxkvNh1:APA91bEaiIpjdinjtBMEbY7u1h71DyCyDF9Il0pml-MQwo0XEXYRPpYgCbHGe7RlUVgeeLnaiQ8pSYH7jlC-ZW96Ox0hydmAAP2s7Fzl4_XoIgsw10iDZUr4znA8NvuDYJhj8VMiwhCJ', 'Samsung SM-M017F', 'Login', '2024-02-20 22:40:41', '2024-02-20 22:40:41'),
(80, 93, 'Android', 'd3UZcIPgS6yklAFRc-gVsN:APA91bEQdkpEivUUi70zXX_c6oftWEeUa0i0ToiBo1eB3xrwxGYgNrmuGFWIG1gQe3fdvSZDIkCOnA9YF01uv7saSmCkIOZfjoch4Ud5Apu_3LdY0YGzX4gNoJGMLykyQvu9YO1gXcx6', 'Xiaomi 2201117PI', 'Login', '2024-02-21 07:42:18', '2024-02-21 07:42:18'),
(81, 94, 'Android', 'dFgPcpWMS8-wNVuRyK-cEy:APA91bHXA6AGoF_y3Q9J4vxaBq7mxsm-iqOBjdnmNwP1p4mvpkWy-QeD6h-bF-18eMjXpzzNN6PcFbV-fxc_8wh6Q4RBJg8_OmMLkVECZIXV5EWdVe_kNU5tHPPvj5mw9uE6N59nktoM', 'Xiaomi M2012K11AI', 'Login', '2024-02-21 13:13:35', '2024-02-21 13:13:35'),
(82, 95, 'Android', 'fu41lETMTum7ClTQ8luvef:APA91bE56VW1MHpr5k-vwdfVaLjkBWhv-S3Xvgj-LpDYVqTa0rzRJ8s5iYImVp5-Zimc1E9WZKUDvUvd2FPhQHTUftkVTaoSeRp4Yh4phFCKy686Y3gw7ug7wnKvu9m-Zw1RvlIZwybz', 'Xiaomi 22071219AI', 'Login', '2024-02-22 06:20:03', '2024-02-22 06:20:03'),
(83, 96, 'Android', 'emJ_8VKNR2mO-AW3F-Uf9f:APA91bF_xKMV8T1PpN8JpyjWiobsa2g5hgk5tmyP_KVWjcOKcpoEdtur8vEhIhj5CECmMnMNeQRPl-noIGCEFLn2LPAEmpLL-BvQalOyeb96S7VC-BPEo5p5b8HiEJFbNxQF1j6uJ2lP', 'Xiaomi POCO M2 Pro', 'Login', '2024-02-22 19:52:57', '2024-02-22 19:52:57'),
(84, 97, 'Android', 'deFEgMBLTU2z3yTzyljxw_:APA91bGhYby6Mreb0AdxWRZcVaLVNdCmDByNfgcj9zBXWESXzVPGPjDejTTrm4BItrjV7p1d-dGI8I6YnR9GMRIgk-VPpa0VWtP-4Nvy547FUUWndBHVmswPFEcvzcH2UVUr-Nex6vx1', 'Realme RMX2061', 'Login', '2024-02-23 01:06:02', '2024-02-23 01:06:02'),
(85, 98, 'Android', 'eKG-I5ItQjCmf2736V6Lg_:APA91bENyY47YNNPWqJZqTlQx2YB2PDsFdKGVPZ3umcDn17mUYLMyU4115UumJ2E3WfAnlMv3p8KzJkla28lfBxg_9xFbpgha6v7sZooqMD7muBHO0EfgaLDnUoIY0_EQo7GWW8vTGWN', 'ONEPLUS A6000', 'Login', '2024-02-25 10:00:53', '2024-02-25 10:00:53'),
(86, 99, 'Android', 'cByZPj8BSu-AxHxUosjB2h:APA91bG8e5yAb12Awc9dOCVWW-DQol5gRtC8pSNs9ZoKhgXU0PNJ-ox2nQ26o2LhLgzcMntgKk7_ZEz5ybmCMqvMPci38NNjc_qvt7EVE2ubv92RTwGduTk-cRfDklkNiQCSCR3CI9A5', 'OnePlus CPH2487', 'Login', '2024-02-28 16:02:57', '2024-02-28 16:02:57'),
(87, 100, 'Android', 'cXnxZbYIT3-qKUPDiAPhiu:APA91bGWIO5Npnu0B_rZ5AOSwo8JXEbYCfBjVWFeJmt9TmYSG-2HAj7hV9VNl3rat2BWg9e_v-mT8voJObIkz94pujO9gcOH4Ye4zXYFDwuvODEH7QPnFAX8EFrRkCbIeyjOwYx9TJQB', 'Vivo V2130', 'Login', '2024-02-28 16:18:18', '2024-02-28 16:18:18'),
(88, 101, 'Android', 'cOHCbnVdTw2tDEF75X-opp:APA91bFTpjkvX59duqO6u-lMnzsKhTE6xwN9vb49zdF20dXfPEYwDzIzzEiIfknanyar_ChObQB-BEv_Ic7-DDza9cI3z9RyrhNg7OD8qeGI3sBA4FlTQ1zf35CdxNSoYNixHYgEodDA', 'Xiaomi 2201117SI', 'Login', '2024-02-28 16:50:45', '2024-02-28 16:50:45'),
(89, 102, 'Android', 'cMFOCdWIRuyWA8WfDd1ZWc:APA91bH64__PS7pljVaWn6_EuZZjq9ecJNj4t4J8QLrrMdNYvLLV-BiNOHkvLfce_ec2GV4dwjOl340VJNusQokEytnvAEiB7b3Mabom4tTxiU0iXpJTwSBozkRFiD9twaZ40plNwcjK', 'Vivo V2142', 'Login', '2024-02-29 13:19:35', '2024-02-29 13:19:35'),
(90, 103, 'Android', 'dgOlJn-HT8Sc2q79yWLuMH:APA91bG9_dJ0fUMU-7qbr9h3dh9cAYDzLDzXGH677zTJI0gPqnI23z5uAnuzW6gFB16bALKTMXmeBi1y9UX9owzquzmcjNT8UEenLKqei1s545i405ekdDWTOI3sRpwSsu4Tbdlp5wjH', 'Xiaomi 2201116TI', 'Login', '2024-03-01 04:21:23', '2024-03-01 04:21:23'),
(91, 104, 'Android', 'drNDmb5jQYqRIPS_eqk8ti:APA91bHwiLdlB-enUfBe4_uA_jgXn8Qat649NRpyz6GeEUnodxFf1_CcrzpNJb56cMiSozEDxAw62nwoCuDXSAB6ZQcrUetclgZe2sucbXsQNf7oCdnbziMNl6mT7K3u3AAzfvp4tt_k', 'Samsung SM-E135F', 'Login', '2024-03-01 14:45:47', '2024-03-01 14:45:47'),
(92, 105, 'Android', 'dXdENXhiTMWT72JzxZTfCj:APA91bF-acU3tHm-dp01F64Sm1NrnOk1-J5MFVtoIG3dfWPNgPHEml3aKC8L374pKNEwT6kHk7W6sxOy1BsGeVki0KtpamI-eQXosOTrtgqmz_pH3ICyw4zC39EIbFxFVjlmM0-hXu8E', 'Samsung SM-M317F', 'Login', '2024-03-03 09:37:19', '2024-03-03 09:37:19'),
(93, 106, 'Android', 'f0HSOMXuQVuUh7JXzykbsZ:APA91bE2RgluPXpipwGPve1MBerjm17Z70ym2mbGX6j9Ni08H5pxmr_9eKbssUJTwxLgZO6a0l8cQqa2FqQVTDbB8SPMG7d8zRNQL60CEKn1WcpjRBHTYC5FiK9vcqpQiuy0K0ISDd8y', 'Xiaomi Redmi Note 8 Pro', 'Login', '2024-03-05 08:15:18', '2024-03-05 08:15:18'),
(94, 107, 'Android', 'c6g6FABeQISL3ylZfhYSOq:APA91bFZ_J56zxECL_rnxAdMF_Y4kVoflWxzVejMg5ejClkHxgQGITpawzvZqg6cy3gnldtCTB-tJuywZS21jNSQB9WAHl4BVjBGIkjk-MnYZfkJLOaIn8MsOb6nbOA2HBwjqzsCo_zf', 'Vivo V2101', 'Login', '2024-03-05 16:10:18', '2024-03-05 16:10:18'),
(95, 108, 'Android', 'c9QgfKwdREGUiKv4u8pX41:APA91bFM9JClCureJIdPWPaVrjm3d0uPv0a99cqy4O9EM1gOV9ey5zFQBpS_-pQuE8NmMlkH5EpMMBVW4JJYhh8UWINZFUySUildQqTboAQEowr30Tb49BsyIl_Lld86DB4NaBplQqcY', 'OPPO CPH2127', 'Login', '2024-03-08 20:29:49', '2024-03-08 20:29:49'),
(96, 109, 'Android', 'fsEQzI7LTU2W7wJDws7fBE:APA91bHYCPA5xso6D9Em17W1hweuC5zA5568Bd7s4lvpQMIsKRZ25FxphtRhkpiN3mnApvp4ChYE1KjoHtD7HpOjK6zAcA1cKcx4He5v2GsYF1YXAoGYNQ5NcWUz-L4qrjX4AZruPeYK', 'Vivo I2208', 'Login', '2024-03-10 00:00:25', '2024-03-10 00:00:25'),
(97, 110, 'Android', 'dnN0guw8SlaQw6IP6a9x31:APA91bFgoWD92SXuvMnBaNhDSJm-fJie4Px_n4TeHUDJy-rhTseA7QEbXjGlzU1EY1F4D6ywCgYaUnkVJi4w8ugtLj6vIEeqIP_s8kbKObtCtGDK-dBM7z_2R4QY1firWqBBaN30Cduo', 'Samsung SM-S928B', 'Login', '2024-03-10 15:08:31', '2024-03-10 15:08:31'),
(98, 39, 'Android', 'erWERL4hTk6cPPobT4eNPY:APA91bEAd3vRk_uJkPD02J5E5E6OMkRqk2hF88kf82Mlh03MLcY7ZUD8b4AGrBu2NBYUaY-_xChatC3YK3SC7x0R3_j7vO_QprCG79oMeY2H4WzY1i0rKblTkow89eUn_94EgFQfrCUo', 'Samsung SM-E045F', 'Login', '2024-03-11 11:46:06', '2024-03-11 11:46:06'),
(99, 111, 'Android', 'fx5AkX3FSJWS7Rwu90E8K-:APA91bFqjz0NsXZhgXMo1SBTOR4Y-Is2n0B3bVMFFtd36ypE6aCFBQN5RufoUvVK3F_DNE2v9V6DKosjOjIH0aGLawHRCCjq1-QvK2sinyq2qBRgU-uuiGiA5Aq4QyUxbWf_dS6KkyTW', 'Samsung SM-N970F', 'Login', '2024-03-12 18:07:04', '2024-03-12 18:07:04'),
(100, 112, 'Android', 'cJP84fwKRzW6T9D2Q0FRgj:APA91bGEyIW6rIEHGexOPCByEu2Y1HyIAYkobGZgdfnY6MWfECKQvLtSh6FPxhoO-bl5gpBGB6Q0YOnrmZ7TKr57Nbbs23F8PEVlo6lM8SXk-a4stt9IoX3zup8Eqzh6J6BAZUXINe9V', 'Samsung SM-S908E', 'Login', '2024-03-12 19:15:50', '2024-03-12 19:15:50'),
(101, 113, 'Android', 'ddJndX68QIGj_CY7BvzJo1:APA91bGDlJyyXKHkDjUwti2yN0spG3Rv1p4cA-NTWleyfK0lgUkgNdhSIX13fn9PCT90AhM2PpO81UFSZttm9SR5aY68960ZA5R8upRfLqKth_cj_ckRCyaH12y1H40CjtaAPgh77G0s', 'Xiaomi M2006C3MII', 'Login', '2024-03-13 14:19:09', '2024-03-13 14:19:09'),
(102, 114, 'Android', 'c5sRTqP7Q4-yMyd2LW8Jf8:APA91bE3iiA0hqZj7fpV7BDEuF9cLUl0iahx0p4e-pEx69dJvZYfUWmBvRSaDrFrjzKQHqd3G3JHPTJbZKel3vG7w3Abvw51OdEVgEsfSneSrZeMGW1FlcvCkriVMif3BIkdFTxOdI-h', 'HUAWEI VOG-L29', 'Login', '2024-03-13 14:49:46', '2024-03-13 14:49:46'),
(103, 115, 'Android', 'evtq6plsQ6S8l5IUsZwHab:APA91bGQBJB5S6-Mnh41j6PoKHfDYshGjdL49b8r-Cfb2NlPwpv1bPmgqacHHl-S_DZX_3ec31bjby6uNDiWXuolwXRZhiO6FtHO_EmNpi0AJg9loLNxw82cVkWsFv2xSJcW_iQEmByp', 'OPPO CPH2213', 'Login', '2024-03-14 06:41:02', '2024-03-14 06:41:02'),
(104, 116, 'Android', 'epRjMrRURx2BCRixiRmhz9:APA91bFe-DAgaSkJfrg0BxLgr1BbQjVnQLrFEHjE9gCVZK1nXzWCovti_fvuKzFU38uQS4cgAzJ_PcQ5DPIKSRCiUCx6RU9FOsXIAIsVEKO3lkd7uTpUxtfGsJjKFm0pkymjQk7EhQdY', 'Xiaomi 22071219CI', 'Login', '2024-03-14 09:47:29', '2024-03-14 09:47:29'),
(105, 117, 'Android', 'cq88ihU_SViLzWmIjisBeJ:APA91bHWMFkx6w2uCnWyXcQDJFU_0ub5g_2J5vCoQH_Ul5JRFip7osf9wP41kt_hfYVEc-T1QrrxKJXnTEXEESL31ftJYz0z3Adi8MT2nJp2pXdMhCdYzc-iWVO5fW2l89H12qEq8Mha', 'OPPO CPH2371', 'Login', '2024-03-15 13:57:00', '2024-03-15 13:57:00'),
(106, 118, 'Android', 'dTKTAP40SzGi4dx7q_4JcQ:APA91bG8rdqvNAeZdSTvXVGTA2r9JahrwvZlV71rBRd5YNAboA3Zg-aQC1j9tAoTOhgKdJ5tqIfMR7LedUajnZIqESDv3BBm-zvHR-fIK49HzPzqDWHkOVq2M9nVobgNbX9tSQL3MkBc', 'Xiaomi 2201116SI', 'LogOut', '2024-03-16 14:42:40', '2024-03-16 20:41:12'),
(107, 119, 'Android', 'eSAeMAPjSH2OSZxKKFhLzF:APA91bE8h_w-0g1whJQts4Xv24KJFos2KxYmTxKfp9Cc67gZXev7vYer0xuZxLBvzR6fcY_k4aUx7TP5RwcG-fOUECPC_dbh3S-cLnhtxdiNcB9Q2WU9facZCdnRFbowLYBALfb2kbRh', 'Vivo V2059', 'Login', '2024-03-17 18:18:18', '2024-03-17 18:18:18'),
(108, 120, 'Android', 'cXgJARkvRzi28S3u3xQOor:APA91bGEk5vd19f5mRT2TKjPcNAE0UlxEca0ef22FdAHTjnXxL-m9OFa7z87DlFjIfxu8XHu98M2YA7QIeZcE7gH6QuRjB4-mnrsPyoha7ZddlAXKwyxRx7GnuOCle2Wxew_azYEu0w6', 'OPPO CPH2127', 'LogOut', '2024-03-19 18:47:00', '2024-03-19 18:47:35'),
(109, 121, 'Android', 'cXgJARkvRzi28S3u3xQOor:APA91bGEk5vd19f5mRT2TKjPcNAE0UlxEca0ef22FdAHTjnXxL-m9OFa7z87DlFjIfxu8XHu98M2YA7QIeZcE7gH6QuRjB4-mnrsPyoha7ZddlAXKwyxRx7GnuOCle2Wxew_azYEu0w6', 'OPPO CPH2127', 'LogOut', '2024-03-19 18:48:34', '2024-03-19 18:48:41'),
(110, 122, 'Android', 'cdItqj0BRCit5VHvursRd9:APA91bEBAnQuFZkAKRYvW-9cW6DYkAYEIpmsqXxa56sEgKvwQGW0eAPEWN5szOwDUJ6vQFX37S0myecLVZIyI08tEytWZn9DduVcUFIClkoWC_D7NQRCrtzBrxgATJk3cYc8QTkmME3k', 'Vivo V2117', 'Login', '2024-03-20 12:25:07', '2024-03-20 12:25:07'),
(111, 123, 'Android', 'er7EloQtRWWYCAoh99-fdL:APA91bF7nZcU1p4LhpdopaHmJ6v-NOu_eCadT0y_sDxNvLtclTQbleoMpupGdUh_9lwMpi0TIwIySiwHMhs6jHtsMVOK56_cgwJ5r6XTl6R7lahMGh-rO2DuNfa4C0CfaPu7IrTvWG5n', 'Xiaomi 22127PC95I', 'Login', '2024-03-20 13:37:16', '2024-03-20 13:37:16'),
(112, 128, 'Android', 'fME0BxGaQkilTZ35G1lcjl:APA91bHDmMhNH6vgYdnZVWtOk9pDLKZQgX2o4G8l96qZXQ-fCs33Rd9-uuWoOCrT1tEAPMdRLRCj1y0kJT3hrCNAXUfgkAC3UCGBqo4PbWIZqcU45uCcnFzoa_e7qVHHmCaNG5TnHkQL', NULL, 'Login', '2024-03-29 11:02:53', '2024-05-08 16:40:28'),
(113, 23, 'Android', 'cQbbATrlS8WemDt4HhTu-L:APA91bFdjltVvMX7J508n084KfT8Gn_nqQGO9fhj_hMkLRN9suZ78-meDzzl2ZQTciKOXJLHmYDVv_PYdLX90I8ayR-LOY1CiqZmiibq1ug271km5Xvcr_CtC35y26s8yNIDIqGmR8gM', NULL, 'Login', '2024-03-29 12:15:50', '2024-05-08 16:58:00'),
(114, 131, 'Android', '7539518246', NULL, 'Login', '2024-03-30 13:20:30', '2024-03-30 13:20:30'),
(115, 134, 'Android', '7539518246', NULL, 'Login', '2024-04-01 17:56:21', '2024-04-01 17:56:21'),
(116, 136, 'iOS', '7539518246543673', NULL, 'Login', '2024-04-02 17:10:28', '2024-04-02 17:10:28'),
(117, 10, 'iOS', '7539518246543673', NULL, 'Login', '2024-04-02 17:17:48', '2024-04-02 17:17:48'),
(118, 139, 'Android', 'cfnX74lKQH2em2zPoEvNFR:APA91bGEK9XOo2wbpMgYwRFKfO4aXdes4NrnutexU62z3927x4iL7JqyW0q3GxKZPh7NDCmSRA6VpDiBuyXVnhwcmq3jPawRBIPqkT_6OsibVwCzjJqO9C_zawiF9EdIR3DW6UPdOlVu', NULL, 'Login', '2024-04-03 11:23:23', '2024-04-03 11:27:26'),
(119, 10, 'Android', 'dnG4uQjASFyXsiqHosEJoa:APA91bG8r4R3x55a-LDkIG58brntkDDZN-8aKxhobB5a6ndRcWzXqu3Sfcx_ufKJKg1c-OtgFj-j0RSwPdcjn8pJNrqT4fPQWIywpBXHSe7y1gK-BAt2oxMxim_03SljXTpwijJO4q5_', NULL, 'Login', '2024-04-03 11:56:56', '2024-05-13 17:24:29'),
(120, 13, 'Android', 'cfnX74lKQH2em2zPoEvNFR:APA91bGEK9XOo2wbpMgYwRFKfO4aXdes4NrnutexU62z3927x4iL7JqyW0q3GxKZPh7NDCmSRA6VpDiBuyXVnhwcmq3jPawRBIPqkT_6OsibVwCzjJqO9C_zawiF9EdIR3DW6UPdOlVu', NULL, 'Login', '2024-04-03 11:57:19', '2024-04-03 11:57:19'),
(121, 140, 'Android', 'cfnX74lKQH2em2zPoEvNFR:APA91bGEK9XOo2wbpMgYwRFKfO4aXdes4NrnutexU62z3927x4iL7JqyW0q3GxKZPh7NDCmSRA6VpDiBuyXVnhwcmq3jPawRBIPqkT_6OsibVwCzjJqO9C_zawiF9EdIR3DW6UPdOlVu', NULL, 'Login', '2024-04-04 11:59:24', '2024-04-04 11:59:24'),
(122, 144, 'Android', 'cfnX74lKQH2em2zPoEvNFR:APA91bGEK9XOo2wbpMgYwRFKfO4aXdes4NrnutexU62z3927x4iL7JqyW0q3GxKZPh7NDCmSRA6VpDiBuyXVnhwcmq3jPawRBIPqkT_6OsibVwCzjJqO9C_zawiF9EdIR3DW6UPdOlVu', NULL, 'Login', '2024-04-04 15:54:21', '2024-04-04 15:54:21'),
(123, 130, 'iOS', '7539518246543673', NULL, 'Login', '2024-04-04 18:47:23', '2024-04-04 18:47:23'),
(124, 23, 'iOS', '7539518246543673', NULL, 'Login', '2024-04-05 19:07:15', '2024-04-05 19:07:15'),
(125, 155, 'Android', 'cfnX74lKQH2em2zPoEvNFR:APA91bGEK9XOo2wbpMgYwRFKfO4aXdes4NrnutexU62z3927x4iL7JqyW0q3GxKZPh7NDCmSRA6VpDiBuyXVnhwcmq3jPawRBIPqkT_6OsibVwCzjJqO9C_zawiF9EdIR3DW6UPdOlVu', NULL, 'Login', '2024-04-05 19:37:18', '2024-04-09 12:45:52'),
(126, 9, 'Android', 'c0G3NWvNQUmpONSMt6PsKT:APA91bGIPL6JxpHGmJ729dR5RdtpmKWsIWkN21X0G274KNSbwaTB-QWQwPRxoVv1UsvfDU9vs3AlwaJG1Xy0bBLbyo31oT0-8eB8MpHh1A5WWks94TTwq6asxponjFoMU8HtI4s9zlBI', NULL, 'Login', '2024-04-11 10:26:22', '2024-04-11 10:26:22'),
(127, 6, 'Android', 'cErzThnTRH6srsBzLxyP0g:APA91bFVYM7ElkreAFiaf1FNoW2PYDjtqwuH77hTwp4LT7Vp4Wab8SIdUTRUtp7bdFhXNkHT9IqIK7yX2ffYBU1EspfnP2TnWOvVnkWz65wyyw5oejfW6foeym9SvsV-m8YjU_sqY_Wa', NULL, 'Login', '2024-04-17 12:23:10', '2024-06-21 13:26:29'),
(128, 161, 'Android', 'd-8XDFmDSu-563se9H-_x4:APA91bF3UZ72q6ivJ8P3V615Bvdd6TVHHMWEen_rpiCh25vK4YEPQ_suWkgnivQftcGyGYfpHS96sxMaU2QY_UKm0BjWrx3yv30Xt1a00JVCGAFk-24JR6CCWzV9CNm9yondXhUAKIdE', NULL, 'Login', '2024-04-18 10:23:17', '2024-04-18 10:23:17'),
(129, 127, 'Android', 'dnG4uQjASFyXsiqHosEJoa:APA91bG8r4R3x55a-LDkIG58brntkDDZN-8aKxhobB5a6ndRcWzXqu3Sfcx_ufKJKg1c-OtgFj-j0RSwPdcjn8pJNrqT4fPQWIywpBXHSe7y1gK-BAt2oxMxim_03SljXTpwijJO4q5_', NULL, 'Login', '2024-04-22 12:48:25', '2024-05-13 15:39:01'),
(130, 167, 'Android', 'dRNyQnGCSju2vM8Db7fC5s:APA91bEwewlSGvS6qtEBMrExJBqfYK-SIWP8t8z0B9tcmiIRQMznQqPIOEmEWLQ-QuAlkHxBNzPTzxvaX3YUbYsxYy3zQedFt1eq8VMZoP163p4cKpsb_7jLdpgvy1qh24I6OOD5TGU_', NULL, 'Login', '2024-05-10 10:16:58', '2024-06-25 12:24:13'),
(131, 169, 'Android', '2323545', NULL, 'Login', '2024-05-10 11:00:23', '2024-06-24 19:01:46'),
(132, 168, 'Android', 'ecoo-kwyQk68bI28UFXzo7:APA91bEYOXwDM1y1m3O5SK9DJoLR7rQe74ys4GmUmFXEA2OBxktCg_nx87NQ4crqLPCFUEYicng09B_53_KNyi6qto7-9MHLgPDA0yDrbUxDnKoy5jdtOrqNs-yaGOCMTSi9mdaFkRQF', NULL, 'Login', '2024-05-10 11:39:29', '2024-05-10 11:39:29'),
(133, 170, 'Android', 'ecoo-kwyQk68bI28UFXzo7:APA91bEYOXwDM1y1m3O5SK9DJoLR7rQe74ys4GmUmFXEA2OBxktCg_nx87NQ4crqLPCFUEYicng09B_53_KNyi6qto7-9MHLgPDA0yDrbUxDnKoy5jdtOrqNs-yaGOCMTSi9mdaFkRQF', NULL, 'Login', '2024-05-10 17:21:29', '2024-05-10 17:21:29'),
(134, 127, 'iOS', '7539518246543673', NULL, 'Login', '2024-05-10 18:56:44', '2024-05-10 18:56:44'),
(135, 177, 'iOS', '7539518246543673', NULL, 'Login', '2024-05-14 12:47:37', '2024-05-14 12:47:37'),
(136, 177, 'Android', 'ecoo-kwyQk68bI28UFXzo7:APA91bEYOXwDM1y1m3O5SK9DJoLR7rQe74ys4GmUmFXEA2OBxktCg_nx87NQ4crqLPCFUEYicng09B_53_KNyi6qto7-9MHLgPDA0yDrbUxDnKoy5jdtOrqNs-yaGOCMTSi9mdaFkRQF', NULL, 'Login', '2024-05-14 13:22:19', '2024-05-14 13:22:19'),
(137, 202, 'Android', '2323545', NULL, 'Login', '2024-06-25 11:46:53', '2024-06-25 11:46:53'),
(138, 203, 'Android', '2323545', NULL, 'Login', '2024-06-25 12:10:06', '2024-06-25 12:10:06'),
(139, 204, 'Android', '2323545', NULL, 'Login', '2024-06-25 12:11:58', '2024-06-25 12:11:58'),
(140, 205, 'Android', '2323545', NULL, 'Login', '2024-06-25 12:16:36', '2024-06-25 12:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `persent` int(15) DEFAULT NULL,
  `nature` enum('Magazine','Book','Merchandise') DEFAULT NULL,
  `product_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_id`)),
  `category_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`category_id`)),
  `author_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`author_id`)),
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `name`, `persent`, `nature`, `product_id`, `category_id`, `author_id`, `from_date`, `to_date`, `status`, `created_date`, `updated_date`) VALUES
(2, 'ss', 11, NULL, '\"[\\\"162\\\",\\\"163\\\",\\\"164\\\",\\\"165\\\",\\\"166\\\",\\\"450\\\",\\\"451\\\",\\\"452\\\",\\\"453\\\",\\\"454\\\"]\"', NULL, NULL, '2024-10-01', '2024-10-05', 'active', '2024-10-05 13:48:37', '2024-10-05 13:48:37'),
(3, 'diwali', 11, NULL, '\"[\\\"162\\\",\\\"163\\\",\\\"164\\\",\\\"165\\\",\\\"166\\\",\\\"167\\\",\\\"183\\\"]\"', NULL, NULL, '2024-10-01', '2024-10-06', 'active', '2024-10-05 14:07:58', '2024-10-05 14:07:58');

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
(51, 'Salary', 'active', '2023-05-11 05:21:02', '2023-05-11 05:21:02'),
(52, 'GST', 'active', '2023-05-11 05:21:15', '2023-05-11 05:21:15'),
(53, 'Staff Welfare', 'active', '2023-05-11 05:21:30', '2023-05-11 05:21:30'),
(54, 'Domestic Cylinders', 'active', '2023-05-11 05:21:57', '2023-05-11 05:21:57'),
(55, 'Reticulated', 'active', '2023-05-11 05:22:13', '2023-05-11 05:22:13'),
(56, '5 kg FTL', 'active', '2023-05-11 05:22:35', '2023-05-11 05:22:35'),
(57, 'BMCG', 'active', '2023-05-11 05:22:45', '2023-05-11 05:22:45'),
(58, 'Internal Transfer', 'active', '2023-05-11 05:23:10', '2023-05-11 05:23:10'),
(59, 'Mandatory Inspection', 'active', '2023-05-11 05:23:42', '2023-05-11 05:23:42'),
(60, 'Transport Contract', 'active', '2023-05-11 05:24:11', '2023-05-11 05:24:11'),
(61, 'Commercial Cylinders', 'active', '2023-05-11 05:24:40', '2023-05-11 05:24:40'),
(62, 'Lakshmi Ravindran  - Personal', 'active', '2023-05-11 05:25:35', '2023-05-11 05:29:58'),
(63, 'Ravindran  - Personal', 'active', '2023-05-11 05:28:46', '2023-05-11 05:29:40'),
(64, 'Rajee Manivannan  - Personal', 'active', '2023-05-11 05:29:11', '2023-05-11 05:29:48'),
(65, 'Manivannan - Personal', 'active', '2023-05-11 05:29:30', '2023-05-11 05:29:30'),
(66, 'Nagamalai Godown Maintenance', 'active', '2023-05-11 05:31:56', '2023-05-11 05:31:56'),
(67, 'Chekkanoorani Godown Maintenance', 'active', '2023-05-11 05:36:20', '2023-05-11 05:36:20'),
(68, 'Thanathavam Godown Maintenance', 'active', '2023-05-11 05:36:51', '2023-05-11 05:36:51'),
(69, 'Shri Balaji Educational Trust / Ashvattha School', 'active', '2023-05-11 05:37:52', '2023-05-11 05:50:55'),
(70, 'Shri Balaji Sivakasi Bharatgas Distributor', 'active', '2023-05-11 05:38:35', '2023-05-11 05:38:35'),
(71, 'Madurai Kadai', 'active', '2023-05-11 05:38:50', '2023-05-11 05:38:50'),
(72, 'TN 58 BE 1533 Maintenance', 'active', '2023-05-11 05:39:30', '2023-05-11 05:39:30'),
(73, 'TN 58 BE 1533 Diesal', 'active', '2023-05-11 05:39:54', '2023-05-11 05:39:54'),
(74, 'TN 58 BE 1533 Fastag', 'active', '2023-05-11 05:40:20', '2023-05-11 05:40:20'),
(75, 'TN 58 BD 1452 Maintenance', 'active', '2023-05-11 05:40:45', '2023-05-11 05:40:45'),
(76, 'TN 58 BD 1452 Diesal', 'active', '2023-05-11 05:41:09', '2023-05-11 05:41:09'),
(77, 'TN 58 BD 1452 Fastag', 'active', '2023-05-11 05:41:43', '2023-05-11 05:41:43'),
(78, 'TN 58 AQ 0482 Maintenance', 'active', '2023-05-11 05:42:15', '2023-05-11 05:42:15'),
(79, 'TN 58 AQ 0482 Diesal', 'active', '2023-05-11 05:42:37', '2023-05-11 05:42:37'),
(80, 'TN 58 AQ 0482 Fastag', 'active', '2023-05-11 05:43:04', '2023-05-11 05:43:04'),
(81, 'TN 58 AR 1566 Maintenance', 'active', '2023-05-11 05:43:32', '2023-05-11 05:43:32'),
(82, 'TN 58 AR 1566 Diesal', 'active', '2023-05-11 05:43:52', '2023-05-11 05:43:52'),
(83, 'TN 58 AR 1566 Fastag', 'active', '2023-05-11 05:44:18', '2023-05-11 05:44:18'),
(84, 'TN 58 AQ 1609 Maintenance', 'active', '2023-05-11 05:46:05', '2023-05-11 05:46:05'),
(85, 'TN 58 AQ 1609 Diesal', 'active', '2023-05-11 05:46:17', '2023-05-11 05:46:17'),
(86, 'TN 58 AQ 1609 Fastag', 'active', '2023-05-11 05:47:00', '2023-05-11 05:47:00'),
(87, 'TN 58 BF 3557 Maintenance', 'active', '2023-05-11 05:47:48', '2023-05-11 05:47:48'),
(88, 'TN 58 BF 3557 Diesal', 'active', '2023-05-11 05:47:56', '2023-05-11 05:47:56'),
(89, 'TN 58 BF 3557 Fastag', 'active', '2023-05-11 05:48:08', '2023-05-11 05:48:08'),
(90, 'TN 58 AK 4741 Maintenance', 'active', '2023-05-11 05:48:42', '2023-05-11 05:48:42'),
(91, 'TN 58 AK 4741 Diesal', 'active', '2023-05-11 05:48:53', '2023-05-11 05:48:53'),
(92, 'TN 58 AK 4741 Fastag', 'active', '2023-05-11 05:49:03', '2023-05-11 05:49:03'),
(93, 'Delivery Boys', 'active', '2023-05-11 05:49:21', '2023-05-11 05:49:21'),
(94, 'Perayur', 'active', '2023-05-11 05:49:36', '2023-05-11 05:49:36'),
(95, 'PF ESI', 'active', '2023-05-11 06:36:35', '2023-05-11 06:36:35'),
(96, 'Income Tax', 'active', '2023-05-11 06:36:51', '2023-05-11 06:36:51'),
(97, 'Interest and EMI', 'active', '2023-05-11 06:37:21', '2023-05-11 06:37:21'),
(98, 'BINT', 'active', '2023-05-11 06:37:35', '2023-05-11 06:37:35'),
(99, 'OB', 'active', '2023-05-11 06:37:40', '2023-05-11 06:37:40'),
(100, 'CB', 'active', '2023-05-11 06:37:45', '2023-05-11 06:37:45'),
(101, 'Hobey', 'active', '2023-05-11 08:56:12', '2023-05-12 13:48:27'),
(102, 'Cylinder Deposit', 'active', '2023-05-11 11:23:01', '2023-05-11 11:23:01'),
(103, 'Service Charge', 'active', '2023-05-11 11:23:15', '2023-05-11 11:23:15'),
(104, 'Stationary', 'active', '2023-05-11 11:23:35', '2023-05-11 11:23:35'),
(105, 'Uniform', 'active', '2023-05-11 11:23:46', '2023-05-11 11:23:46'),
(106, 'Residance For Padmanaban', 'active', '2023-05-12 13:45:14', '2023-05-12 13:45:14'),
(107, 'Stove Sales', 'active', '2023-05-12 13:45:38', '2023-05-12 13:48:59'),
(108, 'Suraksha Sales', 'active', '2023-05-12 13:45:57', '2023-05-12 13:49:16'),
(109, 'Elango / Prabha / Pradhap', 'active', '2023-05-12 13:46:40', '2023-05-12 13:49:45'),
(110, 'Regulator Sales', 'active', '2023-05-12 13:47:19', '2023-05-12 13:50:02'),
(111, 'Pooja Expences', 'active', '2023-05-12 13:47:51', '2023-05-12 13:50:18'),
(112, 'SBC', 'active', '2023-05-12 13:48:01', '2023-05-12 13:48:01'),
(114, 'Online Payment', 'active', '2023-05-20 05:38:04', '2023-05-20 05:38:04'),
(119, 'New Connection', 'active', '2023-06-23 06:25:57', '2023-06-23 06:25:57'),
(120, 'Petrol Allowances', 'active', '2023-07-05 06:59:35', '2023-07-05 06:59:35');

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
-- Table structure for table `magazines`
--

CREATE TABLE `magazines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `issue_period` enum('Daily','Weekly','Monthly') NOT NULL DEFAULT 'Daily',
  `issue_price` double NOT NULL,
  `digital_price` double NOT NULL,
  `digital` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `language` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `average_ratings` double NOT NULL,
  `ratings_count` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `magazines`
--

INSERT INTO `magazines` (`id`, `name`, `issue_period`, `issue_price`, `digital_price`, `digital`, `language`, `topic`, `image`, `average_ratings`, `ratings_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 'தமிழ்த் தேசியத் தமிழர் கண்ணோட்டம்', 'Monthly', 20, 20, 'Yes', 'தமிழ்', 'தமிழ்த்தேசியம்', 'MAG_183824467005_29_2024_08_06_pm.html', 0, 0, 'Active', '2023-10-18 15:42:12', '2024-05-29 14:36:46');

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
(1, NULL, NULL, 'Picture1-190875460-02_24_2024_10_49_am.jpg', NULL, 'Top', NULL, 1, 'Active', '2023-01-20 11:45:16', '2024-02-24 10:49:54'),
(2, NULL, NULL, 'WhatsApp Image 2023-10-19 at 5.24.47 PM-1815875047-10_19_2023_07_35_pm.jpeg', NULL, 'Middle', NULL, 1, 'Active', '2023-01-20 11:45:29', '2023-10-19 19:35:28'),
(3, NULL, NULL, 'Picture2-1901641781-02_21_2024_02_45_pm.jpg', NULL, 'Top', NULL, 2, 'Inactive', '2023-01-20 11:47:17', '2024-02-21 14:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `modes`
--

CREATE TABLE `modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `magazine_id` bigint(20) UNSIGNED NOT NULL,
  `period_id` bigint(20) UNSIGNED NOT NULL,
  `print_price` double NOT NULL,
  `digital_price` double NOT NULL,
  `combo_price` double NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modes`
--

INSERT INTO `modes` (`id`, `magazine_id`, `period_id`, `print_price`, `digital_price`, `combo_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2000, 1000, 0, 'Active', '2024-03-07 15:12:51', '2024-04-08 18:21:14'),
(2, 1, 2, 650, 325, 0, 'Active', '2024-03-07 15:14:38', '2024-04-08 18:21:35'),
(3, 1, 1, 220, 110, 0, 'Active', '2024-03-08 16:21:02', '2024-04-08 18:21:45'),
(4, 1, 4, 1000, 500, 1350, 'Active', '2024-03-11 09:31:46', '2024-04-15 12:38:14');

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
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `news`, `url`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mega Offer BYE it , USE it', NULL, 2, 'Active', '2023-02-15 11:20:11', '2024-02-10 13:29:00'),
(2, 'Get 10% Discount on your first purchase in Madurai Kadai App', NULL, 1, 'Active', '2024-02-10 17:11:55', '2024-02-10 17:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` longtext NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `notifiable_id` int(20) DEFAULT NULL,
  `notifiable_type` varchar(255) DEFAULT NULL,
  `posted_on` datetime NOT NULL,
  `read_at` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `body`, `image`, `notifiable_id`, `notifiable_type`, `posted_on`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'New Products', 'Hurry up', '', NULL, NULL, '2023-04-27 18:50:51', NULL, '2023-04-27 18:50:51', '2023-04-27 18:50:51'),
(2, 'New Product', 'Hurry Up', '', NULL, NULL, '2023-04-27 18:52:00', NULL, '2023-04-27 18:52:00', '2023-04-27 18:52:00'),
(3, 'New Product', 'Hurry Up', '', NULL, NULL, '2023-04-27 18:52:09', NULL, '2023-04-27 18:52:09', '2023-04-27 18:52:09'),
(4, 'Test', 'Test', 'Untitled design-1921347134-04_11_2024_04_19_pm.jpg', NULL, NULL, '2024-04-11 16:19:38', NULL, '2024-04-11 16:19:38', '2024-04-11 16:19:38'),
(5, 'Notification', 'Tset', '', NULL, NULL, '2024-04-11 16:23:18', NULL, '2024-04-11 16:23:18', '2024-04-11 16:23:18'),
(6, 'Notification', 'Test', '', NULL, NULL, '2024-04-11 16:31:31', NULL, '2024-04-11 16:31:31', '2024-04-11 16:31:31'),
(7, 'Test', 'Mother\'s day wishes', 'mothersday-wishes-in-tamil_01-254310826-05_08_2024_07_29_pm.jpg', NULL, NULL, '2024-05-08 19:29:55', NULL, '2024-05-08 19:29:55', '2024-05-08 19:29:55'),
(8, 'Test', 'Test', '', NULL, NULL, '2024-05-08 19:31:24', NULL, '2024-05-08 19:31:24', '2024-05-08 19:31:24'),
(9, 'Test', 'Test', 'mothersday-wishes-in-tamil_01-884718685-05_08_2024_07_31_pm.jpg', NULL, NULL, '2024-05-08 19:31:36', NULL, '2024-05-08 19:31:36', '2024-05-08 19:31:36'),
(10, 'Mother\'s day', 'Happy mother\'s day', '', NULL, NULL, '2024-05-08 19:34:00', NULL, '2024-05-08 19:34:00', '2024-05-08 19:34:00'),
(11, 'May day', 'Happy may day', 'mothersday-wishes-in-tamil_01-2066879162-05_08_2024_07_35_pm.jpg', NULL, NULL, '2024-05-08 19:35:36', NULL, '2024-05-08 19:35:36', '2024-05-08 19:35:36'),
(12, 'Mothers day', 'Happy mother\'s day', 'mothersday-wishes-in-tamil_01-1901897598-05_13_2024_03_31_pm.jpg', NULL, NULL, '2024-05-13 15:31:45', NULL, '2024-05-13 15:31:45', '2024-05-13 15:31:45');

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
('0009714a258aaba0a564aab252fa7e6126a142cd31c09b4ad65cc3f78d78e2b74f57532a29939ec6', 70, 1, 'token', '[]', 0, '2023-12-20 16:19:49', '2023-12-20 16:19:49', '2024-12-20 16:19:49'),
('00c81ca316a60f8f99c042b42bc32f108e6de432c0d1664d8ac621f07910cdb20e698aebe622f9e8', 76, 1, 'token', '[]', 0, '2024-01-02 10:19:35', '2024-01-02 10:19:35', '2025-01-02 10:19:35'),
('0244ae95096da7a707a7a79a512cc25d15e6bb3829af8f6bd1c64bcd3ee282741482881f9e98991f', 23, 1, 'token', '[]', 0, '2024-03-30 10:38:19', '2024-03-30 10:38:19', '2025-03-30 10:38:19'),
('024aba3d147f7020836f1e1e48b178f8d55b25820ea2fcf70a9025bce988edb2c62abd88a0e82917', 25, 1, 'token', '[]', 1, '2023-11-10 15:54:52', '2023-11-10 15:54:52', '2024-11-10 15:54:52'),
('04c36215f6ad9f44a6ec74d3fb75049bccd940229a0ad59d5c0d31e9746d056382de5a977a518c3d', 89, 1, 'token', '[]', 0, '2024-02-13 16:38:09', '2024-02-13 16:38:09', '2025-02-13 16:38:09'),
('062fa0a763632f653cdd25658a219ba119aacbcff0a403d025914e3f8fb1254278bf10a15780904e', 128, 1, 'token', '[]', 0, '2024-03-29 12:15:25', '2024-03-29 12:15:25', '2025-03-29 12:15:25'),
('0697f8cbdc07b8e46289ab3021d9b2a1d6cf269f4affeba7232e93022da52d56423ee1e4c6ecaef4', 67, 1, 'token', '[]', 0, '2023-12-14 10:39:19', '2023-12-14 10:39:19', '2024-12-14 10:39:19'),
('06cdd424d91d9af99446679e89fbb482562a58f9805898bd4137bcddf7309e28becbb0f1a858bcaa', 167, 1, 'token', '[]', 1, '2024-06-21 17:29:04', '2024-06-21 17:29:04', '2025-06-21 17:29:04'),
('087385ccf8b1053a510da96d8d8bb767181fc802a2e9c0327f1c9b49affb3d92a332920968258e01', 59, 1, 'token', '[]', 0, '2023-12-04 15:33:19', '2023-12-04 15:33:19', '2024-12-04 15:33:19'),
('0995402934d4b57eac28f8084f190b664af8228f9f334af3435c1960e60d75a4eaf4c299168c4c6b', 180, 1, 'token', '[]', 1, '2024-05-16 16:04:06', '2024-05-16 16:04:06', '2025-05-16 16:04:06'),
('09effc56b29548b992b985448b3fc1af356530c6acaf22387a1215fe562d97736336732c489f0225', 23, 1, 'token', '[]', 1, '2024-04-12 11:21:31', '2024-04-12 11:21:31', '2025-04-12 11:21:31'),
('0ab5b93038e17f0e832a3a02bdf1421d496707077a31cfca1f7519c192ad540fa301750e87ae3f2b', 164, 1, 'token', '[]', 0, '2024-05-08 15:41:57', '2024-05-08 15:41:57', '2025-05-08 15:41:57'),
('0b06d22f09fc61da0ab142a04f74dd292cd8efe7c1f59eb66a0a1dd19ec3b2bdcaf53e65c8871469', 62, 1, 'token', '[]', 0, '2023-12-08 11:59:26', '2023-12-08 11:59:26', '2024-12-08 11:59:26'),
('0b512e571db8c325529899b4e05591c3b97afbb8fa49502bb3f6b54fdc363cff0c9c5dd9fabc6bb5', 144, 1, 'token', '[]', 1, '2024-04-04 15:48:57', '2024-04-04 15:48:57', '2025-04-04 15:48:57'),
('0b727ddbed5e4fdb9d2b68d005c566e2d83320ce4a7adf664ae9199fc59efc7414bdf3617799f897', 98, 1, 'token', '[]', 0, '2024-02-25 10:00:53', '2024-02-25 10:00:53', '2025-02-25 10:00:53'),
('0b750aeeabe21b3985e7166216d4c4469922d94fbd5a7265cb3d67cc8d77eaa6d20758793fbd7930', 167, 1, 'token', '[]', 1, '2024-05-10 10:53:30', '2024-05-10 10:53:30', '2025-05-10 10:53:30'),
('0cddfc300590c75ff428b20ce49d91a45b81ab8a67f67c9e22ae6dd9f6f451233c483a2944314d3d', 137, 1, 'token', '[]', 0, '2024-04-02 16:05:24', '2024-04-02 16:05:24', '2025-04-02 16:05:24'),
('0dec25ed83f32b3f63d1dc060833de6ec3c5a932f6104c9f77e2a866d9cccd8fba16b198c8d37c83', 72, 1, 'token', '[]', 0, '2023-12-22 15:16:50', '2023-12-22 15:16:50', '2024-12-22 15:16:50'),
('0e78c280a8970107a779703d2fee89f6e44c064a551f22d09b25071fd1b8258f98fc713729f08932', 43, 1, 'token', '[]', 0, '2023-11-28 17:28:23', '2023-11-28 17:28:23', '2024-11-28 17:28:23'),
('0ecca17588237f93af19ba3a3ee46870fcbb2ddbd7e1e1f92e9a767dbe0a809447fdf499799e4487', 10, 1, 'token', '[]', 1, '2024-05-13 18:08:39', '2024-05-13 18:08:39', '2025-05-13 18:08:39'),
('0ede12988be997967223b63b50bf8e0cea6788cf6e884566882afe0be69928e4deabe34534c9bb0e', 167, 1, 'token', '[]', 0, '2024-05-14 17:53:17', '2024-05-14 17:53:17', '2025-05-14 17:53:17'),
('0f39b2786f89b2eb8a0c368203ab0e2718b636afec14eddf280dfe9b8e8381054ea31b33ca17c359', 39, 1, 'token', '[]', 1, '2024-03-11 11:21:34', '2024-03-11 11:21:34', '2025-03-11 11:21:34'),
('10c8a5b339cbdaf7fc081a5d9d1bcc68056bdae35489f134b69695efc910266782522334220f20ad', 31, 1, 'token', '[]', 0, '2023-10-17 08:24:07', '2023-10-17 08:24:07', '2024-10-17 08:24:07'),
('11f216b97c40bf71a76152659991f7dc3ad8daf8cc42c296f0700ec9569edf25f30d7e6bd3f90689', 39, 1, 'token', '[]', 0, '2023-12-18 11:37:56', '2023-12-18 11:37:56', '2024-12-18 11:37:56'),
('13006f66c02ab19d1d2277eafc025dc974306dba45fb19286179c53f72f44fde07674bc07b2a0a59', 204, 1, 'token', '[]', 0, '2024-06-25 12:11:58', '2024-06-25 12:11:58', '2025-06-25 12:11:58'),
('13e5b82738835e810bb740d05a69480c7f448fcc4c4f60634371e1f02c88ccad8e62df04e7e74219', 65, 1, 'token', '[]', 0, '2023-12-11 15:00:11', '2023-12-11 15:00:11', '2024-12-11 15:00:11'),
('147e4e71686cc11a740e5577abc902d8dfd8a5038d564fae6ebd2ddd5653be689a8cd4671f724a32', 170, 1, 'token', '[]', 1, '2024-05-14 11:50:08', '2024-05-14 11:50:08', '2025-05-14 11:50:08'),
('1773201d98a4d8cacf73f30deb721db5d7d87f67d3e30d1133220e4d58547f98afcc4b1be442bf66', 148, 1, 'token', '[]', 0, '2024-04-05 12:11:44', '2024-04-05 12:11:44', '2025-04-05 12:11:44'),
('17e76b033f00523414977e9b7e7068ddf37690d3bf75cb97929d1e152b488790b024c3a3bdc5591f', 6, 1, 'token', '[]', 0, '2023-05-26 12:05:43', '2023-05-26 12:05:43', '2024-05-26 12:05:43'),
('190862b7a1a996c73f4edac2eb7d7f7d9cf6adbf94d1f19445298f1b4a1df7ba741dd1bc47c2d27b', 68, 1, 'token', '[]', 0, '2023-12-17 20:08:26', '2023-12-17 20:08:26', '2024-12-17 20:08:26'),
('193492df189cac93b51009f04fc00133443e2d1a126fe00cc697fe2bbc96084151fd9710ae8a983d', 23, 1, 'token', '[]', 1, '2024-04-11 16:55:44', '2024-04-11 16:55:44', '2025-04-11 16:55:44'),
('1970b44835a3339c9451c67f45b50a2109df1eed3e8a412e6533b3d24675cdda667b756bad95cee3', 114, 1, 'token', '[]', 0, '2024-03-13 14:49:46', '2024-03-13 14:49:46', '2025-03-13 14:49:46'),
('19f091b752309834f3d38cd0dbc683f755d26a8bd8c05654f7fa3e8822207d7933b6f208f5d47218', 48, 1, 'token', '[]', 0, '2023-12-01 09:03:22', '2023-12-01 09:03:22', '2024-12-01 09:03:22'),
('1b63fd50a2132ef732993bf3c4e6c30fc27eb39f73fff8e578dfee741d011480610b65b456718b9a', 142, 1, 'token', '[]', 0, '2024-04-04 10:43:15', '2024-04-04 10:43:15', '2025-04-04 10:43:15'),
('1b725b02f67249fc3a39c40f8dfe4f573d682b91982349e4cbb1e703871fc21ccfd7106e1aac3246', 128, 1, 'token', '[]', 1, '2024-05-08 16:50:41', '2024-05-08 16:50:41', '2025-05-08 16:50:41'),
('1c322efbea5a7fb28b4f20913d2e186ad16a2e26df626dbb18a2cf4993e98c1591609689b1c722f9', 23, 1, 'token', '[]', 1, '2024-04-22 12:47:09', '2024-04-22 12:47:09', '2025-04-22 12:47:09'),
('1ca25c4e020d103c632a6ffa1fca18eacc79d294dd26dcd2736c36befc5f78501a44b090da2a2f13', 85, 1, 'token', '[]', 0, '2024-02-08 12:57:48', '2024-02-08 12:57:48', '2025-02-08 12:57:48'),
('1cbd887dc4d44ae701c125db8468c1e3bcd3769118e1fbe0be0a077467cd7e5d29a10619565055a6', 6, 1, 'token', '[]', 1, '2023-08-16 14:30:27', '2023-08-16 14:30:27', '2024-08-16 14:30:27'),
('1cf77cdaeef027beffca9a836aa9283820d6fd00e9de588740508e63569764917d5fc0b5d60835d0', 134, 1, 'token', '[]', 0, '2024-04-01 17:56:21', '2024-04-01 17:56:21', '2025-04-01 17:56:21'),
('1e9769d624edc62e7b0ba4a57386898eda8911ec5faf0cfbd76be3df2b87345ebe0e143dc23170cb', 128, 1, 'token', '[]', 0, '2024-03-29 12:42:22', '2024-03-29 12:42:22', '2025-03-29 12:42:22'),
('1ef530459d2e760c43833859fdc224888be05f27151b9514bba707c43e4ae6450df093e2ff94a02d', 42, 1, 'token', '[]', 0, '2023-11-28 17:18:02', '2023-11-28 17:18:02', '2024-11-28 17:18:02'),
('1f17101fcce6cd2e775f994477e4411167ba05c48056b7a8d5da08d05e981e769549e88ea35ce570', 167, 1, 'token', '[]', 0, '2024-05-10 18:12:39', '2024-05-10 18:12:39', '2025-05-10 18:12:39'),
('1fc07d87f7ebde53d6fba386f90c83c61182055d3707a5c298057e1f9b202e94d7d2f079c71164af', 168, 1, 'token', '[]', 1, '2024-05-13 09:42:58', '2024-05-13 09:42:58', '2025-05-13 09:42:58'),
('212b3851ac5f5b0afc5305627311218406a7fbfc7530b7c90bc6a25b92f1701cc9bf975ab714a0e4', 82, 1, 'token', '[]', 0, '2024-01-17 23:36:29', '2024-01-17 23:36:29', '2025-01-17 23:36:29'),
('22bf7d64e7c9f9ebfd5f346c4127c8e74a433f3efd92b092ffe9735426ad06dbde31e5b68d57c859', 23, 1, 'token', '[]', 1, '2024-05-08 16:58:00', '2024-05-08 16:58:00', '2025-05-08 16:58:00'),
('245f36349afd70d1b68a5c3a865520c69669677dca20aa55530515f95ebb228e1cb8890fb104ed25', 71, 1, 'token', '[]', 1, '2023-12-21 13:13:38', '2023-12-21 13:13:38', '2024-12-21 13:13:38'),
('24a9edf1a83d7192513618b0d759842c0d7ad6c5f1d71bbcd48f5b3f41d77e079042f87736b434ed', 205, 1, 'token', '[]', 0, '2024-06-25 12:20:30', '2024-06-25 12:20:30', '2025-06-25 12:20:30'),
('24ef4d447d89940b3ad253209785ad98612e169a2df3e9e8e1d207f834920985d8b36fa42f181e88', 97, 1, 'token', '[]', 0, '2024-02-23 01:06:02', '2024-02-23 01:06:02', '2025-02-23 01:06:02'),
('26fc65c82bd6cce73a382f8653d8274d14b4dc85000e8b89b472536ab0afbed718e53635bec0432e', 23, 1, 'token', '[]', 1, '2024-05-08 16:30:35', '2024-05-08 16:30:35', '2025-05-08 16:30:35'),
('27247e42129d5e183a87d2c222cf4982dec78f39605d921c70390924bcd2d6d20b9163f145b2f059', 128, 1, 'token', '[]', 0, '2024-04-02 18:42:41', '2024-04-02 18:42:41', '2025-04-02 18:42:41'),
('273669d2176d522be1d387dfc7e78eb9d932aa0808cb6fa49b10167417990321aab019fb0b6993fd', 168, 1, 'token', '[]', 1, '2024-05-14 12:25:44', '2024-05-14 12:25:44', '2025-05-14 12:25:44'),
('27d83d73baad6ca83388025c465e21f6fd7e7b71d2a8347ed2a27a6a2f012145f55221de1f8c415a', 77, 1, 'token', '[]', 0, '2024-01-10 23:33:30', '2024-01-10 23:33:30', '2025-01-10 23:33:30'),
('28dbbbecc00fd5c31abc3899f5fecf4181218df7f05dd93427221baa443e912d5182b40c536e31dd', 6, 1, 'token', '[]', 0, '2023-08-19 16:33:16', '2023-08-19 16:33:16', '2024-08-19 16:33:16'),
('28f3b38ed0c5547eb87b0d313b160d7cbefe7bfc2cdb919762a790d010c87cb73e94dcc6f2a36e48', 9, 1, 'token', '[]', 1, '2024-04-11 10:26:22', '2024-04-11 10:26:22', '2025-04-11 10:26:22'),
('29e4060f282c999c4394ebd00da151b2e869a01af680a7ca1ec4052cec52f1cf0fd0768162a88368', 47, 1, 'token', '[]', 0, '2023-12-01 08:28:31', '2023-12-01 08:28:31', '2024-12-01 08:28:31'),
('2b0c9ec5d3133ccee6ef5d890e32271b29cbcad30e357d6bd6521424c4cb3cd2b40a416129b96fc3', 190, 1, 'token', '[]', 1, '2024-05-21 17:26:58', '2024-05-21 17:26:58', '2025-05-21 17:26:58'),
('2b86bc99e0fe6f10f2ed3c12c829d9e93896b695b989f080827987337966b6c160d98ddf4c66da3c', 2, 1, 'token', '[]', 0, '2023-05-08 18:17:21', '2023-05-08 18:17:21', '2024-05-08 18:17:21'),
('2d072f8bb5e69643b8c61d9b2f1925643745fa8aaaf50baa9f986d5b8a527f0c0e377f8ce2f4b5e9', 46, 1, 'token', '[]', 0, '2023-12-06 03:13:55', '2023-12-06 03:13:55', '2024-12-06 03:13:55'),
('2d9053482b4fe30a8273de8a7cba43518f33be69b5d341d1ee2e6c193a7b05f5513d6fd7bd05f2ba', 155, 1, 'token', '[]', 1, '2024-04-05 19:37:18', '2024-04-05 19:37:18', '2025-04-05 19:37:18'),
('2eccb4a3f84d62036572be7f9d93d3134d658c32364f1832e9fcf1abf03c15e5535a761af4a10db6', 128, 1, 'token', '[]', 0, '2024-04-04 14:28:35', '2024-04-04 14:28:35', '2025-04-04 14:28:35'),
('2ee494dd977677fe6e807806a90e630a3cc2e12535e3a9080036cb311115f92ff2b607df22a83174', 193, 1, 'token', '[]', 1, '2024-05-21 18:02:20', '2024-05-21 18:02:20', '2025-05-21 18:02:20'),
('30104dd18925a1d47aaea7c8d3424d752b2ccd86ec3eea9161499e2b7d5c25a3e81fc43e628cc29d', 144, 1, 'token', '[]', 1, '2024-04-04 15:54:21', '2024-04-04 15:54:21', '2025-04-04 15:54:21'),
('311e96760168a65fa3998a6fd32b41b9052f643488d4ca756a6622c0e80e0af68871f355c469752b', 6, 1, 'token', '[]', 1, '2023-10-20 17:54:46', '2023-10-20 17:54:46', '2024-10-20 17:54:46'),
('317e512bd8c81432cd9efeac4c8f09dfd0810217e3f99885897cdf91b87de1f6f4ae99908030ad4f', 13, 1, 'token', '[]', 0, '2023-04-02 11:26:12', '2023-04-02 11:26:12', '2024-04-02 11:26:12'),
('317ee45674d4d9bd8024ba399d232b928abeffea6e7c3b4f62a2c9dacd87c7c98a38c8f89d5849b3', 6, 1, 'token', '[]', 0, '2024-06-21 13:26:29', '2024-06-21 13:26:29', '2025-06-21 13:26:29'),
('31c1cc67eb29913510fe1e652644a71d9eb9e9a17288d528e364e8026c49bb4349a83275998c0726', 138, 1, 'token', '[]', 0, '2024-04-02 17:21:19', '2024-04-02 17:21:19', '2025-04-02 17:21:19'),
('322bcff0f8ab83f618d24c7fd066e8fec6e92aca53c16fb9e6c022d3fd8f35db38b7f712b109bcfc', 84, 1, 'token', '[]', 0, '2024-02-07 18:09:20', '2024-02-07 18:09:20', '2025-02-07 18:09:20'),
('32315207630faf66daffb2a82cacd59c4816af7c7aec5511b44b03cd188505c8b3f14e961a32fbd2', 128, 1, 'token', '[]', 0, '2024-03-30 13:06:35', '2024-03-30 13:06:35', '2025-03-30 13:06:35'),
('323c55e24bc4286d25c950d4b95f85cf1e461692a1f302bac0553c744b907c3117a1f40d2985637a', 2, 1, 'token', '[]', 0, '2023-01-12 19:48:44', '2023-01-12 19:48:44', '2024-01-12 19:48:44'),
('32912d1eec0d6d8a17cb2067943679ab5dcc73c4761276483f013803c12d8352e1438ed9ae37d580', 8, 1, 'token', '[]', 0, '2023-04-18 13:31:32', '2023-04-18 13:31:32', '2024-04-18 13:31:32'),
('3458e15164b6eff7ca554615b412874d886359accb9daf05bb86e9ed416120e637f9153de7a897ad', 139, 1, 'token', '[]', 0, '2024-04-02 20:15:18', '2024-04-02 20:15:18', '2025-04-02 20:15:18'),
('34e0d4a48d72b07eb26ffaff5ac2252757a882597f5f65e9592e4d52d13e59fb6d80e535e9e7cbca', 28, 1, 'token', '[]', 1, '2023-09-22 12:37:19', '2023-09-22 12:37:19', '2024-09-22 12:37:19'),
('34e6dcdea04a0d8af5da530cac9ac30aaded918c2913a4cace43bc2ef295c17f2a01b7e207c23cc8', 10, 1, 'token', '[]', 0, '2024-04-02 17:17:48', '2024-04-02 17:17:48', '2025-04-02 17:17:48'),
('36a44f8c01a9be64c31d6e717875e1d8c8d02f5384432b31d0690167dc8621e936501999bcabb615', 109, 1, 'token', '[]', 0, '2024-03-10 00:00:25', '2024-03-10 00:00:25', '2025-03-10 00:00:25'),
('379067eff88f4098038302fb7adfdb4f5a604f44c22cb73ce1d346880ee333eaccececca2b2e4546', 151, 1, 'token', '[]', 0, '2024-04-05 17:05:21', '2024-04-05 17:05:21', '2025-04-05 17:05:21'),
('38190d69d58ff6a5bb854bf46d777dcce9688043fab7f19920aca58c4b566fdbeac973d2b0aa52cc', 25, 1, 'token', '[]', 0, '2023-11-10 19:21:21', '2023-11-10 19:21:21', '2024-11-10 19:21:21'),
('3876c1387e5eaaece3d0a9f47fa83218f3a98e0f6b13f994a259a3b6b1180ad40172e0f2c3b236ef', 121, 1, 'token', '[]', 1, '2024-03-19 18:48:34', '2024-03-19 18:48:34', '2025-03-19 18:48:34'),
('3998cea0784e5266cd93fed3cb9fe272ae53a75d21cb8991c4e8ab83b7c5d3add3967f4355bfbeb5', 167, 1, 'token', '[]', 0, '2024-06-03 18:03:47', '2024-06-03 18:03:47', '2025-06-03 18:03:47'),
('399a5c02a03e92a1b7c683d65649692ef4f3be38bd4231913828fc54cfdda32183e4af3cb2a54fa9', 128, 1, 'token', '[]', 0, '2024-03-29 11:19:49', '2024-03-29 11:19:49', '2025-03-29 11:19:49'),
('39a11136fa704ef8befe0e037fda87fef4da07989a9398d859ceb45f9ee2ece96faa71dcf5d54f63', 81, 1, 'token', '[]', 0, '2024-01-17 15:55:13', '2024-01-17 15:55:13', '2025-01-17 15:55:13'),
('39cdb00f2a35ac241990d09f34e01ebe6e90a9dbe31042850fb5515a8e1574a5cac70a8407025f91', 6, 1, 'token', '[]', 0, '2023-02-15 12:17:17', '2023-02-15 12:17:17', '2024-02-15 12:17:17'),
('3a5eaab404e5f6b548b10d3d3cc225ef192a0941d4ef81e064ffa63604cf47e750e089d4f0c904f4', 112, 1, 'token', '[]', 0, '2024-03-12 19:15:50', '2024-03-12 19:15:50', '2025-03-12 19:15:50'),
('3ab8b7092294e0f1c61fe5b8a41ffc8bf5442baeec614d5f6a8a8bee5c0712460977fad4e11463ad', 161, 1, 'token', '[]', 0, '2024-04-18 10:23:17', '2024-04-18 10:23:17', '2025-04-18 10:23:17'),
('3bdcac6e4279f480d73c6b2f14da7303b751328f0d5baab9122dff8d2ae469f922f752bedcaa0a6b', 23, 1, 'token', '[]', 0, '2024-04-05 19:07:15', '2024-04-05 19:07:15', '2025-04-05 19:07:15'),
('3bdde687efeb8d3a8862171f1c6f596db0ceadbabc76a0e9568bd8945aae6f2da636c8d648833c3c', 167, 1, 'token', '[]', 1, '2024-05-21 16:37:25', '2024-05-21 16:37:25', '2025-05-21 16:37:25'),
('3c6934ab2a06cb99786826b8b46a2e1cdfc8c3dbbb0ada67a04ab46924f1a48da89b50df300e6f40', 178, 1, 'token', '[]', 0, '2024-05-14 13:26:24', '2024-05-14 13:26:24', '2025-05-14 13:26:24'),
('3d0c83983d24ca316e7a8fb31c39cbe422548f81cc09214ecd1fe752116d4dddf54020879f26233d', 205, 1, 'token', '[]', 0, '2024-06-25 12:16:36', '2024-06-25 12:16:36', '2025-06-25 12:16:36'),
('3d9aac96fc7cee902259ececcc27c815fd0eebb118c8005c54bbf1fcd66e0163afec61e28eb0167a', 167, 1, 'token', '[]', 0, '2024-06-03 17:57:06', '2024-06-03 17:57:06', '2025-06-03 17:57:06'),
('3de7ce33acb4803967d2950563f681d565527f86e00d755ada4efd96efd3055b1a6b2ae8ff3fab6a', 99, 1, 'token', '[]', 0, '2024-02-28 16:02:57', '2024-02-28 16:02:57', '2025-02-28 16:02:57'),
('3e4e47133af23052dcdcdb84bd7cc1979179035a80bac643bcc7ae65f93df93d4c7d4c2091c59bc1', 155, 1, 'token', '[]', 1, '2024-04-09 16:18:18', '2024-04-09 16:18:18', '2025-04-09 16:18:18'),
('3f1cfd317952d02f663e0405a071df1358c6ed57a27761a73209d17f33d41727da6e578868cbacd6', 17, 1, 'token', '[]', 0, '2024-03-12 18:20:54', '2024-03-12 18:20:54', '2025-03-12 18:20:54'),
('3fae62493786ba794d6ecf2aba1e9a25460a78eea8b36827a6416fd9ece963508d085816f39ef05c', 3, 1, 'token', '[]', 0, '2023-01-20 11:03:53', '2023-01-20 11:03:53', '2024-01-20 11:03:53'),
('4043ed969e81d8f766bcd21e826ca068171b9720146d66d51cd39cc0c9d1dafedf73e8c1e9bf7032', 123, 1, 'token', '[]', 0, '2024-03-20 13:37:16', '2024-03-20 13:37:16', '2025-03-20 13:37:16'),
('4255e090ef9eba171eed794104d81bce16cf21814dcbf0de4d6576823aed322e01c04438e37de528', 30, 1, 'token', '[]', 0, '2023-10-17 05:30:01', '2023-10-17 05:30:01', '2024-10-17 05:30:01'),
('43e8c0cb171837d0666a188ff9a8b3c8244e95dded79d56cb3f8330d6e866d9111f89b3bf7be9344', 201, 1, 'token', '[]', 1, '2024-06-24 11:09:55', '2024-06-24 11:09:55', '2025-06-24 11:09:55'),
('44b603d1ea0af28d6d3c66c8717d0aa2458dcc8173906813d7c05a53aa98739b300d7a7c3a8daa3f', 64, 1, 'token', '[]', 0, '2023-12-11 13:41:08', '2023-12-11 13:41:08', '2024-12-11 13:41:08'),
('44c9bfec0341fbdfbe3249f7d054244f3ead7aa5efb741020e44ef1489e2376f52b1e921195e3770', 40, 1, 'token', '[]', 0, '2023-11-27 11:29:32', '2023-11-27 11:29:32', '2024-11-27 11:29:32'),
('44f6b558ea30a3f96d8bf78fa842998cffc98f07e5e340e23973cb9c2f27159e7862c1f82453920b', 194, 1, 'token', '[]', 1, '2024-05-21 18:07:02', '2024-05-21 18:07:02', '2025-05-21 18:07:02'),
('45743724937be6a013ac32a9bf464003613531023f8bf75eafec79a0f169fbc1945829726297b7c7', 103, 1, 'token', '[]', 0, '2024-03-01 04:21:23', '2024-03-01 04:21:23', '2025-03-01 04:21:23'),
('458cf31918be002461fe53643f72eb2b2232d4d43e5c1522376e2b7ce36d25b370041835825798ba', 128, 1, 'token', '[]', 0, '2024-04-09 10:29:01', '2024-04-09 10:29:01', '2025-04-09 10:29:01'),
('46f179a6725835806e7c7da59879419a0ba57c81ca7fe03b2a59ae4e4b6313a0ebd0ae19082aa0c5', 4, 1, 'token', '[]', 0, '2023-04-01 17:14:34', '2023-04-01 17:14:34', '2024-04-01 17:14:34'),
('474b8ce3cd908ae5d5b2151d00d69148ba7c79f94ae14a44497a6cb50daa2f31c9835a127a7d1198', 104, 1, 'token', '[]', 0, '2024-03-01 14:45:47', '2024-03-01 14:45:47', '2025-03-01 14:45:47'),
('48590962aad6f45fe47cd20e345bbbc16503e677bbf48c0060b35f6d90d9c683a7415a1a81749bd9', 14, 1, 'token', '[]', 0, '2023-04-15 08:51:25', '2023-04-15 08:51:25', '2024-04-15 08:51:25'),
('48828fb48b7701666f6560a69be7222d130e1ed11cfc5c3c6d4a36a030854d98e901da5541688863', 186, 1, 'token', '[]', 1, '2024-05-18 09:33:56', '2024-05-18 09:33:56', '2025-05-18 09:33:56'),
('489944bcd7ec95dbc5361f7d3081c3301ba87ff823c0fbd8d215a39a7b3bce86246064bd5320ec57', 162, 1, 'token', '[]', 0, '2024-04-19 12:59:30', '2024-04-19 12:59:30', '2025-04-19 12:59:30'),
('49909e9fb1a6309e1f801190542b431cd6d5d7b76f795923a2d7e1815a2e943470437bcd8b91d59d', 168, 1, 'token', '[]', 1, '2024-05-10 11:39:29', '2024-05-10 11:39:29', '2025-05-10 11:39:29'),
('4cffc82f81c7e2b1cf369f6b099802e71d6f6d949c52f33e1809955d87f4bca262b65d27f7d0f185', 13, 1, 'token', '[]', 1, '2023-04-19 11:18:49', '2023-04-19 11:18:49', '2024-04-19 11:18:49'),
('4d16d7de9455ef25a30c7fd860a52580c9fed695f377da57215c7c53ee52ac71f51e0b3a40ae5a61', 128, 1, 'token', '[]', 1, '2024-05-08 16:40:28', '2024-05-08 16:40:28', '2025-05-08 16:40:28'),
('4df2d841d1c06a70e9ac246565a2c49ad67981199780862a3d9a797f01626760d9228a61a8e31260', 189, 1, 'token', '[]', 1, '2024-05-21 16:41:15', '2024-05-21 16:41:15', '2025-05-21 16:41:15'),
('4dfc3fa67bd46c56f5bd637116bdeb544d5cffc3942d1c5cd313e8dc4bf4e27590211203a2762030', 17, 1, 'token', '[]', 0, '2023-12-08 14:16:01', '2023-12-08 14:16:01', '2024-12-08 14:16:01'),
('4ef56be48041928ed0c69b2306b289c256b060f8d70d973de605b29dd2bd869c870793e243147504', 91, 1, 'token', '[]', 0, '2024-02-18 18:09:59', '2024-02-18 18:09:59', '2025-02-18 18:09:59'),
('4f30074529fe8b4a4174f58a3a838498051259844d0bf7ee7959ed67f233a9d30154fe5b500b5947', 195, 1, 'token', '[]', 0, '2024-05-21 18:15:59', '2024-05-21 18:15:59', '2025-05-21 18:15:59'),
('4ff8f0b5f090b7c4df14d63cbe93abd530c70b3ced34525eb1a734dfc1ed89027d3cccf6fb3c7821', 3, 1, 'token', '[]', 1, '2023-01-20 10:15:07', '2023-01-20 10:15:07', '2024-01-20 10:15:07'),
('501d41a154962a976b5dfb1c3df60e2486ad371af9c66fc9259aa86c47d2c591ef077877ec96e264', 23, 1, 'token', '[]', 1, '2024-05-08 16:51:46', '2024-05-08 16:51:46', '2025-05-08 16:51:46'),
('52618616c1c788dad4faae4d3808e81410bebd824e317f5c498f92fa3a303dd04f7cc9bc334c08d8', 44, 1, 'token', '[]', 0, '2023-11-28 18:24:36', '2023-11-28 18:24:36', '2024-11-28 18:24:36'),
('52d2ac44782ec394586a088c17b10bcb7f500a34c39b2ca17b4ad2a7f9c800536ff7a6a7627ab1a7', 4, 1, 'token', '[]', 0, '2023-01-20 10:56:35', '2023-01-20 10:56:35', '2024-01-20 10:56:35'),
('5304db38f99920340abcac4ac72a1b0d78f1ca52c68122922869504d5ffc0fdab111978176801adc', 167, 1, 'token', '[]', 0, '2024-06-25 12:24:13', '2024-06-25 12:24:13', '2025-06-25 12:24:13'),
('539efecbd3f4d1d8f18040f791c9253718013f794d002c9a53040ca16555a7c28a4736da2ec9be69', 127, 1, 'token', '[]', 0, '2024-04-22 12:48:25', '2024-04-22 12:48:25', '2025-04-22 12:48:25'),
('55208ee8120fd57aea20561d6c2158979551d387741c5c46eb912595b7ae2d2a54c90a92d7d5bd51', 167, 1, 'token', '[]', 1, '2024-05-17 16:03:59', '2024-05-17 16:03:59', '2025-05-17 16:03:59'),
('5596ea4e23011cf918d563facb6079d0a59eec9ce035737fdb5a97a933f8db45e65171c79e49ca4f', 205, 1, 'token', '[]', 0, '2024-06-25 12:15:10', '2024-06-25 12:15:10', '2025-06-25 12:15:10'),
('569ce169ab1bb6dce23efafc3a5f00b08d8ef78dd34d90d37cc7d9fa21977ae49cbee0a42ef8f3d6', 140, 1, 'token', '[]', 1, '2024-04-03 11:45:50', '2024-04-03 11:45:50', '2025-04-03 11:45:50'),
('570642e8448fb9e6190aba080a06e9a1431490e0f4c866ff4ebeb50f8ed45b0bf26c016f2994c987', 18, 1, 'token', '[]', 1, '2023-05-09 17:32:30', '2023-05-09 17:32:30', '2024-05-09 17:32:30'),
('585c368061e8455f16e4f61409368b149e1668531d702d64f0b51e97557b435c9b09b492703f0d03', 74, 1, 'token', '[]', 0, '2023-12-27 15:48:10', '2023-12-27 15:48:10', '2024-12-27 15:48:10'),
('58e104cc5e38ed90e25e20fabe6f23f1e8278865dd62151ad239ea714c31cc740238a6be349973ec', 13, 1, 'token', '[]', 0, '2023-04-01 14:31:37', '2023-04-01 14:31:37', '2024-04-01 14:31:37'),
('59e6e5730eb4a6ed6adadcf57d01104342655664617103ad5295c084de8b032da9080949b00d9502', 154, 1, 'token', '[]', 0, '2024-04-05 19:05:18', '2024-04-05 19:05:18', '2025-04-05 19:05:18'),
('5a23d501d5dec85f51fac5cc17af5bad9763ef843386395cbf7a3d65d7052bf9211b8ac8855c7a03', 177, 1, 'token', '[]', 1, '2024-05-14 12:39:40', '2024-05-14 12:39:40', '2025-05-14 12:39:40'),
('5add8c925ee1862f34c1a062509e91e1164f09835c4e8a77f3c171f3ece93afab7507e01be2c0a38', 187, 1, 'token', '[]', 1, '2024-05-21 12:01:33', '2024-05-21 12:01:33', '2025-05-21 12:01:33'),
('5afb1e3cc7c1a44cf247e4be79f352083361a9a548526df10020b1df3dcecc5b8cda3912218a2bba', 136, 1, 'token', '[]', 0, '2024-04-02 17:10:28', '2024-04-02 17:10:28', '2025-04-02 17:10:28'),
('5b2e8ede3f5715776707c65f230412fcf6f4fd93134e0d385969d6878d5198e127a31427ded617ce', 83, 1, 'token', '[]', 0, '2024-01-21 20:46:07', '2024-01-21 20:46:07', '2025-01-21 20:46:07'),
('5bc1f705c61015b8a132eaf2d083bb84733f711601088e4d33606954847810ccb1e68e6233129b73', 6, 1, 'token', '[]', 0, '2023-12-02 16:39:54', '2023-12-02 16:39:54', '2024-12-02 16:39:54'),
('5bd97e4a35d48202fea6d5dec61df96695bb7ffc45d6cbb37b984a31aa63dfb07e8016c2f5131f7e', 4, 1, 'token', '[]', 1, '2023-01-23 12:46:24', '2023-01-23 12:46:24', '2024-01-23 12:46:24'),
('5dad520d8b0575bdf9d9a5623aa4af00fa63aac0213db50bb30746b6769a772273ec736cada43e38', 8, 1, 'token', '[]', 0, '2023-12-14 10:39:10', '2023-12-14 10:39:10', '2024-12-14 10:39:10'),
('5f6dbdd509152c5d3757d617f07c51fcdee21f3f3cedc2787b0cd431f917f22b90002a0b61d611b1', 101, 1, 'token', '[]', 0, '2024-02-28 16:50:45', '2024-02-28 16:50:45', '2025-02-28 16:50:45'),
('5f811df3b808eab97b9109a04e132becaa3df26f7dbc4e7e84069ce353af2e256d4d8fae733e5aa0', 203, 1, 'token', '[]', 0, '2024-06-25 12:10:06', '2024-06-25 12:10:06', '2025-06-25 12:10:06'),
('5f85e2a95b01da34e066e8b7eaac9997c0af3986c9c5edba10ed1ff6c1c50452329857ba6f32420e', 2, 1, 'token', '[]', 0, '2023-01-12 20:16:22', '2023-01-12 20:16:22', '2024-01-12 20:16:22'),
('604d42de02033d2d633943f56354fc2e232acfc30a0081ffccbbeba5512cf909e145021c7f865ca7', 32, 1, 'token', '[]', 0, '2023-10-17 18:32:24', '2023-10-17 18:32:24', '2024-10-17 18:32:24'),
('606703b073abd7f8dc1e6108ad9798740e5bb92e173dd4b5328ffd99171115cec4265cc99829dde0', 111, 1, 'token', '[]', 0, '2024-03-12 18:07:04', '2024-03-12 18:07:04', '2025-03-12 18:07:04'),
('61f8f606f20dafa62f4d360d31a60a27f35c108b39872f237118c65dc98dbacffc62f0f94976ed00', 23, 1, 'token', '[]', 0, '2024-04-10 15:41:12', '2024-04-10 15:41:12', '2025-04-10 15:41:12'),
('634ea6cd40e16e4b561be4ddbfd3d31ea2987294c4bbcac86cfb25566e24f4d03c61ce9a7b807dbe', 15, 1, 'token', '[]', 0, '2023-04-17 17:47:12', '2023-04-17 17:47:12', '2024-04-17 17:47:12'),
('63c9bf24fddb5656d8f75aad5ae3ca720772da92ebd52779de5414c1aba96026757f2facb3181db8', 87, 1, 'token', '[]', 0, '2024-02-09 11:45:41', '2024-02-09 11:45:41', '2025-02-09 11:45:41'),
('63cab56b2d1d844c1239fcb30fb249870d30012f74044cd30925dc7b1535c451a9d2e7e89edc0c31', 106, 1, 'token', '[]', 0, '2024-03-05 08:15:18', '2024-03-05 08:15:18', '2025-03-05 08:15:18'),
('64a36f37b0942295efaa863c8c41938a58e21abc799255f9f3f3b46e322e9fa2c757ff9922d561d5', 128, 1, 'token', '[]', 0, '2024-04-02 17:11:05', '2024-04-02 17:11:05', '2025-04-02 17:11:05'),
('650c8332441102b7d998c99738c5f98b661f51b0185427bff3e97352c869a3f7364a9608f728f61c', 93, 1, 'token', '[]', 0, '2024-02-21 07:42:18', '2024-02-21 07:42:18', '2025-02-21 07:42:18'),
('65f752f381fe7dbcc2aa11f076ff5891fddc1239159c23ed65dafce8fbb065e52d175e5a6cf6053f', 28, 1, 'token', '[]', 0, '2023-09-22 19:31:44', '2023-09-22 19:31:44', '2024-09-22 19:31:44'),
('661bece89550bb156c2c0bca60b6b3f55e9c5d1a4ac7c96559ff0b149f5c4f9c840150233c302a47', 128, 1, 'token', '[]', 0, '2024-04-02 17:11:17', '2024-04-02 17:11:17', '2025-04-02 17:11:17'),
('67f06a387d2da739e2c0b5225b519a57f72235cee3c11f2591bdb0704aa0bbdd093f3c920353da48', 176, 1, 'token', '[]', 0, '2024-05-14 11:38:37', '2024-05-14 11:38:37', '2025-05-14 11:38:37'),
('68438abc17f50f3b5098fddf1410dd254b112c9bd73e903976ce1795e8a0d84114e0dbf6a6f49605', 6, 1, 'token', '[]', 1, '2023-08-16 19:23:43', '2023-08-16 19:23:43', '2024-08-16 19:23:43'),
('6a08fe1de369a38165fb46f5f6965a3239acd54a783c01f53c0bb997a618c1b418969d41c7daecd3', 128, 1, 'token', '[]', 0, '2024-03-30 12:48:38', '2024-03-30 12:48:38', '2025-03-30 12:48:38'),
('6a39bad95e2904b1a66a80252853fab08d02ed5c40a03fc0beb5937b1d84370ba7c98aaae9422dab', 96, 1, 'token', '[]', 0, '2024-02-22 19:52:57', '2024-02-22 19:52:57', '2025-02-22 19:52:57'),
('6ae78d80e1e068b6f2bcaaf8371e2d72328d2723852dc7363b53218db69e39931f4c275f2d1ec201', 6, 1, 'token', '[]', 1, '2023-10-19 18:58:25', '2023-10-19 18:58:25', '2024-10-19 18:58:25'),
('6b756b2e7309450655d4bad8b89e7e3a84dfbbd53e078f3f8e723deab1a7773f10e6f84f3c2f8f04', 184, 1, 'token', '[]', 1, '2024-05-17 16:20:32', '2024-05-17 16:20:32', '2025-05-17 16:20:32'),
('6cbce9df70b39e917cb4926ba909afedab8b5ef815b3fb2d970c3d969d94b68bfc7a8d5b51f9eefc', 128, 1, 'token', '[]', 0, '2024-04-02 17:11:27', '2024-04-02 17:11:27', '2025-04-02 17:11:27'),
('6cbf0d90316e832d32b2b466c1112e8e326c67d574f9f397f4486f6f75fb553d42a4f992d30b8a4b', 139, 1, 'token', '[]', 1, '2024-04-03 11:27:26', '2024-04-03 11:27:26', '2025-04-03 11:27:26'),
('6d66b843fda17793a15fdd25b37ffae15813cdbbf01d5ac570093e7b86600e52596fd96b0132d51c', 4, 1, 'token', '[]', 1, '2023-06-19 18:05:40', '2023-06-19 18:05:40', '2024-06-19 18:05:40'),
('6f02c8e74259d0f1468a6d82bc6bd421af67b48b6a035a83af666ea41007cdffc733b995c49d9dd2', 128, 1, 'token', '[]', 1, '2024-05-08 16:52:54', '2024-05-08 16:52:54', '2025-05-08 16:52:54'),
('6fa5ffd8a82ff4a25e4434ad082f213b968b42030fe08b3ecf0fbfa137cd2e76b6dca8077bda5f43', 168, 1, 'token', '[]', 1, '2024-05-14 11:49:52', '2024-05-14 11:49:52', '2025-05-14 11:49:52'),
('70ea94896fd8d5a1983e75fdc2f9672250037e8428c93f39a9a333c3248013e2124b2bd0858c7130', 49, 1, 'token', '[]', 0, '2023-12-01 11:19:54', '2023-12-01 11:19:54', '2024-12-01 11:19:54'),
('71cc24cc3213ed5f92215d068eaa726e92106a363c3247c53d7c503cc8295471158631aed6e8a72c', 4, 1, 'token', '[]', 1, '2023-11-03 19:19:06', '2023-11-03 19:19:06', '2024-11-03 19:19:06'),
('7258f725cce89741486379fc41288e5850d6de084f0d731c626a676302eb0b1b07aa8da7b883f648', 128, 1, 'token', '[]', 0, '2024-04-02 20:14:43', '2024-04-02 20:14:43', '2025-04-02 20:14:43'),
('7261a7e38a2918990eed27a2a6e74ce0c8ec49ee3ae7553a92109b8dcbbe8090a7594e2ff67f096e', 197, 1, 'token', '[]', 0, '2024-05-22 10:30:25', '2024-05-22 10:30:25', '2025-05-22 10:30:25'),
('73721f62df83fa7585264beec940c85cac6364f294fa57274a1e64bd1da2b104a3c057d7ab7471a8', 10, 1, 'token', '[]', 0, '2024-06-21 17:48:55', '2024-06-21 17:48:55', '2025-06-21 17:48:55'),
('74eae3e6c08e3f4fb42a93d842b3576f323e97d2c153e9f99c387c93421bc7ebb61d85f994dc60ed', 23, 1, 'token', '[]', 0, '2024-04-04 13:21:47', '2024-04-04 13:21:47', '2025-04-04 13:21:47'),
('7586339e84059067f3c0883bd409c2acb6fec854f1894d00ff1a7faacf2557141eb1f5c69f80a1cf', 128, 1, 'token', '[]', 0, '2024-04-01 17:50:38', '2024-04-01 17:50:38', '2025-04-01 17:50:38'),
('75a5bf276cdc151042b775010a244c59e053962b44352139b4c520ffa8d16691af7c5320fa33f2fc', 127, 1, 'token', '[]', 1, '2024-05-13 15:39:01', '2024-05-13 15:39:01', '2025-05-13 15:39:01'),
('7719fb88d63683b71fd702a1b2e60c3c19cceb7003499d40246fcba71258d9c912107885d1437523', 128, 1, 'token', '[]', 0, '2024-04-05 12:04:25', '2024-04-05 12:04:25', '2025-04-05 12:04:25'),
('777887e7a31ceb3e35552bc06de8d7d1efbd496af8dadc6bf075d0ea5d648a64e003c4a48c9fa8a8', 167, 1, 'token', '[]', 1, '2024-05-10 10:26:31', '2024-05-10 10:26:31', '2025-05-10 10:26:31'),
('7813f241680cf015120dd3f47545c633925f7e99ea489a303e3bbd8468b6b1cabb6471a459502165', 181, 1, 'token', '[]', 1, '2024-05-16 16:45:19', '2024-05-16 16:45:19', '2025-05-16 16:45:19'),
('7908ecb1b53f44c7efe788bd452d8388d0e34ee48f114a032392f652607aa332f8081ddcfba5c7a5', 198, 1, 'token', '[]', 1, '2024-05-22 14:58:36', '2024-05-22 14:58:36', '2025-05-22 14:58:36'),
('791e9f5de39cf5c9c1385c452f7044d0b8d821ef5b1b227b32f0b098df2f5901ebe4316f7a987325', 2, 1, 'token', '[]', 0, '2023-01-12 20:22:04', '2023-01-12 20:22:04', '2024-01-12 20:22:04'),
('798bc2594df22845936987b45539582d73dc58936ee47f5663e3cfe2054d8bc559ffe50a0d10ce17', 94, 1, 'token', '[]', 0, '2024-02-21 13:13:35', '2024-02-21 13:13:35', '2025-02-21 13:13:35'),
('79ae41381f7be12ebb69d721bc4cb24114067ca82aa6adc6b29535ae5972a95e66f156049aff509b', 2, 1, 'token', '[]', 1, '2023-04-20 16:15:59', '2023-04-20 16:15:59', '2024-04-20 16:15:59'),
('7a06397abbcba1fae0e255aaa27698ca1b24bb0381d8a64dcf4fb7112e697e315e6a226dd57f0186', 4, 1, 'token', '[]', 0, '2023-08-22 18:54:28', '2023-08-22 18:54:28', '2024-08-22 18:54:28'),
('7a0ae9475bc4759ec85939022f227beef8b21d27b5919924652044d01712a86258041f57c7bf9285', 128, 1, 'token', '[]', 0, '2024-03-29 11:02:53', '2024-03-29 11:02:53', '2025-03-29 11:02:53'),
('7a408ecba751541afcef63380051f42f8bf04d700c9f3e61139ff9efb64c98ca055b45a0f78852b9', 128, 1, 'token', '[]', 0, '2024-04-04 13:21:37', '2024-04-04 13:21:37', '2025-04-04 13:21:37'),
('7cb8c3e2d2effc51fe6e5ca11e7d8bb1eda2c1587e040164e8dc6f8922536eb35c6b7236136f7994', 20, 1, 'token', '[]', 1, '2023-05-10 13:06:22', '2023-05-10 13:06:22', '2024-05-10 13:06:22'),
('7e17341e9105384bb2f4816bee10c1527818fb605dc0b3609be9b4f9903aa6a808e61bedc9727488', 6, 1, 'token', '[]', 0, '2023-04-17 16:28:26', '2023-04-17 16:28:26', '2024-04-17 16:28:26'),
('7ef5a51f6c69bc6a262bb7c1280f5d082ba7e9ba8f59a489808ca54a96e7f485dde14de717cfa2af', 128, 1, 'token', '[]', 0, '2024-04-02 17:15:07', '2024-04-02 17:15:07', '2025-04-02 17:15:07'),
('7fdffa2f9e2030485ae9f059df7b5109bb20bef14919aa04f94b63e5ad70128c03d3b08cf9ad9010', 192, 1, 'token', '[]', 1, '2024-05-21 18:01:30', '2024-05-21 18:01:30', '2025-05-21 18:01:30'),
('80701caf2979feb0281244f43a51fe1c545b1b047de1357f238bc770acc95cd19fae811f1e8d1044', 167, 1, 'token', '[]', 0, '2024-06-03 17:17:04', '2024-06-03 17:17:04', '2025-06-03 17:17:04'),
('80beec4212053a7170c7f4987897f78f4575f0f9f376325e4bcdf90b41f7073cde8a3609beb2dcc4', 3, 1, 'token', '[]', 1, '2023-01-20 10:16:49', '2023-01-20 10:16:49', '2024-01-20 10:16:49'),
('81c0b8793c07707204aedb3c01e3e73376c63cb98690464bea1d8a5a73fda1c854fa6435f180cd3b', 128, 1, 'token', '[]', 0, '2024-03-29 11:21:54', '2024-03-29 11:21:54', '2025-03-29 11:21:54'),
('8345b83cad5f0f44a470f486c8bde19ff791e05c7d46da2c975194a3d210d58c4d59eb5a3538d57a', 39, 1, 'token', '[]', 0, '2023-11-17 16:41:33', '2023-11-17 16:41:33', '2024-11-17 16:41:33'),
('841b67993c0b5f2e0f804dd00f8e5053c0154a5c9580e5589d79ef78f3e0c981fd7d45e0684c671a', 16, 1, 'token', '[]', 0, '2023-04-18 11:33:58', '2023-04-18 11:33:58', '2024-04-18 11:33:58'),
('846ed8ea53f0b4442f2616d46346e93a6c040e5a5bffbba24259ea59d8a9fd921871c5b03a60772b', 199, 1, 'token', '[]', 0, '2024-06-21 15:36:26', '2024-06-21 15:36:26', '2025-06-21 15:36:26'),
('85856adf6383119b1ffe2889436476b438b29b5f94eb39eff53b729c5e67fa0e1b12157daee0b9c3', 171, 1, 'token', '[]', 0, '2024-05-10 18:57:36', '2024-05-10 18:57:36', '2025-05-10 18:57:36'),
('86a7f805e4a3b7cb8bbe1da79bdb5311cd21e43156c3cbf3976917faf5087feb99c61e2c4c226685', 13, 1, 'token', '[]', 1, '2023-04-01 17:05:23', '2023-04-01 17:05:23', '2024-04-01 17:05:23'),
('870bfcab10513445ccac08d9e7489d136f15f0a130a9fdcc626f8aa15e7e243add72dd2f370a2788', 159, 1, 'token', '[]', 1, '2024-04-10 18:29:23', '2024-04-10 18:29:23', '2025-04-10 18:29:23'),
('87b9ca564ff223bbe3ce9b47e73a1c333f5a9b9266d748a2c2d58c507e7c68ccc61f5d018e8ae301', 168, 1, 'token', '[]', 1, '2024-05-09 17:31:07', '2024-05-09 17:31:07', '2025-05-09 17:31:07'),
('88529aa1f1d1a0f8848016755a0e03074416292cbd3dff805974c016a798596477b36195badf1c25', 177, 1, 'token', '[]', 0, '2024-06-13 12:58:56', '2024-06-13 12:58:56', '2025-06-13 12:58:56'),
('88cba1994700775d55ef35f07592c786a3d632eac65f539ec6e152726dd4d29e7241d1360eef26c8', 86, 1, 'token', '[]', 0, '2024-02-09 06:25:47', '2024-02-09 06:25:47', '2025-02-09 06:25:47'),
('890753988a26c9997de61d8b9f94c3c1d686a9121e852d39ed18104c62193a00060135a6a5b45f0e', 188, 1, 'token', '[]', 1, '2024-05-21 14:54:12', '2024-05-21 14:54:12', '2025-05-21 14:54:12'),
('8acf1913e941ed9b3a365b171a56c461099f8d0cbfbf8a9fbca07f85aa36589462fb910a629fa39b', 54, 1, 'token', '[]', 0, '2023-12-01 16:52:27', '2023-12-01 16:52:27', '2024-12-01 16:52:27'),
('8b7958f714440b96961327bdd74c579e43c9111f311b7dcb2fa685ae1354f18baefab9d1ebe8addf', 90, 1, 'token', '[]', 0, '2024-02-18 13:44:43', '2024-02-18 13:44:43', '2025-02-18 13:44:43'),
('8c4b9525ea289cf9ae082d3812cc654bc7e4c8c4133f62897f3bbc8b911d0dff14faba9fdfa8c1c3', 196, 1, 'token', '[]', 1, '2024-05-22 10:17:19', '2024-05-22 10:17:19', '2025-05-22 10:17:19'),
('8c89aab7cff0b8e30af8bb9d958c875badfab7a516e5e98e179d33349ab91830706e5e449adb86f1', 177, 1, 'token', '[]', 1, '2024-05-14 13:31:47', '2024-05-14 13:31:47', '2025-05-14 13:31:47'),
('8ca50d8ad0639977398db71632698977681c18bc94bc954f470e4f701963e0d967c22840a2e6bc61', 3, 1, 'token', '[]', 0, '2023-01-20 10:17:27', '2023-01-20 10:17:27', '2024-01-20 10:17:27'),
('8d7e5e89cd2452d3f4b46c206954dcaf0777591ccddbba3a399e93675309d65a0e97192eb8522217', 66, 1, 'token', '[]', 0, '2023-12-12 13:01:47', '2023-12-12 13:01:47', '2024-12-12 13:01:47'),
('8e798cb50846bbfc2c4813822530340d1b40b3181b332667062fdd92a5a791c2c2685d8b7c34f3fe', 128, 1, 'token', '[]', 0, '2024-04-02 17:05:12', '2024-04-02 17:05:12', '2025-04-02 17:05:12'),
('8f2ffce2a85c032a58fbf683b9b9b781458c7a64df946a0c8280cfde2d3242e2b20945664d6a00fd', 11, 1, 'token', '[]', 0, '2023-04-01 13:12:28', '2023-04-01 13:12:28', '2024-04-01 13:12:28'),
('8fcc28c27b604e2a83206d2f84e5c6371f157ad7c6425fa41ff49ed80ca8fdbdb323c57e72e377ff', 119, 1, 'token', '[]', 0, '2024-03-17 18:18:18', '2024-03-17 18:18:18', '2025-03-17 18:18:18'),
('90f403ab1ffe9ab78c3d2488b88d6dcd938badfaffde6cf6154d1cc6e6c80561dbc987a7ba985e45', 175, 1, 'token', '[]', 1, '2024-05-14 10:57:40', '2024-05-14 10:57:40', '2025-05-14 10:57:40'),
('9194a958c92ed129441bf8adad6cb09396dc845a91831beac5d84b41b0b61b5fb7012a84650d9158', 157, 1, 'token', '[]', 1, '2024-04-10 14:17:07', '2024-04-10 14:17:07', '2025-04-10 14:17:07'),
('92222281b6addd8f42485e6e63219802bd72d62705950e303a5e350077ce28cccaf467bafed9e383', 116, 1, 'token', '[]', 0, '2024-03-14 09:47:29', '2024-03-14 09:47:29', '2025-03-14 09:47:29'),
('92231a9e9d735c81e0ed79b4200a49514febcf7fded384fd993a124552b3bcd681f28623777914b2', 102, 1, 'token', '[]', 0, '2024-02-29 13:19:35', '2024-02-29 13:19:35', '2025-03-01 13:19:35'),
('92e23e40f3db5e5256365a352af78240cdfa751172a16966b413ce9c7e10ba5d66a10e6a4682b9b5', 23, 1, 'token', '[]', 1, '2024-04-10 18:44:52', '2024-04-10 18:44:52', '2025-04-10 18:44:52'),
('92f5bd591b9d127a7af6b4b6a4d616b3b683c0189bab2553af748dd723d3ad8fa1948dedde0e9da6', 4, 1, 'token', '[]', 1, '2023-05-08 16:19:15', '2023-05-08 16:19:15', '2024-05-08 16:19:15'),
('93593aac4a78e9416333b8d7ea7344e90a720dde5f2a4145d0d21671c1f2f67c157ab9ab47561ccb', 115, 1, 'token', '[]', 0, '2024-03-14 06:41:02', '2024-03-14 06:41:02', '2025-03-14 06:41:02'),
('9389c424a4b1ed3825d472eeff2bb459fc5092a47a7e716c06939b30a4f0385cb74328a7444a3328', 131, 1, 'token', '[]', 0, '2024-03-30 13:20:30', '2024-03-30 13:20:30', '2025-03-30 13:20:30'),
('9395b4cb639cf0b0306f0fdab70817f4204c90cf924de029c9261cf8dec93ecee0a6b41515da4714', 6, 1, 'token', '[]', 1, '2023-10-24 12:50:16', '2023-10-24 12:50:16', '2024-10-24 12:50:16'),
('941274674dc6649d3ac344432b8944137c72359b1e6e431641af26c8e373375afbe55e0d831a411c', 155, 1, 'token', '[]', 1, '2024-04-05 19:40:31', '2024-04-05 19:40:31', '2025-04-05 19:40:31'),
('958ad2e42a999036343aa3f374801903826b69932665506b0b59cebc6ec1bc9908c67c082d4f68b9', 177, 1, 'token', '[]', 1, '2024-05-14 16:04:19', '2024-05-14 16:04:19', '2025-05-14 16:04:19'),
('95ac88b13efb69aab9345a687495cb51334760ffb5bde45dde596c3f7d470c9420a37f18fb0d0814', 23, 1, 'token', '[]', 1, '2024-04-10 18:25:04', '2024-04-10 18:25:04', '2025-04-10 18:25:04'),
('95c9cb8076a2bb9a8c30e164fea9b18bcbe434727afd57a3339a11c4448ae5e03e63f7bb306e9e45', 173, 1, 'token', '[]', 1, '2024-05-13 18:09:52', '2024-05-13 18:09:52', '2025-05-13 18:09:52'),
('95d56f0591d5cdc08cbb75457d4743903e9bda410ee496918eae1112a5a9102c5cf1ed63f5835dce', 6, 1, 'token', '[]', 1, '2023-07-03 17:05:00', '2023-07-03 17:05:00', '2024-07-03 17:05:00'),
('95d9d036ea25a768bc62c07da9325e6f83704e1b0dd8e7d1118de4dced3d3c716789e5cd3933b87c', 128, 1, 'token', '[]', 0, '2024-04-09 13:06:00', '2024-04-09 13:06:00', '2025-04-09 13:06:00'),
('97ab84e083bcd6fb2c971d20002cca027005cffcdde3cf2d5c1758c84a94d5d051b2f314c62ef4dd', 130, 1, 'token', '[]', 0, '2024-04-04 18:47:23', '2024-04-04 18:47:23', '2025-04-04 18:47:23'),
('97dd2024c75f78df7c26a39ad3a7e97a4530230d668a4f47377ac91d459a36374895182bae77937c', 107, 1, 'token', '[]', 0, '2024-03-05 16:10:18', '2024-03-05 16:10:18', '2025-03-05 16:10:18'),
('9845de34d782caa42efe9138aba31444a3b6294c5ecafdbe80d92920cd44575b7f067bb5c0543b14', 8, 1, 'token', '[]', 0, '2023-04-18 13:33:08', '2023-04-18 13:33:08', '2024-04-18 13:33:08'),
('98a8b2f202bc4d97e20d39e51c98c478b7013c356dd8f6b772d07c5d9b2c5527cec5e7f85e34c2b7', 4, 1, 'token', '[]', 0, '2023-05-05 17:44:58', '2023-05-05 17:44:58', '2024-05-05 17:44:58'),
('9a8c948ccfc94b77810559f8bb712a78f01404e8b0515902a9da9c8359b2bb5043254d8a2766d2a0', 46, 1, 'token', '[]', 0, '2023-12-06 03:55:47', '2023-12-06 03:55:47', '2024-12-06 03:55:47'),
('9b97fc9d08f54a7b790bbd6e16ab9aac7beb267e8cb953b6b7fb86e4cbe71bfd4aa83bcc9ed69abb', 167, 1, 'token', '[]', 0, '2024-06-03 18:45:59', '2024-06-03 18:45:59', '2025-06-03 18:45:59'),
('9c143e683a4624f32f55ee8cec307a1358e9670388d4e9096e100be4cf0f7ad23419b79de387558a', 39, 1, 'token', '[]', 1, '2024-03-11 11:19:06', '2024-03-11 11:19:06', '2025-03-11 11:19:06'),
('9d5c0d591375c0a84e597fe5cd8c63fa8d982017674b7eecf22be20c4ae3a8ae6595ada857eb6721', 128, 1, 'token', '[]', 0, '2024-04-10 15:33:30', '2024-04-10 15:33:30', '2025-04-10 15:33:30'),
('9e2449d3bf4d96ffb1fc511caa41401cea69feaace48bc81aaec0a7841a94f6674c0acc682e0b59e', 2, 1, 'token', '[]', 0, '2023-07-04 17:11:39', '2023-07-04 17:11:39', '2024-07-04 17:11:39'),
('9e70284cb0257af2f877c730cd6d3c1c8a1d08853748275dd9e92119ec32254c313e182326f0ded1', 100, 1, 'token', '[]', 0, '2024-02-28 16:18:18', '2024-02-28 16:18:18', '2025-02-28 16:18:18'),
('9f20f918704f5a34da68ad04068cf6748873d9be4b375f5e208babf1928bd47677da37d552b43316', 41, 1, 'token', '[]', 0, '2023-11-28 00:14:55', '2023-11-28 00:14:55', '2024-11-28 00:14:55'),
('9ff3630037fc2f4f26be6920767343832e40d1a8f491dcb194628b4703cdf1ab9b98cf23d9516f4a', 23, 1, 'token', '[]', 0, '2024-03-30 19:19:40', '2024-03-30 19:19:40', '2025-03-30 19:19:40'),
('a0daa8a7ba6b273e54bd09664a3e6c4982bd31590b792cd5dc4f152f4738304f852e5e73a3eb89e7', 2, 1, 'token', '[]', 0, '2023-01-12 20:18:03', '2023-01-12 20:18:03', '2024-01-12 20:18:03'),
('a104ea71ca5f60ef5104bcc9640d6d70c01547c43f0b77c0bc52d8d633a6931118a5cdac9e1943b8', 21, 1, 'token', '[]', 0, '2023-05-10 16:00:56', '2023-05-10 16:00:56', '2024-05-10 16:00:56'),
('a3f1d6dcd61e94781c6427c93e666cb554a01fdfad7b818a6f2bafe570e6d6a41f1e5ba24588664c', 45, 1, 'token', '[]', 0, '2024-01-17 15:46:10', '2024-01-17 15:46:10', '2025-01-17 15:46:10'),
('a45dec693323d6092ffc162778a140efb26d7a7f33a30625c94b27f3c5dbb6c52dbd811b35223a14', 39, 1, 'token', '[]', 1, '2024-03-11 11:10:17', '2024-03-11 11:10:17', '2025-03-11 11:10:17'),
('a5b0df0b1bd57d9cb1f965d501bd8f03d131222762ce6d7922b0d397bfbfad9c752b6988dec2feef', 77, 1, 'token', '[]', 1, '2024-01-10 23:07:05', '2024-01-10 23:07:05', '2025-01-10 23:07:05'),
('a5e0979e453df170e66ecc330e1e4bcebb73d5905926cd5bd04d397df560a25f72d06b56ca139b12', 46, 1, 'token', '[]', 0, '2023-12-01 07:24:04', '2023-12-01 07:24:04', '2024-12-01 07:24:04'),
('a5e5ff762c7c1e2b012b9b5959c478e6ab702f5c74cd61ce08ce99b85874bd355ad0c321733be073', 158, 1, 'token', '[]', 0, '2024-04-10 15:32:11', '2024-04-10 15:32:11', '2025-04-10 15:32:11'),
('a7932f9427c2ed5fc39fe14047b05c3a6a67ab7a5036d1de09dfe25c7c8f5f15de646de92d966ddd', 10, 1, 'token', '[]', 1, '2024-05-13 17:24:29', '2024-05-13 17:24:29', '2025-05-13 17:24:29'),
('a93f9734c76a1ca7dfa9b19d3e490c092b98eacea30a548b0203feae8d9d809776b3d529d212c33e', 169, 1, 'token', '[]', 1, '2024-05-10 10:33:14', '2024-05-10 10:33:14', '2025-05-10 10:33:14'),
('a95a0d356a99a4b8f5d52fa1b17d4fcd69849046485d7a770398ba912f5c9140b38bb0cf89c8d766', 10, 1, 'token', '[]', 1, '2024-04-03 11:56:56', '2024-04-03 11:56:56', '2025-04-03 11:56:56'),
('a96e3587a473000aef22212a0012609874266c2d4c4ffe72b98eb3ea4b9bce90b24bfa4c14929cad', 6, 1, 'token', '[]', 0, '2023-10-30 13:02:33', '2023-10-30 13:02:33', '2024-10-30 13:02:33'),
('a9c163feeaf0b30dd166ad11a979c94a892572cf08e514d0134fa6a2036fb1ea6ee7b109424093bc', 128, 1, 'token', '[]', 0, '2024-03-29 12:42:26', '2024-03-29 12:42:26', '2025-03-29 12:42:26'),
('ab0530dc55b62b5324b3041bdd8a46fcdeddc93fc4d60b256681bba68b790f41f48bb8b6e01fee0d', 183, 1, 'token', '[]', 1, '2024-05-17 15:29:34', '2024-05-17 15:29:34', '2025-05-17 15:29:34'),
('ab36c1fc5ae1ab01fe29adfdb3a848010cc18b41c2f625ac90f5382307a0c61f2b8c2d452f448c98', 177, 1, 'token', '[]', 0, '2024-05-14 16:05:35', '2024-05-14 16:05:35', '2025-05-14 16:05:35'),
('abc12e94ff81740f5382c457dfc6aa00cc110900ecd4bff19f0704ce089cfd48839b810401ace3cb', 128, 1, 'token', '[]', 0, '2024-03-30 11:46:12', '2024-03-30 11:46:12', '2025-03-30 11:46:12'),
('ac7d51a56b0ffe84c9864422e9d4b7a13f22bf4c22552c9d05034f28c89b2eae341755bf3b2521bb', 139, 1, 'token', '[]', 0, '2024-04-03 11:23:23', '2024-04-03 11:23:23', '2025-04-03 11:23:23'),
('ad1d7091c4ac35ce6441bb4ca41558eb04d351817c71e35e8cca2a42ce3b065f16d84d74b3f80faf', 10, 1, 'token', '[]', 0, '2024-04-02 17:20:10', '2024-04-02 17:20:10', '2025-04-02 17:20:10'),
('ae46d454917e38c9d00edee2e1ff27e92857088711b46fe79330a184c049775d4ae823383df3693a', 6, 1, 'token', '[]', 1, '2024-04-17 12:23:10', '2024-04-17 12:23:10', '2025-04-17 12:23:10'),
('af89d9ec26919d939a68e3563f1b336300175ffab04be39b9db5c2551b6cbb31315285d4cd5463fd', 174, 1, 'token', '[]', 1, '2024-05-14 10:49:17', '2024-05-14 10:49:17', '2025-05-14 10:49:17'),
('afcfb43e3e39b1e493d01cb6e98d903d82949fb4e0e1d5889361f1d4b4a47151f08a4930b0a60ad3', 23, 1, 'token', '[]', 0, '2023-09-15 15:11:10', '2023-09-15 15:11:10', '2024-09-15 15:11:10'),
('b00731df847638ea701dfcaa6e2ab1c788348bf7a55a1028ab5158766b5ae9b24695148385f13e77', 34, 1, 'token', '[]', 0, '2023-10-18 20:42:45', '2023-10-18 20:42:45', '2024-10-18 20:42:45'),
('b10763b97f2ddc55c3fa45f3c02496250f9946a07175cd19dadbe1788c9980493c0169f4712fb795', 52, 1, 'token', '[]', 1, '2023-12-01 14:50:09', '2023-12-01 14:50:09', '2024-12-01 14:50:09'),
('b14217a13730a86190f021878f99fa376870f41e6aa7c90ad19bff836f93bc63b43c13869bf285a3', 117, 1, 'token', '[]', 0, '2024-03-15 13:57:00', '2024-03-15 13:57:00', '2025-03-15 13:57:00'),
('b1663562a83a905fef6276eef449dbe319354e3750da81303a27eaf2ee71e9b6dd85b3f7986b28dd', 128, 1, 'token', '[]', 0, '2024-04-02 18:31:00', '2024-04-02 18:31:00', '2025-04-02 18:31:00'),
('b1a4d50ba37c9ebfc1a9cfa49cdef83a27a269067ad81bd8efb46a7d047111b926f6e0643f024729', 169, 1, 'token', '[]', 1, '2024-05-10 11:00:23', '2024-05-10 11:00:23', '2025-05-10 11:00:23'),
('b22e0693b775c647d90d5684a09fbbbe4b50a73431a29021d863182b173eeea8ce4f3563054c2e4c', 88, 1, 'token', '[]', 0, '2024-02-09 20:29:07', '2024-02-09 20:29:07', '2025-02-09 20:29:07'),
('b303ba59e344c2e82b121b5fc0d8a8703f86f1549407783143403b91afcc5298e6e3cca13d814e5b', 23, 1, 'token', '[]', 0, '2024-04-10 15:32:01', '2024-04-10 15:32:01', '2025-04-10 15:32:01'),
('b4becbee6484bc39d19e36b5947ceb14e2c63298de097ed333f2845f904d99ea591a76fb1f33fb0a', 13, 1, 'token', '[]', 0, '2023-09-15 15:32:37', '2023-09-15 15:32:37', '2024-09-15 15:32:37'),
('b4c56f683c7b891bbcb988790f5366fc996a2d5e57aaf0681521541a6648ab955b4fda84c7180240', 128, 1, 'token', '[]', 0, '2024-03-29 11:04:41', '2024-03-29 11:04:41', '2025-03-29 11:04:41'),
('b708b2bc7fa8be65efe846ce8328141af44706d4f131afed2e4019e2283d63c5ec33f46e97781ecf', 4, 1, 'token', '[]', 0, '2023-05-05 17:52:53', '2023-05-05 17:52:53', '2024-05-05 17:52:53'),
('b7256c194fe690e3c01cbf5b1320d547dedc21771b0a699534ddd1be98749b239d2a6af335a5a43f', 155, 1, 'token', '[]', 1, '2024-04-09 12:45:52', '2024-04-09 12:45:52', '2025-04-09 12:45:52'),
('b76e400cd999bcf8baf20efa37d44352bea3f3dc3bec2213032019da21660e77b64214d8f497a3df', 120, 1, 'token', '[]', 1, '2024-03-19 18:47:00', '2024-03-19 18:47:00', '2025-03-19 18:47:00'),
('b7e0f27f3d0598ac9c5b08bead7ebdfdd13616b1f7b46a303435d47e6210b44590084f3da6774655', 128, 1, 'token', '[]', 0, '2024-03-30 11:48:57', '2024-03-30 11:48:57', '2025-03-30 11:48:57'),
('b98ce6e9e4863efcf289fb11007f7d4cfbc665b478daf8eaddeef8d53f7a58d3d41ff97a19b5c523', 4, 1, 'token', '[]', 1, '2023-05-08 15:30:14', '2023-05-08 15:30:14', '2024-05-08 15:30:14'),
('ba4a401b2fb357984f5c8d1d7ae1a83016afb6074e38591e4b39ce4bccc8917115c361748feb22f1', 155, 1, 'token', '[]', 0, '2024-04-06 10:40:43', '2024-04-06 10:40:43', '2025-04-06 10:40:43'),
('babe3adeb04a80976ac9c513890a78c229c21c5a286c392ab32e64e8426e99dbb0487c3475dceeb2', 141, 1, 'token', '[]', 0, '2024-04-03 14:52:21', '2024-04-03 14:52:21', '2025-04-03 14:52:21'),
('bca95a3773af704f9637dab5cd9bef13f25f1550ec3ad3132c020743cbb6d35be53bf909c8667af8', 118, 1, 'token', '[]', 1, '2024-03-16 14:42:40', '2024-03-16 14:42:40', '2025-03-16 14:42:40'),
('bcaa66692d2013457744aff53997eb65e2ff00909ab2a291816f087b3ad55cdfefb661bbe0e2e260', 53, 1, 'token', '[]', 1, '2023-12-01 15:42:29', '2023-12-01 15:42:29', '2024-12-01 15:42:29'),
('bd23029b9759e390274bede86ff8d73f5bc84220377fee9d893a598e2ac748e0a216aa4f4f15fce3', 149, 1, 'token', '[]', 0, '2024-04-05 15:01:42', '2024-04-05 15:01:42', '2025-04-05 15:01:42'),
('be45f0c3152c7f0e97bb8b5da6c0722a90a1f220f82c3c6358fe96e255fd22fddac1dcd4eaf1b6de', 170, 1, 'token', '[]', 1, '2024-05-10 16:47:30', '2024-05-10 16:47:30', '2025-05-10 16:47:30'),
('bf1d7571861b32959b69263d7290a8f0123a1bb69bdba50381c0d0ac35c7eec6f46d0ee961c58bb3', 170, 1, 'token', '[]', 1, '2024-05-10 17:21:29', '2024-05-10 17:21:29', '2025-05-10 17:21:29'),
('bfad8e237b34a64affdbd979cc395ff994a6647a5a011fb613a906b8afea1c935b78fda4fcdbe134', 50, 1, 'token', '[]', 0, '2023-12-01 12:00:27', '2023-12-01 12:00:27', '2024-12-01 12:00:27'),
('c00e7617acd1c9fad7eeb9bb9dfb40e010d966f40598e666f1d36b0b7a7215faa55bb35384e639f6', 23, 1, 'token', '[]', 0, '2023-09-15 13:41:50', '2023-09-15 13:41:50', '2024-09-15 13:41:50'),
('c1bf0b14a07aac210d71c05bb7fbf486edbf05d190a38fb40c3e1f3d8bd6f50db0f4ac59ce333acc', 6, 1, 'token', '[]', 1, '2023-10-19 17:57:23', '2023-10-19 17:57:23', '2024-10-19 17:57:23'),
('c1df9eaee2b849ef8805063055eeee9d44d1d41285813f3da8ddfde7714fb15379e61355cc3d4bb7', 128, 1, 'token', '[]', 0, '2024-05-06 13:50:11', '2024-05-06 13:50:11', '2025-05-06 13:50:11'),
('c22e6b1612345b514324fee483a7c5b9b2bdfba6b24c77ee10a12525f447b0970677f024588a40a7', 23, 1, 'token', '[]', 0, '2024-04-04 18:46:44', '2024-04-04 18:46:44', '2025-04-04 18:46:44'),
('c27652947254a16ce3a9443bb266bbe7c4ddb737f66e855c237ca3360dca79dd6b13fae334219abe', 13, 1, 'token', '[]', 1, '2024-04-03 11:57:19', '2024-04-03 11:57:19', '2025-04-03 11:57:19'),
('c30f6e4026d7efc232f45b3929ff4b74048cd29420d56560db3a6f1c5bb406bdc1280b13bbc1907e', 128, 1, 'token', '[]', 0, '2024-03-30 11:45:15', '2024-03-30 11:45:15', '2025-03-30 11:45:15'),
('c31831551673b54f990a5dc37c5046b5c4873d6a4819230a4b3d05507f63b04e604ce62a5e7d250c', 113, 1, 'token', '[]', 0, '2024-03-13 14:19:09', '2024-03-13 14:19:09', '2025-03-13 14:19:09'),
('c4481d1ca86d9838008d6208e094c91c2fa679b95ae71ee4c8eb0a99cc2db5284b9c7c19a7a20c78', 145, 1, 'token', '[]', 0, '2024-04-04 18:47:51', '2024-04-04 18:47:51', '2025-04-04 18:47:51'),
('c4f53f8c4d6af447f85829e62a59d14b4a5f9f216b480f5d849b2561682427e1aec11a9b0050be70', 23, 1, 'token', '[]', 1, '2024-05-08 17:20:23', '2024-05-08 17:20:23', '2025-05-08 17:20:23'),
('c5d3d13fe886d67074a0c1f86208a19f0cabe602033a786910b85d045c4f23dfa751bc3745cb0bc2', 152, 1, 'token', '[]', 0, '2024-04-05 18:42:04', '2024-04-05 18:42:04', '2025-04-05 18:42:04');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('c62399785c19327a1e4c7b5d999ae56f82044a1995422d71a5044f793a060c1cce326e7056c41d4f', 144, 1, 'token', '[]', 1, '2024-04-05 19:26:23', '2024-04-05 19:26:23', '2025-04-05 19:26:23'),
('c6775d840ae5f3ec8f4b3584034bc2c7a40e299b58d9fd230a65ac9268ace02ed6128867913f8e8f', 61, 1, 'token', '[]', 0, '2023-12-07 16:44:57', '2023-12-07 16:44:57', '2024-12-07 16:44:57'),
('c746102a79de233833d7e604cabdc97ac6de7d3fa265c3a8f7c4c7f2198e88a22034639776544f4c', 56, 1, 'token', '[]', 1, '2023-12-03 20:50:58', '2023-12-03 20:50:58', '2024-12-03 20:50:58'),
('c7d2323b17428f6cda26e9d5f27bae5c9f7962420ee3041a19fc1b4a75ffccd3e1cda92c60ed9041', 122, 1, 'token', '[]', 0, '2024-03-20 12:25:07', '2024-03-20 12:25:07', '2025-03-20 12:25:07'),
('c8c741c5d452fb82a87195e5e54b7549ce350c9060bbd7f92d8aa392a6d5cd80aa158a04f2b38f40', 155, 1, 'token', '[]', 1, '2024-04-05 19:28:51', '2024-04-05 19:28:51', '2025-04-05 19:28:51'),
('c9b8a60a8c1019c4a5ced0b6c3289b8de76a167502862ef36053f678b9074620a716bd0b7e009a9f', 69, 1, 'token', '[]', 0, '2023-12-20 14:42:08', '2023-12-20 14:42:08', '2024-12-20 14:42:08'),
('ca03683ed4f141c03e114d27f33dfa4e5e7f6219cebef8d15d14068c0513e7ca887abbef55f5111a', 6, 1, 'token', '[]', 1, '2023-10-20 12:10:48', '2023-10-20 12:10:48', '2024-10-20 12:10:48'),
('cb621fbb9787025108f5fd9a8f29b309871a69070da357674456ed96e2d8d8916bb8075888477bed', 21, 1, 'token', '[]', 0, '2023-11-07 09:55:53', '2023-11-07 09:55:53', '2024-11-07 09:55:53'),
('cb9cfeeb91cfe05aab35a1e03fd8742a78bd53d5a4be9194a680222d6fe9845a4463c8f1c511a7f8', 167, 1, 'token', '[]', 1, '2024-05-22 15:04:26', '2024-05-22 15:04:26', '2025-05-22 15:04:26'),
('cbdf77e152954becb9d858d313ed160c845eb0d21a46be207c07cf1ac3adc868c24168fb5b4fd528', 39, 1, 'token', '[]', 0, '2024-03-11 13:27:15', '2024-03-11 13:27:15', '2025-03-11 13:27:15'),
('ccab377cb157460b5ffae998bc188192d494688e8faa5fea6f666d5ae6e6ecfc75f3ce314f9aa8ac', 144, 1, 'token', '[]', 1, '2024-04-05 19:37:45', '2024-04-05 19:37:45', '2025-04-05 19:37:45'),
('cd70a9e0a566b8f12b7f783ae8bde841eb678997129fc7b759ffe1c5a750d3beed88be87d241603c', 45, 1, 'token', '[]', 0, '2023-11-28 18:28:33', '2023-11-28 18:28:33', '2024-11-28 18:28:33'),
('cdfc0b0ebcf633187d7b9f4dd20da834d6a54c53a1fd87699a8c64204cf67167a692bb0eea5a98d2', 177, 1, 'token', '[]', 1, '2024-05-14 13:22:19', '2024-05-14 13:22:19', '2025-05-14 13:22:19'),
('ceed4abfb969efc1c719a00903b9417fbe33cb7e4193c8eb597b2bb30a8767d91f0d35827631aae9', 51, 1, 'token', '[]', 0, '2023-12-01 13:20:58', '2023-12-01 13:20:58', '2024-12-01 13:20:58'),
('cf343e15545a006ba5cf91a39f266436b0b46b47f9c51f5d7ffbbace225bebfef5b5ddd1232add74', 17, 1, 'token', '[]', 0, '2024-02-08 10:25:59', '2024-02-08 10:25:59', '2025-02-08 10:25:59'),
('d06febeffa1ca4f19ee8b4b50465fea802f7034c036b099be49cf529e924afd2c57b39fbcb158f63', 2, 1, 'token', '[]', 1, '2023-01-19 12:42:38', '2023-01-19 12:42:38', '2024-01-19 12:42:38'),
('d08be0426896250273690939d10068f6d4fe399ed04dd6a633700112e337f38a7f4554d6d65bd287', 146, 1, 'token', '[]', 0, '2024-04-05 12:05:29', '2024-04-05 12:05:29', '2025-04-05 12:05:29'),
('d21224bd9ddf92ce0ff7a7aa7ea37886e8ddc3b87f09b00b211d3194221ab22f3baaa4e0e43d021e', 167, 1, 'token', '[]', 0, '2024-06-03 18:02:18', '2024-06-03 18:02:18', '2025-06-03 18:02:18'),
('d21c347291a1f8d69dc516c4b5440026b5a2d028f5fe2ac3cdcab9112be069928da709166d4655d2', 128, 1, 'token', '[]', 0, '2024-04-02 17:03:27', '2024-04-02 17:03:27', '2025-04-02 17:03:27'),
('d52e292f7fc4e4556f8ee18446ad293af7bbae3f6f4d86b10d6281c0e20682dc5e7eb08e4f7355fd', 165, 1, 'token', '[]', 0, '2024-05-08 15:45:12', '2024-05-08 15:45:12', '2025-05-08 15:45:12'),
('d7d32ecabef78341ff070ee97e7989d76b05a359cbc4de922c6cb00231fb13bf78dcbff14dd80f15', 42, 1, 'token', '[]', 0, '2023-11-28 17:36:26', '2023-11-28 17:36:26', '2024-11-28 17:36:26'),
('d7f89386e25f54f355e670e2794a9b27959187c21afe61aa3f55ee6637fcae193e9a009d694216fe', 95, 1, 'token', '[]', 0, '2024-02-22 06:20:03', '2024-02-22 06:20:03', '2025-02-22 06:20:03'),
('d81704e37c0639d2064ea3d82be305cfe42fdef37d529b87961bb9f94804d90a62e793b997788480', 57, 1, 'token', '[]', 0, '2023-12-04 10:55:01', '2023-12-04 10:55:01', '2024-12-04 10:55:01'),
('d834e3a6e8776a3004130b7d4b1489f0921e71032b5a454ad3555e8736dc2af53460b44f436b2b62', 55, 1, 'token', '[]', 0, '2023-12-02 14:33:37', '2023-12-02 14:33:37', '2024-12-02 14:33:37'),
('d8dd96eb5333dce1f8bdb7abad37d8c0f30ce34c5c12c9b6065481ffac226db2cb94efdec6fb7969', 127, 1, 'token', '[]', 0, '2024-05-10 18:56:44', '2024-05-10 18:56:44', '2025-05-10 18:56:44'),
('da53dca8790f1d5cfa6fa168695c449fee173ed82345611954ba2692c301280ca9355e8d3afeb53d', 143, 1, 'token', '[]', 0, '2024-04-04 13:24:06', '2024-04-04 13:24:06', '2025-04-04 13:24:06'),
('dab199776cec9c25f87a5a8a5a959a714544fd4e8c5450c7c47857bff2745e2f41cda9dc0a38f7b8', 105, 1, 'token', '[]', 0, '2024-03-03 09:37:19', '2024-03-03 09:37:19', '2025-03-03 09:37:19'),
('db7ee25e36fb9c9903239300b06e7b90c9a16a68ae05ff375bf551005c95827bbd9857a3ef8076d1', 29, 1, 'token', '[]', 0, '2023-09-29 17:13:32', '2023-09-29 17:13:32', '2024-09-29 17:13:32'),
('dcc89f840dd762935f0f9298935d93dee49e16b724f6050285c78415f78d33491bb72c789f001159', 19, 1, 'token', '[]', 1, '2023-05-10 13:04:30', '2023-05-10 13:04:30', '2024-05-10 13:04:30'),
('dcdfeedf77efaafb505337738f9e883ffd04e25788e9dc1f0f6c131390fb8f8d3be110d5976a232e', 128, 1, 'token', '[]', 0, '2024-03-30 12:10:15', '2024-03-30 12:10:15', '2025-03-30 12:10:15'),
('de4afc1675975047100817f4b56c0f7dd36c95708f673b180d647172ec698ca8f2e85f707c465fe9', 177, 1, 'token', '[]', 0, '2024-05-14 12:47:37', '2024-05-14 12:47:37', '2025-05-14 12:47:37'),
('de77bc4e3e7428e17878f6c5171fadfa197b5e0e0b1651b9d7bf64fb4cd5abb2353a251993a8d7ac', 13, 1, 'token', '[]', 0, '2023-04-18 20:15:15', '2023-04-18 20:15:15', '2024-04-18 20:15:15'),
('deb3e063ecadbd2bf36eeb4dab0c43b4bc9cbe740eb1cf4699f63843d084dbb11f07a59298ed80fe', 19, 1, 'token', '[]', 0, '2023-05-09 17:35:33', '2023-05-09 17:35:33', '2024-05-09 17:35:33'),
('dfd57eb74516bf4a3399317c2413a587a3020c1e9f525e7f81c8b4d185d01943d2edda1b41b55777', 167, 1, 'token', '[]', 0, '2024-05-10 10:16:58', '2024-05-10 10:16:58', '2025-05-10 10:16:58'),
('dfe26373a76e7b544fb761de8bb9b6a2713f2316735635969b63133cd149251bc42b24256f599689', 167, 1, 'token', '[]', 1, '2024-05-08 18:21:55', '2024-05-08 18:21:55', '2025-05-08 18:21:55'),
('dfe376ae4ac51c2344b9e0bf2c5df756d16ff3c926849365404422325ef6eea0e46885526bda45e7', 78, 1, 'token', '[]', 0, '2024-01-11 14:14:50', '2024-01-11 14:14:50', '2025-01-11 14:14:50'),
('e054e04b3bf26e83252f7867df89eeeb2eeb3df419a22d35db2c5209c5bb96d4bf27acee3f28acd7', 33, 1, 'token', '[]', 0, '2023-10-17 18:33:29', '2023-10-17 18:33:29', '2024-10-17 18:33:29'),
('e0ff8ba02afea7da5556bc9624fcb2e34799415a56561a4ee124f2211b791f5e32374ff9ca3ca91b', 21, 1, 'token', '[]', 1, '2023-05-10 15:46:11', '2023-05-10 15:46:11', '2024-05-10 15:46:11'),
('e1fcc86f9352fa0084c9a6d27e8f89cd99654b1f177802d9b2bdf9820b73b54a42d1389819690d55', 17, 1, 'token', '[]', 0, '2024-02-27 12:48:01', '2024-02-27 12:48:01', '2025-02-27 12:48:01'),
('e24e41f0c28f71599e93f7a51342944469ad3be22e57c206acfc7f0cb0ce0fda9f0b5267e090aba3', 10, 1, 'token', '[]', 0, '2024-05-06 13:50:14', '2024-05-06 13:50:14', '2025-05-06 13:50:14'),
('e32294e041f548630939d6d75a1a84727ca4deded40874a8896e2b2030eb01ac54268ba12f66670f', 128, 1, 'token', '[]', 0, '2024-04-02 17:13:10', '2024-04-02 17:13:10', '2025-04-02 17:13:10'),
('e34b93d4c2290b2907ffa9c1339e6797334f7bd599655c7d362a98c9f580e72391d04b40d5b34b63', 167, 1, 'token', '[]', 1, '2024-05-21 18:22:07', '2024-05-21 18:22:07', '2025-05-21 18:22:07'),
('e34d5604210bd2cb15890101cd900bc3aea8684572ef42e6b26a79ab0a455dd8755ee34fb398a40b', 24, 1, 'token', '[]', 1, '2023-09-21 17:13:13', '2023-09-21 17:13:13', '2024-09-21 17:13:13'),
('e39d417a460069dc0975d7ba3080e0dd51af6b322eb1c85b72f24cb2b2f6a83dfabe05e4ceabb559', 23, 1, 'token', '[]', 0, '2024-04-05 16:03:43', '2024-04-05 16:03:43', '2025-04-05 16:03:43'),
('e3a957c49105536f410913a7e3b4042e5729f7081d6dc479962ec5257d8e8dd46382f85b50f10006', 200, 1, 'token', '[]', 1, '2024-06-21 15:45:08', '2024-06-21 15:45:08', '2025-06-21 15:45:08'),
('e4ca469864ea699a1284e18aa6f24a26964ba22d5a92bed785258fd9fbad1d7f725445093b7ee54e', 169, 1, 'token', '[]', 0, '2024-06-24 19:01:46', '2024-06-24 19:01:46', '2025-06-24 19:01:46'),
('e6700a07ec66229414df286feab93de0c55d5ccb95905fd5c714716dd58a01d0b4b5e5d819c185fc', 140, 1, 'token', '[]', 1, '2024-04-04 11:59:24', '2024-04-04 11:59:24', '2025-04-04 11:59:24'),
('e6f24b1fc8b24fae250cab09096743d007d69d843341398499f780e058f6fdca6faa70ebbdb1142b', 8, 1, 'token', '[]', 0, '2023-04-18 13:29:43', '2023-04-18 13:29:43', '2024-04-18 13:29:43'),
('e71753e558a640a19cc2d5cf49f5c8de6c30c8bb2b205b043df552c18c16d5b3f67b6ec90e8b9a1c', 23, 1, 'token', '[]', 0, '2024-03-29 12:15:50', '2024-03-29 12:15:50', '2025-03-29 12:15:50'),
('e7e4f6782d7dcf1f78419cdc9ff4538fbd004e61f7411f9e94f71993ff21de187e29a73d4a223e5b', 161, 1, 'token', '[]', 1, '2024-04-17 12:20:28', '2024-04-17 12:20:28', '2025-04-17 12:20:28'),
('e9e34f23e327ad9f17d683c79fcc9b389d37bf2adbf009f1443bc05ff2c55027e6cb067aa50fa140', 73, 1, 'token', '[]', 0, '2023-12-25 19:39:46', '2023-12-25 19:39:46', '2024-12-25 19:39:46'),
('e9e5a733c5003989d1798d687a90fb28bfe84a9eb9bcbd64024fbd6ea214029ec77a103d4d8b8178', 202, 1, 'token', '[]', 0, '2024-06-25 11:46:53', '2024-06-25 11:46:53', '2025-06-25 11:46:53'),
('ea47a84026b4d67085e0dde5f74e1b67a1888be1a05190d9f0668f55ff2441afbb07348ecc652f1e', 191, 1, 'token', '[]', 1, '2024-05-21 17:43:56', '2024-05-21 17:43:56', '2025-05-21 17:43:56'),
('eaf01272ac4de2a5c295e05167c2d2cd0bb9cb72d3e87daaa68fe8db0bf81bb5eb64595d4c9262cf', 2, 1, 'token', '[]', 0, '2023-01-21 11:27:54', '2023-01-21 11:27:54', '2024-01-21 11:27:54'),
('ec08006dd0ca568bda5b1be898a6fdc433b7c946a2a696ec06c9eaf02e3d0cfdf3f2c4f8faee8228', 39, 1, 'token', '[]', 0, '2024-03-11 11:46:06', '2024-03-11 11:46:06', '2025-03-11 11:46:06'),
('ece1f492f77f0a89db7674262d95435e085f922f0890dfabb54f7c0acd99047d41c114b6638eaeed', 92, 1, 'token', '[]', 0, '2024-02-20 22:40:41', '2024-02-20 22:40:41', '2025-02-20 22:40:41'),
('edb59163afe8eb584ac28c78d664c0ee4e06035409716293c16518f42a7c2d8680ba4b1fbaac9cb5', 6, 1, 'token', '[]', 0, '2023-06-23 11:38:14', '2023-06-23 11:38:14', '2024-06-23 11:38:14'),
('edc192db396cca658af93b6a0297b742bfb383f149bfbfebb7cf75bad81c9aeda3f706376c0e7dd7', 167, 1, 'token', '[]', 1, '2024-05-10 11:01:52', '2024-05-10 11:01:52', '2025-05-10 11:01:52'),
('eeaadc782d8c499951418828340a1b2a2c16cf01a67be704092c32342ab609649eb7c8f131828a7f', 182, 1, 'token', '[]', 0, '2024-05-17 11:13:50', '2024-05-17 11:13:50', '2025-05-17 11:13:50'),
('f1eb5dee59bcaf61f6ea78a28e748cbf5e9e4a9d19d11f580b47a76d82361ae220b06adf5fbd0b40', 172, 1, 'token', '[]', 1, '2024-05-13 15:15:17', '2024-05-13 15:15:17', '2025-05-13 15:15:17'),
('f1fcf019875d7c835a915a005e5c51fd158c40abf29c83edb5e1359c70a53886c2cd55008ec4865d', 46, 1, 'token', '[]', 0, '2023-12-18 17:56:54', '2023-12-18 17:56:54', '2024-12-18 17:56:54'),
('f2a3674c52db60d1d1224c3678afe87ca25442c1262861ee49a690243f5e63d0b9464db0f0c98737', 163, 1, 'token', '[]', 0, '2024-05-06 15:13:39', '2024-05-06 15:13:39', '2025-05-06 15:13:39'),
('f2ff9ce1ba2f681f3152681cbe2a3235138c29908c9bb26edd591f41eeffa929a3d5b5d038d45f20', 156, 1, 'token', '[]', 1, '2024-04-09 16:21:23', '2024-04-09 16:21:23', '2025-04-09 16:21:23'),
('f51d263023b5829fd7233b981ed7bf648eb7f6682271d821989b33cfc45351cc852998f2229f9fa1', 6, 1, 'token', '[]', 1, '2023-10-21 13:32:03', '2023-10-21 13:32:03', '2024-10-21 13:32:03'),
('f5fd32e9a9d9e3a59d3e2b770ddcb409ccfe0d4689092e2aa105155b180afff51781948ac467e57d', 23, 1, 'token', '[]', 0, '2024-04-10 16:15:50', '2024-04-10 16:15:50', '2025-04-10 16:15:50'),
('f69cee8f13b96d6f457145cfb53e1d6597cae9096f4a738b0fbbdf512732fb7a2330ae50cd075dd3', 23, 1, 'token', '[]', 0, '2024-03-30 17:44:17', '2024-03-30 17:44:17', '2025-03-30 17:44:17'),
('f740ccf61ceba49e961da9df511a9bf842077bccaa5d5b44cd9e350b42b0a5dff152213a634386f1', 128, 1, 'token', '[]', 0, '2024-04-02 17:04:26', '2024-04-02 17:04:26', '2025-04-02 17:04:26'),
('f830fa767d51b5421c0a65c6b467b03b9edf2e073a3f7497b58f5224e58bc0a19ae72a637079d5b1', 153, 1, 'token', '[]', 0, '2024-04-05 18:47:59', '2024-04-05 18:47:59', '2025-04-05 18:47:59'),
('f89680ef63042d1359d926de3c8eb5b4c3279fe077f31fb7b3d97f6bfc2aa6526a7e6aaa55719651', 110, 1, 'token', '[]', 0, '2024-03-10 15:08:31', '2024-03-10 15:08:31', '2025-03-10 15:08:31'),
('f99b13150e041ccce8b6be524bdbbbd72c9b593e1f31482d55cffdbd36d924ceff18c2d71ab21496', 108, 1, 'token', '[]', 0, '2024-03-08 20:29:49', '2024-03-08 20:29:49', '2025-03-08 20:29:49'),
('fb8b9bb757e4a9af734357a51069ca7c8796e5a7c6bed430fc34e9c7d680d16c971acab6540c2755', 21, 1, 'token', '[]', 0, '2023-05-10 16:09:27', '2023-05-10 16:09:27', '2024-05-10 16:09:27'),
('fbb37c9334d1535be79ec45340a51b19cad5245ba405f54580cbabc7ab7d6a75693d08f000650cd9', 147, 1, 'token', '[]', 0, '2024-04-05 12:09:03', '2024-04-05 12:09:03', '2025-04-05 12:09:03'),
('fc145ed20ff294a713c75db4b49c49a45db3a211999893171e5912a95e1ba16c8f1817c5bfe72ff1', 167, 1, 'token', '[]', 1, '2024-05-21 18:28:05', '2024-05-21 18:28:05', '2025-05-21 18:28:05'),
('fc9aedd3b7a316d1a90be99b3f8ba0273f9fe1ac48a1525fa8c4a055df970d3d52484e7ab4278915', 179, 1, 'token', '[]', 1, '2024-05-16 11:38:28', '2024-05-16 11:38:28', '2025-05-16 11:38:28'),
('fcbcf5aa80d9678120b41507e76befa6fa45445a7188acff768ce0aae88eb88dba308940fa7e5918', 167, 1, 'token', '[]', 1, '2024-05-16 16:28:46', '2024-05-16 16:28:46', '2025-05-16 16:28:46'),
('fd27122e729a1b7e0299bbf05232572bbdf5c91d34253ccbcba53d4ccdc870102615195f29ffb289', 150, 1, 'token', '[]', 0, '2024-04-05 16:09:38', '2024-04-05 16:09:38', '2025-04-05 16:09:38'),
('fdf7317289f11db614c50f052cd2ebbf5bcc8c45b3e601f1f8da2970ade21ba14053ce6c74bba74c', 128, 1, 'token', '[]', 0, '2024-03-29 17:20:48', '2024-03-29 17:20:48', '2025-03-29 17:20:48'),
('fe73d915b3624d3346733c8ed111dbf76c5b2f1b1553aae5783f7d0708e7d3bfa04e6407b2e29ba7', 166, 1, 'token', '[]', 1, '2024-05-08 17:28:12', '2024-05-08 17:28:12', '2025-05-08 17:28:12'),
('ff58d109175a93c6414d0a6dda4cc230a904b445e36e79c14863e1f91882eeb34ef38c42cfd37c2b', 185, 1, 'token', '[]', 1, '2024-05-17 19:43:33', '2024-05-17 19:43:33', '2025-05-17 19:43:33');

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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `origin`, `user_id`, `rider_id`, `rider_status`, `address_id`, `items`, `sub_total`, `promo_code_id`, `discount_percent`, `discount_amount`, `tax`, `shipping_charge`, `net_amount`, `delivery_date`, `order_time`, `pickup_time`, `on_job_time`, `reached_time`, `delivery_time`, `delivery_slot_id`, `payment_mode`, `change_required`, `status`, `delivery_status`, `created_at`, `updated_at`) VALUES
(1, 'Web', 2, NULL, 'Pending Collection', 1, 1, 56, NULL, 0, 0, 0, 0, 56, '2023-01-23', '2023-01-21 11:28:52', NULL, NULL, NULL, NULL, 3, 'COD', 100, 'Placed', 'Order Received', '2023-01-21 11:28:05', '2023-01-21 11:28:52'),
(2, 'Web', 4, NULL, 'Pending Collection', 6, 1, 68, NULL, 0, 0, 1.36, 0, 69.36, '2023-05-01', '2023-04-25 17:17:27', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Delivered', '2023-01-23 12:52:55', '2023-04-25 17:28:11'),
(3, 'Bill', 2, NULL, 'Pending Collection', 1, 1, 576, NULL, 0, 0, 11.52, 0, 587.52, '2023-02-10', '2023-02-10 18:36:04', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Delivered', '2023-02-10 18:36:04', '2023-02-10 18:37:23'),
(4, 'Bill', 2, NULL, 'Pending Collection', 1, 1, 136, NULL, 0, 0, 2.72, 0, 138.72, '2023-02-15', '2023-02-15 12:06:43', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-02-15 12:06:43', '2023-02-15 12:06:43'),
(5, 'Web', 6, NULL, 'Pending Collection', 5, 8, 2050, NULL, 0, 0, 21.5, 0, 2071.5, '2023-06-24', '2023-06-23 11:43:12', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Order Received', '2023-02-15 12:17:33', '2023-06-23 11:43:12'),
(6, 'Bill', 2, NULL, 'Pending Collection', 1, 1, 576, NULL, 0, 0, 11.52, 0, 587.52, '2023-03-22', '2023-03-22 10:46:55', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-03-22 10:46:55', '2023-03-22 10:46:55'),
(7, 'Bill', 2, NULL, 'Pending Collection', 1, 3, 1228, NULL, 0, 0, 24.560000000000002, 0, 1252.56, '2023-03-27', '2023-03-22 10:49:18', NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Placed', 'Order Received', '2023-03-22 10:49:18', '2023-03-22 10:49:18'),
(8, 'Web', 11, NULL, 'Pending Collection', NULL, 4, 340, NULL, 0, 0, 0, 0, 340, '2023-04-01', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-04-01 13:13:22', '2023-04-01 13:13:22'),
(9, 'Web', 13, NULL, 'Pending Collection', 12, 1, 1710, NULL, 0, 0, 0, 0, 1710, '2023-09-19', NULL, NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Created', 'Not Applicable', '2023-04-05 12:47:19', '2023-09-16 10:44:00'),
(10, 'Web', 14, NULL, 'Pending Collection', NULL, 2, 272, NULL, 0, 0, 0, 0, 272, '2023-04-15', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-04-15 08:53:31', '2023-04-15 09:07:15'),
(11, 'Web', 16, NULL, 'Pending Collection', 14, 5, 1088, NULL, 0, 0, 0, 0, 1088, '2023-04-18', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-04-18 11:34:17', '2023-04-18 11:37:22'),
(12, 'Web', 8, NULL, 'Pending Collection', 15, 1, 75, NULL, 0, 0, 0, 0, 75, '2023-05-01', '2023-04-24 11:41:06', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Order Received', '2023-04-18 13:33:14', '2023-04-24 11:41:06'),
(13, 'Web', 2, NULL, 'Pending Collection', 1, 1, 68, NULL, 0, 0, 1.36, 0, 69.36, '2023-05-01', '2023-04-20 16:16:54', NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Placed', 'Packed', '2023-04-20 16:16:05', '2023-04-26 16:32:27'),
(14, 'Web', 2, NULL, 'Pending Collection', 1, 1, 68, NULL, 0, 0, 1.36, 0, 69.36, '2023-05-01', '2023-04-26 16:52:13', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Order Received', '2023-04-20 16:17:28', '2023-04-26 16:52:13'),
(15, 'Web', 4, NULL, 'Pending Collection', 16, 1, 166, NULL, 0, 0, 3.32, 0, 169.32, '2023-05-01', '2023-04-26 17:14:21', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Order Received', '2023-04-26 17:13:12', '2023-04-26 17:14:21'),
(16, 'Web', 4, NULL, 'Pending Collection', 9, 1, 166, NULL, 0, 0, 3.32, 0, 169.32, '2023-05-01', '2023-04-26 17:18:37', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Order Received', '2023-04-26 17:16:00', '2023-04-26 17:18:37'),
(17, 'Web', 8, 10, 'Pending Collection', 15, 3, 649, NULL, 0, 0, 12.98, 0, 661.98, '2023-05-01', '2023-04-27 17:26:34', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Packed', '2023-04-27 16:36:14', '2023-04-27 17:27:17'),
(18, 'Web', 8, NULL, 'Pending Collection', 6, 1, 1800, NULL, 0, 0, 0, 0, 1800, '2023-07-04', '2023-07-03 12:14:15', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Order Received', '2023-04-27 17:30:40', '2023-07-03 12:14:15'),
(19, 'Bill', 7, 10, 'Pending Collection', 4, 2, 1630, NULL, 0, 0, 0, 0, 1630, '2023-04-28', '2023-04-27 19:26:46', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Delivered', '2023-04-27 19:26:46', '2023-04-27 19:27:15'),
(20, 'Web', 4, NULL, 'Pending Collection', 16, 1, 1245, NULL, 0, 0, 24.9, 0, 1269.9, '2023-05-08', '2023-05-05 17:46:39', NULL, NULL, NULL, NULL, 22, 'COD', 0, 'Placed', 'Order Received', '2023-04-28 12:49:22', '2023-05-05 17:46:39'),
(21, 'Web', 2, NULL, 'Pending Collection', 1, 1, 1600, NULL, 0, 0, 0, 0, 1600, '2023-05-01', '2023-04-29 13:18:37', NULL, NULL, NULL, NULL, 20, 'COD', 0, 'Placed', 'Order Received', '2023-04-29 13:18:24', '2023-04-29 13:18:37'),
(22, 'Web', 2, NULL, 'Pending Collection', 18, 1, 68, NULL, 0, 0, 1.36, 0, 69.36, '2023-05-09', '2023-05-08 18:17:52', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Order Received', '2023-05-05 17:30:18', '2023-05-08 18:17:52'),
(23, 'Web', 4, NULL, 'Pending Collection', 9, 1, 80, NULL, 0, 0, 0, 0, 80, '2023-05-09', '2023-05-08 15:40:42', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Delivered', '2023-05-05 17:52:57', '2023-05-08 15:53:22'),
(24, 'Web', 4, NULL, 'Pending Collection', 19, 1, 750, NULL, 0, 0, 0, 0, 750, '2023-05-15', '2023-05-08 18:15:49', NULL, NULL, NULL, NULL, 22, 'COD', 0, 'Placed', 'Order Received', '2023-05-08 16:19:39', '2023-05-08 18:15:49'),
(25, 'Web', 4, NULL, 'Pending Collection', 9, 1, 1800, NULL, 0, 0, 0, 0, 1800, '2023-05-10', '2023-05-09 15:35:27', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2023-05-08 19:01:18', '2023-05-09 15:35:27'),
(26, 'Web', 2, NULL, 'Pending Collection', 18, 1, 75, NULL, 0, 0, 0, 0, 75, '2023-05-10', '2023-05-09 15:00:32', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-05-09 15:00:19', '2023-05-09 15:00:32'),
(27, 'Web', 4, NULL, 'Pending Collection', 9, 1, 500, NULL, 0, 0, 0, 0, 500, '2023-05-10', '2023-05-09 15:47:39', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2023-05-09 15:47:21', '2023-05-09 15:47:39'),
(28, 'Web', 2, NULL, 'Pending Collection', 18, 1, 300, NULL, 0, 0, 0, 0, 300, '2023-05-10', '2023-05-09 17:04:52', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-05-09 17:04:34', '2023-05-09 17:04:52'),
(29, 'Web', 4, NULL, 'Pending Collection', 4, 1, 1200, NULL, 0, 0, 24, 0, 1224, '2023-06-20', '2023-06-19 18:23:10', NULL, NULL, NULL, NULL, 10, 'COD', 0, 'Placed', 'Order Received', '2023-05-09 17:29:29', '2023-06-19 18:23:10'),
(30, 'Web', 18, NULL, 'Pending Collection', NULL, 1, 600, NULL, 0, 0, 0, 0, 600, '2023-05-09', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-05-09 17:33:05', '2023-05-09 17:34:00'),
(31, 'Web', 19, NULL, 'Pending Collection', 20, 1, 800, NULL, 0, 0, 0, 0, 800, '2023-05-10', NULL, NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Created', 'Not Applicable', '2023-05-09 17:35:56', '2023-05-09 17:44:25'),
(32, 'Web', 2, NULL, 'Pending Collection', 2, 1, 100, NULL, 0, 0, 0, 0, 100, '2023-05-13', '2023-05-12 11:53:02', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2023-05-10 10:06:03', '2023-05-12 11:53:02'),
(33, 'Web', 20, NULL, 'Pending Collection', 21, 1, 75, NULL, 0, 0, 0, 0, 75, '2023-05-11', '2023-05-10 13:15:31', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Delivered', '2023-05-10 13:06:37', '2023-05-10 13:17:55'),
(34, 'Web', 20, NULL, 'Pending Collection', 23, 1, 68, NULL, 0, 0, 1.36, 0, 69.36, '2023-05-12', '2023-05-10 15:01:36', NULL, NULL, NULL, NULL, 24, 'COD', 70, 'Placed', 'Order Received', '2023-05-10 13:31:45', '2023-05-10 15:01:36'),
(35, 'Web', 20, NULL, 'Pending Collection', 23, 1, 75, NULL, 0, 0, 0, 0, 75, '2023-05-12', '2023-05-10 15:05:28', NULL, NULL, NULL, NULL, 24, 'COD', 100, 'Placed', 'Order Received', '2023-05-10 15:04:55', '2023-05-10 15:05:28'),
(36, 'Web', 20, NULL, 'Pending Collection', 23, 1, 120, NULL, 0, 0, 0, 0, 120, '2023-05-15', '2023-05-10 15:12:44', NULL, NULL, NULL, NULL, 23, 'COD', 200, 'Placed', 'Order Received', '2023-05-10 15:11:19', '2023-05-10 15:12:44'),
(37, 'Web', 20, NULL, 'Pending Collection', 22, 1, 300, NULL, 0, 0, 0, 0, 300, '2023-05-19', '2023-05-10 15:17:03', NULL, NULL, NULL, NULL, 24, 'COD', 500, 'Placed', 'Order Received', '2023-05-10 15:15:25', '2023-05-10 15:17:03'),
(38, 'Web', 21, NULL, 'Pending Collection', 24, 2, 145, NULL, 0, 0, 2.9, 0, 147.9, '2023-05-11', '2023-05-10 15:53:02', NULL, NULL, NULL, NULL, 17, 'COD', 150, 'Placed', 'Order Received', '2023-05-10 15:47:39', '2023-05-10 15:53:02'),
(39, 'Web', 21, NULL, 'Pending Collection', 3, 2, 300, NULL, 0, 0, 0, 0, 300, '2023-05-11', '2023-05-10 16:15:50', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2023-05-10 15:58:57', '2023-05-10 16:15:50'),
(40, 'Web', 21, NULL, 'Pending Collection', 3, 1, 600, NULL, 0, 0, 0, 0, 600, '2023-05-16', '2023-05-15 10:42:18', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2023-05-10 16:52:24', '2023-05-15 10:42:18'),
(41, 'Web', 2, NULL, 'Pending Collection', 2, 1, 3200, NULL, 0, 0, 0, 0, 3200, '2023-05-16', '2023-05-15 09:43:56', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2023-05-15 09:43:41', '2023-05-15 09:43:56'),
(42, 'Web', 2, NULL, 'Pending Collection', 2, 1, 3200, NULL, 0, 0, 0, 0, 3200, '2023-05-16', '2023-05-15 09:45:22', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2023-05-15 09:45:14', '2023-05-15 09:45:22'),
(43, 'Web', 2, NULL, 'Pending Collection', 2, 1, 3200, NULL, 0, 0, 0, 0, 3200, '2023-05-16', '2023-05-15 09:48:17', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2023-05-15 09:48:10', '2023-05-15 09:48:17'),
(44, 'Web', 2, NULL, 'Pending Collection', 2, 1, 3200, NULL, 0, 0, 0, 0, 3200, '2023-05-16', '2023-05-15 09:55:37', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2023-05-15 09:55:31', '2023-05-15 09:55:37'),
(45, 'Web', 21, NULL, 'Pending Collection', 3, 1, 2400, NULL, 0, 0, 0, 0, 2400, '2023-05-16', '2023-05-15 10:59:12', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2023-05-15 10:58:59', '2023-05-15 10:59:12'),
(46, 'Web', 21, NULL, 'Pending Collection', 3, 1, 9000, NULL, 0, 0, 0, 0, 9000, '2023-05-18', '2023-05-17 18:48:18', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2023-05-17 18:48:02', '2023-05-17 18:48:18'),
(47, 'Web', 21, NULL, 'Pending Collection', 3, 1, 3000, NULL, 0, 0, 37020, 0, 40020, '2023-05-18', '2023-05-17 18:53:36', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2023-05-17 18:53:28', '2023-05-17 18:53:36'),
(48, 'Web', 21, NULL, 'Pending Collection', 3, 1, 4200, NULL, 0, 0, 0, 0, 4200, '2023-05-18', '2023-05-17 19:06:09', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2023-05-17 19:06:00', '2023-05-17 19:06:09'),
(49, 'Web', 4, NULL, 'Pending Collection', 4, 1, 1600, NULL, 0, 0, 0, 0, 1600, '2023-06-20', '2023-06-19 18:30:33', NULL, NULL, NULL, NULL, 10, 'COD', 0, 'Placed', 'Delivered', '2023-06-19 18:30:15', '2023-06-19 18:32:58'),
(50, 'Bill', 6, NULL, 'Pending Collection', 5, 2, 218, NULL, 0, 0, 4.36, 0, 222.36, '2023-07-03', '2023-07-03 13:32:08', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-03 13:32:08', '2023-07-03 13:32:08'),
(51, 'Bill', 21, NULL, 'Pending Collection', 3, 2, 876, NULL, 0, 0, 17.52, 20, 913.52, '2023-07-04', '2023-07-04 06:15:36', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 06:15:36', '2023-07-04 06:15:36'),
(52, 'Bill', 6, NULL, 'Pending Collection', 5, 1, 2158, NULL, 0, 0, 43.16, 0, 2201.16, '2023-07-04', '2023-07-04 06:18:25', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 06:18:25', '2023-07-04 06:18:25'),
(53, 'Web', 4, NULL, 'Pending Collection', 4, 2, 523.5, NULL, 0, 0, 18.675, 0, 542.175, '2023-07-06', '2023-07-05 10:46:42', NULL, NULL, NULL, NULL, 12, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 12:26:08', '2023-07-05 10:46:42'),
(54, 'Bill', 2, NULL, 'Pending Collection', 2, 1, 154, NULL, 0, 0, 3.08, 0, 157.08, '2023-07-04', '2023-07-04 16:43:03', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 16:43:03', '2023-07-04 16:43:03'),
(55, 'Bill', 2, NULL, 'Pending Collection', 2, 1, 3200, NULL, 0, 0, 0, 0, 3200, '2023-07-05', '2023-07-04 16:48:27', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 16:48:27', '2023-07-04 16:48:27'),
(56, 'Bill', 2, NULL, 'Pending Collection', 2, 1, 3200, NULL, 0, 0, 0, 0, 3200, '2023-07-05', '2023-07-04 16:48:38', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 16:48:38', '2023-07-04 16:48:38'),
(57, 'Bill', 2, NULL, 'Pending Collection', 2, 1, 249, NULL, 0, 0, 12.45, 0, 261.45, '2023-07-06', '2023-07-04 17:05:44', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 17:05:44', '2023-07-04 17:05:44'),
(58, 'Bill', 2, NULL, 'Pending Collection', 2, 1, 249, NULL, 0, 0, 12.45, 0, 261.45, '2023-07-06', '2023-07-04 17:05:59', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 17:05:59', '2023-07-04 17:05:59'),
(59, 'Web', 2, NULL, 'Pending Collection', 2, 1, 249, NULL, 0, 0, 12.45, 0, 261.45, '2023-07-05', '2023-07-04 17:12:16', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2023-07-04 17:12:02', '2023-07-04 17:12:16'),
(60, 'Bill', 21, NULL, 'Pending Collection', 8, 1, 68, NULL, 0, 0, 1.36, 0, 69.36, '2023-07-05', '2023-07-05 13:23:26', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-05 13:23:26', '2023-07-05 13:23:26'),
(61, 'Bill', 18, NULL, 'Pending Collection', 9, 2, 730, NULL, 0, 0, 14.6, 0, 744.6, '2023-07-05', '2023-07-05 13:24:31', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-05 13:24:31', '2023-07-05 13:24:31'),
(62, 'Bill', 19, NULL, 'Pending Collection', 10, 2, 604, NULL, 0, 0, 12.08, 0, 616.08, '2023-07-06', '2023-07-05 13:27:32', NULL, NULL, NULL, NULL, 12, 'COD', 0, 'Placed', 'Order Received', '2023-07-05 13:27:32', '2023-07-05 13:27:32'),
(63, 'Web', 4, NULL, 'Pending Collection', 4, 1, 622.5, NULL, 0, 0, 31.125, 0, 653.625, '2023-07-06', '2023-07-05 13:32:13', NULL, NULL, NULL, NULL, 12, 'COD', 0, 'Placed', 'Delivered', '2023-07-05 13:31:48', '2023-07-05 13:35:39'),
(64, 'Bill', 4, NULL, 'Pending Collection', 4, 2, 644, NULL, 0, 0, 12.879999999999999, 25, 681.88, '2023-07-07', '2023-07-07 16:22:22', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-07-07 16:22:22', '2023-07-07 16:22:22'),
(65, 'Web', 4, NULL, 'Pending Collection', 4, 1, 679, NULL, 0, 0, 0, 0, 679, '2023-08-23', '2023-08-22 18:47:29', NULL, NULL, NULL, NULL, 11, 'COD', 0, 'Placed', 'Out for Delivery', '2023-08-05 12:34:37', '2023-08-22 18:50:59'),
(66, 'Web', 4, 10, 'Pending Collection', 4, 1, 61, NULL, 0, 0, 3.05, 0, 64.05, '2023-11-04', '2023-11-03 19:20:13', NULL, NULL, NULL, NULL, 14, 'COD', 0, 'Placed', 'Delivered', '2023-08-22 18:54:35', '2023-11-03 19:27:08'),
(67, 'Web', 23, NULL, 'Pending Collection', 11, 2, 1782, NULL, 0, 0, 6.35, 0, 1788.35, '2023-09-16', '2023-09-15 14:57:01', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2023-09-15 13:41:54', '2023-09-15 14:57:01'),
(68, 'Web', 23, NULL, 'Pending Collection', 11, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-09-15', '2024-04-10 15:32:19', NULL, NULL, NULL, NULL, NULL, 'COD', 2468, 'Placed', 'Order Received', '2023-09-15 15:03:05', '2024-04-10 15:32:19'),
(69, 'Web', 28, NULL, 'Pending Collection', 13, 2, 1762, NULL, 0, 0, 0, 0, 1762, '2023-10-02', NULL, NULL, NULL, NULL, NULL, 22, 'COD', 0, 'Created', 'Packed', '2023-09-22 12:56:13', '2023-09-22 19:34:26'),
(70, 'Web', 30, NULL, 'Pending Collection', 14, 1, 1710, NULL, 0, 0, 0, 0, 1710, '2023-10-18', '2023-10-17 05:33:22', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-10-17 05:30:16', '2023-10-17 05:33:22'),
(71, 'Web', 31, NULL, 'Pending Collection', 15, 5, 2477, NULL, 0, 0, 11.35, 0, 2488.35, '2023-10-18', '2023-10-17 08:30:13', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-10-17 08:29:15', '2023-10-17 08:30:13'),
(72, 'Web', 33, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-10-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-10-17 18:34:43', '2023-10-31 22:25:16'),
(73, 'Web', 31, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-10-18', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-10-18 18:51:48', '2023-10-18 18:51:48'),
(74, 'Web', 34, NULL, 'Pending Collection', NULL, 2, 68, NULL, 0, 0, 0, 0, 68, '2023-10-18', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-10-18 20:42:54', '2023-10-18 20:43:58'),
(75, 'Web', 6, NULL, 'Pending Collection', 5, 3, 614, NULL, 0, 0, 12.95, 0, 626.95, '2023-10-20', '2023-10-19 18:24:15', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Order Received', '2023-10-19 18:23:40', '2023-10-19 18:24:15'),
(76, 'Web', 6, NULL, 'Pending Collection', 5, 2, 2340, NULL, 0, 0, 22, 0, 2362, '2023-11-01', '2023-10-30 13:03:26', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-10-30 13:02:48', '2023-10-30 13:03:26'),
(77, 'Bill', 30, NULL, 'Pending Collection', 14, 4, 980, NULL, 0, 0, 8, 0, 988, '2023-10-30', '2023-10-30 13:07:03', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-10-30 13:07:03', '2023-10-30 13:07:03'),
(78, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 128, NULL, 0, 0, 20.7, 0, 148.7, '2023-10-30', '2023-10-30 13:09:21', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-10-30 13:09:21', '2023-10-30 13:09:21'),
(79, 'Web', 6, NULL, 'Pending Collection', 5, 1, 1900, NULL, 0, 0, 0, 0, 1900, '2023-11-01', '2023-10-31 13:00:40', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-10-31 13:00:15', '2023-10-31 13:00:40'),
(80, 'Web', 6, NULL, 'Pending Collection', 5, 7, 2470, NULL, 0, 0, 55.6, 0, 2525.6, '2023-11-01', '2023-10-31 13:35:47', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-10-31 13:35:36', '2023-10-31 13:35:47'),
(81, 'Web', 36, NULL, 'Pending Collection', NULL, 1, 148, NULL, 0, 0, 0, 0, 148, '2023-11-01', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-11-01 19:41:53', '2023-11-01 19:42:05'),
(82, 'Web', 6, NULL, 'Pending Collection', 5, 4, 151, NULL, 0, 0, 17.24, 0, 168.24, '2023-11-04', '2023-11-03 12:36:54', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Order Received', '2023-11-03 12:36:16', '2023-11-03 12:36:54'),
(83, 'Web', 4, NULL, 'Pending Collection', 4, 1, 211, NULL, 0, 0, 0, 0, 211, '2023-11-06', '2023-11-03 19:28:55', NULL, NULL, NULL, NULL, 9, 'COD', 250, 'Placed', 'Delivered', '2023-11-03 19:28:18', '2023-11-07 11:09:13'),
(84, 'Bill', 2, NULL, 'Pending Collection', 2, 2, 160, NULL, 0, 0, 25.16, 0, 185.16, '2023-11-04', '2023-11-04 10:10:01', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-04 10:10:01', '2023-11-04 10:10:01'),
(85, 'Bill', 35, NULL, 'Pending Collection', 16, 3, 230, NULL, 0, 0, 15.920000000000002, 0, 245.92000000000002, '2023-11-04', '2023-11-04 18:42:16', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-04 18:42:16', '2023-11-04 18:42:16'),
(86, 'Bill', 2, NULL, 'Pending Collection', 2, 3, 888, NULL, 0, 0, 15, 0, 903, '2023-11-06', '2023-11-06 10:38:38', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-06 10:38:38', '2023-11-06 10:38:38'),
(87, 'Web', 21, NULL, 'Pending Collection', 3, 1, 36, NULL, 0, 0, 0, 0, 36, '2023-11-09', '2023-11-07 10:00:34', NULL, NULL, NULL, NULL, 17, 'COD', 250, 'Placed', 'Delivered', '2023-11-07 09:57:40', '2023-11-07 11:08:51'),
(88, 'Web', 21, NULL, 'Pending Collection', 3, 2, 193, NULL, 0, 0, 0, 0, 195.25, '2023-11-09', '2023-11-08 15:27:19', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Delivered', '2023-11-07 10:23:51', '2023-11-08 15:46:37'),
(89, 'Web', 6, NULL, 'Pending Collection', 5, 4, 107, NULL, 0, 0, 11.69, 0, 118.69, '2023-11-08', '2023-11-07 19:32:41', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-11-07 19:32:27', '2023-11-07 19:32:41'),
(90, 'Web', 6, NULL, 'Pending Collection', 5, 3, 2351, NULL, 0, 0, 402.25, 0, 2753.25, '2023-11-09', '2023-11-08 10:12:57', NULL, NULL, NULL, NULL, 8, 'COD', 0, 'Placed', 'Order Received', '2023-11-08 10:12:49', '2023-11-08 10:12:57'),
(91, 'Bill', 6, NULL, 'Pending Collection', 5, 2, 1688, NULL, 0, 0, 6.84, 0, 1694.84, '2023-11-10', '2023-11-10 14:02:25', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-10 14:02:25', '2023-11-10 14:02:25'),
(92, 'Web', 25, NULL, 'Pending Collection', 17, 1, 132, NULL, 0, 0, 0, 0, 132, '2023-11-11', '2023-11-10 19:23:17', NULL, NULL, NULL, NULL, 19, 'COD', 150, 'Placed', 'Order Received', '2023-11-10 15:55:18', '2023-11-10 19:23:17'),
(93, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 34, NULL, 0, 0, 6.12, 0, 40.12, '2023-11-15', '2023-11-15 13:38:19', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-15 13:38:19', '2023-11-15 13:38:19'),
(94, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 729, NULL, 0, 0, 6.84, 0, 735.84, '2023-11-17', '2023-11-17 11:17:47', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-17 11:17:47', '2023-11-17 11:17:47'),
(95, 'Web', 39, NULL, 'Pending Collection', 18, 1, 211, NULL, 0, 0, 0, 0, 211, '2023-11-20', '2023-11-17 16:42:47', NULL, NULL, NULL, NULL, 40, 'COD', 0, 'Placed', 'Order Received', '2023-11-17 16:41:39', '2023-11-17 16:42:47'),
(96, 'Web', 39, NULL, 'Pending Collection', 18, 2, 1695, NULL, 0, 0, 0, 0, 1695, '2023-11-20', '2023-11-17 16:44:50', NULL, NULL, NULL, NULL, 40, 'COD', 0, 'Placed', 'Order Received', '2023-11-17 16:44:39', '2023-11-17 16:44:50'),
(97, 'Web', 39, NULL, 'Pending Collection', 18, 1, 1650, NULL, 0, 0, 0, 0, 1650, '2023-11-20', '2023-11-17 16:50:08', NULL, NULL, NULL, NULL, 40, 'COD', 0, 'Placed', 'Order Received', '2023-11-17 16:49:46', '2023-11-17 16:50:08'),
(98, 'Web', 6, NULL, 'Pending Collection', 5, 6, 2640, NULL, 0, 0, 0, 0, 2640, '2023-12-01', '2023-11-30 13:51:17', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Order Received', '2023-11-21 14:07:54', '2023-11-30 13:51:17'),
(99, 'Bill', 35, NULL, 'Pending Collection', 16, 3, 848, NULL, 0, 0, 19.8, 0, 867.8, '2023-11-21', '2023-11-21 14:47:21', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-21 14:47:21', '2023-11-21 14:47:21'),
(100, 'Bill', 35, NULL, 'Pending Collection', 16, 3, 502, NULL, 0, 0, 12.1, 0, 514.1, '2023-11-22', '2023-11-22 12:13:55', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-22 12:13:55', '2023-11-22 12:13:55'),
(101, 'Bill', 6, NULL, 'Pending Collection', 5, 2, 132, NULL, 0, 0, 8.64, 0, 140.64, '2023-11-25', '2023-11-25 11:01:08', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-25 11:01:08', '2023-11-25 11:01:08'),
(102, 'Bill', 19, NULL, 'Pending Collection', 10, 4, 1291, NULL, 0, 0, 0, 0, 1291, '2023-11-25', '2023-11-25 15:39:41', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-25 15:39:41', '2023-11-25 15:39:41'),
(103, 'Bill', 6, NULL, 'Pending Collection', 5, 2, 61, NULL, 0, 0, 0, 0, 61, '2023-11-25', '2023-11-25 17:59:47', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-25 17:59:47', '2023-11-25 17:59:47'),
(104, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 379, NULL, 0, 0, 0, 0, 379, '2023-11-27', '2023-11-27 10:37:04', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-27 10:37:04', '2023-11-27 10:37:04'),
(105, 'Web', 40, 10, 'Pending Collection', 19, 1, 10, NULL, 0, 0, 0, 0, 10, '2023-11-29', '2023-11-28 17:04:16', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Order Received', '2023-11-28 16:54:24', '2023-11-28 17:06:47'),
(106, 'Web', 40, NULL, 'Pending Collection', NULL, 4, 530, NULL, 0, 0, 0, 0, 530, '2023-11-28', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-11-28 17:05:42', '2024-01-31 18:31:36'),
(107, 'Web', 42, NULL, 'Pending Collection', 20, 1, 30, NULL, 0, 0, 0, 0, 30, '2023-11-29', '2023-11-28 17:22:06', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Delivered', '2023-11-28 17:20:10', '2023-11-29 18:16:21'),
(108, 'Web', 43, NULL, 'Pending Collection', 21, 1, 26, NULL, 0, 0, 0, 0, 26, '2023-11-29', '2023-11-28 17:31:45', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Delivered', '2023-11-28 17:28:37', '2023-11-29 18:16:06'),
(109, 'Web', 43, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-11-28', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-11-28 17:36:21', '2023-12-14 12:03:10'),
(110, 'Web', 42, NULL, 'Pending Collection', 20, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-11-28', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-11-28 17:37:05', '2023-11-28 17:37:20'),
(111, 'Web', 44, NULL, 'Pending Collection', NULL, 1, 60, NULL, 0, 0, 0, 0, 60, '2023-11-28', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-11-28 18:24:40', '2023-11-28 18:24:40'),
(112, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 209, NULL, 0, 0, 0, 0, 209, '2023-11-29', '2023-11-29 09:56:38', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-29 09:56:38', '2023-11-29 09:56:38'),
(113, 'Web', 39, NULL, 'Pending Collection', 18, 6, 2418, NULL, 0, 0, 0, 0, 2418, '2024-01-12', '2024-01-08 10:36:36', NULL, NULL, NULL, NULL, 41, 'COD', 0, 'Placed', 'Order Received', '2023-11-30 12:50:38', '2024-01-08 10:36:36'),
(114, 'Bill', 6, NULL, 'Pending Collection', 5, 3, 106, NULL, 0, 0, 0, 0, 106, '2023-11-30', '2023-11-30 18:55:39', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-11-30 18:55:39', '2023-11-30 18:55:39'),
(115, 'Bill', 6, NULL, 'Pending Collection', 5, 1, 50, NULL, 0, 0, 0, 0, 50, '2023-12-01', '2023-12-01 10:54:21', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-12-01 10:54:21', '2023-12-01 10:54:21'),
(116, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 128, NULL, 0, 0, 0, 0, 128, '2023-12-02', '2023-12-01 11:59:20', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Order Received', '2023-12-01 11:59:20', '2023-12-01 11:59:20'),
(117, 'Web', 51, NULL, 'Pending Collection', 25, 4, 812, NULL, 0, 0, 0, 0, 812, '2023-12-02', '2023-12-01 13:22:32', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Delivered', '2023-12-01 13:21:00', '2023-12-01 14:07:41'),
(118, 'Web', 52, NULL, 'Pending Collection', NULL, 6, 443, NULL, 0, 0, 0, 0, 443, '2023-12-01', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-01 14:55:23', '2023-12-01 14:58:53'),
(119, 'Web', 54, NULL, 'Pending Collection', 27, 3, 120, NULL, 0, 0, 0, 0, 120, '2023-12-02', '2023-12-01 16:56:38', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Out for Delivery', '2023-12-01 16:52:32', '2023-12-02 18:35:25'),
(120, 'Web', 46, NULL, 'Pending Collection', NULL, 8, 438, NULL, 0, 0, 0, 0, 438, '2023-12-02', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-02 07:48:30', '2023-12-18 18:04:47'),
(121, 'Bill', 6, NULL, 'Pending Collection', 5, 2, 157, NULL, 0, 0, 0, 0, 157, '2023-12-02', '2023-12-02 11:48:17', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-12-02 11:48:17', '2023-12-02 11:48:17'),
(122, 'Web', 55, NULL, 'Pending Collection', 28, 1, 19, NULL, 0, 0, 0, 0, 19, '2023-12-04', '2023-12-02 14:35:07', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Order Received', '2023-12-02 14:34:08', '2023-12-02 14:35:07'),
(123, 'Web', 54, NULL, 'Pending Collection', 27, 3, 243, NULL, 0, 0, 0, 0, 243, '2023-12-04', '2023-12-02 17:42:29', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Out for Delivery', '2023-12-02 17:38:23', '2023-12-02 18:35:13'),
(124, 'Web', 56, NULL, 'Pending Collection', NULL, 4, 386, NULL, 0, 0, 0, 0, 386, '2023-12-03', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-03 20:51:04', '2023-12-03 20:51:04'),
(125, 'Web', 57, NULL, 'Pending Collection', NULL, 2, 15, NULL, 0, 0, 0, 0, 15, '2023-12-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-04 10:55:29', '2023-12-04 10:55:29'),
(126, 'Web', 59, NULL, 'Pending Collection', 30, 9, 678, NULL, 0, 0, 0, 0, 678, '2023-12-05', '2023-12-04 16:12:35', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Delivered', '2023-12-04 15:35:40', '2023-12-21 18:01:48'),
(127, 'Web', 6, NULL, 'Pending Collection', 5, 2, 528, NULL, 0, 0, 26.4, 0, 528, '2024-04-19', '2024-04-18 10:22:13', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Order Received', '2023-12-04 16:28:13', '2024-04-18 10:22:13'),
(128, 'Bill', 6, NULL, 'Pending Collection', 5, 1, 22, NULL, 0, 0, 0, 0, 22, '2023-12-06', '2023-12-06 11:36:39', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-12-06 11:36:39', '2023-12-06 11:36:39'),
(129, 'Web', 61, NULL, 'Pending Collection', 31, 3, 98, NULL, 0, 0, 0, 0, 98, '2023-12-08', '2023-12-07 16:46:56', NULL, NULL, NULL, NULL, 36, 'COD', 0, 'Placed', 'Delivered', '2023-12-07 16:45:08', '2023-12-09 11:28:03'),
(130, 'Web', 62, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-12-08', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-08 12:43:12', '2023-12-08 12:43:29'),
(131, 'Bill', 35, NULL, 'Pending Collection', 16, 1, 990, NULL, 0, 0, 0, 0, 990, '2023-12-11', '2023-12-11 10:28:13', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-12-11 10:28:13', '2023-12-11 10:28:13'),
(132, 'Web', 65, NULL, 'Pending Collection', 32, 21, 2171, NULL, 0, 0, 0, 0, 2171, '2023-12-12', '2023-12-11 15:03:27', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Delivered', '2023-12-11 15:00:19', '2023-12-12 10:01:33'),
(133, 'Web', 66, NULL, 'Pending Collection', 33, 1, 214, NULL, 0, 0, 0, 0, 214, '2023-12-12', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-12 13:03:36', '2023-12-12 13:08:46'),
(134, 'Web', 17, NULL, 'Pending Collection', 43, 4, 480, NULL, 0, 0, 24.49, 0, 480, '2024-03-12', '2024-03-11 12:32:41', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Delivered', '2023-12-13 17:26:37', '2024-03-14 12:39:37'),
(135, 'Web', 67, NULL, 'Pending Collection', NULL, 1, 175, NULL, 0, 0, 0, 0, 175, '2023-12-14', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-14 10:49:44', '2024-02-04 10:18:51'),
(136, 'Web', 45, NULL, 'Pending Collection', NULL, 4, 170, NULL, 0, 0, 0, 0, 170, '2023-12-14', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-14 12:04:11', '2024-03-11 22:03:51'),
(137, 'Bill', 4, NULL, 'Pending Collection', 4, 1, 1775, NULL, 0, 0, 0, 0, 1775, '2023-12-18', '2023-12-18 18:58:54', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2023-12-18 18:58:54', '2023-12-18 18:58:54'),
(138, 'Web', 69, NULL, 'Pending Collection', 35, 6, 415, NULL, 0, 0, 0, 0, 415, '2023-12-21', '2023-12-20 14:50:57', NULL, NULL, NULL, NULL, 8, 'COD', 0, 'Placed', 'Delivered', '2023-12-20 14:42:17', '2023-12-21 12:54:34'),
(139, 'Web', 69, NULL, 'Pending Collection', 35, 3, 70, NULL, 0, 0, 0, 0, 70, '2023-12-21', '2023-12-20 14:54:25', NULL, NULL, NULL, NULL, 8, 'COD', 0, 'Placed', 'Delivered', '2023-12-20 14:53:50', '2023-12-21 12:54:18'),
(140, 'Web', 70, NULL, 'Pending Collection', 36, 39, 1258, NULL, 0, 0, 0, 0, 1258, '2024-01-06', '2024-01-05 10:55:34', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Delivered', '2023-12-20 16:19:53', '2024-01-05 16:09:57'),
(141, 'Web', 69, NULL, 'Pending Collection', 35, 27, 1117, NULL, 0, 0, 0, 0, 1117, '2023-12-23', '2023-12-22 11:08:17', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Delivered', '2023-12-21 10:52:31', '2023-12-22 12:53:11'),
(142, 'Web', 71, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2023-12-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2023-12-21 13:14:35', '2023-12-22 00:43:39'),
(143, 'Bill', 18, NULL, 'Pending Collection', 9, 3, 382, NULL, 0, 0, 19.1, 0, 382, '2023-12-26', '2023-12-26 13:42:46', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Delivered', '2023-12-26 13:42:46', '2023-12-26 13:46:10'),
(144, 'Bill', 35, NULL, 'Pending Collection', 16, 4, 553, NULL, 0, 0, 99.53999999999999, 0, 553, '2024-01-01', '2024-01-01 19:17:36', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2024-01-01 19:17:36', '2024-01-01 19:17:36'),
(145, 'Web', 76, NULL, 'Pending Collection', 37, 27, 1245, NULL, 0, 0, 0, 0, 1245, '2024-01-06', NULL, NULL, NULL, NULL, NULL, 25, 'COD', 0, 'Created', 'Not Applicable', '2024-01-02 10:19:37', '2024-03-21 10:51:53'),
(146, 'Web', 51, NULL, 'Pending Collection', NULL, 1, 16, NULL, 0, 0, 0, 0, 16, '2024-01-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-01-04 17:49:00', '2024-01-04 17:49:00'),
(147, 'Web', 69, NULL, 'Pending Collection', 35, 21, 1149, NULL, 0, 0, 0, 0, 1149, '2024-01-08', '2024-01-06 10:41:05', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Delivered', '2024-01-06 10:40:00', '2024-01-06 12:09:14'),
(148, 'Bill', 18, NULL, 'Pending Collection', 9, 1, 691, NULL, 0, 0, 0, 0, 691, '2024-01-06', '2024-01-06 16:56:50', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2024-01-06 16:56:50', '2024-01-06 16:56:50'),
(149, 'Bill', 18, NULL, 'Pending Collection', 9, 1, 191, NULL, 0, 0, 9.55, 0, 191, '2024-01-08', '2024-01-08 10:37:44', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2024-01-08 10:37:44', '2024-01-08 10:37:44'),
(150, 'Bill', 35, NULL, 'Pending Collection', 16, 2, 233, NULL, 0, 0, 11.65, 0, 233, '2024-01-08', '2024-01-08 11:42:44', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2024-01-08 11:42:44', '2024-01-08 11:42:44'),
(151, 'Bill', 35, NULL, 'Pending Collection', 16, 3, 235, NULL, 0, 0, 42.300000000000004, 0, 235, '2024-01-08', '2024-01-08 16:50:53', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2024-01-08 16:50:53', '2024-01-08 16:50:53'),
(152, 'Web', 39, NULL, 'Pending Collection', 18, 2, 1841, NULL, 0, 0, 9.55, 0, 1850.55, '2024-01-12', '2024-01-08 18:25:57', NULL, NULL, NULL, NULL, 41, 'COD', 0, 'Placed', 'Order Received', '2024-01-08 18:25:35', '2024-01-08 18:25:57'),
(153, 'Web', 65, NULL, 'Pending Collection', 32, 25, 2885, NULL, 0, 0, 192.29, 0, 2885, '2024-01-10', '2024-01-09 07:32:18', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Delivered', '2024-01-09 07:27:38', '2024-01-10 10:35:33'),
(154, 'Web', 39, NULL, 'Pending Collection', 18, 1, 158, NULL, 0, 0, 7.9, 0, 158, '2024-01-12', '2024-01-09 09:51:04', NULL, NULL, NULL, NULL, 41, 'COD', 0, 'Placed', 'Order Received', '2024-01-09 09:50:40', '2024-01-09 09:51:04'),
(155, 'Web', 69, NULL, 'Pending Collection', 35, 27, 1231, NULL, 0, 0, 116.28, 0, 1231, '2024-01-31', '2024-01-30 09:52:23', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Delivered', '2024-01-09 13:04:28', '2024-01-30 14:36:55'),
(156, 'Web', 77, NULL, 'Pending Collection', 38, 52, 11144, NULL, 0, 0, 618.87, 0, 11144, '2024-01-11', '2024-01-10 23:32:00', NULL, NULL, NULL, NULL, 12, 'COD', 0, 'Placed', 'Delivered', '2024-01-10 23:07:11', '2024-01-11 19:11:43'),
(157, 'Bill', 79, NULL, 'Pending Collection', 40, 9, 1200, NULL, 0, 0, 77.27000000000001, 0, 1200, '2024-01-11', '2024-01-11 16:49:21', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Delivered', '2024-01-11 16:49:21', '2024-01-11 19:11:51'),
(158, 'Web', 78, NULL, 'Pending Collection', NULL, 7, 407, NULL, 0, 0, 0, 0, 407, '2024-01-11', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-01-11 23:12:09', '2024-02-08 12:21:09'),
(159, 'Bill', 79, NULL, 'Pending Collection', 40, 9, 1200, NULL, 0, 0, 77.27000000000001, 0, 1200, '2024-01-12', '2024-01-12 19:13:41', NULL, NULL, NULL, NULL, 1, 'COD', 0, 'Placed', 'Order Received', '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(160, 'Web', 82, NULL, 'Pending Collection', 42, 69, 4109, NULL, 0, 0, 266.24, 0, 4109, '2024-01-20', '2024-01-18 10:59:35', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2024-01-17 23:36:33', '2024-01-18 10:59:35'),
(161, 'Web', 77, NULL, 'Pending Collection', 38, 77, 19784, NULL, 0, 0, 1661.7, 0, 19784, '2024-02-05', '2024-02-04 18:43:52', NULL, NULL, NULL, NULL, 9, 'COD', 0, 'Placed', 'Delivered', '2024-01-22 22:42:14', '2024-02-06 10:20:56'),
(162, 'Web', 69, NULL, 'Pending Collection', 35, 24, 1859, NULL, 0, 0, 90.87, 0, 1859, '2024-02-03', '2024-02-02 16:58:49', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Delivered', '2024-02-02 12:52:45', '2024-02-08 10:30:36'),
(163, 'Web', 65, NULL, 'Pending Collection', 32, 8, 700, NULL, 0, 0, 27.5, 0, 700, '2024-02-06', '2024-02-05 17:47:28', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Delivered', '2024-02-05 17:46:37', '2024-02-06 10:23:10'),
(164, 'Web', 84, NULL, 'Pending Collection', NULL, 1, 46, NULL, 0, 0, 0, 0, 46, '2024-02-07', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-02-07 18:09:22', '2024-02-07 18:09:22'),
(165, 'Web', 87, NULL, 'Pending Collection', 46, 35, 1433, NULL, 0, 0, 102.06, 0, 1433, '2024-02-10', '2024-02-09 12:05:21', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Delivered', '2024-02-09 11:51:53', '2024-02-22 13:41:47'),
(166, 'Web', 88, NULL, 'Pending Collection', NULL, 5, 58, NULL, 0, 0, 0, 0, 58, '2024-02-09', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-02-09 20:29:16', '2024-02-09 20:29:16'),
(167, 'Web', 89, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-02-13', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-02-13 16:38:14', '2024-02-13 16:39:44'),
(168, 'Web', 91, NULL, 'Pending Collection', 48, 6, 341, NULL, 0, 0, 0, 0, 341, '2024-02-20', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-02-20 17:12:46', '2024-02-20 17:17:27'),
(169, 'Web', 92, NULL, 'Pending Collection', NULL, 23, 738, NULL, 0, 0, 0, 0, 738, '2024-02-20', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-02-20 22:40:46', '2024-03-13 08:50:50'),
(170, 'Web', 93, NULL, 'Pending Collection', 50, 3, 132, NULL, 0, 0, 12.14, 0, 132, '2024-02-22', NULL, NULL, NULL, NULL, NULL, 8, 'COD', 0, 'Created', 'Not Applicable', '2024-02-21 07:48:00', '2024-02-21 07:52:52'),
(171, 'Web', 94, NULL, 'Pending Collection', 51, 1, 30, NULL, 0, 0, 0, 0, 30, '2024-02-22', '2024-02-21 13:16:39', NULL, NULL, NULL, NULL, 8, 'COD', 70, 'Placed', 'Order Received', '2024-02-21 13:15:24', '2024-02-21 13:16:39'),
(172, 'Web', 69, NULL, 'Pending Collection', 35, 15, 890, NULL, 0, 0, 34.65, 0, 890, '2024-02-23', '2024-02-22 12:33:42', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Delivered', '2024-02-22 12:32:40', '2024-02-22 14:47:02'),
(173, 'Web', 69, NULL, 'Pending Collection', 35, 28, 892, NULL, 0, 0, 71.17, 0, 892, '2024-03-12', '2024-03-11 08:58:57', NULL, NULL, NULL, NULL, 6, 'COD', 0, 'Placed', 'Delivered', '2024-02-22 13:45:25', '2024-03-12 10:21:34'),
(174, 'Web', 87, NULL, 'Pending Collection', 46, 11, 500, NULL, 0, 0, 37.61, 0, 500, '2024-02-23', '2024-02-22 16:04:22', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Delivered', '2024-02-22 15:36:50', '2024-02-23 14:48:20'),
(175, 'Web', 96, NULL, 'Pending Collection', 53, 28, 3013, NULL, 0, 0, 152.53, 0, 3013, '2024-02-24', '2024-02-23 10:30:32', NULL, NULL, NULL, NULL, 25, 'COD', 0, 'Placed', 'Delivered', '2024-02-22 20:00:09', '2024-02-23 19:39:18'),
(176, 'Web', 87, NULL, 'Pending Collection', 46, 1, 125, NULL, 0, 0, 6.25, 0, 125, '2024-02-23', '2024-02-22 21:16:14', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Delivered', '2024-02-22 21:14:09', '2024-02-23 14:48:27'),
(177, 'Web', 97, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-02-23', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-02-23 01:06:08', '2024-02-23 12:22:58'),
(178, 'Web', 99, NULL, 'Pending Collection', 55, 8, 1081, NULL, 0, 0, 40.8, 0, 1081, '2024-02-29', '2024-02-28 16:06:13', NULL, NULL, NULL, NULL, 23, 'COD', 0, 'Placed', 'Delivered', '2024-02-28 16:03:02', '2024-02-29 09:39:22'),
(179, 'Web', 101, NULL, 'Pending Collection', 56, 1, 30, NULL, 0, 0, 1.5, 0, 30, '2024-03-01', '2024-02-29 00:15:43', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Delivered', '2024-02-28 16:50:49', '2024-03-01 09:25:17'),
(180, 'Web', 101, NULL, 'Pending Collection', 56, 1, 110, NULL, 0, 0, 5.5, 0, 110, '2024-03-01', '2024-02-29 23:02:22', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Order Received', '2024-02-29 00:22:26', '2024-02-29 23:02:22'),
(181, 'Web', 103, NULL, 'Pending Collection', NULL, 3, 189, NULL, 0, 0, 0, 0, 189, '2024-03-01', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-01 04:21:28', '2024-03-01 04:21:28'),
(182, 'Web', 104, NULL, 'Pending Collection', 57, 2, 112, NULL, 0, 0, 0, 0, 112, '2024-03-01', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-01 17:01:52', '2024-03-01 23:11:55'),
(183, 'Web', 98, NULL, 'Pending Collection', 54, 49, 5008, NULL, 0, 0, 336.45, 0, 5008, '2024-03-04', '2024-03-02 11:18:12', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Delivered', '2024-03-02 10:57:37', '2024-03-04 14:21:29'),
(184, 'Web', 101, NULL, 'Pending Collection', 56, 1, 110, NULL, 0, 0, 5.5, 0, 110, '2024-03-04', '2024-03-02 21:35:06', NULL, NULL, NULL, NULL, 5, 'COD', 0, 'Placed', 'Delivered', '2024-03-02 21:34:37', '2024-03-04 14:14:31'),
(185, 'Web', 77, NULL, 'Pending Collection', 38, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-04 23:34:41', '2024-03-05 20:24:11'),
(186, 'Web', 107, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-05 16:10:34', '2024-03-05 18:12:05'),
(187, 'Web', 87, NULL, 'Pending Collection', NULL, 21, 724, NULL, 0, 0, 0, 0, 724, '2024-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-05 17:18:40', '2024-03-05 18:06:33'),
(188, 'Web', 106, NULL, 'Pending Collection', NULL, 41, 1624, NULL, 0, 0, 0, 0, 1624, '2024-03-06', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-06 21:52:19', '2024-03-13 20:03:59'),
(189, 'Web', 108, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-08', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-08 20:29:51', '2024-03-08 20:30:50'),
(190, 'Web', 109, NULL, 'Pending Collection', 59, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-11', NULL, NULL, NULL, NULL, NULL, 22, 'COD', 0, 'Created', 'Not Applicable', '2024-03-10 00:01:49', '2024-03-13 10:29:43'),
(191, 'Web', 39, NULL, 'Pending Collection', 18, 3, 2352, NULL, 0, 0, 28.6, 0, 2352, '2024-03-15', '2024-03-11 13:30:53', NULL, NULL, NULL, NULL, 41, 'COD', 0, 'Placed', 'Delivered', '2024-03-11 11:18:27', '2024-03-14 10:16:06'),
(192, 'Web', 111, NULL, 'Pending Collection', 68, 52, 6351, NULL, 0, 0, 361.53, 0, 6351, '2024-03-14', '2024-03-12 19:28:12', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Delivered', '2024-03-12 18:10:03', '2024-03-14 10:08:42'),
(193, 'Web', 17, NULL, 'Pending Collection', 65, 2, 1875, NULL, 0, 0, 4.75, 0, 1875, '2024-03-13', '2024-03-12 18:28:16', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Delivered', '2024-03-12 18:21:03', '2024-03-14 10:15:52'),
(194, 'Web', 112, NULL, 'Pending Collection', 67, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-14', NULL, NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Created', 'Not Applicable', '2024-03-12 19:16:40', '2024-03-12 19:33:21'),
(195, 'Web', 111, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-12', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-12 19:28:35', '2024-03-12 19:28:35'),
(196, 'Web', 99, NULL, 'Pending Collection', 55, 1, 576, NULL, 0, 0, 28.8, 0, 576, '2024-03-14', '2024-03-13 07:18:49', NULL, NULL, NULL, NULL, 23, 'COD', 0, 'Placed', 'Delivered', '2024-03-13 07:18:05', '2024-03-13 12:30:45'),
(197, 'Web', 113, NULL, 'Pending Collection', NULL, 1, 46, NULL, 0, 0, 0, 0, 46, '2024-03-13', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-13 14:23:56', '2024-03-13 14:24:31'),
(198, 'Web', 114, NULL, 'Pending Collection', 69, 7, 848, NULL, 0, 0, 44.6, 0, 848, '2024-03-20', '2024-03-13 07:55:40', NULL, NULL, NULL, NULL, 2, 'COD', 0, 'Placed', 'Delivered', '2024-03-13 14:49:50', '2024-03-19 11:17:41'),
(199, 'Web', 116, NULL, 'Pending Collection', 70, 6, 1047, NULL, 0, 0, 25.3, 0, 1047, '2024-03-15', '2024-03-14 09:55:46', NULL, NULL, NULL, NULL, 7, 'COD', 0, 'Placed', 'Delivered', '2024-03-14 09:47:43', '2024-03-14 19:30:36'),
(200, 'Web', 117, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-16', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-16 12:49:25', '2024-03-16 12:49:31'),
(201, 'Web', 118, NULL, 'Pending Collection', 71, 10, 1469, NULL, 0, 0, 86.46, 0, 1469, '2024-03-18', '2024-03-16 20:39:12', NULL, NULL, NULL, NULL, 42, 'COD', 0, 'Placed', 'Order Received', '2024-03-16 14:42:46', '2024-03-18 12:47:45'),
(202, 'Web', 119, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-17 18:23:10', '2024-03-17 18:24:01'),
(203, 'Web', 114, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-19', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-03-19 07:56:27', '2024-03-19 07:56:27'),
(204, 'Web', 122, NULL, 'Pending Collection', 72, 12, 2993, NULL, 0, 0, 155.08, 0, 2993, '2024-03-21', '2024-03-20 12:41:22', NULL, NULL, NULL, NULL, 23, 'COD', 0, 'Placed', 'Delivered', '2024-03-20 12:25:10', '2024-03-20 18:30:38'),
(205, 'Web', 39, NULL, 'Pending Collection', 18, 53, 5589, NULL, 0, 0, 0, 0, 5589, '2024-03-25', '2024-03-22 13:28:18', NULL, NULL, NULL, NULL, 40, 'Online', 0, 'Created', 'Not Applicable', '2024-03-22 07:49:07', '2024-03-26 12:37:17'),
(206, 'Web', 125, NULL, 'Pending Collection', 74, 1, 572, NULL, 0, 0, 28.6, 0, 514.8, '2024-03-28', '2024-03-27 10:54:10', NULL, NULL, NULL, NULL, 12, 'COD', 12, 'Placed', 'Order Received', '2024-03-27 10:50:06', '2024-03-27 10:54:10'),
(207, 'Web', 125, NULL, 'Pending Collection', 74, 1, 385, NULL, 0, 0, 0, 0, 385, '2024-03-28', '2024-03-27 11:02:44', NULL, NULL, NULL, NULL, 12, 'Online', 0, 'Created', 'Not Applicable', '2024-03-27 11:02:20', '2024-03-27 11:02:44'),
(208, 'Web', 126, NULL, 'Pending Collection', 75, 2, 85, NULL, 0, 0, 4.25, 0, 76.5, '2024-03-28', '2024-03-27 11:14:58', NULL, NULL, NULL, NULL, 45, 'COD', 10, 'Placed', 'Order Received', '2024-03-27 11:09:49', '2024-03-27 11:14:58'),
(209, 'Web', 127, NULL, 'Pending Collection', 76, 1, 143, NULL, 0, 0, 7.15, 0, 143, '2024-04-23', '2024-04-22 12:48:58', NULL, NULL, NULL, NULL, 43, 'COD', 0, 'Placed', 'Order Received', '2024-03-27 15:26:27', '2024-04-22 12:48:58'),
(210, 'Web', 142, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-04 10:44:04', '2024-04-04 11:59:03'),
(211, 'Web', 140, NULL, 'Pending Collection', NULL, 2, 3483, NULL, 0, 0, 0, 0, 3483, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-04 11:59:29', '2024-04-04 15:46:03'),
(212, 'Web', 128, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-04', '2024-04-09 13:06:27', NULL, NULL, NULL, NULL, NULL, 'COD', 2468, 'Placed', 'Order Received', '2024-04-04 14:29:04', '2024-04-09 13:06:27'),
(213, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 145, NULL, 0, 0, 0, 0, 145, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-04 15:49:05', '2024-04-05 19:38:03'),
(214, 'Web', 142, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-04 18:48:02', '2024-04-04 18:48:02'),
(215, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 145, NULL, 0, 0, 0, 0, 130.5, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 10:31:38', '2024-04-05 10:31:38'),
(216, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 145, NULL, 0, 0, 0, 0, 130.5, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 10:32:25', '2024-04-05 10:32:25'),
(217, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 145, NULL, 0, 0, 0, 0, 130.5, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 10:34:50', '2024-04-05 10:34:50'),
(218, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 290, NULL, 0, 0, 0, 0, 261, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 10:35:22', '2024-04-05 10:35:22'),
(219, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 290, NULL, 0, 0, 0, 0, 261, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 10:35:22', '2024-04-05 10:35:22'),
(220, 'Web', 144, NULL, 'Pending Collection', NULL, 1, 290, NULL, 0, 0, 0, 0, 261, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 10:35:37', '2024-04-05 10:35:37');
INSERT INTO `orders` (`id`, `origin`, `user_id`, `rider_id`, `rider_status`, `address_id`, `items`, `sub_total`, `promo_code_id`, `discount_percent`, `discount_amount`, `tax`, `shipping_charge`, `net_amount`, `delivery_date`, `order_time`, `pickup_time`, `on_job_time`, `reached_time`, `delivery_time`, `delivery_slot_id`, `payment_mode`, `change_required`, `status`, `delivery_status`, `created_at`, `updated_at`) VALUES
(221, 'Web', 128, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', '2024-04-09 13:45:27', NULL, NULL, NULL, NULL, NULL, 'COD', 2468, 'Placed', 'Order Received', '2024-04-05 12:04:48', '2024-04-09 13:45:27'),
(222, 'Web', 146, NULL, 'Pending Collection', 92, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-16', '2024-05-14 13:17:43', NULL, NULL, NULL, NULL, 24, 'COD', 2468, 'Placed', 'Order Received', '2024-04-05 12:05:55', '2024-05-14 13:17:43'),
(223, 'Web', 142, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 12:07:43', '2024-04-05 12:07:43'),
(224, 'Web', 148, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 12:12:53', '2024-04-05 12:12:53'),
(225, 'Web', 150, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 16:10:04', '2024-04-05 16:10:04'),
(226, 'Web', 151, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 17:05:57', '2024-04-05 17:05:57'),
(227, 'Web', 152, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 18:42:26', '2024-04-05 18:42:26'),
(228, 'Web', 153, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 18:48:57', '2024-04-05 18:48:57'),
(229, 'Web', 154, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-05 19:05:38', '2024-04-05 19:05:38'),
(230, 'Web', 155, NULL, 'Pending Collection', 80, 1, 1780, NULL, 0, 0, 0, 0, 1780, '2024-04-11', '2024-04-09 12:29:37', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-05 19:29:11', '2024-04-09 12:29:37'),
(231, 'Web', 155, NULL, 'Pending Collection', 80, 1, 143, NULL, 0, 0, 7.15, 0, 143, '2024-04-11', '2024-04-09 12:31:40', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 12:31:23', '2024-04-09 12:31:40'),
(232, 'Web', 155, NULL, 'Pending Collection', 80, 1, 73, NULL, 0, 0, 3.65, 0, 73, '2024-04-11', '2024-04-09 12:32:40', NULL, NULL, NULL, NULL, 45, 'COD', 100, 'Placed', 'Order Received', '2024-04-09 12:32:24', '2024-04-09 12:32:40'),
(233, 'Web', 155, NULL, 'Pending Collection', 80, 1, 770, NULL, 0, 0, 38.5, 0, 770, '2024-04-11', '2024-04-09 12:37:50', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 12:37:19', '2024-04-09 12:37:50'),
(234, 'Web', 155, NULL, 'Pending Collection', 80, 1, 100, NULL, 0, 0, 12, 0, 100, '2024-04-11', '2024-04-09 12:45:08', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 12:44:53', '2024-04-09 12:45:08'),
(235, 'Web', 155, NULL, 'Pending Collection', 80, 1, 103, NULL, 0, 0, 5.15, 0, 103, '2024-04-11', '2024-04-09 12:46:34', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 12:46:19', '2024-04-09 12:46:34'),
(236, 'Web', 155, NULL, 'Pending Collection', 80, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-04-11', '2024-04-09 13:50:36', NULL, NULL, NULL, NULL, 45, 'COD', 100, 'Placed', 'Order Received', '2024-04-09 13:49:47', '2024-04-09 13:50:36'),
(237, 'Web', 155, NULL, 'Pending Collection', 80, 1, 145, NULL, 0, 0, 7.25, 0, 145, '2024-04-11', '2024-04-09 13:51:11', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 13:50:48', '2024-04-09 13:51:11'),
(238, 'Web', 155, NULL, 'Pending Collection', 80, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-04-11', '2024-04-09 16:16:22', NULL, NULL, NULL, NULL, 45, 'COD', 100, 'Placed', 'Order Received', '2024-04-09 16:15:50', '2024-04-09 16:16:22'),
(239, 'Web', 155, NULL, 'Pending Collection', 80, 1, 1527, NULL, 0, 0, 274.86, 0, 1527, '2024-04-11', '2024-04-09 16:18:44', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 16:18:26', '2024-04-09 16:18:44'),
(240, 'Web', 156, NULL, 'Pending Collection', 81, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-04-11', '2024-04-09 16:22:47', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-09 16:22:17', '2024-04-09 16:22:47'),
(241, 'Web', 156, NULL, 'Pending Collection', 81, 1, 143, NULL, 0, 0, 7.15, 0, 143, '2024-04-11', '2024-04-09 16:23:54', NULL, NULL, NULL, NULL, 45, 'COD', 100, 'Placed', 'Order Received', '2024-04-09 16:23:34', '2024-04-09 16:23:54'),
(242, 'Web', 157, NULL, 'Pending Collection', 82, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-04-11', '2024-04-10 14:18:27', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-10 14:18:05', '2024-04-10 14:18:27'),
(243, 'Web', 157, NULL, 'Pending Collection', 82, 1, 127, NULL, 0, 0, 6.35, 0, 127, '2024-04-11', '2024-04-10 15:30:30', NULL, NULL, NULL, NULL, 45, 'COD', 200, 'Placed', 'Order Received', '2024-04-10 14:18:51', '2024-04-10 15:30:30'),
(244, 'Web', 158, NULL, 'Pending Collection', 83, 1, 145, NULL, 0, 0, 7.25, 0, 145, '2024-04-11', '2024-04-10 15:33:27', NULL, NULL, NULL, NULL, 45, 'COD', 200, 'Placed', 'Order Received', '2024-04-10 15:33:01', '2024-04-10 15:33:27'),
(245, 'Web', 158, NULL, 'Pending Collection', 83, 1, 132, NULL, 0, 0, 15.84, 0, 132, '2024-04-11', '2024-04-10 15:39:38', NULL, NULL, NULL, NULL, 45, 'COD', 100, 'Placed', 'Order Received', '2024-04-10 15:39:27', '2024-04-10 15:39:38'),
(246, 'Web', 158, NULL, 'Pending Collection', 83, 1, 100, NULL, 0, 0, 12, 0, 100, '2024-04-11', '2024-04-10 16:14:31', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-04-10 16:14:06', '2024-04-10 16:14:31'),
(247, 'Web', 159, NULL, 'Pending Collection', 84, 1, 572, NULL, 0, 0, 28.6, 0, 514.8, '2024-04-11', NULL, NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Created', 'Not Applicable', '2024-04-10 18:29:39', '2024-04-10 18:44:04'),
(248, 'Web', 23, NULL, 'Pending Collection', 11, 2, 1148, NULL, 0, 0, 57.4, 0, 1148, '2024-04-12', '2024-04-11 16:56:27', NULL, NULL, NULL, NULL, 18, 'COD', 0, 'Placed', 'Order Received', '2024-04-10 18:45:03', '2024-04-11 16:56:27'),
(249, 'Web', 9, NULL, 'Pending Collection', 85, 4, 1589, NULL, 0, 0, 284.46, 0, 1589, '2024-04-12', '2024-04-11 16:52:19', NULL, NULL, NULL, NULL, 46, 'COD', 0, 'Placed', 'Order Received', '2024-04-11 10:27:05', '2024-04-11 16:52:19'),
(250, 'Web', 9, NULL, 'Pending Collection', 85, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-04-12', '2024-04-11 16:54:06', NULL, NULL, NULL, NULL, 46, 'COD', 0, 'Placed', 'Order Received', '2024-04-11 16:53:08', '2024-04-11 16:54:06'),
(251, 'Web', 23, NULL, 'Pending Collection', 11, 1, 770, NULL, 0, 0, 38.5, 0, 770, '2024-05-09', '2024-05-08 16:33:35', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2024-04-12 11:21:13', '2024-05-08 16:33:35'),
(252, 'Web', 161, NULL, 'Pending Collection', 86, 2, 528, NULL, 0, 0, 26.4, 0, 528, '2024-04-18', '2024-04-17 12:22:10', NULL, NULL, NULL, NULL, 8, 'COD', 0, 'Placed', 'Order Received', '2024-04-17 12:20:56', '2024-04-17 12:22:10'),
(253, 'Web', 161, NULL, 'Pending Collection', NULL, 1, 775, NULL, 0, 0, 0, 0, 775, '2024-04-19', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-04-19 08:36:58', '2024-04-21 13:44:07'),
(254, 'Web', 128, NULL, 'Pending Collection', 87, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-05-09', '2024-05-08 16:54:07', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2024-05-08 16:40:36', '2024-05-08 16:54:07'),
(255, 'Web', 23, NULL, 'Pending Collection', 11, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-05-09', NULL, NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Created', 'Not Applicable', '2024-05-08 16:58:24', '2024-05-08 16:58:55'),
(256, 'Web', 166, NULL, 'Pending Collection', 88, 1, 143, NULL, 0, 0, 7.15, 0, 143, '2024-05-11', '2024-05-08 17:47:54', NULL, NULL, NULL, NULL, 39, 'COD', 0, 'Placed', 'Order Received', '2024-05-08 17:28:17', '2024-05-08 17:47:54'),
(257, 'Web', 166, NULL, 'Pending Collection', NULL, 5, 1212, NULL, 0, 0, 0, 0, 1212, '2024-05-08', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-05-08 18:00:23', '2024-05-08 18:20:46'),
(258, 'Web', 167, NULL, 'Pending Collection', 89, 8, 997, NULL, 0, 0, 49.85, 0, 997, '2024-05-09', '2024-05-08 18:29:57', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Delivered', '2024-05-08 18:24:37', '2024-05-08 19:48:01'),
(259, 'Web', 167, NULL, 'Pending Collection', 89, 1, 12, NULL, 0, 0, 0, 0, 12, '2024-05-09', '2024-05-08 19:39:19', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Delivered', '2024-05-08 19:23:24', '2024-05-08 19:47:34'),
(260, 'Web', 167, NULL, 'Pending Collection', 89, 1, 385, 1, 10, 10, 19.25, 0, 375, '2024-05-09', '2024-05-08 19:45:32', NULL, NULL, NULL, NULL, 17, 'COD', 400, 'Placed', 'Delivered', '2024-05-08 19:40:42', '2024-05-08 19:47:14'),
(261, 'Web', 168, NULL, 'Pending Collection', 90, 1, 254, NULL, 0, 0, 12.7, 0, 254, '2024-05-10', '2024-05-09 21:14:51', NULL, NULL, NULL, NULL, 46, 'COD', 0, 'Placed', 'Order Received', '2024-05-09 17:32:16', '2024-05-09 21:14:51'),
(262, 'Web', 167, NULL, 'Pending Collection', 89, 2, 294, NULL, 0, 0, 14.7, 0, 294, '2024-05-13', '2024-05-10 11:02:10', NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Placed', 'Order Received', '2024-05-10 10:26:41', '2024-05-10 11:02:10'),
(263, 'Web', 169, NULL, 'Pending Collection', 91, 1, 18, NULL, 0, 0, 0.9, 0, 18, '2024-05-13', NULL, NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Created', 'Not Applicable', '2024-05-10 10:35:15', '2024-05-10 11:00:42'),
(264, 'Web', 170, NULL, 'Pending Collection', 92, 1, 290, NULL, 0, 0, 14.5, 0, 290, '2024-05-16', NULL, NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Created', 'Not Applicable', '2024-05-10 16:48:51', '2024-05-14 12:04:17'),
(265, 'Web', 171, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-10', '2024-05-10 19:02:33', NULL, NULL, NULL, NULL, NULL, 'COD', 2468, 'Placed', 'Order Received', '2024-05-10 18:58:20', '2024-05-10 19:02:33'),
(266, 'Web', 127, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-10', '2024-05-10 19:00:07', NULL, NULL, NULL, NULL, NULL, 'COD', 2468, 'Placed', 'Order Received', '2024-05-10 18:59:11', '2024-05-10 19:00:07'),
(267, 'Web', 172, NULL, 'Pending Collection', 93, 2, 414, NULL, 0, 0, 20.7, 0, 372.6, '2024-05-14', '2024-05-13 15:22:03', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2024-05-13 15:15:46', '2024-05-13 15:22:03'),
(268, 'Web', 127, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-13', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-05-13 15:39:07', '2024-05-13 15:39:07'),
(269, 'Web', 10, NULL, 'Pending Collection', 94, 2, 261, NULL, 0, 0, 13.05, 0, 261, '2024-05-14', '2024-05-13 17:26:49', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2024-05-13 17:24:52', '2024-05-13 17:26:49'),
(270, 'Web', 173, NULL, 'Pending Collection', 95, 4, 138, NULL, 0, 0, 2.8, 0, 138, '2024-05-14', '2024-05-13 18:14:16', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2024-05-13 18:10:47', '2024-05-13 18:14:16'),
(271, 'Web', 173, NULL, 'Pending Collection', NULL, 2, 68, NULL, 0, 0, 0, 0, 68, '2024-05-14', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-05-14 10:48:04', '2024-05-14 10:48:04'),
(272, 'Web', 174, NULL, 'Pending Collection', 96, 2, 106, NULL, 0, 0, 4.8, 0, 95.4, '2024-05-16', NULL, NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Created', 'Not Applicable', '2024-05-14 10:49:42', '2024-05-14 11:46:50'),
(273, 'Web', 175, NULL, 'Pending Collection', 97, 1, 145, NULL, 0, 0, 7.25, 0, 130.5, '2024-05-15', NULL, NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Created', 'Not Applicable', '2024-05-14 10:58:08', '2024-05-14 11:37:53'),
(274, 'Web', 176, NULL, 'Pending Collection', NULL, 1, 143, NULL, 0, 0, 0, 0, 128.7, '2024-05-14', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-05-14 11:38:49', '2024-05-14 11:39:21'),
(275, 'Web', 177, NULL, 'Pending Collection', 98, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-05-16', '2024-05-14 12:41:13', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-14 12:40:55', '2024-05-14 12:41:13'),
(276, 'Web', 177, NULL, 'Pending Collection', 98, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-05-16', '2024-05-14 14:28:02', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-14 13:06:59', '2024-05-14 14:28:02'),
(277, 'Web', 146, NULL, 'Pending Collection', 92, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-16', NULL, NULL, NULL, NULL, NULL, 24, 'COD', 0, 'Created', 'Not Applicable', '2024-05-14 13:23:51', '2024-05-21 17:14:38'),
(278, 'Web', 178, NULL, 'Pending Collection', 92, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-14', '2024-05-14 13:27:38', NULL, NULL, NULL, NULL, NULL, 'COD', 2468, 'Placed', 'Order Received', '2024-05-14 13:26:42', '2024-05-14 13:27:38'),
(279, 'Web', 179, NULL, 'Pending Collection', 99, 2, 258, NULL, 0, 0, 12.9, 0, 258, '2024-05-17', '2024-05-16 12:03:40', NULL, NULL, NULL, NULL, 18, 'COD', 0, 'Placed', 'Order Received', '2024-05-16 11:39:57', '2024-05-16 12:03:40'),
(280, 'Web', 179, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-16', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-05-16 16:01:42', '2024-05-16 16:01:42'),
(281, 'Web', 180, NULL, 'Pending Collection', 100, 2, 238, NULL, 0, 0, 11.9, 0, 238, '2024-05-18', '2024-05-16 16:05:29', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2024-05-16 16:04:28', '2024-05-16 16:05:29'),
(282, 'Web', 180, NULL, 'Pending Collection', 100, 1, 95, NULL, 0, 0, 4.75, 0, 95, '2024-05-18', '2024-05-16 16:10:35', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2024-05-16 16:07:32', '2024-05-16 16:10:35'),
(283, 'Web', 180, NULL, 'Pending Collection', NULL, 1, 50, NULL, 0, 0, 0, 0, 45, '2024-05-16', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-05-16 16:12:15', '2024-05-16 16:12:35'),
(284, 'Web', 167, NULL, 'Pending Collection', 89, 2, 46, NULL, 0, 0, 2.3, 0, 46, '2024-05-20', '2024-05-17 16:04:45', NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Placed', 'Order Received', '2024-05-16 16:29:16', '2024-05-17 16:04:45'),
(285, 'Web', 181, NULL, 'Pending Collection', 101, 2, 100, NULL, 0, 0, 12, 0, 100, '2024-05-18', '2024-05-16 16:47:54', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2024-05-16 16:46:21', '2024-05-16 16:47:54'),
(286, 'Web', 181, NULL, 'Pending Collection', 101, 1, 115, NULL, 0, 0, 5.75, 0, 115, '2024-05-17', '2024-05-16 16:49:17', NULL, NULL, NULL, NULL, 18, 'COD', 0, 'Placed', 'Order Received', '2024-05-16 16:48:54', '2024-05-16 16:49:17'),
(287, 'Web', 181, NULL, 'Pending Collection', 101, 1, 115, NULL, 0, 0, 5.75, 0, 115, '2024-05-18', NULL, NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Created', 'Not Applicable', '2024-05-16 16:50:19', '2024-05-17 15:28:20'),
(288, 'Web', 182, NULL, 'Pending Collection', 102, 2, 574, NULL, 0, 0, 28.7, 0, 516.6, '2024-05-18', '2024-05-17 11:23:40', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Packed', '2024-05-17 11:14:13', '2024-05-17 11:23:40'),
(289, 'Web', 182, NULL, 'Pending Collection', 102, 1, 50, NULL, 0, 0, 6, 0, 50, '2024-05-20', '2024-05-17 11:32:48', NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Placed', 'Order Received', '2024-05-17 11:25:17', '2024-05-17 11:32:48'),
(291, 'Web', 182, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 11:47:32', '2024-05-17 11:47:32'),
(292, 'Web', 182, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 11:47:47', '2024-05-17 11:47:47'),
(293, 'Web', 182, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 13:02:23', '2024-05-17 13:02:23'),
(294, 'Web', 182, NULL, 'Pending Collection', NULL, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 13:15:47', '2024-05-17 13:15:47'),
(295, 'Web', 182, NULL, 'Pending Collection', NULL, 1, 57, NULL, 0, 0, 0, 0, 57, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 13:17:50', '2024-05-17 13:17:50'),
(296, 'Web', 183, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 15:29:47', '2024-05-17 15:29:47'),
(297, 'Web', 183, NULL, 'Pending Collection', NULL, 20, 6773, NULL, 0, 0, 0, 0, 6773, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 15:39:59', '2024-05-17 15:39:59'),
(298, 'Web', 183, NULL, 'Pending Collection', NULL, 12, 3283, NULL, 0, 0, 0, 0, 3283, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 15:46:03', '2024-05-17 15:46:03'),
(299, 'Web', 183, NULL, 'Pending Collection', NULL, 3, 333, NULL, 0, 0, 0, 0, 333, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 15:46:53', '2024-05-17 15:46:53'),
(300, 'Web', 184, NULL, 'Pending Collection', NULL, 3, 664, NULL, 0, 0, 0, 0, 664, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 16:22:01', '2024-05-17 16:22:01'),
(301, 'Web', 184, NULL, 'Pending Collection', NULL, 3, 664, NULL, 0, 0, 0, 0, 664, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 16:23:35', '2024-05-17 16:23:35'),
(302, 'Web', 182, NULL, 'Pending Collection', NULL, 1, 57, NULL, 0, 0, 0, 0, 57, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 16:36:29', '2024-05-17 16:36:29'),
(303, 'Web', 182, NULL, 'Pending Collection', NULL, 1, 57, NULL, 0, 0, 0, 0, 57, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 16:37:57', '2024-05-17 16:37:57'),
(304, 'Web', 182, NULL, 'Pending Collection', NULL, 4, 523, NULL, 0, 0, 0, 0, 523, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 16:38:57', '2024-05-17 16:38:57'),
(305, 'Web', 182, NULL, 'Pending Collection', 102, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-05-18', '2024-05-17 16:43:09', NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Placed', 'Order Received', '2024-05-17 16:40:14', '2024-05-17 16:43:09'),
(306, 'Web', 182, NULL, 'Pending Collection', NULL, 1, 385, NULL, 0, 0, 0, 0, 385, '2024-05-17', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-17 19:29:26', '2024-05-17 19:29:26'),
(307, 'Web', 184, NULL, 'Pending Collection', 104, 3, 664, NULL, 0, 0, 39.5, 0, 597.6, '2024-05-18', NULL, NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Created', 'Not Applicable', '2024-05-17 19:39:09', '2024-05-17 19:42:27'),
(308, 'Web', 185, NULL, 'Pending Collection', 105, 2, 330, NULL, 0, 0, 16.5, 0, 297, '2024-05-20', '2024-05-17 19:46:29', NULL, NULL, NULL, NULL, 42, 'COD', 0, 'Placed', 'Order Received', '2024-05-17 19:44:26', '2024-05-17 19:46:29'),
(309, 'Web', 185, NULL, 'Pending Collection', 105, 2, 161, NULL, 0, 0, 8.05, 0, 161, '2024-05-20', '2024-05-17 19:47:41', NULL, NULL, NULL, NULL, 42, 'COD', 0, 'Placed', 'Order Received', '2024-05-17 19:47:22', '2024-05-17 19:47:41'),
(310, 'Web', 185, NULL, 'Pending Collection', 105, 10, 4636, NULL, 0, 0, 87.45, 0, 4172.4, '2024-05-20', '2024-05-18 09:32:28', NULL, NULL, NULL, NULL, 42, 'COD', 0, 'Placed', 'Order Received', '2024-05-18 09:12:55', '2024-05-18 09:32:28'),
(311, 'Web', 186, NULL, 'Pending Collection', 106, 2, 2099, NULL, 0, 0, 377.82, 0, 1889.1, '2024-05-20', NULL, NULL, NULL, NULL, NULL, 42, 'COD', 0, 'Created', 'Not Applicable', '2024-05-18 09:35:00', '2024-05-18 09:35:37'),
(312, 'Web', 177, NULL, 'Pending Collection', 98, 2, 322, NULL, 0, 0, 0, 0, 322, '2024-05-20', NULL, NULL, NULL, NULL, NULL, 42, 'COD', 0, 'Created', 'Not Applicable', '2024-05-18 12:53:13', '2024-05-21 18:14:19'),
(313, 'Web', 187, NULL, 'Pending Collection', 107, 2, 677, NULL, 0, 0, 33.85, 0, 609.3, '2024-05-22', '2024-05-21 17:21:07', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 13:25:09', '2024-05-21 17:21:07'),
(314, 'Web', 188, NULL, 'Pending Collection', 108, 3, 651, NULL, 0, 0, 32.55, 0, 585.9, '2024-05-23', '2024-05-21 14:57:24', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 14:56:11', '2024-05-21 14:57:24'),
(315, 'Web', 188, NULL, 'Pending Collection', 108, 2, 200, NULL, 0, 0, 10, 0, 180, '2024-05-23', '2024-05-21 15:13:40', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 15:06:18', '2024-05-21 15:13:40'),
(316, 'Web', 167, NULL, 'Pending Collection', 89, 2, 171, NULL, 0, 0, 20.52, 0, 171, '2024-05-24', '2024-05-22 15:06:03', NULL, NULL, NULL, NULL, 18, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 16:38:00', '2024-05-22 15:06:03'),
(317, 'Web', 189, NULL, 'Pending Collection', 109, 1, 60, NULL, 0, 0, 3, 0, 54, '2024-05-22', '2024-05-21 17:52:45', NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 16:42:33', '2024-05-21 17:52:45'),
(318, 'Web', 187, NULL, 'Pending Collection', NULL, 1, 122, NULL, 0, 0, 0, 0, 122, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:21:31', '2024-05-21 17:21:31'),
(319, 'Web', 187, NULL, 'Pending Collection', NULL, 1, 122, NULL, 0, 0, 0, 0, 122, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:21:56', '2024-05-21 17:21:56'),
(320, 'Web', 187, NULL, 'Pending Collection', NULL, 1, 122, NULL, 0, 0, 0, 0, 122, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:22:12', '2024-05-21 17:22:12'),
(321, 'Web', 187, NULL, 'Pending Collection', NULL, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:22:52', '2024-05-21 17:22:52'),
(322, 'Web', 187, NULL, 'Pending Collection', NULL, 2, 1895, NULL, 0, 0, 0, 0, 1895, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:25:38', '2024-05-21 17:25:38'),
(323, 'Web', 187, NULL, 'Pending Collection', NULL, 2, 1895, NULL, 0, 0, 0, 0, 1895, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:25:53', '2024-05-21 17:25:53'),
(332, 'Web', 191, NULL, 'Pending Collection', NULL, 1, 211, NULL, 0, 0, 0, 0, 211, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:48:08', '2024-05-21 17:48:08'),
(333, 'Web', 191, NULL, 'Pending Collection', NULL, 1, 211, NULL, 0, 0, 0, 0, 211, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:48:27', '2024-05-21 17:48:27'),
(334, 'Web', 191, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:48:37', '2024-05-21 17:48:37'),
(335, 'Web', 191, NULL, 'Pending Collection', NULL, 4, 451, NULL, 0, 0, 0, 0, 451, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 17:49:07', '2024-05-21 17:49:07'),
(336, 'Web', 189, NULL, 'Pending Collection', 109, 1, 40, NULL, 0, 0, 2, 0, 40, '2024-05-22', NULL, NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Created', 'Not Applicable', '2024-05-21 17:53:26', '2024-05-21 18:00:03'),
(337, 'Web', 191, NULL, 'Pending Collection', 111, 1, 385, NULL, 0, 0, 19.25, 0, 346.5, '2024-05-23', '2024-05-21 17:56:37', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 17:55:36', '2024-05-21 17:56:37'),
(338, 'Web', 191, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 18:00:30', '2024-05-21 18:00:30'),
(339, 'Web', 191, NULL, 'Pending Collection', 111, 1, 385, NULL, 0, 0, 19.25, 0, 385, '2024-05-23', '2024-05-21 18:01:19', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 18:00:55', '2024-05-21 18:01:19'),
(340, 'Web', 193, NULL, 'Pending Collection', NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-21', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Cancelled', 'Not Applicable', '2024-05-21 18:02:42', '2024-05-21 18:02:42'),
(341, 'Web', 192, NULL, 'Pending Collection', 112, 2, 433, NULL, 0, 0, 0, 0, 389.7, '2024-05-22', NULL, NULL, NULL, NULL, NULL, 16, 'COD', 0, 'Created', 'Not Applicable', '2024-05-21 18:02:53', '2024-05-21 18:03:44'),
(342, 'Web', 193, NULL, 'Pending Collection', 113, 1, 189, NULL, 0, 0, 9.45, 0, 170.1, '2024-05-23', '2024-05-21 18:05:40', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-21 18:03:41', '2024-05-21 18:05:40'),
(343, 'Web', 194, NULL, 'Pending Collection', 114, 2, 410, NULL, 0, 0, 20.5, 0, 369, '2024-05-23', NULL, NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Created', 'Not Applicable', '2024-05-21 18:07:39', '2024-05-21 18:08:45'),
(344, 'Web', 195, NULL, 'Pending Collection', 115, 1, 145, NULL, 0, 0, 7.25, 0, 130.5, '2024-05-23', NULL, NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Created', 'Not Applicable', '2024-05-21 18:17:55', '2024-06-14 20:50:53'),
(345, 'Web', 196, NULL, 'Pending Collection', 116, 1, 95, NULL, 0, 0, 4.75, 0, 85.5, '2024-05-23', '2024-05-22 10:19:39', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 10:18:24', '2024-05-22 10:19:39'),
(346, 'Web', 196, NULL, 'Pending Collection', 116, 1, 189, NULL, 0, 0, 9.45, 0, 189, '2024-05-23', '2024-05-22 10:24:12', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 10:20:56', '2024-05-22 10:24:12'),
(347, 'Web', 196, NULL, 'Pending Collection', 116, 4, 448, NULL, 0, 0, 22.4, 0, 448, '2024-05-23', '2024-05-22 10:29:21', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 10:27:12', '2024-05-22 10:29:21'),
(354, 'Web', 197, NULL, 'Pending Collection', 117, 2, 736, NULL, 0, 0, 36.8, 0, 662.4, '2024-05-23', '2024-05-22 12:53:19', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 12:52:21', '2024-05-22 12:53:19'),
(355, 'Web', 197, NULL, 'Pending Collection', 117, 1, 265, NULL, 0, 0, 13.25, 0, 265, '2024-05-23', '2024-05-22 12:54:00', NULL, NULL, NULL, NULL, 45, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 12:53:49', '2024-05-22 12:54:00'),
(356, 'Web', 198, NULL, 'Pending Collection', 118, 2, 278, NULL, 0, 0, 13.9, 0, 250.2, '2024-05-23', '2024-05-22 15:01:59', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 15:01:10', '2024-05-22 15:01:59'),
(357, 'Web', 198, NULL, 'Pending Collection', 118, 1, 116, NULL, 0, 0, 5.8, 0, 116, '2024-05-23', '2024-05-22 15:03:43', NULL, NULL, NULL, NULL, 17, 'COD', 0, 'Placed', 'Order Received', '2024-05-22 15:02:41', '2024-05-22 15:03:43'),
(358, 'Web', 167, NULL, 'Pending Collection', 89, 1, 144, NULL, 0, 0, 7.2, 0, 144, '2024-05-24', NULL, NULL, NULL, NULL, NULL, 18, 'COD', 0, 'Created', 'Not Applicable', '2024-05-22 15:07:31', '2024-05-22 15:07:55'),
(359, 'Web', 6, NULL, 'Pending Collection', 5, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-06-22', '2024-06-21 13:27:23', NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Placed', 'Order Received', '2024-06-21 13:27:02', '2024-06-21 13:27:23'),
(360, 'Web', 6, NULL, 'Pending Collection', 5, 8, 533, NULL, 0, 0, 8.4, 0, 533, '2024-06-22', NULL, NULL, NULL, NULL, NULL, 4, 'COD', 0, 'Created', 'Not Applicable', '2024-06-21 13:28:07', '2024-06-24 11:09:07'),
(361, 'Web', 199, NULL, 'Pending Collection', 120, 1, 57, NULL, 0, 0, 2.85, 0, 51.3, '2024-06-22', NULL, NULL, NULL, NULL, NULL, 19, 'COD', 0, 'Created', 'Not Applicable', '2024-06-21 15:37:11', '2024-06-21 15:40:37'),
(362, 'Web', 200, NULL, 'Pending Collection', 121, 1, 55, NULL, 0, 0, 2.75, 0, 49.5, '2024-06-24', NULL, NULL, NULL, NULL, NULL, 3, 'COD', 0, 'Created', 'Not Applicable', '2024-06-21 15:47:02', '2024-06-21 15:47:47'),
(363, 'Web', 201, NULL, 'Pending Collection', 122, 1, 211, NULL, 0, 0, 10.55, 0, 189.9, '2024-06-25', '2024-06-24 11:11:36', NULL, NULL, NULL, NULL, 15, 'COD', 0, 'Placed', 'Order Received', '2024-06-24 11:10:12', '2024-06-24 11:11:36'),
(364, 'Web', 201, NULL, 'Pending Collection', NULL, 1, 1750, NULL, 0, 0, 0, 0, 1750, '2024-06-24', NULL, NULL, NULL, NULL, NULL, NULL, 'COD', 0, 'Created', 'Not Applicable', '2024-06-24 11:13:14', '2024-06-24 11:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_deliveries`
--

CREATE TABLE `order_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `proof` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price_id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `offer_price` double NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `total_weight` int(11) NOT NULL,
  `gst_percent` double NOT NULL DEFAULT 0,
  `gst_amount` double NOT NULL DEFAULT 0,
  `sgst_percent` double NOT NULL DEFAULT 0,
  `sgst_amount` double NOT NULL DEFAULT 0,
  `cgst_percent` double NOT NULL DEFAULT 0,
  `cgst_amount` double NOT NULL DEFAULT 0,
  `igst_percent` double NOT NULL DEFAULT 0,
  `igst_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `product_price_id`, `price`, `offer_price`, `weight`, `quantity`, `amount`, `total_weight`, `gst_percent`, `gst_amount`, `sgst_percent`, `sgst_amount`, `cgst_percent`, `cgst_amount`, `igst_percent`, `igst_amount`, `created_at`, `updated_at`) VALUES
(79, 65, 4, 164, 172, 679, 0, 10, 1, 679, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-22 18:47:29', '2023-08-22 18:47:29'),
(80, 67, 23, 165, 174, 127, 0, 2, 1, 127, 2, 5, 6.35, 2.5, 3.175, 2.5, 3.175, 0, 0, '2023-09-15 14:57:01', '2023-09-15 14:57:01'),
(81, 67, 23, 166, 175, 1655, 0, 26, 1, 1655, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-15 14:57:01', '2023-09-15 14:57:01'),
(82, 70, 30, 163, 169, 1710, 0, 26, 1, 1710, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-17 05:33:22', '2023-10-17 05:33:22'),
(83, 71, 31, 163, 170, 355, 0, 5, 1, 355, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-17 08:30:13', '2023-10-17 08:30:13'),
(84, 71, 31, 165, 174, 127, 0, 2, 1, 127, 2, 5, 6.35, 2.5, 3.175, 2.5, 3.175, 0, 0, '2023-10-17 08:30:13', '2023-10-17 08:30:13'),
(85, 71, 31, 166, 175, 1655, 0, 26, 1, 1655, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-17 08:30:13', '2023-10-17 08:30:13'),
(86, 71, 31, 170, 182, 100, 0, 1, 1, 100, 1, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2023-10-17 08:30:13', '2023-10-17 08:30:13'),
(87, 71, 31, 168, 180, 240, 0, 5, 1, 240, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-17 08:30:13', '2023-10-17 08:30:13'),
(88, 75, 6, 165, 174, 127, 0, 2, 1, 127, 2, 5, 6.35, 2.5, 3.175, 2.5, 3.175, 0, 0, '2023-10-19 18:24:15', '2023-10-19 18:24:15'),
(89, 75, 6, 163, 170, 355, 0, 5, 1, 355, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-19 18:24:15', '2023-10-19 18:24:15'),
(90, 75, 6, 182, 224, 132, 0, 1, 1, 132, 1, 5, 6.6, 2.5, 3.3, 2.5, 3.3, 0, 0, '2023-10-19 18:24:15', '2023-10-19 18:24:15'),
(91, 76, 6, 163, 169, 1900, 0, 26, 1, 1900, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-30 13:03:26', '2023-10-30 13:03:26'),
(92, 76, 6, 220, 266, 440, 0, 1, 1, 440, 1, 5, 22, 2.5, 11, 2.5, 11, 0, 0, '2023-10-30 13:03:26', '2023-10-30 13:03:26'),
(93, 77, 30, 164, 172, 800, 0, 10, 1, 800, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-30 13:07:03', '2023-10-30 13:07:03'),
(94, 77, 30, 195, 239, 20, 0, 100, 1, 20, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-30 13:07:03', '2023-10-30 13:07:03'),
(95, 77, 30, 162, 168, 10, 10, 50, 1, 10, 50, 5, 0.5, 2.5, 0.25, 2.5, 0.25, 0, 0, '2023-10-30 13:07:03', '2023-10-30 13:07:03'),
(96, 77, 30, 167, 178, 150, 0, 2, 1, 150, 2, 5, 7.5, 2.5, 3.75, 2.5, 3.75, 0, 0, '2023-10-30 13:07:03', '2023-10-30 13:07:03'),
(97, 78, 35, 323, 416, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2023-10-30 13:09:21', '2023-10-30 13:09:21'),
(98, 78, 35, 385, 478, 110, 0, 50, 1, 110, 50, 18, 19.8, 9, 9.9, 9, 9.9, 0, 0, '2023-10-30 13:09:21', '2023-10-30 13:09:21'),
(99, 79, 6, 163, 169, 1900, 0, 26, 1, 1900, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-31 13:00:40', '2023-10-31 13:00:40'),
(100, 80, 6, 165, 174, 150, 0, 2, 1, 150, 2, 5, 7.5, 2.5, 3.75, 2.5, 3.75, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(101, 80, 6, 164, 171, 1800, 0, 26, 1, 1800, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(102, 80, 6, 170, 182, 100, 0, 1, 1, 100, 1, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(103, 80, 6, 182, 224, 155, 0, 1, 1, 155, 1, 5, 7.75, 2.5, 3.875, 2.5, 3.875, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(104, 80, 6, 186, 228, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(105, 80, 6, 529, 622, 10, 0, 50, 1, 10, 50, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(106, 80, 6, 582, 675, 160, 0, 1000, 1, 160, 1000, 18, 28.8, 9, 14.4, 9, 14.4, 0, 0, '2023-10-31 13:35:47', '2023-10-31 13:35:47'),
(107, 82, 6, 185, 227, 70, 0, 500, 1, 70, 500, 5, 3.5, 2.5, 1.75, 2.5, 1.75, 0, 0, '2023-11-03 12:36:54', '2023-11-03 12:36:54'),
(108, 82, 6, 405, 498, 14, 0, 70, 1, 14, 70, 12, 1.68, 6, 0.84, 6, 0.84, 0, 0, '2023-11-03 12:36:54', '2023-11-03 12:36:54'),
(109, 82, 6, 448, 541, 42, 0, 100, 1, 42, 100, 18, 7.56, 9, 3.78, 9, 3.78, 0, 0, '2023-11-03 12:36:54', '2023-11-03 12:36:54'),
(110, 82, 6, 399, 492, 25, 0, 200, 1, 25, 200, 18, 4.5, 9, 2.25, 9, 2.25, 0, 0, '2023-11-03 12:36:54', '2023-11-03 12:36:54'),
(111, 66, 4, 223, 269, 61, 0, 500, 1, 61, 500, 5, 3.05, 2.5, 1.525, 2.5, 1.525, 0, 0, '2023-11-03 19:20:13', '2023-11-03 19:20:13'),
(112, 83, 4, 219, 265, 211, 0, 500, 1, 211, 500, 5, 10.55, 2.5, 5.275, 2.5, 5.275, 0, 0, '2023-11-03 19:28:55', '2023-11-03 19:28:55'),
(113, 84, 2, 212, 258, 28, 0, 500, 1, 28, 500, 5, 1.4, 2.5, 0.7, 2.5, 0.7, 0, 0, '2023-11-04 10:10:01', '2023-11-04 10:10:01'),
(114, 84, 2, 494, 587, 132, 0, 100, 1, 132, 100, 18, 23.76, 9, 11.88, 9, 11.88, 0, 0, '2023-11-04 10:10:01', '2023-11-04 10:10:01'),
(115, 85, 35, 303, 396, 80, 0, 100, 1, 80, 100, 5, 4, 2.5, 2, 2.5, 2, 0, 0, '2023-11-04 18:42:16', '2023-11-04 18:42:16'),
(116, 85, 35, 224, 270, 116, 0, 1, 1, 116, 1, 5, 5.8, 2.5, 2.9, 2.5, 2.9, 0, 0, '2023-11-04 18:42:16', '2023-11-04 18:42:16'),
(117, 85, 35, 567, 660, 34, 0, 250, 1, 34, 250, 18, 6.12, 9, 3.06, 9, 3.06, 0, 0, '2023-11-04 18:42:16', '2023-11-04 18:42:16'),
(118, 86, 2, 164, 172, 679, 0, 10, 1, 679, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-06 10:38:38', '2023-11-06 10:38:38'),
(119, 86, 2, 236, 282, 174, 0, 500, 1, 174, 500, 5, 8.7, 2.5, 4.35, 2.5, 4.35, 0, 0, '2023-11-06 10:38:38', '2023-11-06 10:38:38'),
(120, 86, 2, 475, 568, 35, 0, 100, 1, 35, 100, 18, 6.3, 9, 3.15, 9, 3.15, 0, 0, '2023-11-06 10:38:38', '2023-11-06 10:38:38'),
(121, 87, 21, 191, 233, 36, 0, 250, 1, 36, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-07 09:58:48', '2023-11-07 09:58:48'),
(122, 89, 6, 262, 348, 14, 0, 50, 1, 14, 50, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2023-11-07 19:32:41', '2023-11-07 19:32:41'),
(123, 89, 6, 264, 351, 41, 0, 50, 1, 41, 50, 5, 2.05, 2.5, 1.025, 2.5, 1.025, 0, 0, '2023-11-07 19:32:41', '2023-11-07 19:32:41'),
(124, 89, 6, 404, 497, 7, 0, 32, 1, 7, 32, 12, 0.84, 6, 0.42, 6, 0.42, 0, 0, '2023-11-07 19:32:41', '2023-11-07 19:32:41'),
(125, 89, 6, 690, 783, 45, 0, 25, 1, 45, 25, 18, 8.1, 9, 4.05, 9, 4.05, 0, 0, '2023-11-07 19:32:41', '2023-11-07 19:32:41'),
(126, 90, 6, 170, 182, 100, 0, 1, 1, 100, 1, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2023-11-08 10:12:57', '2023-11-08 10:12:57'),
(127, 90, 6, 223, 269, 61, 0, 500, 1, 61, 500, 5, 3.05, 2.5, 1.525, 2.5, 1.525, 0, 0, '2023-11-08 10:12:57', '2023-11-08 10:12:57'),
(128, 90, 6, 694, 787, 2190, 0, 0, 1, 2190, 0, 18, 394.2, 9, 197.1, 9, 197.1, 0, 0, '2023-11-08 10:12:57', '2023-11-08 10:12:57'),
(129, 88, 21, 682, 775, 15, 0, 0, 3, 45, 0, 5, 2.25, 2.5, 1.125, 2.5, 1.125, 0, 0, '2023-11-08 15:27:19', '2023-11-08 15:27:19'),
(130, 88, 21, 182, 224, 148, 0, 1, 1, 148, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-08 15:27:19', '2023-11-08 15:27:19'),
(131, 91, 6, 164, 171, 1650, 0, 26, 1, 1650, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-10 14:02:25', '2023-11-10 14:02:25'),
(132, 91, 6, 466, 559, 38, 0, 75, 1, 38, 75, 18, 6.84, 9, 3.42, 9, 3.42, 0, 0, '2023-11-10 14:02:25', '2023-11-10 14:02:25'),
(133, 92, 25, 165, 174, 132, 0, 2, 1, 132, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-10 19:23:17', '2023-11-10 19:23:17'),
(134, 94, 35, 164, 172, 691, 0, 10, 1, 691, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-17 11:17:47', '2023-11-17 11:17:47'),
(135, 94, 35, 613, 706, 38, 0, 200, 1, 38, 200, 18, 6.84, 9, 3.42, 9, 3.42, 0, 0, '2023-11-17 11:17:47', '2023-11-17 11:17:47'),
(136, 95, 39, 219, 265, 211, 0, 500, 1, 211, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-17 16:42:47', '2023-11-17 16:42:47'),
(137, 96, 39, 164, 171, 1650, 0, 26, 1, 1650, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-17 16:44:50', '2023-11-17 16:44:50'),
(138, 96, 39, 445, 538, 45, 0, 125, 1, 45, 125, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-17 16:44:50', '2023-11-17 16:44:50'),
(139, 97, 39, 164, 171, 1650, 0, 26, 1, 1650, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-17 16:50:08', '2023-11-17 16:50:08'),
(140, 99, 35, 164, 172, 691, 0, 10, 1, 691, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-21 14:47:21', '2023-11-21 14:47:21'),
(141, 99, 35, 205, 251, 47, 0, 250, 1, 47, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-21 14:47:21', '2023-11-21 14:47:21'),
(142, 99, 35, 512, 605, 110, 0, 200, 1, 110, 200, 18, 19.8, 9, 9.9, 9, 9.9, 0, 0, '2023-11-21 14:47:21', '2023-11-21 14:47:21'),
(143, 100, 35, 164, 173, 351, 0, 5, 1, 351, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-22 12:13:55', '2023-11-22 12:13:55'),
(144, 100, 35, 476, 569, 35, 0, 75, 1, 35, 75, 18, 6.3, 9, 3.15, 9, 3.15, 0, 0, '2023-11-22 12:13:55', '2023-11-22 12:13:55'),
(145, 100, 35, 240, 286, 116, 0, 500, 1, 116, 500, 5, 5.8, 2.5, 2.9, 2.5, 2.9, 0, 0, '2023-11-22 12:13:55', '2023-11-22 12:13:55'),
(146, 101, 6, 397, 490, 72, 0, 200, 1, 72, 200, 12, 8.64, 6, 4.32, 6, 4.32, 0, 0, '2023-11-25 11:01:08', '2023-11-25 11:01:08'),
(147, 101, 6, 192, 234, 60, 0, 500, 1, 60, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-25 11:01:08', '2023-11-25 11:01:08'),
(148, 102, 19, 164, 172, 691, 0, 10, 1, 691, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-25 15:39:41', '2023-11-25 15:39:41'),
(149, 102, 19, 186, 228, 100, 0, 500, 2, 200, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-25 15:39:41', '2023-11-25 15:39:41'),
(150, 102, 19, 186, 228, 100, 0, 500, 3, 300, 1500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-25 15:39:41', '2023-11-25 15:39:41'),
(151, 102, 19, 196, 241, 20, 0, 250, 5, 100, 1250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-25 15:39:41', '2023-11-25 15:39:41'),
(152, 104, 35, 164, 173, 351, 0, 5, 1, 351, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-27 10:37:04', '2023-11-27 10:37:04'),
(153, 104, 35, 212, 258, 28, 0, 500, 1, 28, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-27 10:37:04', '2023-11-27 10:37:04'),
(154, 105, 40, 437, 530, 10, 0, 45, 1, 10, 45, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-28 17:04:16', '2023-11-28 17:04:16'),
(156, 108, 43, 399, 492, 26, 0, 200, 1, 26, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-28 17:31:45', '2023-11-28 17:31:45'),
(157, 112, 35, 199, 244, 35, 0, 250, 1, 35, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-29 09:56:38', '2023-11-29 09:56:38'),
(158, 112, 35, 236, 282, 174, 0, 500, 1, 174, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-29 09:56:38', '2023-11-29 09:56:38'),
(159, 98, 6, 339, 432, 39, 0, 50, 1, 39, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 13:51:17', '2023-11-30 13:51:17'),
(160, 98, 6, 340, 433, 24, 0, 50, 1, 24, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 13:51:17', '2023-11-30 13:51:17'),
(161, 98, 6, 341, 434, 25, 0, 50, 1, 25, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 13:51:17', '2023-11-30 13:51:17'),
(162, 98, 6, 695, 788, 2480, 0, 0, 1, 2480, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 13:51:17', '2023-11-30 13:51:17'),
(163, 98, 6, 808, 902, 27, 0, 50, 1, 27, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 13:51:17', '2023-11-30 13:51:17'),
(164, 98, 6, 445, 538, 45, 0, 125, 1, 45, 125, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 13:51:17', '2023-11-30 13:51:17'),
(165, 114, 6, 199, 244, 35, 0, 250, 1, 35, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 18:55:39', '2023-11-30 18:55:39'),
(166, 114, 6, 223, 269, 58, 0, 500, 1, 58, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 18:55:39', '2023-11-30 18:55:39'),
(167, 114, 6, 565, 658, 13, 0, 90, 1, 13, 90, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-30 18:55:39', '2023-11-30 18:55:39'),
(168, 115, 6, 265, 354, 50, 0, 100, 1, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 10:54:21', '2023-12-01 10:54:21'),
(169, 116, 35, 228, 274, 90, 0, 1, 1, 90, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 11:59:20', '2023-12-01 11:59:20'),
(170, 116, 35, 473, 566, 38, 0, 125, 1, 38, 125, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 11:59:20', '2023-12-01 11:59:20'),
(171, 117, 51, 262, 348, 14, 0, 50, 1, 14, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 13:22:32', '2023-12-01 13:22:32'),
(172, 117, 51, 254, 300, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 13:22:32', '2023-12-01 13:22:32'),
(173, 117, 51, 182, 224, 158, 0, 1, 1, 158, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 13:22:32', '2023-12-01 13:22:32'),
(174, 117, 51, 188, 230, 157, 0, 1, 4, 628, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 13:22:32', '2023-12-01 13:22:32'),
(175, 119, 54, 200, 245, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 16:56:38', '2023-12-01 16:56:38'),
(176, 119, 54, 310, 403, 53, 0, 250, 1, 53, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 16:56:38', '2023-12-01 16:56:38'),
(177, 119, 54, 610, 703, 37, 0, 200, 1, 37, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-01 16:56:38', '2023-12-01 16:56:38'),
(178, 121, 6, 348, 441, 45, 0, 50, 1, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-02 11:48:17', '2023-12-02 11:48:17'),
(179, 121, 6, 580, 673, 112, 0, 500, 1, 112, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-02 11:48:17', '2023-12-02 11:48:17'),
(180, 122, 55, 313, 406, 19, 0, 50, 1, 19, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-02 14:35:07', '2023-12-02 14:35:07'),
(181, 123, 54, 225, 271, 110, 0, 1, 1, 110, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-02 17:42:29', '2023-12-02 17:42:29'),
(182, 123, 54, 239, 285, 33, 0, 200, 1, 33, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-02 17:42:29', '2023-12-02 17:42:29'),
(183, 123, 54, 186, 228, 100, 0, 500, 1, 100, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-02 17:42:29', '2023-12-02 17:42:29'),
(184, 126, 59, 187, 229, 66, 0, 500, 1, 66, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(185, 126, 59, 253, 299, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(186, 126, 59, 302, 395, 26, 0, 50, 1, 26, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(187, 126, 59, 308, 401, 49, 0, 50, 1, 49, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(188, 126, 59, 555, 648, 30, 0, 0, 2, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(189, 126, 59, 656, 749, 10, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(190, 126, 59, 681, 774, 45, 0, 0, 1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(191, 126, 59, 222, 268, 192, 0, 500, 1, 192, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(192, 126, 59, 227, 273, 218, 0, 1, 1, 218, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-04 16:12:35', '2023-12-04 16:12:35'),
(193, 128, 6, 328, 421, 22, 0, 50, 1, 22, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-06 11:36:39', '2023-12-06 11:36:39'),
(194, 129, 61, 428, 521, 58, 0, 200, 1, 58, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-07 16:46:56', '2023-12-07 16:46:56'),
(195, 129, 61, 435, 528, 10, 0, 48, 1, 10, 48, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-07 16:46:56', '2023-12-07 16:46:56'),
(196, 129, 61, 440, 533, 10, 0, 40, 3, 30, 120, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-07 16:46:56', '2023-12-07 16:46:56'),
(197, 132, 65, 748, 842, 250, 0, 5, 1, 250, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(198, 132, 65, 171, 183, 130, 0, 1, 1, 130, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(199, 132, 65, 734, 827, 35, 0, 1, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(200, 132, 65, 182, 224, 158, 0, 1, 3, 474, 3, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(201, 132, 65, 208, 254, 33, 0, 250, 1, 33, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(202, 132, 65, 210, 256, 25, 0, 500, 1, 25, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(203, 132, 65, 207, 253, 26, 0, 500, 1, 26, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(204, 132, 65, 265, 353, 25, 0, 50, 4, 100, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(205, 132, 65, 264, 351, 41, 0, 50, 3, 123, 150, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(206, 132, 65, 269, 360, 107, 0, 250, 1, 107, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(207, 132, 65, 267, 357, 75, 0, 250, 1, 75, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(208, 132, 65, 271, 364, 18, 0, 50, 1, 18, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(209, 132, 65, 272, 365, 18, 0, 50, 1, 18, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(210, 132, 65, 279, 372, 80, 0, 50, 2, 160, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(211, 132, 65, 290, 383, 73, 0, 50, 1, 73, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(212, 132, 65, 291, 384, 142, 0, 100, 1, 142, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(213, 132, 65, 604, 697, 22, 0, 75, 2, 44, 150, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(214, 132, 65, 614, 707, 93, 0, 500, 1, 93, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(215, 132, 65, 627, 720, 115, 0, 250, 1, 115, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(216, 132, 65, 628, 721, 91, 0, 250, 1, 91, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(217, 132, 65, 638, 731, 39, 0, 185, 1, 39, 185, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-11 15:03:27', '2023-12-11 15:03:27'),
(218, 137, 4, 163, 170, 355, 0, 5, 5, 1775, 25, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-18 18:58:54', '2023-12-18 18:58:54'),
(219, 138, 69, 267, 357, 75, 0, 250, 1, 75, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:50:57', '2023-12-20 14:50:57'),
(220, 138, 69, 286, 379, 68, 0, 50, 1, 68, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:50:57', '2023-12-20 14:50:57'),
(221, 138, 69, 752, 846, 82, 0, 100, 1, 82, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:50:57', '2023-12-20 14:50:57'),
(222, 138, 69, 753, 847, 50, 0, 100, 1, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:50:57', '2023-12-20 14:50:57'),
(223, 138, 69, 225, 271, 112, 0, 1, 1, 112, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:50:57', '2023-12-20 14:50:57'),
(224, 138, 69, 212, 258, 28, 0, 500, 1, 28, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:50:57', '2023-12-20 14:50:57'),
(225, 139, 69, 429, 522, 10, 0, 45, 3, 30, 135, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:54:25', '2023-12-20 14:54:25'),
(226, 139, 69, 434, 527, 10, 0, 60, 2, 20, 120, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:54:25', '2023-12-20 14:54:25'),
(227, 139, 69, 439, 532, 5, 0, 30, 4, 20, 120, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-20 14:54:25', '2023-12-20 14:54:25'),
(228, 141, 69, 317, 410, 15, 0, 50, 1, 15, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(229, 141, 69, 318, 411, 26, 0, 50, 1, 26, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(230, 141, 69, 319, 412, 22, 0, 50, 1, 22, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(231, 141, 69, 324, 417, 34, 0, 500, 1, 34, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(232, 141, 69, 327, 420, 45, 0, 50, 1, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(233, 141, 69, 332, 425, 27, 0, 50, 1, 27, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(234, 141, 69, 337, 430, 22, 0, 50, 1, 22, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(235, 141, 69, 349, 442, 13, 0, 50, 1, 13, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(236, 141, 69, 354, 447, 10, 0, 50, 1, 10, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(237, 141, 69, 755, 849, 28, 0, 50, 1, 28, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(238, 141, 69, 227, 273, 196, 0, 1, 1, 196, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(239, 141, 69, 582, 675, 145, 0, 1000, 1, 145, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(240, 141, 69, 510, 603, 20, 0, 45, 1, 20, 45, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(241, 141, 69, 527, 620, 2, 0, 6, 10, 20, 60, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(242, 141, 69, 618, 711, 4, 0, 19, 5, 20, 95, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(243, 141, 69, 619, 712, 4, 0, 19, 5, 20, 95, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(244, 141, 69, 623, 716, 4, 0, 19, 5, 20, 95, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(245, 141, 69, 656, 749, 10, 0, 0, 3, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(246, 141, 69, 681, 774, 45, 0, 0, 1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(247, 141, 69, 427, 520, 25, 0, 600, 1, 25, 600, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(248, 141, 69, 416, 509, 49, 0, 500, 1, 49, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(249, 141, 69, 415, 508, 39, 0, 500, 1, 39, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(250, 141, 69, 357, 450, 86, 0, 100, 1, 86, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(251, 141, 69, 377, 470, 5, 0, 20, 3, 15, 60, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(252, 141, 69, 378, 471, 5, 0, 15, 3, 15, 45, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(253, 141, 69, 186, 228, 100, 0, 500, 1, 100, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(254, 141, 69, 200, 245, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2023-12-22 11:08:17', '2023-12-22 11:08:17'),
(255, 143, 18, 169, 181, 120, 0, 1, 1, 120, 1, 5, 6, 2.5, 3, 2.5, 3, 0, 0, '2023-12-26 13:42:46', '2023-12-26 13:42:46'),
(256, 143, 18, 171, 183, 130, 0, 1, 1, 130, 1, 5, 6.5, 2.5, 3.25, 2.5, 3.25, 0, 0, '2023-12-26 13:42:46', '2023-12-26 13:42:46'),
(257, 143, 18, 187, 229, 66, 0, 500, 2, 132, 1000, 5, 6.6, 2.5, 3.3, 2.5, 3.3, 0, 0, '2023-12-26 13:42:46', '2023-12-26 13:42:46'),
(258, 144, 35, 860, 954, 74, 0, 100, 1, 74, 100, 18, 13.32, 9, 6.66, 9, 6.66, 0, 0, '2024-01-01 19:17:36', '2024-01-01 19:17:36'),
(259, 144, 35, 867, 961, 79, 0, 50, 1, 79, 50, 18, 14.22, 9, 7.11, 9, 7.11, 0, 0, '2024-01-01 19:17:36', '2024-01-01 19:17:36'),
(260, 144, 35, 859, 953, 153, 0, 5, 1, 153, 5, 18, 27.54, 9, 13.77, 9, 13.77, 0, 0, '2024-01-01 19:17:36', '2024-01-01 19:17:36'),
(261, 144, 35, 848, 942, 247, 0, 200, 1, 247, 200, 18, 44.46, 9, 22.23, 9, 22.23, 0, 0, '2024-01-01 19:17:36', '2024-01-01 19:17:36'),
(262, 140, 70, 648, 741, 22, 0, 50, 1, 22, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(264, 140, 70, 571, 664, 12, 0, 300, 1, 12, 300, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(265, 140, 70, 569, 662, 9, 0, 130, 2, 18, 260, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(266, 140, 70, 590, 683, 44, 0, 200, 1, 44, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(267, 140, 70, 598, 691, 10, 0, 135, 2, 20, 270, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(268, 140, 70, 605, 698, 15, 0, 500, 1, 15, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(269, 140, 70, 685, 778, 53, 0, 12, 1, 53, 12, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(270, 140, 70, 418, 511, 43, 0, 500, 1, 43, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(271, 140, 70, 426, 519, 25, 0, 250, 1, 25, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(272, 140, 70, 263, 349, 7, 0, 50, 1, 7, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(273, 140, 70, 265, 353, 25, 0, 50, 1, 25, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(274, 140, 70, 266, 355, 8, 0, 50, 1, 8, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(275, 140, 70, 267, 357, 75, 0, 250, 1, 75, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(276, 140, 70, 271, 364, 18, 0, 50, 1, 18, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(277, 140, 70, 272, 365, 18, 0, 50, 1, 18, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(278, 140, 70, 276, 369, 20, 0, 50, 1, 20, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(279, 140, 70, 281, 374, 15, 0, 50, 1, 15, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(280, 140, 70, 284, 377, 25, 0, 50, 1, 25, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(281, 140, 70, 803, 897, 40, 0, 50, 1, 40, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(282, 140, 70, 258, 304, 30, 0, 500, 1, 30, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(283, 140, 70, 306, 399, 40, 0, 50, 1, 40, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(284, 140, 70, 308, 401, 49, 0, 50, 1, 49, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(285, 140, 70, 310, 403, 53, 0, 250, 1, 53, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(286, 140, 70, 302, 395, 26, 0, 50, 1, 26, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(287, 140, 70, 311, 404, 16, 0, 50, 1, 16, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(288, 140, 70, 313, 406, 19, 0, 50, 1, 19, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(289, 140, 70, 318, 411, 26, 0, 50, 1, 26, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(290, 140, 70, 238, 284, 76, 0, 500, 1, 76, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(291, 140, 70, 189, 231, 36, 0, 250, 1, 36, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(292, 140, 70, 820, 914, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(293, 140, 70, 197, 242, 27, 0, 250, 1, 27, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(294, 140, 70, 198, 243, 53, 0, 250, 1, 53, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(295, 140, 70, 199, 244, 35, 0, 250, 1, 35, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(296, 140, 70, 208, 254, 33, 0, 250, 1, 33, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(297, 140, 70, 742, 836, 62, 0, 1, 1, 62, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(298, 140, 70, 475, 568, 35, 0, 100, 1, 35, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(299, 140, 70, 517, 610, 47, 0, 100, 1, 47, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(300, 140, 70, 194, 237, 52, 0, 500, 1, 52, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 10:55:34', '2024-01-05 10:55:34'),
(301, 147, 69, 183, 225, 200, 0, 1, 1, 200, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(302, 147, 69, 314, 407, 22, 0, 50, 1, 22, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(303, 147, 69, 322, 415, 25, 0, 50, 1, 25, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(304, 147, 69, 324, 417, 34, 0, 500, 1, 34, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(305, 147, 69, 338, 431, 14, 0, 50, 2, 28, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(306, 147, 69, 348, 441, 45, 0, 50, 1, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(307, 147, 69, 347, 440, 24, 0, 50, 1, 24, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(308, 147, 69, 212, 258, 28, 0, 500, 1, 28, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(309, 147, 69, 217, 263, 62, 0, 1, 1, 62, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(310, 147, 69, 218, 264, 37, 0, 500, 1, 37, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(311, 147, 69, 227, 273, 196, 0, 1, 1, 196, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(312, 147, 69, 255, 301, 48, 0, 1, 1, 48, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(313, 147, 69, 260, 306, 55, 0, 500, 1, 55, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(314, 147, 69, 197, 242, 27, 0, 250, 2, 54, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(315, 147, 69, 198, 243, 53, 0, 250, 1, 53, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(316, 147, 69, 200, 245, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(317, 147, 69, 618, 711, 4, 0, 19, 5, 20, 95, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(318, 147, 69, 619, 712, 4, 0, 19, 5, 20, 95, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(319, 147, 69, 623, 716, 4, 0, 19, 5, 20, 95, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(320, 147, 69, 286, 379, 68, 0, 50, 1, 68, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(321, 147, 69, 802, 896, 80, 0, 100, 1, 80, 100, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 10:41:05', '2024-01-06 10:41:05'),
(322, 148, 18, 164, 172, 691, 0, 10, 1, 691, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-06 16:56:50', '2024-01-06 16:56:50'),
(323, 113, 39, 164, 171, 1650, 0, 26, 1, 1650, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 10:36:36', '2024-01-08 10:36:36'),
(324, 113, 39, 182, 224, 158, 0, 1, 1, 158, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 10:36:36', '2024-01-08 10:36:36'),
(325, 113, 39, 221, 267, 381, 0, 1, 1, 381, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 10:36:36', '2024-01-08 10:36:36'),
(326, 113, 39, 225, 271, 112, 0, 1, 1, 112, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 10:36:36', '2024-01-08 10:36:36'),
(327, 113, 39, 211, 257, 55, 0, 500, 1, 55, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 10:36:36', '2024-01-08 10:36:36'),
(328, 113, 39, 217, 263, 62, 0, 1, 1, 62, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 10:36:36', '2024-01-08 10:36:36'),
(329, 149, 18, 183, 225, 191, 0, 1, 1, 191, 1, 5, 9.55, 2.5, 4.775, 2.5, 4.775, 0, 0, '2024-01-08 10:37:44', '2024-01-08 10:37:44'),
(330, 150, 35, 169, 181, 120, 0, 1, 1, 120, 1, 5, 6, 2.5, 3, 2.5, 3, 0, 0, '2024-01-08 11:42:44', '2024-01-08 11:42:44'),
(331, 150, 35, 224, 270, 113, 0, 1, 1, 113, 1, 5, 5.65, 2.5, 2.825, 2.5, 2.825, 0, 0, '2024-01-08 11:42:44', '2024-01-08 11:42:44'),
(332, 151, 35, 517, 610, 47, 0, 100, 1, 47, 100, 18, 8.46, 9, 4.23, 9, 4.23, 0, 0, '2024-01-08 16:50:53', '2024-01-08 16:50:53'),
(333, 151, 35, 863, 957, 109, 0, 750, 1, 109, 750, 18, 19.62, 9, 9.81, 9, 9.81, 0, 0, '2024-01-08 16:50:53', '2024-01-08 16:50:53'),
(334, 151, 35, 867, 961, 79, 0, 50, 1, 79, 50, 18, 14.22, 9, 7.11, 9, 7.11, 0, 0, '2024-01-08 16:50:53', '2024-01-08 16:50:53'),
(335, 152, 39, 164, 171, 1650, 0, 26, 1, 1650, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-08 18:25:57', '2024-01-08 18:25:57'),
(336, 152, 39, 183, 225, 191, 0, 1, 1, 191, 1, 5, 9.55, 2.5, 4.775, 2.5, 4.775, 0, 0, '2024-01-08 18:25:57', '2024-01-08 18:25:57'),
(337, 153, 65, 746, 840, 679, 0, 10, 1, 679, 10, 5, 33.95, 2.5, 16.975, 2.5, 16.975, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(338, 153, 65, 748, 842, 250, 0, 5, 1, 250, 5, 5, 12.5, 2.5, 6.25, 2.5, 6.25, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(339, 153, 65, 182, 224, 158, 0, 1, 1, 158, 1, 5, 7.9, 2.5, 3.95, 2.5, 3.95, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(340, 153, 65, 194, 237, 52, 0, 500, 1, 52, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(341, 153, 65, 200, 245, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(342, 153, 65, 201, 246, 58, 0, 500, 1, 58, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(343, 153, 65, 203, 249, 36, 0, 250, 1, 36, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(344, 153, 65, 209, 255, 45, 0, 1, 5, 225, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(345, 153, 65, 212, 258, 28, 0, 500, 3, 84, 1500, 5, 4.2, 2.5, 2.1, 2.5, 2.1, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(346, 153, 65, 310, 403, 53, 0, 250, 2, 106, 500, 5, 5.3, 2.5, 2.65, 2.5, 2.65, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(347, 153, 65, 385, 478, 104, 0, 50, 3, 312, 150, 18, 56.16, 9, 28.08, 9, 28.08, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(348, 153, 65, 357, 450, 86, 0, 100, 1, 86, 100, 5, 4.3, 2.5, 2.15, 2.5, 2.15, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(349, 153, 65, 427, 520, 25, 0, 600, 1, 25, 600, 12, 3, 6, 1.5, 6, 1.5, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(350, 153, 65, 426, 519, 25, 0, 250, 2, 50, 500, 5, 2.5, 2.5, 1.25, 2.5, 1.25, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(351, 153, 65, 738, 832, 10, 0, 40, 3, 30, 120, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(352, 153, 65, 613, 706, 38, 0, 200, 2, 76, 400, 18, 13.68, 9, 6.84, 9, 6.84, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(353, 153, 65, 627, 720, 115, 0, 250, 2, 230, 500, 12, 27.6, 6, 13.8, 6, 13.8, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(354, 153, 65, 560, 653, 10, 0, 150, 1, 10, 150, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(355, 153, 65, 274, 367, 108, 0, 50, 1, 108, 50, 5, 5.4, 2.5, 2.7, 2.5, 2.7, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(356, 153, 65, 284, 377, 25, 0, 50, 2, 50, 100, 5, 2.5, 2.5, 1.25, 2.5, 1.25, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(357, 153, 65, 751, 845, 15, 0, 100, 1, 15, 100, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(358, 153, 65, 752, 846, 82, 0, 100, 1, 82, 100, 5, 4.1, 2.5, 2.05, 2.5, 2.05, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(359, 153, 65, 753, 847, 50, 0, 100, 1, 50, 100, 5, 2.5, 2.5, 1.25, 2.5, 1.25, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(360, 153, 65, 754, 848, 15, 0, 100, 1, 15, 100, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(361, 153, 65, 277, 370, 68, 0, 50, 1, 68, 50, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-01-09 07:32:18', '2024-01-09 07:32:18'),
(362, 154, 39, 182, 224, 158, 0, 1, 1, 158, 1, 5, 7.9, 2.5, 3.95, 2.5, 3.95, 0, 0, '2024-01-09 09:51:04', '2024-01-09 09:51:04'),
(363, 156, 77, 163, 169, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(364, 156, 77, 748, 842, 250, 0, 5, 1, 250, 5, 5, 12.5, 2.5, 6.25, 2.5, 6.25, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(365, 156, 77, 169, 181, 120, 0, 1, 2, 240, 2, 5, 12, 2.5, 6, 2.5, 6, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(366, 156, 77, 171, 183, 130, 0, 1, 2, 260, 2, 5, 13, 2.5, 6.5, 2.5, 6.5, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(367, 156, 77, 182, 224, 158, 0, 1, 3, 474, 3, 5, 23.7, 2.5, 11.85, 2.5, 11.85, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(368, 156, 77, 183, 225, 191, 0, 1, 3, 573, 3, 5, 28.65, 2.5, 14.325, 2.5, 14.325, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(369, 156, 77, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(370, 156, 77, 194, 237, 52, 0, 500, 2, 104, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(371, 156, 77, 197, 242, 27, 0, 250, 2, 54, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(372, 156, 77, 198, 243, 53, 0, 250, 2, 106, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(373, 156, 77, 201, 246, 58, 0, 500, 2, 116, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(374, 156, 77, 202, 248, 38, 0, 250, 4, 152, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(375, 156, 77, 206, 252, 50, 0, 250, 2, 100, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(376, 156, 77, 225, 271, 112, 0, 1, 1, 112, 1, 5, 5.6, 2.5, 2.8, 2.5, 2.8, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(377, 156, 77, 227, 273, 196, 0, 1, 2, 392, 2, 5, 19.6, 2.5, 9.8, 2.5, 9.8, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(378, 156, 77, 221, 267, 381, 0, 1, 2, 762, 2, 5, 38.1, 2.5, 19.05, 2.5, 19.05, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(379, 156, 77, 252, 298, 400, 0, 500, 2, 800, 1000, 12, 96, 6, 48, 6, 48, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(380, 156, 77, 215, 261, 34, 0, 500, 2, 68, 1000, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(381, 156, 77, 217, 263, 62, 0, 1, 5, 310, 5, 5, 15.5, 2.5, 7.75, 2.5, 7.75, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(382, 156, 77, 323, 416, 15, 0, 50, 2, 30, 100, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(383, 156, 77, 336, 429, 215, 0, 500, 4, 860, 2000, 5, 43, 2.5, 21.5, 2.5, 21.5, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(384, 156, 77, 353, 446, 100, 0, 500, 1, 100, 500, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(385, 156, 77, 302, 395, 26, 0, 50, 2, 52, 100, 5, 2.6, 2.5, 1.3, 2.5, 1.3, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(386, 156, 77, 305, 398, 80, 0, 100, 5, 400, 500, 5, 20, 2.5, 10, 2.5, 10, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(387, 156, 77, 310, 403, 53, 0, 250, 1, 53, 250, 5, 2.65, 2.5, 1.325, 2.5, 1.325, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(388, 156, 77, 255, 301, 48, 0, 1, 5, 240, 5, 5, 12, 2.5, 6, 2.5, 6, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(389, 156, 77, 254, 300, 12, 0, 1, 2, 24, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(390, 156, 77, 259, 305, 190, 0, 500, 2, 380, 1000, 5, 19, 2.5, 9.5, 2.5, 9.5, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(391, 156, 77, 260, 306, 55, 0, 500, 2, 110, 1000, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(392, 156, 77, 263, 349, 7, 0, 50, 2, 14, 100, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(393, 156, 77, 264, 351, 41, 0, 50, 2, 82, 100, 5, 4.1, 2.5, 2.05, 2.5, 2.05, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(394, 156, 77, 265, 353, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(395, 156, 77, 266, 355, 8, 0, 50, 2, 16, 100, 5, 0.8, 2.5, 0.4, 2.5, 0.4, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(396, 156, 77, 267, 357, 75, 0, 250, 1, 75, 250, 5, 3.75, 2.5, 1.875, 2.5, 1.875, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(397, 156, 77, 268, 359, 80, 0, 250, 1, 80, 250, 5, 4, 2.5, 2, 2.5, 2, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(398, 156, 77, 271, 364, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(399, 156, 77, 272, 365, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(400, 156, 77, 274, 367, 108, 0, 50, 1, 108, 50, 5, 5.4, 2.5, 2.7, 2.5, 2.7, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(401, 156, 77, 277, 370, 68, 0, 50, 1, 68, 50, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(402, 156, 77, 290, 383, 73, 0, 50, 1, 73, 50, 5, 3.65, 2.5, 1.825, 2.5, 1.825, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(403, 156, 77, 802, 896, 80, 0, 100, 1, 80, 100, 5, 4, 2.5, 2, 2.5, 2, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(404, 156, 77, 418, 511, 43, 0, 500, 2, 86, 1000, 5, 4.3, 2.5, 2.15, 2.5, 2.15, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(405, 156, 77, 420, 513, 50, 0, 500, 1, 50, 500, 5, 2.5, 2.5, 1.25, 2.5, 1.25, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(406, 156, 77, 613, 706, 38, 0, 200, 2, 76, 400, 18, 13.68, 9, 6.84, 9, 6.84, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(408, 156, 77, 685, 778, 53, 0, 12, 1, 53, 12, 5, 2.65, 2.5, 1.325, 2.5, 1.325, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(409, 156, 77, 470, 563, 51, 0, 150, 3, 153, 450, 18, 27.54, 9, 13.77, 9, 13.77, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(410, 156, 77, 506, 599, 95, 0, 200, 2, 190, 400, 18, 34.2, 9, 17.1, 9, 17.1, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(411, 156, 77, 531, 624, 53, 0, 80, 1, 53, 80, 18, 9.54, 9, 4.77, 9, 4.77, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(412, 156, 77, 536, 629, 88, 0, 150, 2, 176, 300, 18, 31.68, 9, 15.84, 9, 15.84, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(413, 156, 77, 550, 643, 89, 0, 250, 1, 89, 250, 5, 4.45, 2.5, 2.225, 2.5, 2.225, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(414, 156, 77, 316, 409, 120, 0, 500, 2, 240, 1000, 5, 12, 2.5, 6, 2.5, 6, 0, 0, '2024-01-10 23:32:00', '2024-01-10 23:32:00'),
(415, 157, 79, 732, 825, 75, 0, 1, 2, 150, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(416, 157, 79, 258, 304, 30, 0, 500, 4, 120, 2000, 5, 6, 2.5, 3, 2.5, 3, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(417, 157, 79, 248, 294, 391, 0, 500, 1, 391, 500, 12, 46.92, 6, 23.46, 6, 23.46, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(418, 157, 79, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(419, 157, 79, 183, 225, 191, 0, 1, 1, 191, 1, 5, 9.55, 2.5, 4.775, 2.5, 4.775, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(420, 157, 79, 194, 237, 52, 0, 500, 1, 52, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(421, 157, 79, 870, 964, 54, 0, 25, 1, 54, 25, 5, 2.7, 2.5, 1.35, 2.5, 1.35, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(422, 157, 79, 305, 398, 88, 0, 100, 1, 88, 100, 5, 4.4, 2.5, 2.2, 2.5, 2.2, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(423, 157, 79, 301, 394, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-01-11 16:49:21', '2024-01-11 16:49:21'),
(424, 159, 79, 732, 825, 75, 0, 1, 2, 150, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(425, 159, 79, 258, 304, 30, 0, 500, 4, 120, 2000, 5, 6, 2.5, 3, 2.5, 3, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(426, 159, 79, 248, 294, 391, 0, 500, 1, 391, 500, 12, 46.92, 6, 23.46, 6, 23.46, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(427, 159, 79, 183, 225, 191, 0, 1, 1, 191, 1, 5, 9.55, 2.5, 4.775, 2.5, 4.775, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(428, 159, 79, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(429, 159, 79, 194, 237, 52, 0, 500, 1, 52, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(430, 159, 79, 870, 964, 54, 0, 25, 1, 54, 25, 5, 2.7, 2.5, 1.35, 2.5, 1.35, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(431, 159, 79, 305, 398, 88, 0, 100, 1, 88, 100, 5, 4.4, 2.5, 2.2, 2.5, 2.2, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(432, 159, 79, 301, 394, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-01-12 19:13:41', '2024-01-12 19:13:41'),
(433, 160, 82, 182, 224, 158, 0, 1, 1, 158, 1, 5, 7.9, 2.5, 3.95, 2.5, 3.95, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(434, 160, 82, 183, 225, 191, 0, 1, 1, 191, 1, 5, 9.55, 2.5, 4.775, 2.5, 4.775, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(435, 160, 82, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(436, 160, 82, 194, 237, 52, 0, 500, 1, 52, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(437, 160, 82, 197, 242, 27, 0, 250, 1, 27, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(438, 160, 82, 198, 243, 53, 0, 250, 1, 53, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(439, 160, 82, 199, 244, 35, 0, 250, 1, 35, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(440, 160, 82, 200, 245, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(441, 160, 82, 204, 250, 52, 0, 250, 1, 52, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(442, 160, 82, 205, 251, 47, 0, 250, 1, 47, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(443, 160, 82, 224, 270, 113, 0, 1, 1, 113, 1, 5, 5.65, 2.5, 2.825, 2.5, 2.825, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(444, 160, 82, 234, 280, 242, 0, 500, 1, 242, 500, 5, 12.1, 2.5, 6.05, 2.5, 6.05, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(445, 160, 82, 246, 292, 90, 0, 100, 1, 90, 100, 12, 10.8, 6, 5.4, 6, 5.4, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(446, 160, 82, 211, 257, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(447, 160, 82, 215, 261, 34, 0, 500, 1, 34, 500, 5, 1.7, 2.5, 0.85, 2.5, 0.85, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(448, 160, 82, 217, 263, 62, 0, 1, 1, 62, 1, 5, 3.1, 2.5, 1.55, 2.5, 1.55, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(449, 160, 82, 218, 264, 37, 0, 500, 1, 37, 500, 5, 1.85, 2.5, 0.925, 2.5, 0.925, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(450, 160, 82, 311, 404, 16, 0, 50, 2, 32, 100, 5, 1.6, 2.5, 0.8, 2.5, 0.8, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(451, 160, 82, 312, 405, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(452, 160, 82, 313, 406, 19, 0, 50, 1, 19, 50, 5, 0.95, 2.5, 0.475, 2.5, 0.475, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(453, 160, 82, 315, 408, 205, 0, 500, 1, 205, 500, 5, 10.25, 2.5, 5.125, 2.5, 5.125, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(454, 160, 82, 316, 409, 120, 0, 500, 1, 120, 500, 5, 6, 2.5, 3, 2.5, 3, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(455, 160, 82, 318, 411, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(456, 160, 82, 320, 413, 20, 0, 50, 1, 20, 50, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(457, 160, 82, 322, 415, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(458, 160, 82, 323, 416, 15, 0, 50, 1, 15, 50, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(459, 160, 82, 325, 418, 180, 0, 500, 1, 180, 500, 5, 9, 2.5, 4.5, 2.5, 4.5, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(460, 160, 82, 327, 420, 45, 0, 50, 1, 45, 50, 5, 2.25, 2.5, 1.125, 2.5, 1.125, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(461, 160, 82, 326, 419, 23, 0, 50, 1, 23, 50, 5, 1.15, 2.5, 0.575, 2.5, 0.575, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(462, 160, 82, 329, 422, 180, 0, 500, 1, 180, 500, 5, 9, 2.5, 4.5, 2.5, 4.5, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(463, 160, 82, 330, 423, 20, 0, 50, 1, 20, 50, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(464, 160, 82, 340, 433, 24, 0, 50, 1, 24, 50, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(465, 160, 82, 339, 432, 39, 0, 50, 1, 39, 50, 5, 1.95, 2.5, 0.975, 2.5, 0.975, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(466, 160, 82, 343, 436, 27, 0, 50, 1, 27, 50, 5, 1.35, 2.5, 0.675, 2.5, 0.675, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(467, 160, 82, 302, 395, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(468, 160, 82, 305, 398, 88, 0, 100, 1, 88, 100, 5, 4.4, 2.5, 2.2, 2.5, 2.2, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(469, 160, 82, 308, 401, 49, 0, 50, 1, 49, 50, 12, 5.88, 6, 2.94, 6, 2.94, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(470, 160, 82, 309, 402, 95, 0, 50, 1, 95, 50, 12, 11.4, 6, 5.7, 6, 5.7, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(471, 160, 82, 253, 299, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(472, 160, 82, 258, 304, 30, 0, 500, 1, 30, 500, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(473, 160, 82, 260, 306, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(474, 160, 82, 873, 967, 70, 0, 500, 1, 70, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(475, 160, 82, 262, 348, 14, 0, 50, 1, 14, 50, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(476, 160, 82, 263, 349, 7, 0, 50, 2, 14, 100, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(477, 160, 82, 264, 351, 41, 0, 50, 2, 82, 100, 5, 4.1, 2.5, 2.05, 2.5, 2.05, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(478, 160, 82, 265, 353, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(479, 160, 82, 266, 355, 8, 0, 50, 1, 8, 50, 5, 0.4, 2.5, 0.2, 2.5, 0.2, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(480, 160, 82, 267, 357, 75, 0, 250, 2, 150, 500, 5, 7.5, 2.5, 3.75, 2.5, 3.75, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(481, 160, 82, 358, 451, 213, 0, 250, 1, 213, 250, 5, 10.65, 2.5, 5.325, 2.5, 5.325, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(482, 160, 82, 620, 713, 55, 0, 220, 1, 55, 220, 18, 9.9, 9, 4.95, 9, 4.95, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(483, 160, 82, 428, 521, 58, 0, 200, 1, 58, 200, 5, 2.9, 2.5, 1.45, 2.5, 1.45, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(484, 160, 82, 429, 522, 10, 0, 45, 1, 10, 45, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(485, 160, 82, 430, 523, 10, 0, 20, 1, 10, 20, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(486, 160, 82, 431, 524, 10, 0, 45, 1, 10, 45, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(487, 160, 82, 432, 525, 5, 0, 14, 1, 5, 14, 18, 0.9, 9, 0.45, 9, 0.45, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(488, 160, 82, 433, 526, 10, 0, 78, 1, 10, 78, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35');
INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `product_price_id`, `price`, `offer_price`, `weight`, `quantity`, `amount`, `total_weight`, `gst_percent`, `gst_amount`, `sgst_percent`, `sgst_amount`, `cgst_percent`, `cgst_amount`, `igst_percent`, `igst_amount`, `created_at`, `updated_at`) VALUES
(489, 160, 82, 434, 527, 10, 0, 60, 1, 10, 60, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(490, 160, 82, 682, 775, 15, 0, 0, 1, 15, 0, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(491, 160, 82, 683, 776, 45, 0, 98, 1, 45, 98, 5, 2.25, 2.5, 1.125, 2.5, 1.125, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(492, 160, 82, 685, 778, 53, 0, 12, 1, 53, 12, 5, 2.65, 2.5, 1.325, 2.5, 1.325, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(493, 160, 82, 692, 785, 2, 0, 0, 2, 4, 0, 18, 0.72, 9, 0.36, 9, 0.36, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(494, 160, 82, 561, 654, 25, 0, 250, 1, 25, 250, 18, 4.5, 9, 2.25, 9, 2.25, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(495, 160, 82, 564, 657, 25, 0, 300, 1, 25, 300, 18, 4.5, 9, 2.25, 9, 2.25, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(496, 160, 82, 567, 660, 34, 0, 250, 1, 34, 250, 18, 6.12, 9, 3.06, 9, 3.06, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(497, 160, 82, 452, 545, 55, 0, 100, 1, 55, 100, 18, 9.9, 9, 4.95, 9, 4.95, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(498, 160, 82, 498, 591, 116, 0, 140, 1, 116, 140, 18, 20.88, 9, 10.44, 9, 10.44, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(499, 160, 82, 505, 598, 66, 0, 100, 1, 66, 100, 18, 11.88, 9, 5.94, 9, 5.94, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(500, 160, 82, 546, 639, 52, 0, 90, 1, 52, 90, 18, 9.36, 9, 4.68, 9, 4.68, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(501, 160, 82, 550, 643, 89, 0, 250, 1, 89, 250, 5, 4.45, 2.5, 2.225, 2.5, 2.225, 0, 0, '2024-01-18 10:59:35', '2024-01-18 10:59:35'),
(502, 155, 69, 269, 360, 107, 0, 250, 1, 107, 250, 5, 5.35, 2.5, 2.675, 2.5, 2.675, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(503, 155, 69, 264, 351, 41, 0, 50, 1, 41, 50, 5, 2.05, 2.5, 1.025, 2.5, 1.025, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(504, 155, 69, 263, 349, 7, 0, 50, 2, 14, 100, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(505, 155, 69, 295, 388, 50, 0, 50, 1, 50, 50, 5, 2.5, 2.5, 1.25, 2.5, 1.25, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(506, 155, 69, 803, 897, 40, 0, 50, 1, 40, 50, 5, 2, 2.5, 1, 2.5, 1, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(507, 155, 69, 335, 428, 20, 0, 50, 1, 20, 50, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(508, 155, 69, 337, 430, 22, 0, 50, 1, 22, 50, 5, 1.1, 2.5, 0.55, 2.5, 0.55, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(509, 155, 69, 338, 431, 14, 0, 50, 2, 28, 100, 5, 1.4, 2.5, 0.7, 2.5, 0.7, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(510, 155, 69, 348, 441, 45, 0, 50, 1, 45, 50, 5, 2.25, 2.5, 1.125, 2.5, 1.125, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(511, 155, 69, 352, 445, 20, 0, 50, 2, 40, 100, 5, 2, 2.5, 1, 2.5, 1, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(512, 155, 69, 354, 447, 10, 0, 50, 1, 10, 50, 5, 0.5, 2.5, 0.25, 2.5, 0.25, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(513, 155, 69, 755, 849, 28, 0, 50, 1, 28, 50, 5, 1.4, 2.5, 0.7, 2.5, 0.7, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(514, 155, 69, 618, 711, 4, 0, 19, 5, 20, 95, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(515, 155, 69, 619, 712, 4, 0, 19, 5, 20, 95, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(516, 155, 69, 623, 716, 4, 0, 19, 5, 20, 95, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(517, 155, 69, 634, 727, 73, 0, 45, 1, 73, 45, 18, 13.14, 9, 6.57, 9, 6.57, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(518, 155, 69, 652, 745, 25, 0, 0, 1, 25, 0, 18, 4.5, 9, 2.25, 9, 2.25, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(519, 155, 69, 224, 270, 113, 0, 1, 1, 113, 1, 5, 5.65, 2.5, 2.825, 2.5, 2.825, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(520, 155, 69, 250, 296, 80, 0, 100, 1, 80, 100, 12, 9.6, 6, 4.8, 6, 4.8, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(521, 155, 69, 253, 299, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(522, 155, 69, 255, 301, 48, 0, 1, 1, 48, 1, 5, 2.4, 2.5, 1.2, 2.5, 1.2, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(523, 155, 69, 260, 306, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(524, 155, 69, 872, 966, 35, 0, 250, 1, 35, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(525, 155, 69, 273, 366, 47, 0, 250, 1, 47, 250, 5, 2.35, 2.5, 1.175, 2.5, 1.175, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(526, 155, 69, 582, 675, 145, 0, 1000, 1, 145, 1000, 18, 26.1, 9, 13.05, 9, 13.05, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(527, 155, 69, 592, 685, 63, 0, 500, 1, 63, 500, 18, 11.34, 9, 5.67, 9, 5.67, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(528, 155, 69, 598, 691, 10, 0, 135, 3, 30, 405, 18, 5.4, 9, 2.7, 9, 2.7, 0, 0, '2024-01-30 09:52:23', '2024-01-30 09:52:23'),
(529, 162, 69, 262, 348, 14, 0, 50, 3, 42, 150, 5, 2.1, 2.5, 1.05, 2.5, 1.05, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(530, 162, 69, 263, 349, 7, 0, 50, 1, 7, 50, 5, 0.35, 2.5, 0.175, 2.5, 0.175, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(531, 162, 69, 264, 351, 36, 0, 50, 4, 144, 200, 5, 7.2, 2.5, 3.6, 2.5, 3.6, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(532, 162, 69, 265, 353, 25, 0, 50, 3, 75, 150, 5, 3.75, 2.5, 1.875, 2.5, 1.875, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(533, 162, 69, 266, 355, 8, 0, 50, 3, 24, 150, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(534, 162, 69, 267, 357, 75, 0, 250, 2, 150, 500, 5, 7.5, 2.5, 3.75, 2.5, 3.75, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(535, 162, 69, 268, 359, 80, 0, 250, 2, 160, 500, 5, 8, 2.5, 4, 2.5, 4, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(536, 162, 69, 269, 360, 107, 0, 250, 1, 107, 250, 5, 5.35, 2.5, 2.675, 2.5, 2.675, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(537, 162, 69, 271, 364, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(538, 162, 69, 272, 365, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(539, 162, 69, 273, 366, 47, 0, 250, 4, 188, 1000, 5, 9.4, 2.5, 4.7, 2.5, 4.7, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(540, 162, 69, 279, 372, 80, 0, 50, 1, 80, 50, 5, 4, 2.5, 2, 2.5, 2, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(541, 162, 69, 281, 374, 15, 0, 50, 1, 15, 50, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(542, 162, 69, 288, 381, 58, 0, 1, 2, 116, 2, 5, 5.8, 2.5, 2.9, 2.5, 2.9, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(543, 162, 69, 804, 898, 200, 0, 250, 1, 200, 250, 5, 10, 2.5, 5, 2.5, 5, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(544, 162, 69, 188, 230, 157, 0, 1, 1, 157, 1, 5, 7.85, 2.5, 3.925, 2.5, 3.925, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(545, 162, 69, 190, 232, 47, 0, 250, 2, 94, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(546, 162, 69, 198, 243, 53, 0, 250, 1, 53, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(547, 162, 69, 202, 248, 38, 0, 250, 1, 38, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(548, 162, 69, 203, 249, 36, 0, 250, 1, 36, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(549, 162, 69, 301, 394, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(550, 162, 69, 310, 403, 42, 0, 250, 1, 42, 250, 5, 2.1, 2.5, 1.05, 2.5, 1.05, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(551, 162, 69, 491, 584, 49, 0, 12, 1, 49, 12, 18, 8.82, 9, 4.41, 9, 4.41, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(552, 162, 69, 527, 620, 2, 0, 6, 10, 20, 60, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-02-02 16:58:49', '2024-02-02 16:58:49'),
(553, 161, 77, 163, 169, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(554, 161, 77, 164, 171, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(555, 161, 77, 748, 842, 260, 0, 5, 3, 780, 15, 5, 39, 2.5, 19.5, 2.5, 19.5, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(556, 161, 77, 732, 825, 77, 0, 1, 5, 385, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(557, 161, 77, 169, 181, 120, 0, 1, 4, 480, 4, 5, 24, 2.5, 12, 2.5, 12, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(558, 161, 77, 183, 225, 191, 0, 1, 3, 573, 3, 5, 28.65, 2.5, 14.325, 2.5, 14.325, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(559, 161, 77, 201, 246, 58, 0, 500, 4, 232, 2000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(560, 161, 77, 202, 248, 38, 0, 250, 2, 76, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(561, 161, 77, 203, 249, 36, 0, 250, 1, 36, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(562, 161, 77, 205, 251, 47, 0, 250, 1, 47, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(563, 161, 77, 206, 252, 50, 0, 250, 1, 50, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(564, 161, 77, 208, 254, 33, 0, 250, 2, 66, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(565, 161, 77, 221, 267, 390, 0, 1, 1, 390, 1, 5, 19.5, 2.5, 9.75, 2.5, 9.75, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(566, 161, 77, 224, 270, 113, 0, 1, 2, 226, 2, 5, 11.3, 2.5, 5.65, 2.5, 5.65, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(567, 161, 77, 227, 273, 196, 0, 1, 1, 196, 1, 5, 9.8, 2.5, 4.9, 2.5, 4.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(568, 161, 77, 248, 294, 391, 0, 500, 10, 3910, 5000, 12, 469.2, 6, 234.6, 6, 234.6, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(569, 161, 77, 215, 261, 34, 0, 500, 2, 68, 1000, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(570, 161, 77, 217, 263, 62, 0, 1, 5, 310, 5, 5, 15.5, 2.5, 7.75, 2.5, 7.75, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(571, 161, 77, 218, 264, 37, 0, 500, 4, 148, 2000, 5, 7.4, 2.5, 3.7, 2.5, 3.7, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(572, 161, 77, 336, 429, 200, 0, 500, 1, 200, 500, 5, 10, 2.5, 5, 2.5, 5, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(573, 161, 77, 344, 437, 13, 0, 50, 4, 52, 200, 5, 2.6, 2.5, 1.3, 2.5, 1.3, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(574, 161, 77, 354, 447, 10, 0, 50, 2, 20, 100, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(575, 161, 77, 316, 409, 120, 0, 500, 1, 120, 500, 5, 6, 2.5, 3, 2.5, 3, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(576, 161, 77, 301, 394, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(577, 161, 77, 305, 398, 75, 0, 100, 2, 150, 200, 5, 7.5, 2.5, 3.75, 2.5, 3.75, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(578, 161, 77, 306, 399, 40, 0, 50, 1, 40, 50, 5, 2, 2.5, 1, 2.5, 1, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(579, 161, 77, 254, 300, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(580, 161, 77, 257, 303, 42, 0, 100, 3, 126, 300, 5, 6.3, 2.5, 3.15, 2.5, 3.15, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(581, 161, 77, 255, 301, 48, 0, 1, 3, 144, 3, 5, 7.2, 2.5, 3.6, 2.5, 3.6, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(582, 161, 77, 260, 306, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(583, 161, 77, 873, 967, 70, 0, 500, 2, 140, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(584, 161, 77, 264, 351, 36, 0, 50, 1, 36, 50, 5, 1.8, 2.5, 0.9, 2.5, 0.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(585, 161, 77, 266, 355, 8, 0, 50, 1, 8, 50, 5, 0.4, 2.5, 0.2, 2.5, 0.2, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(586, 161, 77, 267, 357, 75, 0, 250, 1, 75, 250, 5, 3.75, 2.5, 1.875, 2.5, 1.875, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(587, 161, 77, 271, 364, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(588, 161, 77, 272, 365, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(589, 161, 77, 274, 367, 103, 0, 50, 1, 103, 50, 5, 5.15, 2.5, 2.575, 2.5, 2.575, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(590, 161, 77, 277, 370, 68, 0, 50, 1, 68, 50, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(591, 161, 77, 293, 386, 20, 0, 10, 1, 20, 10, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(592, 161, 77, 751, 845, 15, 0, 100, 1, 15, 100, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(593, 161, 77, 802, 896, 80, 0, 100, 1, 80, 100, 5, 4, 2.5, 2, 2.5, 2, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(594, 161, 77, 399, 492, 26, 0, 200, 1, 26, 200, 18, 4.68, 9, 2.34, 9, 2.34, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(595, 161, 77, 739, 833, 125, 0, 175, 2, 250, 350, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(596, 161, 77, 361, 454, 234, 0, 250, 2, 468, 500, 5, 23.4, 2.5, 11.7, 2.5, 11.7, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(597, 161, 77, 416, 509, 58, 0, 500, 2, 116, 1000, 5, 5.8, 2.5, 2.9, 2.5, 2.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(598, 161, 77, 415, 508, 39, 0, 500, 2, 78, 1000, 5, 3.9, 2.5, 1.95, 2.5, 1.95, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(599, 161, 77, 418, 511, 43, 0, 500, 2, 86, 1000, 5, 4.3, 2.5, 2.15, 2.5, 2.15, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(600, 161, 77, 420, 513, 50, 0, 500, 2, 100, 1000, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(601, 161, 77, 736, 830, 35, 0, 200, 1, 35, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(602, 161, 77, 633, 726, 75, 0, 45, 5, 375, 225, 18, 67.5, 9, 33.75, 9, 33.75, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(603, 161, 77, 635, 728, 116, 0, 400, 1, 116, 400, 18, 20.88, 9, 10.44, 9, 10.44, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(604, 161, 77, 649, 742, 90, 0, 0, 1, 90, 0, 18, 16.2, 9, 8.1, 9, 8.1, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(605, 161, 77, 657, 750, 9, 0, 0, 3, 27, 0, 18, 4.86, 9, 2.43, 9, 2.43, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(606, 161, 77, 660, 753, 10, 0, 0, 1, 10, 0, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(607, 161, 77, 683, 776, 45, 0, 98, 4, 180, 392, 5, 9, 2.5, 4.5, 2.5, 4.5, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(608, 161, 77, 685, 778, 53, 0, 12, 4, 212, 48, 5, 10.6, 2.5, 5.3, 2.5, 5.3, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(609, 161, 77, 693, 786, 10, 0, 0, 2, 20, 0, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(610, 161, 77, 567, 660, 34, 0, 250, 5, 170, 1250, 18, 30.6, 9, 15.3, 9, 15.3, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(611, 161, 77, 603, 696, 121, 0, 500, 4, 484, 2000, 18, 87.12, 9, 43.56, 9, 43.56, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(612, 161, 77, 611, 704, 105, 0, 500, 2, 210, 1000, 18, 37.8, 9, 18.9, 9, 18.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(613, 161, 77, 468, 561, 52, 0, 125, 5, 260, 625, 18, 46.8, 9, 23.4, 9, 23.4, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(614, 161, 77, 485, 578, 226, 0, 450, 1, 226, 450, 18, 40.68, 9, 20.34, 9, 20.34, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(615, 161, 77, 493, 586, 106, 0, 100, 1, 106, 100, 18, 19.08, 9, 9.54, 9, 9.54, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(616, 161, 77, 502, 595, 111, 0, 150, 1, 111, 150, 18, 19.98, 9, 9.99, 9, 9.99, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(617, 161, 77, 494, 587, 132, 0, 100, 1, 132, 100, 18, 23.76, 9, 11.88, 9, 11.88, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(618, 161, 77, 513, 606, 55, 0, 100, 2, 110, 200, 18, 19.8, 9, 9.9, 9, 9.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(619, 161, 77, 516, 609, 36, 0, 40, 1, 36, 40, 5, 1.8, 2.5, 0.9, 2.5, 0.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(620, 161, 77, 508, 601, 133, 0, 200, 2, 266, 400, 18, 47.88, 9, 23.94, 9, 23.94, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(621, 161, 77, 531, 624, 53, 0, 80, 5, 265, 400, 18, 47.7, 9, 23.85, 9, 23.85, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(622, 161, 77, 536, 629, 110, 0, 150, 4, 440, 600, 18, 79.2, 9, 39.6, 9, 39.6, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(623, 161, 77, 806, 900, 92, 0, 150, 1, 92, 150, 18, 16.56, 9, 8.28, 9, 8.28, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(624, 161, 77, 848, 942, 247, 0, 200, 1, 247, 200, 18, 44.46, 9, 22.23, 9, 22.23, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(625, 161, 77, 879, 973, 154, 0, 250, 1, 154, 250, 5, 7.7, 2.5, 3.85, 2.5, 3.85, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(626, 161, 77, 373, 466, 286, 0, 500, 2, 572, 1000, 18, 102.96, 9, 51.48, 9, 51.48, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(627, 161, 77, 394, 487, 145, 0, 100, 1, 145, 100, 5, 7.25, 2.5, 3.625, 2.5, 3.625, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(628, 161, 77, 587, 680, 115, 0, 500, 4, 460, 2000, 18, 82.8, 9, 41.4, 9, 41.4, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(629, 161, 77, 452, 545, 55, 0, 100, 2, 110, 200, 18, 19.8, 9, 9.9, 9, 9.9, 0, 0, '2024-02-04 18:43:52', '2024-02-04 18:43:52'),
(630, 163, 65, 732, 825, 77, 0, 1, 1, 77, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(631, 163, 65, 734, 827, 44, 0, 1, 3, 132, 3, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(632, 163, 65, 741, 835, 175, 0, 1, 1, 175, 1, 5, 8.75, 2.5, 4.375, 2.5, 4.375, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(633, 163, 65, 742, 836, 62, 0, 1, 1, 62, 1, 5, 3.1, 2.5, 1.55, 2.5, 1.55, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(634, 163, 65, 200, 245, 32, 0, 250, 2, 64, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(635, 163, 65, 202, 248, 38, 0, 250, 1, 38, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(636, 163, 65, 218, 264, 37, 0, 500, 1, 37, 500, 5, 1.85, 2.5, 0.925, 2.5, 0.925, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(637, 163, 65, 627, 720, 115, 0, 250, 1, 115, 250, 12, 13.8, 6, 6.9, 6, 6.9, 0, 0, '2024-02-05 17:47:28', '2024-02-05 17:47:28'),
(638, 165, 87, 185, 227, 73, 0, 500, 2, 146, 1000, 5, 7.3, 2.5, 3.65, 2.5, 3.65, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(639, 165, 87, 194, 237, 45, 0, 500, 1, 45, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(640, 165, 87, 203, 249, 36, 0, 250, 1, 36, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(641, 165, 87, 186, 228, 100, 0, 500, 1, 100, 500, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(642, 165, 87, 225, 271, 112, 0, 1, 1, 112, 1, 5, 5.6, 2.5, 2.8, 2.5, 2.8, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(643, 165, 87, 869, 963, 96, 0, 500, 1, 96, 500, 5, 4.8, 2.5, 2.4, 2.5, 2.4, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(644, 165, 87, 217, 263, 62, 0, 1, 1, 62, 1, 5, 3.1, 2.5, 1.55, 2.5, 1.55, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(645, 165, 87, 313, 406, 19, 0, 50, 1, 19, 50, 5, 0.95, 2.5, 0.475, 2.5, 0.475, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(646, 165, 87, 314, 407, 22, 0, 50, 2, 44, 100, 5, 2.2, 2.5, 1.1, 2.5, 1.1, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(647, 165, 87, 317, 410, 15, 0, 50, 1, 15, 50, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(648, 165, 87, 321, 414, 23, 0, 50, 1, 23, 50, 5, 1.15, 2.5, 0.575, 2.5, 0.575, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(649, 165, 87, 344, 437, 13, 0, 50, 2, 26, 100, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(650, 165, 87, 352, 445, 20, 0, 50, 3, 60, 150, 5, 3, 2.5, 1.5, 2.5, 1.5, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(651, 165, 87, 808, 902, 27, 0, 50, 1, 27, 50, 5, 1.35, 2.5, 0.675, 2.5, 0.675, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(652, 165, 87, 257, 303, 42, 0, 100, 1, 42, 100, 5, 2.1, 2.5, 1.05, 2.5, 1.05, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(653, 165, 87, 265, 353, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(654, 165, 87, 295, 388, 50, 0, 50, 1, 50, 50, 5, 2.5, 2.5, 1.25, 2.5, 1.25, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(655, 165, 87, 803, 897, 40, 0, 50, 1, 40, 50, 5, 2, 2.5, 1, 2.5, 1, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(656, 165, 87, 399, 492, 26, 0, 200, 1, 26, 200, 18, 4.68, 9, 2.34, 9, 2.34, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(657, 165, 87, 364, 457, 76, 0, 250, 1, 76, 250, 5, 3.8, 2.5, 1.9, 2.5, 1.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(658, 165, 87, 378, 471, 5, 0, 15, 4, 20, 60, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(659, 165, 87, 384, 477, 10, 0, 9, 2, 20, 18, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(660, 165, 87, 407, 500, 54, 0, 280, 1, 54, 280, 12, 6.48, 6, 3.24, 6, 3.24, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(661, 165, 87, 416, 509, 58, 0, 500, 1, 58, 500, 5, 2.9, 2.5, 1.45, 2.5, 1.45, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(662, 165, 87, 419, 512, 21, 0, 180, 1, 21, 180, 5, 1.05, 2.5, 0.525, 2.5, 0.525, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(663, 165, 87, 417, 510, 20, 0, 180, 1, 20, 180, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(664, 165, 87, 433, 526, 10, 0, 78, 1, 10, 78, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(665, 165, 87, 444, 537, 5, 0, 30, 2, 10, 60, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(666, 165, 87, 778, 872, 10, 0, 63, 1, 10, 63, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(667, 165, 87, 785, 879, 5, 0, 13, 2, 10, 26, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(668, 165, 87, 787, 881, 10, 0, 69, 1, 10, 69, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(669, 165, 87, 561, 654, 25, 0, 250, 1, 25, 250, 18, 4.5, 9, 2.25, 9, 2.25, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(670, 165, 87, 601, 694, 15, 0, 115, 2, 30, 230, 18, 5.4, 9, 2.7, 9, 2.7, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(671, 165, 87, 572, 665, 55, 0, 500, 1, 55, 500, 18, 9.9, 9, 4.95, 9, 4.95, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(672, 165, 87, 509, 602, 10, 0, 20, 1, 10, 20, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-09 12:05:21', '2024-02-09 12:05:21'),
(673, 171, 94, 820, 914, 30, 0, 250, 1, 30, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-21 13:16:39', '2024-02-21 13:16:39'),
(674, 172, 69, 183, 225, 191, 0, 1, 1, 191, 1, 5, 9.55, 2.5, 4.775, 2.5, 4.775, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(675, 172, 69, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(676, 172, 69, 194, 237, 45, 0, 500, 1, 45, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(677, 172, 69, 202, 248, 38, 0, 250, 4, 152, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(678, 172, 69, 264, 351, 36, 0, 50, 1, 36, 50, 5, 1.8, 2.5, 0.9, 2.5, 0.9, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(679, 172, 69, 265, 353, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(680, 172, 69, 263, 349, 7, 0, 50, 4, 28, 200, 5, 1.4, 2.5, 0.7, 2.5, 0.7, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(681, 172, 69, 212, 258, 30, 0, 500, 1, 30, 500, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(682, 172, 69, 216, 262, 33, 0, 500, 1, 33, 500, 5, 1.65, 2.5, 0.825, 2.5, 0.825, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(683, 172, 69, 311, 404, 16, 0, 50, 1, 16, 50, 5, 0.8, 2.5, 0.4, 2.5, 0.4, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(684, 172, 69, 318, 411, 26, 0, 50, 1, 26, 50, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(685, 172, 69, 324, 417, 34, 0, 500, 1, 34, 500, 5, 1.7, 2.5, 0.85, 2.5, 0.85, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(686, 172, 69, 337, 430, 22, 0, 50, 1, 22, 50, 5, 1.1, 2.5, 0.55, 2.5, 0.55, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(687, 172, 69, 338, 431, 14, 0, 50, 1, 14, 50, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(688, 172, 69, 224, 270, 110, 0, 1, 1, 110, 1, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-02-22 12:33:42', '2024-02-22 12:33:42'),
(689, 174, 87, 167, 178, 127, 0, 2, 2, 254, 4, 5, 12.7, 2.5, 6.35, 2.5, 6.35, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(690, 174, 87, 187, 229, 66, 0, 500, 1, 66, 500, 5, 3.3, 2.5, 1.65, 2.5, 1.65, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(691, 174, 87, 344, 437, 13, 0, 50, 2, 26, 100, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(692, 174, 87, 264, 351, 36, 0, 50, 1, 36, 50, 5, 1.8, 2.5, 0.9, 2.5, 0.9, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(693, 174, 87, 378, 471, 5, 0, 15, 2, 10, 30, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(694, 174, 87, 377, 470, 5, 0, 20, 2, 10, 40, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(695, 174, 87, 383, 476, 5, 0, 5, 2, 10, 9, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(696, 174, 87, 444, 537, 5, 0, 30, 2, 10, 60, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(697, 174, 87, 785, 879, 5, 0, 13, 2, 10, 26, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(698, 174, 87, 517, 610, 47, 0, 100, 1, 47, 100, 18, 8.46, 9, 4.23, 9, 4.23, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(699, 174, 87, 419, 512, 21, 0, 180, 1, 21, 180, 5, 1.05, 2.5, 0.525, 2.5, 0.525, 0, 0, '2024-02-22 16:04:22', '2024-02-22 16:04:22'),
(700, 176, 87, 345, 438, 125, 0, 500, 1, 125, 500, 5, 6.25, 2.5, 3.125, 2.5, 3.125, 0, 0, '2024-02-22 21:16:14', '2024-02-22 21:16:14'),
(701, 175, 96, 305, 398, 70, 0, 100, 2, 140, 200, 5, 7, 2.5, 3.5, 2.5, 3.5, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(702, 175, 96, 224, 270, 110, 0, 1, 5, 550, 5, 5, 27.5, 2.5, 13.75, 2.5, 13.75, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(703, 175, 96, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(704, 175, 96, 183, 225, 187, 0, 1, 2, 374, 2, 5, 18.7, 2.5, 9.35, 2.5, 9.35, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(705, 175, 96, 184, 226, 126, 0, 1, 1, 126, 1, 5, 6.3, 2.5, 3.15, 2.5, 3.15, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(706, 175, 96, 169, 181, 115, 0, 1, 1, 115, 1, 5, 5.75, 2.5, 2.875, 2.5, 2.875, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(707, 175, 96, 194, 237, 45, 0, 500, 1, 45, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(708, 175, 96, 197, 242, 27, 0, 250, 1, 27, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(709, 175, 96, 198, 243, 53, 0, 250, 2, 106, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(710, 175, 96, 211, 257, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(711, 175, 96, 218, 264, 37, 0, 500, 1, 37, 500, 5, 1.85, 2.5, 0.925, 2.5, 0.925, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(712, 175, 96, 331, 424, 10, 0, 50, 3, 30, 150, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(713, 175, 96, 335, 428, 20, 0, 50, 2, 40, 100, 5, 2, 2.5, 1, 2.5, 1, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(714, 175, 96, 338, 431, 14, 0, 50, 2, 28, 100, 5, 1.4, 2.5, 0.7, 2.5, 0.7, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(715, 175, 96, 340, 433, 24, 0, 50, 1, 24, 50, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(716, 175, 96, 337, 430, 22, 0, 50, 2, 44, 100, 5, 2.2, 2.5, 1.1, 2.5, 1.1, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(717, 175, 96, 347, 440, 24, 0, 50, 1, 24, 50, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(718, 175, 96, 352, 445, 20, 0, 50, 2, 40, 100, 5, 2, 2.5, 1, 2.5, 1, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(719, 175, 96, 274, 367, 103, 0, 50, 1, 103, 50, 5, 5.15, 2.5, 2.575, 2.5, 2.575, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(720, 175, 96, 752, 846, 72, 0, 100, 2, 144, 200, 5, 7.2, 2.5, 3.6, 2.5, 3.6, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(721, 175, 96, 753, 847, 50, 0, 100, 2, 100, 200, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(722, 175, 96, 286, 379, 64, 0, 50, 1, 64, 50, 5, 3.2, 2.5, 1.6, 2.5, 1.6, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(723, 175, 96, 754, 848, 15, 0, 100, 2, 30, 200, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(724, 175, 96, 407, 500, 54, 0, 280, 1, 54, 280, 12, 6.48, 6, 3.24, 6, 3.24, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(725, 175, 96, 424, 517, 100, 0, 250, 1, 100, 250, 12, 12, 6, 6, 6, 6, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(726, 175, 96, 804, 898, 200, 0, 250, 1, 200, 250, 5, 10, 2.5, 5, 2.5, 5, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(727, 175, 96, 363, 456, 205, 0, 250, 1, 205, 250, 5, 10.25, 2.5, 5.125, 2.5, 5.125, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(728, 175, 96, 267, 357, 65, 0, 250, 1, 65, 250, 5, 3.25, 2.5, 1.625, 2.5, 1.625, 0, 0, '2024-02-23 10:30:32', '2024-02-23 10:30:32'),
(729, 178, 99, 222, 268, 189, 0, 500, 2, 378, 1000, 5, 18.9, 2.5, 9.45, 2.5, 9.45, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(730, 178, 99, 230, 276, 246, 0, 1, 1, 246, 1, 5, 12.3, 2.5, 6.15, 2.5, 6.15, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(731, 178, 99, 868, 962, 192, 0, 1, 1, 192, 1, 5, 9.6, 2.5, 4.8, 2.5, 4.8, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(732, 178, 99, 197, 242, 27, 0, 250, 1, 27, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(733, 178, 99, 198, 243, 53, 0, 250, 2, 106, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(734, 178, 99, 199, 244, 31, 0, 250, 2, 62, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(735, 178, 99, 200, 245, 32, 0, 250, 1, 32, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(736, 178, 99, 202, 248, 38, 0, 250, 1, 38, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-28 16:06:13', '2024-02-28 16:06:13'),
(737, 179, 101, 355, 448, 10, 0, 13, 3, 30, 39, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-02-29 00:15:43', '2024-02-29 00:15:43'),
(738, 180, 101, 224, 270, 110, 0, 1, 1, 110, 1, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-02-29 23:02:22', '2024-02-29 23:02:22'),
(739, 183, 98, 918, 1012, 114, 0, 500, 1, 114, 500, 18, 20.52, 9, 10.26, 9, 10.26, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(740, 183, 98, 692, 785, 2, 0, 0, 5, 10, 0, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(741, 183, 98, 162, 168, 10, 5.2, 50, 2, 20, 100, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(742, 183, 98, 264, 351, 32, 0, 50, 4, 128, 200, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(743, 183, 98, 802, 896, 80, 0, 100, 2, 160, 200, 5, 8, 2.5, 4, 2.5, 4, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(744, 183, 98, 753, 847, 50, 0, 100, 2, 100, 200, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(745, 183, 98, 754, 848, 15, 0, 100, 1, 15, 100, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(746, 183, 98, 284, 377, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(747, 183, 98, 277, 370, 68, 0, 50, 1, 68, 50, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(748, 183, 98, 870, 964, 54, 0, 25, 1, 54, 25, 5, 2.7, 2.5, 1.35, 2.5, 1.35, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(749, 183, 98, 195, 239, 15, 0, 100, 2, 30, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(750, 183, 98, 254, 300, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(751, 183, 98, 255, 301, 48, 0, 1, 2, 96, 2, 5, 4.8, 2.5, 2.4, 2.5, 2.4, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(752, 183, 98, 352, 445, 20, 0, 50, 4, 80, 200, 5, 4, 2.5, 2, 2.5, 2, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(753, 183, 98, 348, 441, 45, 0, 50, 2, 90, 100, 5, 4.5, 2.5, 2.25, 2.5, 2.25, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(754, 183, 98, 201, 246, 58, 0, 500, 1, 58, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(755, 183, 98, 736, 830, 35, 0, 200, 2, 70, 400, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(756, 183, 98, 539, 632, 2, 0, 2, 10, 20, 20, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(757, 183, 98, 511, 604, 62, 0, 100, 2, 124, 200, 18, 22.32, 9, 11.16, 9, 11.16, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(758, 183, 98, 518, 611, 57, 0, 80, 1, 57, 80, 18, 10.26, 9, 5.13, 9, 5.13, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(759, 183, 98, 489, 582, 47, 0, 100, 2, 94, 200, 18, 16.92, 9, 8.46, 9, 8.46, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(760, 183, 98, 598, 691, 10, 0, 135, 6, 60, 810, 18, 10.8, 9, 5.4, 9, 5.4, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(761, 183, 98, 581, 674, 166, 0, 1000, 1, 166, 1000, 18, 29.88, 9, 14.94, 9, 14.94, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(762, 183, 98, 183, 225, 187, 0, 1, 2, 374, 2, 5, 18.7, 2.5, 9.35, 2.5, 9.35, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(763, 183, 98, 188, 230, 157, 0, 1, 3, 471, 3, 5, 23.55, 2.5, 11.775, 2.5, 11.775, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(764, 183, 98, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(765, 183, 98, 217, 263, 62, 0, 1, 2, 124, 2, 5, 6.2, 2.5, 3.1, 2.5, 3.1, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(766, 183, 98, 873, 967, 70, 0, 500, 1, 70, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(767, 183, 98, 260, 306, 55, 0, 500, 2, 110, 1000, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(768, 183, 98, 258, 304, 32, 0, 500, 1, 32, 500, 5, 1.6, 2.5, 0.8, 2.5, 0.8, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(769, 183, 98, 221, 267, 385, 0, 1, 2, 770, 2, 5, 38.5, 2.5, 19.25, 2.5, 19.25, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(770, 183, 98, 548, 641, 26, 0, 100, 2, 52, 200, 5, 2.6, 2.5, 1.3, 2.5, 1.3, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(771, 183, 98, 286, 379, 64, 0, 50, 1, 64, 50, 5, 3.2, 2.5, 1.6, 2.5, 1.6, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(772, 183, 98, 267, 357, 65, 0, 250, 1, 65, 250, 5, 3.25, 2.5, 1.625, 2.5, 1.625, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(773, 183, 98, 197, 242, 27, 0, 250, 2, 54, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(774, 183, 98, 247, 293, 169, 0, 200, 1, 169, 200, 12, 20.28, 6, 10.14, 6, 10.14, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(775, 183, 98, 682, 775, 12, 0, 0, 2, 24, 0, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(776, 183, 98, 306, 399, 37, 0, 50, 1, 37, 50, 5, 1.85, 2.5, 0.925, 2.5, 0.925, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(777, 183, 98, 301, 394, 18, 0, 50, 1, 18, 50, 5, 0.9, 2.5, 0.45, 2.5, 0.45, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(779, 183, 98, 656, 749, 10, 0, 0, 1, 10, 0, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(780, 183, 98, 657, 750, 9, 0, 0, 1, 9, 0, 18, 1.62, 9, 0.81, 9, 0.81, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(781, 183, 98, 693, 786, 10, 0, 0, 1, 10, 0, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(782, 183, 98, 888, 982, 110, 0, 150, 1, 110, 150, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(783, 183, 98, 890, 984, 110, 0, 200, 1, 110, 200, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(784, 183, 98, 892, 986, 62, 0, 50, 1, 62, 50, 5, 3.1, 2.5, 1.55, 2.5, 1.55, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(785, 183, 98, 893, 987, 78, 0, 150, 1, 78, 150, 5, 3.9, 2.5, 1.95, 2.5, 1.95, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(786, 183, 98, 886, 980, 66, 0, 100, 1, 66, 100, 5, 3.3, 2.5, 1.65, 2.5, 1.65, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(787, 183, 98, 225, 271, 110, 0, 1, 3, 330, 3, 5, 16.5, 2.5, 8.25, 2.5, 8.25, 0, 0, '2024-03-02 11:18:12', '2024-03-02 11:18:12'),
(788, 184, 101, 224, 270, 110, 0, 1, 1, 110, 1, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-03-02 21:35:06', '2024-03-02 21:35:06'),
(789, 173, 69, 162, 168, 10, 5.2, 50, 1, 10, 50, 5, 0.5, 2.5, 0.25, 2.5, 0.25, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(790, 173, 69, 322, 415, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(791, 173, 69, 324, 417, 34, 0, 500, 1, 34, 500, 5, 1.7, 2.5, 0.85, 2.5, 0.85, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(792, 173, 69, 335, 428, 20, 0, 50, 1, 20, 50, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(793, 173, 69, 337, 430, 22, 0, 50, 1, 22, 50, 5, 1.1, 2.5, 0.55, 2.5, 0.55, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(794, 173, 69, 338, 431, 14, 0, 50, 2, 28, 100, 5, 1.4, 2.5, 0.7, 2.5, 0.7, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(795, 173, 69, 347, 440, 24, 0, 50, 1, 24, 50, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(796, 173, 69, 352, 445, 20, 0, 50, 1, 20, 50, 5, 1, 2.5, 0.5, 2.5, 0.5, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(797, 173, 69, 263, 349, 7, 0, 50, 2, 14, 100, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(798, 173, 69, 264, 351, 32, 0, 50, 1, 32, 50, 5, 1.6, 2.5, 0.8, 2.5, 0.8, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(799, 173, 69, 253, 299, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(800, 173, 69, 872, 966, 35, 0, 250, 1, 35, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(801, 173, 69, 224, 270, 110, 0, 1, 1, 110, 1, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(802, 173, 69, 215, 261, 34, 0, 500, 1, 34, 500, 5, 1.7, 2.5, 0.85, 2.5, 0.85, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(803, 173, 69, 217, 263, 62, 0, 1, 1, 62, 1, 5, 3.1, 2.5, 1.55, 2.5, 1.55, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(804, 173, 69, 218, 264, 37, 0, 500, 1, 37, 500, 5, 1.85, 2.5, 0.925, 2.5, 0.925, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(805, 173, 69, 348, 441, 45, 0, 50, 1, 45, 50, 5, 2.25, 2.5, 1.125, 2.5, 1.125, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(806, 173, 69, 634, 727, 75, 0, 45, 1, 75, 45, 18, 13.5, 9, 6.75, 9, 6.75, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(807, 173, 69, 656, 749, 10, 0, 0, 3, 30, 0, 18, 5.4, 9, 2.7, 9, 2.7, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(808, 173, 69, 784, 878, 10, 0, 60, 2, 20, 120, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(809, 173, 69, 787, 881, 10, 0, 69, 2, 20, 138, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(810, 173, 69, 687, 780, 10, 0, 14, 1, 10, 14, 5, 0.5, 2.5, 0.25, 2.5, 0.25, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(811, 173, 69, 558, 651, 34, 0, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(812, 173, 69, 736, 830, 35, 0, 200, 1, 35, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(813, 173, 69, 455, 548, 36, 0, 100, 1, 36, 100, 18, 6.48, 9, 3.24, 9, 3.24, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(814, 173, 69, 471, 564, 38, 0, 125, 1, 38, 125, 18, 6.84, 9, 3.42, 9, 3.42, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(815, 173, 69, 527, 620, 2, 0, 6, 10, 20, 60, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(816, 173, 69, 529, 622, 10, 0, 50, 1, 10, 50, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-03-11 08:58:57', '2024-03-11 08:58:57'),
(817, 134, 17, 183, 225, 187, 0, 1, 1, 187, 1, 5, 9.35, 2.5, 4.675, 2.5, 4.675, 0, 0, '2024-03-11 12:32:41', '2024-03-11 12:32:41'),
(818, 134, 17, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-03-11 12:32:41', '2024-03-11 12:32:41'),
(819, 134, 17, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-03-11 12:32:41', '2024-03-11 12:32:41'),
(820, 134, 17, 404, 497, 7, 0, 32, 1, 7, 32, 12, 0.84, 6, 0.42, 6, 0.42, 0, 0, '2024-03-11 12:32:41', '2024-03-11 12:32:41'),
(821, 191, 39, 163, 169, 1780, 0, 26, 1, 1780, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-11 13:30:53', '2024-03-11 13:30:53'),
(822, 191, 39, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-03-11 13:30:53', '2024-03-11 13:30:53'),
(823, 191, 39, 183, 225, 187, 0, 1, 1, 187, 1, 5, 9.35, 2.5, 4.675, 2.5, 4.675, 0, 0, '2024-03-11 13:30:53', '2024-03-11 13:30:53'),
(824, 193, 17, 163, 169, 1780, 0, 26, 1, 1780, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 18:28:16', '2024-03-12 18:28:16'),
(825, 193, 17, 186, 228, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-03-12 18:28:16', '2024-03-12 18:28:16'),
(826, 192, 111, 169, 181, 115, 0, 1, 2, 230, 2, 5, 11.5, 2.5, 5.75, 2.5, 5.75, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(827, 192, 111, 198, 243, 50, 0, 250, 2, 100, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(828, 192, 111, 201, 246, 60, 0, 500, 2, 120, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(829, 192, 111, 200, 245, 32, 0, 250, 2, 64, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(830, 192, 111, 202, 248, 38, 0, 250, 2, 76, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(831, 192, 111, 203, 249, 33, 0, 250, 2, 66, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(832, 192, 111, 351, 444, 160, 0, 500, 2, 320, 1000, 5, 16, 2.5, 8, 2.5, 8, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(833, 192, 111, 353, 446, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(834, 192, 111, 808, 902, 27, 0, 50, 2, 54, 100, 5, 2.7, 2.5, 1.35, 2.5, 1.35, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(835, 192, 111, 811, 905, 27, 0, 50, 3, 81, 150, 5, 4.05, 2.5, 2.025, 2.5, 2.025, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(836, 192, 111, 350, 443, 18, 0, 50, 2, 36, 100, 5, 1.8, 2.5, 0.9, 2.5, 0.9, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(837, 192, 111, 348, 441, 45, 0, 50, 3, 135, 150, 5, 6.75, 2.5, 3.375, 2.5, 3.375, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(838, 192, 111, 346, 439, 18, 0, 50, 2, 36, 100, 5, 1.8, 2.5, 0.9, 2.5, 0.9, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(839, 192, 111, 344, 437, 13, 0, 50, 2, 26, 100, 5, 1.3, 2.5, 0.65, 2.5, 0.65, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(840, 192, 111, 343, 436, 27, 0, 50, 4, 108, 200, 5, 5.4, 2.5, 2.7, 2.5, 2.7, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(841, 192, 111, 341, 434, 25, 0, 50, 5, 125, 250, 5, 6.25, 2.5, 3.125, 2.5, 3.125, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(842, 192, 111, 339, 432, 40, 0, 50, 5, 200, 250, 5, 10, 2.5, 5, 2.5, 5, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(843, 192, 111, 336, 429, 175, 0, 500, 2, 350, 1000, 5, 17.5, 2.5, 8.75, 2.5, 8.75, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(844, 192, 111, 332, 425, 27, 0, 50, 3, 81, 150, 5, 4.05, 2.5, 2.025, 2.5, 2.025, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(845, 192, 111, 313, 406, 19, 0, 50, 6, 114, 300, 5, 5.7, 2.5, 2.85, 2.5, 2.85, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(846, 192, 111, 312, 405, 25, 0, 50, 4, 100, 200, 5, 5, 2.5, 2.5, 2.5, 2.5, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(847, 192, 111, 300, 393, 48, 0, 200, 1, 48, 200, 12, 5.76, 6, 2.88, 6, 2.88, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(848, 192, 111, 302, 395, 22, 0, 50, 2, 44, 100, 5, 2.2, 2.5, 1.1, 2.5, 1.1, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(849, 192, 111, 305, 398, 70, 0, 100, 2, 140, 200, 5, 7, 2.5, 3.5, 2.5, 3.5, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(850, 192, 111, 875, 969, 46, 0, 50, 1, 46, 50, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(851, 192, 111, 873, 967, 70, 0, 500, 2, 140, 1000, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(852, 192, 111, 259, 305, 190, 0, 500, 1, 190, 500, 5, 9.5, 2.5, 4.75, 2.5, 4.75, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(853, 192, 111, 264, 351, 32, 0, 50, 10, 320, 500, 5, 16, 2.5, 8, 2.5, 8, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(854, 192, 111, 265, 353, 25, 0, 50, 7, 175, 350, 5, 8.75, 2.5, 4.375, 2.5, 4.375, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(855, 192, 111, 266, 355, 8, 0, 50, 2, 16, 100, 5, 0.8, 2.5, 0.4, 2.5, 0.4, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(856, 192, 111, 274, 367, 103, 0, 50, 1, 103, 50, 5, 5.15, 2.5, 2.575, 2.5, 2.575, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(857, 192, 111, 276, 369, 28, 0, 50, 2, 56, 100, 5, 2.8, 2.5, 1.4, 2.5, 1.4, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(858, 192, 111, 277, 370, 68, 0, 50, 1, 68, 50, 5, 3.4, 2.5, 1.7, 2.5, 1.7, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(859, 192, 111, 278, 371, 43, 0, 50, 1, 43, 50, 5, 2.15, 2.5, 1.075, 2.5, 1.075, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(860, 192, 111, 279, 372, 70, 0, 50, 6, 420, 300, 5, 21, 2.5, 10.5, 2.5, 10.5, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(861, 192, 111, 281, 374, 15, 0, 50, 1, 15, 50, 5, 0.75, 2.5, 0.375, 2.5, 0.375, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(862, 192, 111, 284, 377, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(863, 192, 111, 286, 379, 64, 0, 50, 1, 64, 50, 5, 3.2, 2.5, 1.6, 2.5, 1.6, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(864, 192, 111, 802, 896, 80, 0, 100, 5, 400, 500, 5, 20, 2.5, 10, 2.5, 10, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(865, 192, 111, 846, 940, 15, 0, 100, 10, 150, 1000, 5, 7.5, 2.5, 3.75, 2.5, 3.75, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(866, 192, 111, 401, 494, 102, 0, 180, 1, 102, 180, 18, 18.36, 9, 9.18, 9, 9.18, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(867, 192, 111, 918, 1012, 114, 0, 500, 1, 114, 500, 18, 20.52, 9, 10.26, 9, 10.26, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(868, 192, 111, 407, 500, 54, 0, 280, 5, 270, 1400, 12, 32.4, 6, 16.2, 6, 16.2, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(869, 192, 111, 409, 502, 12, 0, 67, 4, 48, 268, 12, 5.76, 6, 2.88, 6, 2.88, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(870, 192, 111, 415, 508, 39, 0, 500, 6, 234, 3000, 5, 11.7, 2.5, 5.85, 2.5, 5.85, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(871, 192, 111, 420, 513, 50, 0, 500, 4, 200, 2000, 5, 10, 2.5, 5, 2.5, 5, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(872, 192, 111, 843, 937, 45, 0, 200, 2, 90, 400, 12, 10.8, 6, 5.4, 6, 5.4, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(873, 192, 111, 622, 715, 63, 0, 220, 2, 126, 440, 18, 22.68, 9, 11.34, 9, 11.34, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(874, 192, 111, 648, 741, 22, 0, 50, 3, 66, 150, 5, 3.3, 2.5, 1.65, 2.5, 1.65, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(875, 192, 111, 647, 740, 10, 0, 20, 1, 10, 20, 5, 0.5, 2.5, 0.25, 2.5, 0.25, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(876, 192, 111, 662, 755, 75, 0, 100, 1, 75, 100, 5, 3.75, 2.5, 1.875, 2.5, 1.875, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(877, 192, 111, 756, 850, 18, 0, 250, 2, 36, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-12 19:28:12', '2024-03-12 19:28:12'),
(878, 196, 99, 868, 962, 192, 0, 1, 3, 576, 3, 5, 28.8, 2.5, 14.4, 2.5, 14.4, 0, 0, '2024-03-13 07:18:49', '2024-03-13 07:18:49'),
(879, 199, 116, 182, 224, 143, 0, 1, 2, 286, 2, 5, 14.3, 2.5, 7.15, 2.5, 7.15, 0, 0, '2024-03-14 09:55:46', '2024-03-14 09:55:46'),
(880, 199, 116, 224, 270, 110, 0, 1, 2, 220, 2, 5, 11, 2.5, 5.5, 2.5, 5.5, 0, 0, '2024-03-14 09:55:46', '2024-03-14 09:55:46');
INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `product_price_id`, `price`, `offer_price`, `weight`, `quantity`, `amount`, `total_weight`, `gst_percent`, `gst_amount`, `sgst_percent`, `sgst_amount`, `cgst_percent`, `cgst_amount`, `igst_percent`, `igst_amount`, `created_at`, `updated_at`) VALUES
(881, 199, 116, 197, 242, 27, 0, 250, 2, 54, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-14 09:55:46', '2024-03-14 09:55:46'),
(882, 199, 116, 208, 254, 33, 0, 250, 1, 33, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-14 09:55:46', '2024-03-14 09:55:46'),
(883, 199, 116, 209, 255, 45, 0, 1, 6, 270, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-14 09:55:46', '2024-03-14 09:55:46'),
(884, 199, 116, 875, 969, 46, 0, 50, 4, 184, 200, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-14 09:55:46', '2024-03-14 09:55:46'),
(885, 201, 118, 571, 664, 12, 0, 300, 1, 12, 300, 18, 2.16, 9, 1.08, 9, 1.08, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(886, 201, 118, 922, 1016, 10, 0, 100, 1, 10, 100, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(887, 201, 118, 482, 575, 40, 0, 75, 1, 40, 75, 18, 7.2, 9, 3.6, 9, 3.6, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(888, 201, 118, 510, 603, 20, 0, 45, 1, 20, 45, 18, 3.6, 9, 1.8, 9, 1.8, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(889, 201, 118, 432, 525, 5, 0, 14, 1, 5, 14, 18, 0.9, 9, 0.45, 9, 0.45, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(890, 201, 118, 442, 535, 5, 0, 10, 1, 5, 10, 18, 0.9, 9, 0.45, 9, 0.45, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(891, 201, 118, 756, 850, 18, 0, 250, 1, 18, 250, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(892, 201, 118, 438, 531, 5, 0, 30, 3, 15, 90, 18, 2.7, 9, 1.35, 9, 1.35, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(893, 201, 118, 221, 267, 385, 0, 1, 3, 1155, 3, 5, 57.75, 2.5, 28.875, 2.5, 28.875, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(894, 201, 118, 222, 268, 189, 0, 500, 1, 189, 500, 5, 9.45, 2.5, 4.725, 2.5, 4.725, 0, 0, '2024-03-16 20:39:12', '2024-03-16 20:39:12'),
(895, 198, 114, 182, 224, 143, 0, 1, 2, 286, 2, 5, 14.3, 2.5, 7.15, 2.5, 7.15, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(896, 198, 114, 183, 225, 187, 0, 1, 1, 187, 1, 5, 9.35, 2.5, 4.675, 2.5, 4.675, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(897, 198, 114, 187, 229, 66, 0, 500, 1, 66, 500, 5, 3.3, 2.5, 1.65, 2.5, 1.65, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(898, 198, 114, 820, 914, 33, 0, 250, 3, 99, 750, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(899, 198, 114, 267, 357, 65, 0, 250, 2, 130, 500, 5, 6.5, 2.5, 3.25, 2.5, 3.25, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(900, 198, 114, 284, 377, 25, 0, 50, 1, 25, 50, 5, 1.25, 2.5, 0.625, 2.5, 0.625, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(901, 198, 114, 572, 665, 55, 0, 500, 1, 55, 500, 18, 9.9, 9, 4.95, 9, 4.95, 0, 0, '2024-03-19 07:55:40', '2024-03-19 07:55:40'),
(902, 204, 122, 897, 991, 583, 0, 5, 2, 1166, 10, 5, 58.3, 2.5, 29.15, 2.5, 29.15, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(903, 204, 122, 230, 276, 246, 0, 1, 1, 246, 1, 5, 12.3, 2.5, 6.15, 2.5, 6.15, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(904, 204, 122, 733, 826, 50, 0, 1, 1, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(905, 204, 122, 188, 230, 166, 0, 1, 3, 498, 3, 5, 24.9, 2.5, 12.45, 2.5, 12.45, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(906, 204, 122, 190, 232, 47, 0, 250, 3, 141, 750, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(907, 204, 122, 217, 263, 62, 0, 1, 2, 124, 2, 5, 6.2, 2.5, 3.1, 2.5, 3.1, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(908, 204, 122, 351, 444, 160, 0, 500, 2, 320, 1000, 5, 16, 2.5, 8, 2.5, 8, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(909, 204, 122, 348, 441, 45, 0, 50, 1, 45, 50, 5, 2.25, 2.5, 1.125, 2.5, 1.125, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(910, 204, 122, 246, 292, 90, 0, 100, 1, 90, 100, 12, 10.8, 6, 5.4, 6, 5.4, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(911, 204, 122, 253, 299, 12, 0, 1, 2, 24, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(912, 204, 122, 358, 451, 213, 0, 250, 1, 213, 250, 5, 10.65, 2.5, 5.325, 2.5, 5.325, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(913, 204, 122, 473, 566, 38, 0, 125, 2, 76, 250, 18, 13.68, 9, 6.84, 9, 6.84, 0, 0, '2024-03-20 12:41:22', '2024-03-20 12:41:22'),
(914, 206, 125, 182, 224, 143, 0, 1, 4, 572, 4, 5, 28.6, 2.5, 14.3, 2.5, 14.3, 0, 0, '2024-03-27 10:54:10', '2024-03-27 10:54:10'),
(915, 208, 126, 211, 257, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-03-27 11:14:58', '2024-03-27 11:14:58'),
(916, 208, 126, 212, 258, 30, 0, 500, 1, 30, 500, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-03-27 11:14:58', '2024-03-27 11:14:58'),
(917, 230, 155, 163, 169, 1780, 0, 26, 1, 1780, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-09 12:29:37', '2024-04-09 12:29:37'),
(918, 231, 155, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-04-09 12:31:40', '2024-04-09 12:31:40'),
(919, 232, 155, 185, 227, 73, 0, 500, 1, 73, 500, 5, 3.65, 2.5, 1.825, 2.5, 1.825, 0, 0, '2024-04-09 12:32:40', '2024-04-09 12:32:40'),
(920, 233, 155, 221, 267, 385, 0, 1, 2, 770, 2, 5, 38.5, 2.5, 19.25, 2.5, 19.25, 0, 0, '2024-04-09 12:37:50', '2024-04-09 12:37:50'),
(921, 234, 155, 309, 402, 100, 0, 50, 1, 100, 50, 12, 12, 6, 6, 6, 6, 0, 0, '2024-04-09 12:45:08', '2024-04-09 12:45:08'),
(922, 235, 155, 274, 367, 103, 0, 50, 1, 103, 50, 5, 5.15, 2.5, 2.575, 2.5, 2.575, 0, 0, '2024-04-09 12:46:34', '2024-04-09 12:46:34'),
(923, 236, 155, 164, 171, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-09 13:50:36', '2024-04-09 13:50:36'),
(924, 237, 155, 165, 174, 145, 0, 2, 1, 145, 2, 5, 7.25, 2.5, 3.625, 2.5, 3.625, 0, 0, '2024-04-09 13:51:11', '2024-04-09 13:51:11'),
(925, 238, 155, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-04-09 16:16:22', '2024-04-09 16:16:22'),
(926, 239, 155, 945, 1039, 1527, 0, 5, 1, 1527, 5, 18, 274.86, 9, 137.43, 9, 137.43, 0, 0, '2024-04-09 16:18:44', '2024-04-09 16:18:44'),
(927, 240, 156, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-04-09 16:22:47', '2024-04-09 16:22:47'),
(928, 241, 156, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-04-09 16:23:54', '2024-04-09 16:23:54'),
(929, 242, 157, 164, 171, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-10 14:18:27', '2024-04-10 14:18:27'),
(930, 243, 157, 167, 178, 127, 0, 2, 1, 127, 2, 5, 6.35, 2.5, 3.175, 2.5, 3.175, 0, 0, '2024-04-10 15:30:30', '2024-04-10 15:30:30'),
(931, 244, 158, 165, 174, 145, 0, 2, 1, 145, 2, 5, 7.25, 2.5, 3.625, 2.5, 3.625, 0, 0, '2024-04-10 15:33:27', '2024-04-10 15:33:27'),
(932, 245, 158, 894, 988, 132, 0, 200, 1, 132, 200, 12, 15.84, 6, 7.92, 6, 7.92, 0, 0, '2024-04-10 15:39:38', '2024-04-10 15:39:38'),
(933, 246, 158, 309, 402, 100, 0, 50, 1, 100, 50, 12, 12, 6, 6, 6, 6, 0, 0, '2024-04-10 16:14:31', '2024-04-10 16:14:31'),
(934, 249, 9, 945, 1039, 1527, 0, 5, 1, 1527, 5, 18, 274.86, 9, 137.43, 9, 137.43, 0, 0, '2024-04-11 16:52:19', '2024-04-11 16:52:19'),
(935, 249, 9, 682, 775, 12, 0, 0, 1, 12, 0, 5, 0.6, 2.5, 0.3, 2.5, 0.3, 0, 0, '2024-04-11 16:52:19', '2024-04-11 16:52:19'),
(936, 249, 9, 692, 785, 2, 0, 0, 5, 10, 0, 18, 1.8, 9, 0.9, 9, 0.9, 0, 0, '2024-04-11 16:52:19', '2024-04-11 16:52:19'),
(937, 249, 9, 693, 786, 10, 0, 0, 4, 40, 0, 18, 7.2, 9, 3.6, 9, 3.6, 0, 0, '2024-04-11 16:52:19', '2024-04-11 16:52:19'),
(938, 250, 9, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-04-11 16:54:06', '2024-04-11 16:54:06'),
(939, 248, 23, 221, 267, 385, 0, 1, 2, 770, 2, 5, 38.5, 2.5, 19.25, 2.5, 19.25, 0, 0, '2024-04-11 16:56:27', '2024-04-11 16:56:27'),
(940, 248, 23, 222, 268, 189, 0, 500, 2, 378, 1000, 5, 18.9, 2.5, 9.45, 2.5, 9.45, 0, 0, '2024-04-11 16:56:27', '2024-04-11 16:56:27'),
(941, 252, 161, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-04-17 12:22:10', '2024-04-17 12:22:10'),
(942, 252, 161, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-04-17 12:22:10', '2024-04-17 12:22:10'),
(943, 127, 6, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-04-18 10:22:13', '2024-04-18 10:22:13'),
(944, 127, 6, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-04-18 10:22:13', '2024-04-18 10:22:13'),
(945, 209, 127, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-04-22 12:48:58', '2024-04-22 12:48:58'),
(946, 251, 23, 221, 267, 385, 0, 1, 2, 770, 2, 5, 38.5, 2.5, 19.25, 2.5, 19.25, 0, 0, '2024-05-08 16:33:35', '2024-05-08 16:33:35'),
(947, 254, 128, 166, 175, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 16:54:07', '2024-05-08 16:54:07'),
(948, 256, 166, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-05-08 17:47:54', '2024-05-08 17:47:54'),
(949, 258, 167, 183, 225, 187, 0, 1, 1, 187, 1, 5, 9.35, 2.5, 4.675, 2.5, 4.675, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(950, 258, 167, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(951, 258, 167, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(952, 258, 167, 225, 271, 110, 0, 1, 1, 110, 1, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(953, 258, 167, 211, 257, 55, 0, 500, 1, 55, 500, 5, 2.75, 2.5, 1.375, 2.5, 1.375, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(954, 258, 167, 212, 258, 30, 0, 500, 1, 30, 500, 5, 1.5, 2.5, 0.75, 2.5, 0.75, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(955, 258, 167, 311, 404, 16, 0, 50, 3, 48, 150, 5, 2.4, 2.5, 1.2, 2.5, 1.2, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(956, 258, 167, 332, 425, 27, 0, 50, 2, 54, 100, 5, 2.7, 2.5, 1.35, 2.5, 1.35, 0, 0, '2024-05-08 18:29:57', '2024-05-08 18:29:57'),
(957, 259, 167, 253, 299, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 19:39:19', '2024-05-08 19:39:19'),
(958, 260, 167, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-08 19:45:32', '2024-05-08 19:45:32'),
(959, 261, 168, 167, 178, 127, 0, 2, 2, 254, 4, 5, 12.7, 2.5, 6.35, 2.5, 6.35, 0, 0, '2024-05-09 21:14:51', '2024-05-09 21:14:51'),
(960, 262, 167, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-05-10 11:02:10', '2024-05-10 11:02:10'),
(961, 262, 167, 188, 230, 166, 0, 1, 1, 166, 1, 5, 8.3, 2.5, 4.15, 2.5, 4.15, 0, 0, '2024-05-10 11:02:10', '2024-05-10 11:02:10'),
(962, 267, 172, 182, 224, 143, 0, 1, 2, 286, 2, 5, 14.3, 2.5, 7.15, 2.5, 7.15, 0, 0, '2024-05-13 15:22:03', '2024-05-13 15:22:03'),
(963, 267, 172, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-05-13 15:22:03', '2024-05-13 15:22:03'),
(964, 269, 10, 186, 228, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-05-13 17:26:49', '2024-05-13 17:26:49'),
(965, 269, 10, 188, 230, 166, 0, 1, 1, 166, 1, 5, 8.3, 2.5, 4.15, 2.5, 4.15, 0, 0, '2024-05-13 17:26:49', '2024-05-13 17:26:49'),
(966, 270, 173, 253, 299, 12, 0, 1, 1, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-13 18:14:16', '2024-05-13 18:14:16'),
(967, 270, 173, 256, 302, 24, 0, 500, 1, 24, 500, 5, 1.2, 2.5, 0.6, 2.5, 0.6, 0, 0, '2024-05-13 18:14:16', '2024-05-13 18:14:16'),
(968, 270, 173, 258, 304, 32, 0, 500, 1, 32, 500, 5, 1.6, 2.5, 0.8, 2.5, 0.8, 0, 0, '2024-05-13 18:14:16', '2024-05-13 18:14:16'),
(969, 270, 173, 873, 967, 70, 0, 500, 1, 70, 500, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-13 18:14:16', '2024-05-13 18:14:16'),
(970, 275, 177, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-14 12:41:13', '2024-05-14 12:41:13'),
(971, 276, 177, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-14 14:28:02', '2024-05-14 14:28:02'),
(972, 279, 179, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-05-16 12:03:40', '2024-05-16 12:03:40'),
(973, 279, 179, 169, 181, 115, 0, 1, 1, 115, 1, 5, 5.75, 2.5, 2.875, 2.5, 2.875, 0, 0, '2024-05-16 12:03:40', '2024-05-16 12:03:40'),
(974, 281, 180, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-05-16 16:05:29', '2024-05-16 16:05:29'),
(975, 281, 180, 186, 228, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-05-16 16:05:29', '2024-05-16 16:05:29'),
(976, 282, 180, 186, 228, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-05-16 16:10:35', '2024-05-16 16:10:35'),
(977, 285, 181, 298, 391, 50, 0, 200, 1, 50, 200, 12, 6, 6, 3, 6, 3, 0, 0, '2024-05-16 16:47:54', '2024-05-16 16:47:54'),
(978, 285, 181, 299, 392, 50, 0, 200, 1, 50, 200, 12, 6, 6, 3, 6, 3, 0, 0, '2024-05-16 16:47:54', '2024-05-16 16:47:54'),
(979, 286, 181, 169, 181, 115, 0, 1, 1, 115, 1, 5, 5.75, 2.5, 2.875, 2.5, 2.875, 0, 0, '2024-05-16 16:49:17', '2024-05-16 16:49:17'),
(980, 288, 182, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-17 11:23:40', '2024-05-17 11:23:40'),
(981, 288, 182, 222, 268, 189, 0, 500, 1, 189, 500, 5, 9.45, 2.5, 4.725, 2.5, 4.725, 0, 0, '2024-05-17 11:23:40', '2024-05-17 11:23:40'),
(982, 289, 182, 298, 391, 50, 0, 200, 1, 50, 200, 12, 6, 6, 3, 6, 3, 0, 0, '2024-05-17 11:32:48', '2024-05-17 11:32:48'),
(983, 284, 167, 262, 348, 14, 0, 50, 1, 14, 50, 5, 0.7, 2.5, 0.35, 2.5, 0.35, 0, 0, '2024-05-17 16:04:45', '2024-05-17 16:04:45'),
(984, 284, 167, 264, 351, 32, 0, 50, 1, 32, 50, 5, 1.6, 2.5, 0.8, 2.5, 0.8, 0, 0, '2024-05-17 16:04:45', '2024-05-17 16:04:45'),
(985, 305, 182, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-17 16:43:09', '2024-05-17 16:43:09'),
(986, 308, 185, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-05-17 19:46:29', '2024-05-17 19:46:29'),
(987, 308, 185, 183, 225, 187, 0, 1, 1, 187, 1, 5, 9.35, 2.5, 4.675, 2.5, 4.675, 0, 0, '2024-05-17 19:46:29', '2024-05-17 19:46:29'),
(988, 309, 185, 186, 228, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-05-17 19:47:41', '2024-05-17 19:47:41'),
(989, 309, 185, 187, 229, 66, 0, 500, 1, 66, 500, 5, 3.3, 2.5, 1.65, 2.5, 1.65, 0, 0, '2024-05-17 19:47:41', '2024-05-17 19:47:41'),
(990, 310, 185, 165, 174, 145, 0, 2, 1, 145, 2, 5, 7.25, 2.5, 3.625, 2.5, 3.625, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(991, 310, 185, 168, 179, 1235, 0, 26, 1, 1235, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(992, 310, 185, 732, 825, 77, 0, 1, 1, 77, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(993, 310, 185, 741, 835, 175, 0, 1, 1, 175, 1, 5, 8.75, 2.5, 4.375, 2.5, 4.375, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(994, 310, 185, 746, 840, 725, 0, 10, 1, 725, 10, 5, 36.25, 2.5, 18.125, 2.5, 18.125, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(995, 310, 185, 830, 924, 1575, 0, 26, 1, 1575, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(996, 310, 185, 932, 1026, 360, 300, 5, 1, 360, 5, 5, 18, 2.5, 9, 2.5, 9, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(997, 310, 185, 182, 224, 143, 0, 1, 1, 143, 1, 5, 7.15, 2.5, 3.575, 2.5, 3.575, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(998, 310, 185, 184, 226, 128, 0, 1, 1, 128, 1, 5, 6.4, 2.5, 3.2, 2.5, 3.2, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(999, 310, 185, 185, 227, 73, 0, 500, 1, 73, 500, 5, 3.65, 2.5, 1.825, 2.5, 1.825, 0, 0, '2024-05-18 09:32:28', '2024-05-18 09:32:28'),
(1000, 314, 188, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-21 14:57:24', '2024-05-21 14:57:24'),
(1001, 314, 188, 223, 269, 57, 0, 500, 3, 171, 1500, 5, 8.55, 2.5, 4.275, 2.5, 4.275, 0, 0, '2024-05-21 14:57:24', '2024-05-21 14:57:24'),
(1002, 314, 188, 226, 272, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-05-21 14:57:24', '2024-05-21 14:57:24'),
(1003, 315, 188, 211, 257, 55, 0, 500, 2, 110, 1000, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-05-21 15:13:40', '2024-05-21 15:13:40'),
(1004, 315, 188, 212, 258, 30, 0, 500, 3, 90, 1500, 5, 4.5, 2.5, 2.25, 2.5, 2.25, 0, 0, '2024-05-21 15:13:40', '2024-05-21 15:13:40'),
(1005, 313, 187, 222, 268, 189, 0, 500, 3, 567, 1500, 5, 28.35, 2.5, 14.175, 2.5, 14.175, 0, 0, '2024-05-21 17:21:07', '2024-05-21 17:21:07'),
(1006, 313, 187, 225, 271, 110, 0, 1, 1, 110, 1, 5, 5.5, 2.5, 2.75, 2.5, 2.75, 0, 0, '2024-05-21 17:21:07', '2024-05-21 17:21:07'),
(1007, 328, 190, 166, 175, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 17:40:41', '2024-05-21 17:40:41'),
(1008, 317, 189, 212, 258, 30, 0, 500, 2, 60, 1000, 5, 3, 2.5, 1.5, 2.5, 1.5, 0, 0, '2024-05-21 17:52:45', '2024-05-21 17:52:45'),
(1009, 337, 191, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-21 17:56:37', '2024-05-21 17:56:37'),
(1010, 339, 191, 221, 267, 385, 0, 1, 1, 385, 1, 5, 19.25, 2.5, 9.625, 2.5, 9.625, 0, 0, '2024-05-21 18:01:19', '2024-05-21 18:01:19'),
(1011, 342, 193, 222, 268, 189, 0, 500, 1, 189, 500, 5, 9.45, 2.5, 4.725, 2.5, 4.725, 0, 0, '2024-05-21 18:05:40', '2024-05-21 18:05:40'),
(1012, 345, 196, 226, 272, 95, 0, 500, 1, 95, 500, 5, 4.75, 2.5, 2.375, 2.5, 2.375, 0, 0, '2024-05-22 10:19:39', '2024-05-22 10:19:39'),
(1013, 346, 196, 222, 268, 189, 0, 500, 1, 189, 500, 5, 9.45, 2.5, 4.725, 2.5, 4.725, 0, 0, '2024-05-22 10:24:12', '2024-05-22 10:24:12'),
(1014, 347, 196, 211, 257, 55, 0, 500, 4, 220, 2000, 5, 11, 2.5, 5.5, 2.5, 5.5, 0, 0, '2024-05-22 10:29:21', '2024-05-22 10:29:21'),
(1015, 347, 196, 212, 258, 30, 0, 500, 3, 90, 1500, 5, 4.5, 2.5, 2.25, 2.5, 2.25, 0, 0, '2024-05-22 10:29:21', '2024-05-22 10:29:21'),
(1016, 347, 196, 214, 260, 33, 0, 500, 2, 66, 1000, 5, 3.3, 2.5, 1.65, 2.5, 1.65, 0, 0, '2024-05-22 10:29:21', '2024-05-22 10:29:21'),
(1017, 347, 196, 215, 261, 36, 0, 500, 2, 72, 1000, 5, 3.6, 2.5, 1.8, 2.5, 1.8, 0, 0, '2024-05-22 10:29:21', '2024-05-22 10:29:21'),
(1018, 354, 197, 229, 275, 122, 0, 500, 2, 244, 1000, 5, 12.2, 2.5, 6.1, 2.5, 6.1, 0, 0, '2024-05-22 12:53:19', '2024-05-22 12:53:19'),
(1019, 354, 197, 230, 276, 246, 0, 1, 2, 492, 2, 5, 24.6, 2.5, 12.3, 2.5, 12.3, 0, 0, '2024-05-22 12:53:19', '2024-05-22 12:53:19'),
(1020, 355, 197, 231, 277, 265, 0, 1, 1, 265, 1, 5, 13.25, 2.5, 6.625, 2.5, 6.625, 0, 0, '2024-05-22 12:54:00', '2024-05-22 12:54:00'),
(1021, 356, 198, 185, 227, 73, 0, 500, 2, 146, 1000, 5, 7.3, 2.5, 3.65, 2.5, 3.65, 0, 0, '2024-05-22 15:01:59', '2024-05-22 15:01:59'),
(1022, 356, 198, 187, 229, 66, 0, 500, 2, 132, 1000, 5, 6.6, 2.5, 3.3, 2.5, 3.3, 0, 0, '2024-05-22 15:01:59', '2024-05-22 15:01:59'),
(1023, 357, 198, 428, 521, 58, 0, 200, 2, 116, 400, 5, 5.8, 2.5, 2.9, 2.5, 2.9, 0, 0, '2024-05-22 15:03:43', '2024-05-22 15:03:43'),
(1024, 316, 167, 299, 392, 50, 0, 200, 3, 150, 600, 12, 18, 6, 9, 6, 9, 0, 0, '2024-05-22 15:06:03', '2024-05-22 15:06:03'),
(1025, 316, 167, 404, 497, 7, 0, 32, 3, 21, 96, 12, 2.52, 6, 1.26, 6, 1.26, 0, 0, '2024-05-22 15:06:03', '2024-05-22 15:06:03'),
(1026, 359, 6, 166, 175, 1750, 0, 26, 1, 1750, 26, 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-21 13:27:23', '2024-06-21 13:27:23'),
(1027, 363, 201, 395, 488, 211, 0, 500, 1, 211, 500, 5, 10.55, 2.5, 5.275, 2.5, 5.275, 0, 0, '2024-06-24 11:11:36', '2024-06-24 11:11:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_notifications`
--

CREATE TABLE `order_notifications` (
  `order_id` bigint(20) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `data` longtext NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `read_at` varchar(191) DEFAULT NULL,
  `notifiable_id` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_notifications`
--

INSERT INTO `order_notifications` (`order_id`, `id`, `type`, `data`, `user`, `read_at`, `notifiable_id`, `notifiable_type`, `created_at`, `updated_at`) VALUES
(1, 'b6dddffb-b1de-4f00-bdd1-025b5de2f026', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-12 11:54:39', '1', 'App\\User', '2023-05-09 10:16:59', '2023-05-12 11:54:39'),
(2, 'a5619822-ad0d-45c3-9abb-79d44a35ba11', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-15 10:50:15', '1', 'App\\User', '2023-05-09 10:37:20', '2023-05-15 10:50:15'),
(3, 'fa9bdcec-ed04-406a-857f-02bfe33da98f', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-15 10:50:19', '1', 'App\\User', '2023-05-09 10:44:09', '2023-05-15 10:50:19'),
(4, 'af08191f-7fb0-4464-9fac-53599f1e31f5', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-15 10:50:27', '1', 'App\\User', '2023-05-09 10:54:57', '2023-05-15 10:50:27'),
(5, 'b3bdd594-de8f-44a5-a463-11888167a4fa', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-15 10:51:16', '1', 'App\\User', '2023-05-09 11:00:18', '2023-05-15 10:51:16'),
(6, '95b3ac9f-ef42-40ef-ab6d-ba6ca4085f2b', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-09 16:52:14', '1', 'App\\User', '2023-05-09 11:02:38', '2023-05-09 11:22:14'),
(7, '683cf5b3-86e7-4a60-b6af-ef065c809e68', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-15 10:51:19', '1', 'App\\User', '2023-05-09 11:03:40', '2023-05-15 10:51:19'),
(8, '2bc8370a-f4c2-4776-9bcc-02acd3752160', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"102\"}', NULL, '2023-05-09 17:03:50', '1', 'App\\User', '2023-05-09 11:06:14', '2023-05-09 17:03:50'),
(9, '2fb87a9f-3bef-4183-a067-34c76d5846ce', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-15 10:51:21', '1', 'App\\User', '2023-05-09 11:06:55', '2023-05-15 10:51:21'),
(10, '5b7107e8-d33e-43ca-bd00-8c62f587187f', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"10_2\"}', NULL, '2023-05-09 17:03:46', '1', 'App\\User', '2023-05-09 17:02:50', '2023-05-09 17:03:46'),
(11, '6772beda-e6d0-4d95-a13b-309206eed593', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"28_2\"}', NULL, '2023-05-15 10:51:24', '1', 'App\\User', '2023-05-09 17:04:52', '2023-05-15 10:51:24'),
(12, '0162f486-07d9-4985-b35a-e97ff7f070c6', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"33_20\"}', NULL, '2023-05-15 10:51:25', '1', 'App\\User', '2023-05-10 13:15:31', '2023-05-15 10:51:25'),
(13, 'b3de8aa6-b3e7-4494-a630-1a608037f679', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"34_20\"}', NULL, '2023-05-15 10:51:27', '1', 'App\\User', '2023-05-10 15:01:36', '2023-05-15 10:51:27'),
(14, '4f5621a3-9c0b-4457-aed5-d54a995b9ce9', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"35_20\"}', NULL, '2023-05-15 10:51:29', '1', 'App\\User', '2023-05-10 15:05:28', '2023-05-15 10:51:29'),
(15, '145aeab1-f7ab-4c4b-928b-9a94ee91b383', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"36_20\"}', NULL, '2023-05-15 10:51:31', '1', 'App\\User', '2023-05-10 15:12:44', '2023-05-15 10:51:31'),
(16, '22a60c1a-06f9-49f9-83ad-03a0417e0248', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"37_20\"}', NULL, '2023-05-15 10:51:33', '1', 'App\\User', '2023-05-10 15:17:03', '2023-05-15 10:51:33'),
(17, '1b34fdaa-48e6-44b1-b8cd-78392d47d990', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"38_21\"}', NULL, '2023-05-15 10:51:36', '1', 'App\\User', '2023-05-10 15:53:02', '2023-05-15 10:51:36'),
(18, '56a0ddd8-f0a0-4d17-89cb-f40662c58719', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"39_21\"}', NULL, '2023-05-15 10:51:39', '1', 'App\\User', '2023-05-10 16:15:50', '2023-05-15 10:51:39'),
(19, '4341f96f-d7ee-441d-9987-cb4d8a5388bb', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"32_2\"}', NULL, '2023-05-15 10:51:41', '1', 'App\\User', '2023-05-12 11:53:02', '2023-05-15 10:51:41'),
(20, '04485852-2446-486a-871b-0571bc1d6236', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"41_2\"}', NULL, '2023-05-15 10:51:48', '1', 'App\\User', '2023-05-15 09:43:56', '2023-05-15 10:51:48'),
(21, '8c294e83-a0f6-4222-b4fb-18e27f167c0f', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"42_2\"}', NULL, '2023-05-15 10:51:51', '1', 'App\\User', '2023-05-15 09:45:22', '2023-05-15 10:51:51'),
(22, '4c033ce5-876a-403a-b99b-5366e4200e47', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"43_2\"}', NULL, '2023-05-15 10:51:53', '1', 'App\\User', '2023-05-15 09:48:17', '2023-05-15 10:51:53'),
(23, 'fc6c7e14-64bf-4169-bee7-56a663ea916d', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"44_2\"}', NULL, '2023-05-15 10:51:55', '1', 'App\\User', '2023-05-15 09:55:37', '2023-05-15 10:51:55'),
(24, 'f74c4076-9ef9-4111-9867-e44999ea82d3', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"40_21\"}', NULL, '2023-05-15 10:51:57', '1', 'App\\User', '2023-05-15 10:42:18', '2023-05-15 10:51:57'),
(25, '57d84de7-0780-460f-a5cc-21b7c76d94b6', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"45_21\"}', NULL, '2023-07-03 12:17:30', '1', 'App\\User', '2023-05-15 10:59:12', '2023-07-03 12:17:30'),
(26, '59286e8f-1069-4744-b1be-5066626ffc12', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"46_21\"}', NULL, '2023-07-03 12:17:36', '1', 'App\\User', '2023-05-17 18:48:18', '2023-07-03 12:17:36'),
(27, '6786cfab-4afb-4237-8296-2a36d9ff472c', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"47_21\"}', NULL, '2023-07-03 12:17:38', '1', 'App\\User', '2023-05-17 18:53:36', '2023-07-03 12:17:38'),
(28, 'd3f05926-107d-4f2f-a08a-62bb2f74cbfa', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"48_21\"}', NULL, '2023-07-03 12:17:41', '1', 'App\\User', '2023-05-17 19:06:09', '2023-07-03 12:17:41'),
(29, 'ab422b5f-63f9-4cad-b63e-7d388a690748', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"29_4\"}', NULL, '2023-07-03 12:17:44', '1', 'App\\User', '2023-06-19 18:23:10', '2023-07-03 12:17:44'),
(30, '084d2537-d0c4-45c0-957a-326180313292', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"49_4\"}', NULL, '2023-07-03 12:17:47', '1', 'App\\User', '2023-06-19 18:30:33', '2023-07-03 12:17:47'),
(31, 'eda54b30-07e4-401b-8249-f55242affd03', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"5_6\"}', NULL, '2023-07-03 12:17:49', '1', 'App\\User', '2023-06-23 11:43:12', '2023-07-03 12:17:49'),
(32, '9f43d284-e254-4091-8b1f-f190bf1847f6', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"18_8\"}', NULL, '2023-07-03 12:17:51', '1', 'App\\User', '2023-07-03 12:14:15', '2023-07-03 12:17:51'),
(33, 'ba5a0456-245d-4e07-b8c6-fbd935f2a44e', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"59_2\"}', NULL, '2023-07-05 13:17:54', '1', 'App\\User', '2023-07-04 17:12:17', '2023-07-05 13:17:54'),
(34, 'b62e6d7f-49c2-4246-be7a-53383373d3cc', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"53_4\"}', NULL, '2023-07-07 15:18:26', '1', 'App\\User', '2023-07-05 10:46:42', '2023-07-07 15:18:26'),
(35, 'f3efa203-0b76-4586-b5ba-a55c35de30c1', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"63_4\"}', NULL, '2023-07-07 15:18:31', '1', 'App\\User', '2023-07-05 13:32:13', '2023-07-07 15:18:31'),
(36, '464d083a-69ce-4e07-9237-a68ebbd104f9', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"65_4\"}', NULL, '2023-10-13 12:39:38', '1', 'App\\User', '2023-08-22 18:47:29', '2023-10-13 12:39:38'),
(37, '3b098172-1ac5-49db-8af4-d4aa7d0ed650', 'App\\Notifications\\OrderSuccessfull', '{\"data\":\"67_23\"}', NULL, '2023-10-13 12:39:40', '1', 'App\\User', '2023-09-15 14:57:01', '2023-10-13 12:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `order_pickups`
--

CREATE TABLE `order_pickups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `proof` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hendersonfhjvbj@gmail.com', '$2y$10$1xJMsTOPVph3qdVdrGrJSugz4iQqSq2ixYbqAL4UuL5luYjmcyDle', '2022-02-24 13:10:14'),
('ekholuyenthanhtai7643@gmail.com', '$2y$10$RzCegynWbe4dXqDmcqnkrOoGI8V5NecyWgbP6F3Tpyk3Q4ziGKOna', '2022-03-21 03:43:34'),
('ssnsgaksvukb@gmail.com', '$2y$10$6/iEInQmqpjCVo0Tck.VCuGt/SXkqF3Q/pWalnkqdwyJWcOnlbXBS', '2022-04-10 10:17:37'),
('brettbouillion@gmail.com', '$2y$10$ZXvfy4IehCNsImXJkVwIludL6qFBoeAQvTOtFW/CltRKmN0Nxs5fW', '2022-04-12 10:47:25'),
('cheddarball777@gmail.com', '$2y$10$DZ.def2i2oPDEvnuAbAxPeb/d9S7S7mBBBkjrDRMRw0mvff3wWn32', '2022-04-13 00:49:27'),
('jeldersr@gmail.com', '$2y$10$eTCdfvN5ZzViKzgRJ.GNpeo5G7XbPbuEhfSHJmhtJR6do0dKR1MB.', '2022-04-14 03:30:38'),
('douglasldavies@gmail.com', '$2y$10$uMZCyg/bPBxWYla4xnfQDOc1rVX5uIEkDJvK3jEePjuGFeNseWuoK', '2022-04-15 10:20:04'),
('thehanlon5@comcast.net', '$2y$10$ZiJCWP3sFuBrNyBmzzaDruQ97owdPwZJFNHS/.cE/McjSon9IAosG', '2022-04-16 02:58:41'),
('s.lee.quist@gmail.com', '$2y$10$hOEMsOcPLTF0DcX5jiLwY.jrDudDpYGWXfRVLl4mkpvhPsba9jvA2', '2022-04-16 21:36:59'),
('Ruthxxelizabethib9393@gmail.com', '$2y$10$GuHCv20qfnG5cO9k15y1B.s9SILTyg/2iuZmBEGuiwAckyN1yX0Z2', '2022-04-17 21:40:06'),
('immarylou1@gmail.com', '$2y$10$glUqPk5SligfDZnzwcTIyeV4oCKZE09MGEA4c6ygGxTWx141J7RKG', '2022-04-19 09:22:11'),
('kyungdukkim47@gmail.com', '$2y$10$K9Kk1zoJTyxnZ58jRKERBe4Fw3W6QnDsPHVbiA0bj1/5Lr9sEPCBS', '2022-04-20 01:37:45'),
('frivvioffbull@gmail.com', '$2y$10$1PIBBK51EufQ51MO76sjCOf4oNMcBlHeDHvl0vvqrMRQvxMPty86O', '2022-04-22 04:49:57'),
('vegasbeautysupply@gmail.com', '$2y$10$/XvVOsZri0kzGAG8.Ze4RuUB0rZuGiiJqRCd5lwQDjQDHIWX0RDcC', '2022-04-22 12:53:53'),
('kenya.nordass@yahoo.com', '$2y$10$R7T97YRLBHBM26pGxd5SJu8LNbiHM8vg8yckFJM4E2aJNryPM0bLS', '2022-04-24 21:50:06'),
('shondaputland@yahoo.com', '$2y$10$XkDJiSPppWzreQY6Yz7HUOoc5qksh3kcU.3ErkfDEbu/KPvlDdfwm', '2022-04-24 23:22:21'),
('munsonjoanie@yahoo.com', '$2y$10$GSLx84tLkyEKA8NYVzzazO.PA0H3BVmOkOufKAlgKgy1pQBTQWWc6', '2022-04-25 16:28:07'),
('sejxolejuz@outlook.com', '$2y$10$42EAKSguCQTB5C7JaX38OOAlf41GN38VBMtxzdGBLKJAlZRkmrG9m', '2023-10-26 11:25:16'),
('vinothkv01@yahoo.com', '$2y$10$Qm0LT.5WB0Wqw1K25AKdU.s2xynlIzUmynx9mf3GtlOPOxV9kPNye', '2023-11-14 15:22:05'),
('flintwilliam1738@yahoo.com', '$2y$10$pk.95bWPmq1BIk7ecgijy.O3fYRlMIbNE9t7CzcQGLxNz051Zvbme', '2023-11-16 22:32:24'),
('scottrebecca5828@yahoo.com', '$2y$10$KOvvENWzXttU9qKzQxgmau28hgMwvPImzQRPO9RauXP91WaebuFEy', '2023-11-18 09:30:10'),
('berry_joseph2029@yahoo.com', '$2y$10$CTKmChpZ3pC6Nr17TUzzFee4y9bMuP8RYqf.937JXLehHywflpIpO', '2023-11-22 11:17:17'),
('luispungercar1995@yahoo.com', '$2y$10$Rnjjrnix3pp8s0JnOh29RObBDOjm55tfQz815FBMwjvIp27CZ0j8y', '2023-11-22 12:03:21'),
('MichaelGarcia510881518@outlook.com', '$2y$10$T/qGQsDQE2PUmFS.TiuMZ.rPoiI.XPRXXODSyODhXbVPfQ3UPSfpi', '2023-12-06 16:00:48'),
('f90rpuycd85m@outlook.com', '$2y$10$jb6mE1PKVhfL3X6dgMg7C.NC6/Gtro8FjpaFuwR3zBuZiQXgsh6HO', '2023-12-27 02:13:35'),
('mariacc707@outlook.com', '$2y$10$IlIvTQgVZH5/lHGwNF9pAuzCZeYUL6Iaa/tmeOo7mFrAcFDDwqkNm', '2024-01-11 00:17:00'),
('YahairaLooney989@yahoo.com', '$2y$10$3wkimAgh9gk.j68M3TgLMOh2j/n8dWTB3.KVa.FyWpfz5FD1NRPMy', '2024-01-12 17:49:45'),
('uyvzyhaugy@outlook.com', '$2y$10$WjBPhScFZiyrAe7oWCPKx.PmBuOEdwzEOv20MdicdV.WgGU/NwU5m', '2024-01-12 22:58:15'),
('tofsvbdo@outlook.com', '$2y$10$gEk5LDBfDeYke4eGERcJau7k3PMoLi4KhcfHsbvWbef7B.15Z3t4a', '2024-01-16 15:21:50'),
('lhrnnbndsjbd@outlook.com', '$2y$10$mr6iRf4nASRTAE5DClrNseuXBBspwxVEWFAeqvbhzSzRDO0nJX.sO', '2024-01-19 12:30:28'),
('yaroslavkled@outlook.com', '$2y$10$c/jZ8/cfYa5W0JbDLuSFwepgep34CwjjdKKFI2jU4UTZmDIMXqAZ.', '2024-02-02 05:11:52'),
('elfriedagandy38@aol.com', '$2y$10$qJlDg.OnLDWvZ6n.NrdPX.g8SHDojFHQJJFIjvyPs28p/R1BQ1Sla', '2024-02-03 18:10:26'),
('mullenkeilb50@gmail.com', '$2y$10$oDZ2isXqWTpWS7VnoQmhMeiAsOtSb8dpeJSZ7Hudtw3q7z2/xA1OO', '2024-02-09 12:20:59'),
('lovelybrewer2002@yahoo.com', '$2y$10$1oZESd7e7pK9Oiq.ItL5ZeI0G7kK8/G/QKYByVIVLP/n4ptYrkus.', '2024-02-10 06:46:50'),
('KarmaGorham782@aol.com', '$2y$10$AcmcUVAd8yy55VvInG71XOH4hiPiaMAGe0g5kJuwhKABNu.K1wj2W', '2024-02-10 12:53:25'),
('wshaundra6eid74aw@outlook.com', '$2y$10$UTihJeBAYjmhShpLgGGOCuP8G6RjSFLkYaLWPiJ7LqpeDz3T2CbPm', '2024-02-14 16:59:32'),
('katherine66martelqj4@outlook.com', '$2y$10$hCgFTXX6SGhrs7zZsauMf.DLv6PVjSgKrJlTEGzm9rJ364ipAzUV.', '2024-02-14 17:44:01'),
('berryu1_morris3q@outlook.com', '$2y$10$oL48dEP3tyfY.k1YE26GhuR4YWrHWjJbPLj1FNbhzMspY/i2S95SS', '2024-02-15 08:37:31'),
('derrilshortha34@gmail.com', '$2y$10$TNFzGKxAlPshSd5P7Cjf..7cD9VxRMtR2LdpZLVeIOdzPyUCX9DVa', '2024-02-19 06:51:26'),
('herleisu3181@gmail.com', '$2y$10$V7kqSUWH/Xw8W.60G.42WOasLNPKyqQrYqkuk7oiXh5uu/XHW8XLK', '2024-03-02 13:24:25'),
('vildtependi0@outlook.com', '$2y$10$fK902NpCDIBtE.lqjBFRRO9y9bK0lSKm7WGsswG/DUUgbfVdWGyJ6', '2024-03-03 19:53:12'),
('beyladenma2004@gmail.com', '$2y$10$pm6MChl0NkN.LXFmyRVXQeomiPz.ndufKI20vxblcsgsTRZpR9HTa', '2024-03-05 05:37:05'),
('ebony94gracia94h@outlook.com', '$2y$10$u3BCt.vjZMVQsAuCeNp0bO3AwmulL0wJlczDtz4fKVbXv73jgNh5C', '2024-03-09 12:02:26'),
('alicewp_painterrb@outlook.com', '$2y$10$wnanPd303cRdvSwyDpFYduHEs7ntqPRbuGelcruY6zruVkeaMXcYa', '2024-03-10 14:15:45'),
('arunabharthi.k@gmail.com', '$2y$10$TbPkzXYhH2C/nLLeocRalubKUdqIDF11PpqpeHgs0FKbyhWEv7J6q', '2024-03-11 12:21:34'),
('doyle.christy1988@aol.com', '$2y$10$G4CiD.jDO3CYP4NrmLylLOA811buTxkSgGxY5QfI9q39EbGDlKHjO', '2024-03-12 05:12:03'),
('kgrahamyr2005@gmail.com', '$2y$10$s6n8utjrIGG1LXbWZkPQ0eU8DOXSwiFybPr8JR70gIyH9hv9rKJ72', '2024-03-24 12:59:34'),
('vla95azykov@outlook.com', '$2y$10$UlbVGbC2SG5U/8/wu60olOhLNB4S.SPhiPiTwrFLarLjN1RG7PMz2', '2024-03-31 10:49:10'),
('glavandab1987@gmail.com', '$2y$10$vGkT5BHkL4GTUNA2JqDfG.9rA3zEI32K0ej7TIW2UCB5jhkHGTb66', '2024-04-01 07:44:10'),
('test@mailinator.com', '$2y$10$h3K8vqpiPCFwwV8pdmeMHejoc5HdenisdZveNQqxjJhF7m/TutkaC', '2024-04-01 15:06:12'),
('elijahferbrs2@outlook.com', '$2y$10$NCFXp6GiI5WlHxpbC9ysX.uRy6Ms4u3o/3MeezVrWcMPulrfOWiT2', '2024-04-01 17:43:27'),
('sanchez.amanda3864@yahoo.com', '$2y$10$TZXEcRS9Cej5lioXveAp0OLV7vjcaD8K.B1W4n5DHOwGeRciIv6/y', '2024-04-01 17:46:24'),
('zamoragei3223@gmail.com', '$2y$10$Nk1JwUaPWHM8RL84mq/rZ.xC1E0ydnoUVYTm4FqWTXA.I/FvqvHZW', '2024-04-02 10:21:06'),
('allen_stephanie6658@yahoo.com', '$2y$10$3jbP97Ok6WjX4LuZbvhCa.jILYJNYaWukkHdGxjghoO0sAGyJamYW', '2024-04-02 15:58:38'),
('holbrook.roxana1995@yahoo.com', '$2y$10$GK39jK/vnGvCGETpjDCARuXJ1ieDg6GvzL2d7ifwP1lzNH6nQ/tgy', '2024-04-02 16:20:09'),
('ncarrollfk2199@gmail.com', '$2y$10$gNlw/bxg21DHuwJoXl1useYlgBUddrArl6Z89uM14XtfkWZB/XE/e', '2024-04-02 22:15:15'),
('daviscynthia3609@yahoo.com', '$2y$10$vC04OHKFnUgAOvT68RzqV.KxgJ5d0P2EI68Lblp1A8YsLa/1ioxma', '2024-04-07 08:06:38'),
('romanh6l2lukin@outlook.com', '$2y$10$ssnR.LYha/TqD7bOnNM5E.r.rC6aB63gHETG0gt9Fg4qy8gDxbG8K', '2024-04-07 09:50:40'),
('morganchristine1990@yahoo.com', '$2y$10$IiHIHrRD4Cnl5KAV.XAJNuNOJq71lkHZxB1p36oZbT.Ul8P3j1gEO', '2024-04-07 10:33:20'),
('krobbinsgq1126@gmail.com', '$2y$10$q8ou3PHTfhPv.JbE.JLhVO6JRa/1iSQ9zSuaM/VllX2UN5R15JXUO', '2024-04-12 04:04:58'),
('hawkins.alex4193@yahoo.com', '$2y$10$.rTkwpY0.1Un8.05oCcELOmpMi/O69RhPYyOWUSJZkB5u1YIAEXqC', '2024-04-14 08:11:57'),
('eallredjd@outlook.com', '$2y$10$udAugoejoIT3KtHRG1WCVOE3tfz7PH1OlXgB4seBIKScuV5L9ea8y', '2024-04-16 09:59:48'),
('lor.denise1998@yahoo.com', '$2y$10$qWRezewyyehZ6R23ior0euAXuM5wtsyJt36.AX0ykHQD7fO0fd5Q6', '2024-04-19 12:36:21'),
('anne_ortega5787@yahoo.com', '$2y$10$ewSNBav11vBc1VN7StYJ2.pSJH.nFp8GyGl5FcCd92iVKesEpS/ZG', '2024-04-19 23:03:12'),
('saranya@mailinator.com', '$2y$10$k48zehCaDNKW4ty0Ua.tEO82M9t8Xp/2IB03HdBLE1cHqxYxpUfoe', '2024-06-10 16:06:21'),
('raghul.babu@gmail.com', '$2y$10$PWU17JwgIHuimJPbVa27luIQlt7pBJUhAfJNIsZ2Xch4BICRZ9Qbm', '2024-08-07 03:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `duration` enum('Month','Year') NOT NULL DEFAULT 'Month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `description`, `count`, `duration`, `created_at`, `updated_at`) VALUES
(1, '1 ஆண்டு', 12, 'Month', '2024-03-07 15:12:16', '2024-04-15 11:33:31'),
(2, '3 ஆண்டு', 36, 'Month', '2024-03-07 15:14:19', '2024-04-15 11:33:22'),
(3, '10 ஆண்டு', 120, 'Month', '2024-03-08 16:20:28', '2024-04-15 11:33:13'),
(4, '5 ஆண்டு', 60, 'Month', '2024-03-11 09:31:15', '2024-04-15 11:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
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
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `thumbnail` varchar(191) NOT NULL DEFAULT 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
  `description` mediumtext DEFAULT NULL,
  `matrix1` varchar(191) DEFAULT NULL,
  `matrix2` varchar(191) DEFAULT NULL,
  `gst` double NOT NULL DEFAULT 0,
  `mrp` varchar(200) DEFAULT NULL,
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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `vendor_id`, `name`, `slug`, `thumbnail`, `description`, `matrix1`, `matrix2`, `gst`, `mrp`, `lot_number`, `average_ratings`, `ratings_count`, `nonreturnable`, `is_offer`, `is_top_selling`, `status`, `created_at`, `updated_at`, `show_in_home`) VALUES
(3, 1, 1, NULL, 'MOTHI LADDU', 'MOTHI-LADDU-850', 'IMG-20221017-WA0054-189867248-10_09_2024_01_14_pm.jpg', '<p>Sugar (51%),Chickpea Flour(26%),Ghee,Green Cardamom Powder,Refined Palm Oil,Preservatives(INS 202, INS 200)</p>', NULL, NULL, 5, '500', NULL, 0, 0, 'No', 'No', 'Yes', 'Active', '2024-10-09 07:44:12', '2024-10-09 07:47:37', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `product_authors`
--

CREATE TABLE `product_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `feature` varchar(191) NOT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) NOT NULL,
  `matrix1` varchar(191) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `matrix1`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'IMG-20221017-WA0051-1119689641-10_09_2024_01_16_pm.jpg', NULL, 1, 'Active', '2024-10-09 07:46:55', '2024-10-09 07:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `matrix1` varchar(191) DEFAULT NULL,
  `matrix2` varchar(191) DEFAULT NULL,
  `price` double NOT NULL,
  `offer_percentage` double NOT NULL DEFAULT 0,
  `offer_price` double NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `retail_price` double NOT NULL DEFAULT 0,
  `minimum_order` int(11) NOT NULL DEFAULT 1,
  `weight` varchar(200) NOT NULL DEFAULT '0',
  `inventory` int(11) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `matrix1`, `matrix2`, `price`, `offer_percentage`, `offer_price`, `start_date`, `end_date`, `retail_price`, `minimum_order`, `weight`, `inventory`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, '', '', 500, 0, 0, NULL, NULL, 0, 1, '500', 1000, 1, 'Active', '2024-10-09 07:46:39', '2024-10-09 07:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ratings` int(11) NOT NULL,
  `review` mediumtext NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `details` varchar(191) NOT NULL,
  `display_order` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `discount_percent` double(8,2) NOT NULL,
  `minimum_order` double(8,2) NOT NULL,
  `maximum_discount` double(8,2) NOT NULL,
  `budget` double(8,2) NOT NULL,
  `spent` double(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `name`, `code`, `discount_percent`, `minimum_order`, `maximum_discount`, `budget`, `spent`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'May day', '001', 10.00, 0.00, 10.00, 0.00, 0.00, '2024-05-01', '2024-05-10', 'Active', '2024-05-08 19:43:18', '2024-05-10 19:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'தமிழ்த்தேசியப் பேரியக்கம்', 'Active', '2022-02-11 01:58:51', '2022-02-11 01:59:11'),
(2, 'பன்மைவெளி', 'Active', '2022-02-11 01:58:52', '2022-02-11 01:58:52'),
(3, 'தமிழ்த்தேசியத் தமிழர் கண்ணோட்டம்', 'Active', '2022-02-11 01:59:27', '2022-02-11 01:59:27'),
(4, 'புல்லாங்குழல் பதிப்பகம்', 'Active', '2022-02-11 01:59:50', '2022-02-11 01:59:50'),
(5, 'தமிழா் தாயகம்', 'Active', '2022-02-24 15:00:45', '2022-02-24 15:00:45'),
(6, 'மெய்மை வெளியீடு', 'Active', '2023-11-08 12:29:55', '2023-11-08 12:29:55');

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
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
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

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `department_id`, `phone_number`, `actual_date_of_joining`, `date_of_incorporation_in_pf`, `date_of_birth`, `age`, `wedding_day`, `supply_zone_id`, `supply_area_id`, `number_of_active_customers`, `emergency_contact_name`, `relation`, `contact_number`, `emergency_contact_name2`, `relation2`, `contact_number2`, `pf_or_esi`, `created_at`, `updated_at`) VALUES
(33, 'JEYAPANDIAN', 21, '9842113949', '1983-07-05', '1992-01-01', '1964-06-08', '59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:42:09', '2023-07-03 12:40:30'),
(34, 'SENGUTTUVAN MOORTHY', 25, '9842913434', '1986-08-10', '1992-01-02', '1965-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:43:49', '2023-04-27 13:43:49'),
(35, 'MUTHUPANDI R', 9, '9842913949', '2004-01-25', '2006-09-01', '1979-08-02', NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:45:07', '2023-05-02 13:54:05'),
(36, 'J.PRABHU', 21, '9095013949', '2007-01-22', '2012-09-01', '1974-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:46:28', '2023-04-27 13:46:28'),
(37, 'MUTHUKUMAR NARASINGAM', 21, '9942884496', '2017-11-01', '2017-11-01', '1986-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:48:53', '2023-04-27 13:48:53'),
(38, 'VEERASUBRAMANIAN ARUMUGAM', 21, '9443015804', '2005-11-06', '2012-09-01', '1966-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:50:25', '2023-04-27 13:50:25'),
(39, 'A P KANNAN', 21, '9994107649', '2015-04-01', '2015-04-01', '1979-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:56:32', '2023-04-27 13:56:32'),
(40, 'BALAMURUGAN', 21, '7373713949', '2016-11-24', '2018-05-01', '1991-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 14:01:35', '2023-04-27 14:01:35'),
(41, 'P GANESAN', 27, '9894440030', '2016-06-04', '2017-12-01', '1989-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:20:41', '2023-04-28 07:20:41'),
(42, 'NAGESHVARAN', 9, '9698778711', '2018-02-10', '2018-04-01', '1977-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:22:55', '2023-04-28 07:22:55'),
(43, 'C SANKAR', 17, '7448395506', '2018-07-27', '2018-10-01', '1997-05-30', '26', NULL, NULL, NULL, NULL, 'CHINNAKKANNAN', 'Parent', '9698965045', 'MARY', 'Guardian', '9751940532', 'No', '2023-04-28 07:26:28', '2023-07-03 13:48:53'),
(44, 'KANNAN S', 27, '6369303198', '2021-02-01', '2021-04-01', '1999-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:29:08', '2023-05-04 12:55:09'),
(45, 'A YESURAJ', 9, '9597139163', '2015-01-04', '2019-06-01', '1990-12-18', NULL, '2019-11-03', NULL, NULL, NULL, 'ARUL SUTHA', 'Spouse', '9791235920', 'EMERANCE MARY', 'Parent', '7200304416', 'Yes', '2023-04-28 07:30:29', '2023-04-28 07:32:26'),
(46, 'SUBA SURENDIRAN', 9, '9665640012', '2018-03-05', '2018-04-01', '1963-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:37:28', '2023-04-28 07:37:28'),
(47, 'PALANIKUMAR', 17, '9788420232', '2019-08-12', '2020-01-01', '1990-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:38:53', '2023-04-28 07:38:53'),
(48, 'CHELLAPANDI', 35, '7305353870', '2020-11-11', '2021-01-01', '1993-02-03', NULL, '2021-05-17', NULL, NULL, NULL, 'C.PRIYADHASHINI', 'Spouse', '7904789647', 'K.MUTHU', 'Parent', '9790519733', 'Yes', '2023-04-28 07:40:50', '2023-05-02 13:56:05'),
(49, 'PANDIYARAJ A', 20, '9751801806', '2022-08-01', '2023-01-02', '2002-05-17', '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-04-28 07:42:38', '2023-07-06 13:13:47'),
(50, 'S MUTHURAJA', 20, '7708539670', '2022-10-06', '2022-10-06', '2002-04-21', NULL, NULL, NULL, NULL, NULL, 'MARIYAMMAL', 'Parent', '9597716390', 'THAALAMUTHU', 'Sibling', NULL, 'Yes', '2023-04-28 07:45:21', '2023-04-29 05:39:18'),
(51, 'R MURALI', 25, '9345680136', '2021-02-01', '2022-07-01', '1976-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:46:35', '2023-04-28 07:46:35'),
(52, 'PANDIYAMMAL S', 25, '9788154940', '2015-09-01', '2015-09-01', '1968-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:48:58', '2023-04-29 04:48:58'),
(53, 'RANI', 36, '9843372784', '2018-03-13', '2019-04-01', '1988-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:51:27', '2023-04-29 04:51:27'),
(54, 'PRABAVATHI', 9, '9940757877', '2018-04-01', '2018-07-01', '1990-09-16', NULL, '2015-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:56:21', '2023-04-29 04:56:21'),
(55, 'RAJALAKSHMI', 18, '9585263093', '2018-02-21', '2018-04-01', '1987-03-15', NULL, '2012-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:58:20', '2023-04-29 04:58:20'),
(56, 'MANIMALA', 9, '9003640130', '2012-01-25', '2020-02-04', '1986-01-08', NULL, '2007-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:00:08', '2023-04-29 05:00:08'),
(57, 'SONIYA', 19, '9384742459', '2021-11-13', '2022-08-04', '2001-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:01:45', '2023-04-29 05:01:45'),
(58, 'KANNAN', 35, '9629600849', '2015-09-01', '2015-09-01', '1982-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:02:45', '2023-04-29 05:02:45'),
(59, 'S.PRADEEP', 35, '8012555933', '2015-09-01', '2015-09-01', '1983-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:05:17', '2023-04-29 05:05:17'),
(60, 'M SIVAKUMAR', 35, '9087979906', '2015-12-01', '2016-12-01', '1984-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:06:10', '2023-04-29 05:06:10'),
(61, 'NAVANEETHAN', 35, '9159678689', '2019-09-21', '2019-10-01', '1991-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:08:31', '2023-04-29 05:08:31'),
(62, 'JEYAKUMAR', 35, '9047220980', '2019-12-03', '2020-07-07', '1984-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:10:41', '2023-04-29 05:10:41'),
(63, 'VINOTHKUMAR A', 35, '9965478072', '2021-02-26', '2021-07-01', '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:11:44', '2023-04-29 05:11:44'),
(64, 'KALIDOSS', 14, '9842140708', '2022-10-06', '2022-10-06', '1989-03-18', NULL, NULL, 16, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:14:17', '2023-04-29 05:14:17'),
(65, 'ANTHONY XAVIER', 35, '9940881759', '2017-11-02', '2021-01-01', '1968-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:15:33', '2023-04-29 05:15:33'),
(66, 'ARPUTHARAJ', 35, '8883139846', '2019-08-29', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:17:54', '2023-04-29 05:17:54'),
(67, 'SIVASAKTHIVEL', 35, '9943330962', '2020-01-18', '2021-01-01', '1969-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:18:52', '2023-04-29 05:18:52'),
(68, 'VINOTH', 35, '9791373892', '2019-11-24', '2021-01-01', '1992-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:19:29', '2023-04-29 05:19:29'),
(69, 'ARUNACHALAM', 35, '8012555960', '2015-04-01', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:20:08', '2023-04-29 05:20:08'),
(70, 'SUNDHARAPANDI S', 35, '8012555934', '2015-04-01', '2015-04-01', '1986-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:21:12', '2023-04-29 05:21:12'),
(71, 'NAGARAJAN S', 35, '8012555928', '2019-06-11', '2019-06-11', '1982-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:22:59', '2023-04-29 05:22:59'),
(72, 'A VIVEKANANDAN', 35, '8012555938', '2019-06-06', '2021-02-01', '1986-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:24:40', '2023-04-29 05:24:40'),
(73, 'RANJITHKUMAR', 35, '9567474621', '2022-03-15', '2022-04-01', '1988-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:25:22', '2023-04-29 05:25:22'),
(74, 'JOTHIBASU C', 14, '9843695839', '2013-01-01', '2013-01-01', '1983-04-20', NULL, NULL, 15, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:26:58', '2023-04-29 05:26:58'),
(75, 'K.CHELLAM', 14, '8870313265', '2017-06-01', '2017-06-01', '1981-07-01', NULL, NULL, 15, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:28:45', '2023-04-29 05:28:45'),
(76, 'KARTHICK B', 14, '9626653542', '2018-07-14', '2018-07-14', '1990-04-15', NULL, NULL, 15, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:31:58', '2023-04-29 05:31:58'),
(77, 'BHARATH B', 14, '8012555987', '2022-10-08', '2022-10-08', '1990-04-15', NULL, NULL, 15, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:35:12', '2023-04-29 05:35:12'),
(78, 'JEYAPRAKASH J', 14, '8012555990', '2023-01-02', '2023-01-02', '1994-04-10', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:41:57', '2023-04-29 05:41:57'),
(79, 'P RAGUNATHAN', 14, '8012555902', '2007-07-01', '2007-07-01', '1974-03-09', NULL, NULL, 14, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:43:05', '2023-04-29 05:43:05'),
(80, 'J SURESHKUMAR', 14, '8012555904', '2008-12-01', '2008-12-01', '1981-06-11', NULL, NULL, 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:05:30', '2023-04-29 06:05:30'),
(81, 'M.SEKAR', 14, '8012555945', '2011-08-10', '2011-08-10', '1981-10-11', NULL, NULL, 11, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:11', '2023-04-29 06:07:11'),
(82, 'S.MUTHUPANDI', 14, '8012555916', '2012-02-01', '2012-02-01', '1974-05-02', NULL, NULL, 10, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:57', '2023-04-29 06:07:57'),
(83, 'M.MAYILRAJ', 14, '8012555907', '2012-12-01', '2012-10-01', '1975-07-30', NULL, NULL, 10, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:08:55', '2023-04-29 06:08:55'),
(84, 'MURUGESAN', 14, '8012555927', '2012-10-01', '2012-10-01', '1962-06-10', NULL, NULL, 13, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:10:06', '2023-04-29 06:10:06'),
(85, 'P.MARIYAPPAN', 14, '8012555905', '2012-10-01', '2012-10-01', '1983-10-30', NULL, NULL, 11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:11:08', '2023-04-29 06:11:08'),
(86, 'S.PERUMAL', 14, '9843370762', '2012-10-01', '2012-10-01', '1982-02-03', NULL, NULL, 14, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:46:33', '2023-04-29 06:46:33'),
(87, 'J KANNAN', 14, '8012555941', '2014-04-01', '2014-04-01', '1973-07-04', NULL, NULL, 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:48:17', '2023-04-29 06:48:17'),
(88, 'R KASIVISWANATHAN', 14, '8012555914', '2014-04-01', '2014-04-01', '1981-04-16', NULL, NULL, 11, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:50:02', '2023-04-29 06:50:02'),
(89, 'B SATHAMUSEN', 14, '8012555924', '2014-04-01', '2014-04-01', '1992-07-29', NULL, NULL, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:51:36', '2023-04-29 06:51:36'),
(90, 'BALAVENUGOPAL V', 14, '8012555926', '2015-04-01', '2015-04-01', '1972-05-12', NULL, NULL, 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:21:20', '2023-04-29 07:21:20'),
(91, 'RAMESH D', 14, '8012555964', '2015-04-01', '2015-04-01', '1978-01-21', NULL, NULL, 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:22:18', '2023-05-04 12:39:55'),
(92, 'RAVINDRAN M', 14, '8012555970', '2015-04-01', '2015-04-01', '1974-05-02', NULL, NULL, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:23:13', '2023-04-29 07:23:13'),
(93, 'MANIKANDAN K R', 14, '8012555985', '2015-04-01', '2015-04-01', '1980-01-07', NULL, NULL, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:24:55', '2023-04-29 07:24:55'),
(94, 'RAJA M', 14, '8012555994', '2015-04-01', '2015-04-01', '1983-10-13', NULL, NULL, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:28:19', '2023-04-29 07:28:19'),
(95, 'KADHARMYDEEN R', 14, '8012555981', '2015-04-01', '2015-04-01', '1983-04-24', NULL, NULL, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:31:31', '2023-04-29 07:31:31'),
(96, 'MAHALINGAM', 14, '8012555979', '2015-04-01', '2015-04-01', '1977-07-19', NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:32:25', '2023-04-29 07:32:25'),
(97, 'RAMACHANDRAN', 14, '8012555977', '2015-04-01', '2015-04-01', '1984-05-10', NULL, NULL, 13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:33:20', '2023-04-29 07:33:20'),
(98, 'C.NALLENDRAKUMAR', 14, '8012555983', '2015-12-01', '2015-12-01', '1988-06-28', NULL, NULL, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:34:17', '2023-04-29 07:34:17'),
(99, 'V.VIJAY', 14, '8012555953', '2015-12-01', '2015-12-01', '1986-07-01', NULL, NULL, 12, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:35:22', '2023-04-29 07:35:22'),
(100, 'R.MUTHU', 14, '8012555995', '2015-12-01', '2015-12-01', '1973-02-22', NULL, NULL, 10, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:37:19', '2023-04-29 07:37:19'),
(101, 'M.VINOTH', 14, '8012555943', '2015-12-01', '2015-12-01', '1989-04-14', NULL, NULL, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:05', '2023-04-29 07:38:05'),
(102, 'KAMATCHI', 14, '8012555912', '2019-03-01', '2019-03-01', '1979-04-05', NULL, NULL, 14, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:48', '2023-04-29 07:38:48'),
(103, 'SATHISHKUMAR C', 14, '8012555909', '2012-10-01', '2019-06-01', '1986-06-15', NULL, NULL, 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:39:50', '2023-04-29 07:39:50'),
(104, 'ABDHULLAH', 14, '8012555923', '2019-12-01', '2019-07-01', '1981-01-10', NULL, NULL, 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:40:36', '2023-04-29 07:40:36'),
(105, 'ALAGESAN', 14, '8012555993', '2021-07-01', '2021-07-01', '1983-03-15', NULL, NULL, 12, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:41:23', '2023-04-29 07:41:23'),
(106, 'S BALAMURUGAN', 14, '8012555992', '2021-07-01', '2021-07-01', '1995-09-29', '28', NULL, 11, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:42:48', '2023-07-05 06:20:07'),
(107, 'MADURAIVEERAN', 14, '8012555930', '2021-07-01', '2021-07-01', '1981-12-26', NULL, NULL, 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:44:24', '2023-04-29 07:44:24'),
(108, 'KURUMBAN', 14, '8012555910', '2021-07-01', '2021-11-01', '1989-06-01', NULL, NULL, 10, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:45:27', '2023-04-29 07:45:27'),
(109, 'C.RAMALINGAM', 14, '8012555921', '2021-08-01', '2022-07-01', '1976-02-12', NULL, NULL, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:46:16', '2023-04-29 07:46:16'),
(110, 'BOOMINATHAN', 14, '8012555982', '2022-10-06', '2022-10-06', '1974-05-11', NULL, NULL, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:47:00', '2023-04-29 07:47:00'),
(111, 'RAVICHANDRAN', 14, '8012555936', '2022-10-06', '2022-10-06', '1980-01-10', NULL, NULL, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:48:09', '2023-04-29 07:48:09'),
(112, 'DURAI', 14, '8012555908', '2022-11-05', '2022-11-05', '1986-05-23', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:00', '2023-04-29 07:50:00'),
(113, 'SARAVANAKUMAR', 14, '8012555980', '2023-01-02', '2023-01-02', '1977-07-31', NULL, NULL, 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:41', '2023-04-29 07:50:41'),
(114, 'DAYANA', 20, '8438073809', '2019-03-12', '2023-04-01', '1995-05-10', NULL, '2022-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:37:23', '2023-04-29 08:37:23'),
(115, 'PRIYADHARSHINI', 16, '8189877959', '2017-04-17', '2023-04-01', '1999-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:38:41', '2023-04-29 08:38:41'),
(116, 'R VIJAY', 14, '9843604701', '2015-04-11', '2015-04-01', '1983-05-06', NULL, NULL, 16, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:33:55', '2023-05-02 05:33:55'),
(117, 'NITHISHKUMAR R', 14, '8012555989', '2023-01-02', '2023-01-02', '1994-05-11', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:35:06', '2023-05-02 05:35:06'),
(120, 'RATHIDEVI SENTHILKUMAR', 9, '9942103199', '1994-01-01', '2020-10-01', '1980-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-03 08:54:50', '2023-05-03 08:54:50'),
(161, 'DEVA', 26, '8122660503', '2003-05-03', NULL, '1980-05-25', '41', '2009-02-03', NULL, NULL, NULL, 'T SARITHA', 'Spouse', '7358864420', 'M SALAIMUTHAIAH', 'Parent', '7200764428', 'No', '2023-05-29 04:58:51', '2023-05-29 04:58:51'),
(162, 'N RAJANGAM', 26, '9600087024', '2023-02-18', NULL, '1953-02-16', '70', '1978-06-28', NULL, NULL, NULL, 'R VIJAYALAKSHMI', 'Spouse', '6380709820', 'R MANIKANDAN', 'Sibling', '8754573434', 'No', '2023-05-29 05:01:41', '2023-05-29 05:01:41'),
(163, 'M PRIYANKA', 18, '9500561227', '2023-02-15', NULL, '1994-06-12', '29', '2012-09-26', NULL, NULL, NULL, 'B MARIMUTHU', 'Spouse', '9500777146', 'M KARTHICK RAJA', 'Sibling', '7530008449', 'No', '2023-05-29 05:10:35', '2023-05-29 05:10:35'),
(164, 'Manasvini @ Meenakshi.B', 18, '8438448434', '2023-01-23', NULL, '1997-06-12', '26', '2021-09-10', NULL, NULL, NULL, 'N PRAKASH', 'Spouse', '7010095940', 'B RAMALAKSHMI', 'Parent', '8072841517', 'No', '2023-05-29 05:13:01', '2023-05-29 05:13:01'),
(165, 'S ABIRAMI', 19, '9514086284', '2023-02-27', NULL, '1999-08-26', '24', '2022-04-06', NULL, NULL, NULL, 'M SARAVANAN', 'Spouse', '7418858074', 'SARANYA', 'Friend', '9176207368', 'No', '2023-05-29 05:17:09', '2023-05-29 05:17:09'),
(166, 'M MUTHULAKSHMI', 18, '8220773555', '2023-04-26', NULL, '2001-04-30', '22', '2020-10-29', NULL, NULL, NULL, 'M VINOTH', 'Spouse', '8438285350', 'M KASTHURI', 'Parent', '9655124575', 'No', '2023-05-29 05:43:18', '2023-05-29 05:43:18'),
(167, 'AMIRTHA', 38, '7200658808', '2023-03-23', NULL, '2003-01-28', '20', NULL, NULL, NULL, NULL, 'MALARVIZHI', 'Parent', '9363471863', 'PALANISAMY', 'Parent', '6374552344', 'No', '2023-06-01 05:56:17', '2023-06-07 11:21:54'),
(168, 'ARCHANA', 16, '8438075700', '2023-05-08', NULL, '2002-07-15', '21', '2023-01-23', NULL, NULL, NULL, 'AJITHKUMAR', 'Spouse', '8012555942', 'CHELLAM', 'Sibling', '8012938291', 'No', '2023-06-01 06:04:06', '2023-06-01 06:09:21'),
(169, 'ATHIRSTALAKSHMI A', 18, '9514475543', '2023-05-27', NULL, '1997-03-12', '26', '2022-04-06', NULL, NULL, NULL, 'SANKAR', 'Spouse', '8608600572', 'ASURAJAN', 'Parent', '9994575543', 'No', '2023-06-01 08:05:32', '2023-06-01 08:05:32'),
(170, 'AJITHKUMAR', 19, '9524754969', '2023-03-06', NULL, '1996-09-30', '27', '2023-01-23', NULL, NULL, NULL, 'ARCHANA', 'Spouse', '8438075700', 'CHELLAM', 'Parent', '8012938291', 'No', '2023-06-01 08:09:53', '2023-06-01 08:09:53'),
(171, 'SAJITHARANI', 16, '9092043173', '2023-03-20', NULL, '1985-05-20', '38', NULL, NULL, NULL, NULL, 'ABITHA', 'Sibling', '9003593173', NULL, NULL, NULL, 'No', '2023-06-01 08:15:12', '2023-06-01 08:15:12'),
(172, 'PANDIYARAJ', 26, '9787147604', '2018-05-16', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:30:05', '2023-06-01 08:30:05'),
(173, 'KARUPPASAMY', 24, '9942656271', '2022-06-04', NULL, '1980-07-10', '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:33:28', '2023-06-01 08:33:28'),
(174, 'SURESHKUMAR', 24, '8870827284', '2022-03-05', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:37:53', '2023-06-01 08:37:53'),
(175, 'KARTHIKEYAN', 24, '9787020716', '2023-04-01', NULL, '1981-11-17', '42', '2017-11-23', NULL, NULL, NULL, 'K KALEESWARI', 'Spouse', '7502342825', 'A UMAVATHI', 'Parent', '9943338865', 'No', '2023-06-01 08:39:38', '2023-06-01 09:06:17'),
(176, 'ALAGUPANDI', 14, '8012555925', '2022-07-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:41:37', '2023-06-01 08:41:37'),
(177, 'SELVARAJ', 14, '8012555940', '2015-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:43:53', '2023-06-01 08:43:53'),
(178, 'GANESAN', 14, '9442032239', '2018-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:45:05', '2023-06-01 08:45:05'),
(179, 'Dhanapakiam', 32, '1234567890', '0001-01-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:47:06', '2023-06-01 08:47:06'),
(180, 'MARIAMMAL', 32, '9940823540', '2015-07-06', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:48:11', '2023-06-01 08:48:11'),
(181, 'PAPPA', 32, '6385229518', '2014-06-02', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:49:35', '2023-06-01 08:49:35'),
(182, 'MURUGAN', 32, '9367740105', '2014-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:50:56', '2023-06-01 08:50:56'),
(183, 'GUNA', 27, '8012555971', '2023-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:13:56', '2023-06-02 13:13:56'),
(184, 'THILAGAR', 27, '8012555918', '2023-05-23', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:15:24', '2023-06-02 13:15:24'),
(33, 'JEYAPANDIAN', 21, '9842113949', '1983-07-05', '1992-01-01', '1964-06-08', '59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:42:09', '2023-07-03 12:40:30'),
(34, 'SENGUTTUVAN MOORTHY', 25, '9842913434', '1986-08-10', '1992-01-02', '1965-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:43:49', '2023-04-27 13:43:49'),
(35, 'MUTHUPANDI R', 9, '9842913949', '2004-01-25', '2006-09-01', '1979-08-02', NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:45:07', '2023-05-02 13:54:05'),
(36, 'J.PRABHU', 21, '9095013949', '2007-01-22', '2012-09-01', '1974-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:46:28', '2023-04-27 13:46:28'),
(37, 'MUTHUKUMAR NARASINGAM', 21, '9942884496', '2017-11-01', '2017-11-01', '1986-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:48:53', '2023-04-27 13:48:53'),
(38, 'VEERASUBRAMANIAN ARUMUGAM', 21, '9443015804', '2005-11-06', '2012-09-01', '1966-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:50:25', '2023-04-27 13:50:25'),
(39, 'A P KANNAN', 21, '9994107649', '2015-04-01', '2015-04-01', '1979-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:56:32', '2023-04-27 13:56:32'),
(40, 'BALAMURUGAN', 21, '7373713949', '2016-11-24', '2018-05-01', '1991-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 14:01:35', '2023-04-27 14:01:35'),
(41, 'P GANESAN', 27, '9894440030', '2016-06-04', '2017-12-01', '1989-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:20:41', '2023-04-28 07:20:41'),
(42, 'NAGESHVARAN', 9, '9698778711', '2018-02-10', '2018-04-01', '1977-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:22:55', '2023-04-28 07:22:55'),
(43, 'C SANKAR', 17, '7448395506', '2018-07-27', '2018-10-01', '1997-05-30', '26', NULL, NULL, NULL, NULL, 'CHINNAKKANNAN', 'Parent', '9698965045', 'MARY', 'Guardian', '9751940532', 'No', '2023-04-28 07:26:28', '2023-07-03 13:48:53'),
(44, 'KANNAN S', 27, '6369303198', '2021-02-01', '2021-04-01', '1999-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:29:08', '2023-05-04 12:55:09'),
(45, 'A YESURAJ', 9, '9597139163', '2015-01-04', '2019-06-01', '1990-12-18', NULL, '2019-11-03', NULL, NULL, NULL, 'ARUL SUTHA', 'Spouse', '9791235920', 'EMERANCE MARY', 'Parent', '7200304416', 'Yes', '2023-04-28 07:30:29', '2023-04-28 07:32:26'),
(46, 'SUBA SURENDIRAN', 9, '9665640012', '2018-03-05', '2018-04-01', '1963-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:37:28', '2023-04-28 07:37:28'),
(47, 'PALANIKUMAR', 17, '9788420232', '2019-08-12', '2020-01-01', '1990-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:38:53', '2023-04-28 07:38:53'),
(48, 'CHELLAPANDI', 35, '7305353870', '2020-11-11', '2021-01-01', '1993-02-03', NULL, '2021-05-17', NULL, NULL, NULL, 'C.PRIYADHASHINI', 'Spouse', '7904789647', 'K.MUTHU', 'Parent', '9790519733', 'Yes', '2023-04-28 07:40:50', '2023-05-02 13:56:05'),
(49, 'PANDIYARAJ A', 20, '9751801806', '2022-08-01', '2023-01-02', '2002-05-17', '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-04-28 07:42:38', '2023-07-06 13:13:47'),
(50, 'S MUTHURAJA', 20, '7708539670', '2022-10-06', '2022-10-06', '2002-04-21', NULL, NULL, NULL, NULL, NULL, 'MARIYAMMAL', 'Parent', '9597716390', 'THAALAMUTHU', 'Sibling', NULL, 'Yes', '2023-04-28 07:45:21', '2023-04-29 05:39:18'),
(51, 'R MURALI', 25, '9345680136', '2021-02-01', '2022-07-01', '1976-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:46:35', '2023-04-28 07:46:35'),
(52, 'PANDIYAMMAL S', 25, '9788154940', '2015-09-01', '2015-09-01', '1968-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:48:58', '2023-04-29 04:48:58'),
(53, 'RANI', 36, '9843372784', '2018-03-13', '2019-04-01', '1988-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:51:27', '2023-04-29 04:51:27'),
(54, 'PRABAVATHI', 9, '9940757877', '2018-04-01', '2018-07-01', '1990-09-16', NULL, '2015-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:56:21', '2023-04-29 04:56:21'),
(55, 'RAJALAKSHMI', 18, '9585263093', '2018-02-21', '2018-04-01', '1987-03-15', NULL, '2012-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:58:20', '2023-04-29 04:58:20'),
(56, 'MANIMALA', 9, '9003640130', '2012-01-25', '2020-02-04', '1986-01-08', NULL, '2007-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:00:08', '2023-04-29 05:00:08'),
(57, 'SONIYA', 19, '9384742459', '2021-11-13', '2022-08-04', '2001-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:01:45', '2023-04-29 05:01:45'),
(58, 'KANNAN', 35, '9629600849', '2015-09-01', '2015-09-01', '1982-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:02:45', '2023-04-29 05:02:45'),
(59, 'S.PRADEEP', 35, '8012555933', '2015-09-01', '2015-09-01', '1983-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:05:17', '2023-04-29 05:05:17'),
(60, 'M SIVAKUMAR', 35, '9087979906', '2015-12-01', '2016-12-01', '1984-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:06:10', '2023-04-29 05:06:10'),
(61, 'NAVANEETHAN', 35, '9159678689', '2019-09-21', '2019-10-01', '1991-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:08:31', '2023-04-29 05:08:31'),
(62, 'JEYAKUMAR', 35, '9047220980', '2019-12-03', '2020-07-07', '1984-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:10:41', '2023-04-29 05:10:41'),
(63, 'VINOTHKUMAR A', 35, '9965478072', '2021-02-26', '2021-07-01', '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:11:44', '2023-04-29 05:11:44'),
(64, 'KALIDOSS', 14, '9842140708', '2022-10-06', '2022-10-06', '1989-03-18', NULL, NULL, 16, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:14:17', '2023-04-29 05:14:17'),
(65, 'ANTHONY XAVIER', 35, '9940881759', '2017-11-02', '2021-01-01', '1968-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:15:33', '2023-04-29 05:15:33'),
(66, 'ARPUTHARAJ', 35, '8883139846', '2019-08-29', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:17:54', '2023-04-29 05:17:54'),
(67, 'SIVASAKTHIVEL', 35, '9943330962', '2020-01-18', '2021-01-01', '1969-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:18:52', '2023-04-29 05:18:52'),
(68, 'VINOTH', 35, '9791373892', '2019-11-24', '2021-01-01', '1992-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:19:29', '2023-04-29 05:19:29'),
(69, 'ARUNACHALAM', 35, '8012555960', '2015-04-01', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:20:08', '2023-04-29 05:20:08'),
(70, 'SUNDHARAPANDI S', 35, '8012555934', '2015-04-01', '2015-04-01', '1986-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:21:12', '2023-04-29 05:21:12'),
(71, 'NAGARAJAN S', 35, '8012555928', '2019-06-11', '2019-06-11', '1982-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:22:59', '2023-04-29 05:22:59'),
(72, 'A VIVEKANANDAN', 35, '8012555938', '2019-06-06', '2021-02-01', '1986-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:24:40', '2023-04-29 05:24:40'),
(73, 'RANJITHKUMAR', 35, '9567474621', '2022-03-15', '2022-04-01', '1988-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:25:22', '2023-04-29 05:25:22'),
(74, 'JOTHIBASU C', 14, '9843695839', '2013-01-01', '2013-01-01', '1983-04-20', NULL, NULL, 15, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:26:58', '2023-04-29 05:26:58'),
(75, 'K.CHELLAM', 14, '8870313265', '2017-06-01', '2017-06-01', '1981-07-01', NULL, NULL, 15, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:28:45', '2023-04-29 05:28:45'),
(76, 'KARTHICK B', 14, '9626653542', '2018-07-14', '2018-07-14', '1990-04-15', NULL, NULL, 15, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:31:58', '2023-04-29 05:31:58'),
(77, 'BHARATH B', 14, '8012555987', '2022-10-08', '2022-10-08', '1990-04-15', NULL, NULL, 15, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:35:12', '2023-04-29 05:35:12'),
(78, 'JEYAPRAKASH J', 14, '8012555990', '2023-01-02', '2023-01-02', '1994-04-10', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:41:57', '2023-04-29 05:41:57'),
(79, 'P RAGUNATHAN', 14, '8012555902', '2007-07-01', '2007-07-01', '1974-03-09', NULL, NULL, 14, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:43:05', '2023-04-29 05:43:05'),
(80, 'J SURESHKUMAR', 14, '8012555904', '2008-12-01', '2008-12-01', '1981-06-11', NULL, NULL, 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:05:30', '2023-04-29 06:05:30'),
(81, 'M.SEKAR', 14, '8012555945', '2011-08-10', '2011-08-10', '1981-10-11', NULL, NULL, 11, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:11', '2023-04-29 06:07:11'),
(82, 'S.MUTHUPANDI', 14, '8012555916', '2012-02-01', '2012-02-01', '1974-05-02', NULL, NULL, 10, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:57', '2023-04-29 06:07:57'),
(83, 'M.MAYILRAJ', 14, '8012555907', '2012-12-01', '2012-10-01', '1975-07-30', NULL, NULL, 10, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:08:55', '2023-04-29 06:08:55'),
(84, 'MURUGESAN', 14, '8012555927', '2012-10-01', '2012-10-01', '1962-06-10', NULL, NULL, 13, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:10:06', '2023-04-29 06:10:06'),
(85, 'P.MARIYAPPAN', 14, '8012555905', '2012-10-01', '2012-10-01', '1983-10-30', NULL, NULL, 11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:11:08', '2023-04-29 06:11:08'),
(86, 'S.PERUMAL', 14, '9843370762', '2012-10-01', '2012-10-01', '1982-02-03', NULL, NULL, 14, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:46:33', '2023-04-29 06:46:33'),
(87, 'J KANNAN', 14, '8012555941', '2014-04-01', '2014-04-01', '1973-07-04', NULL, NULL, 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:48:17', '2023-04-29 06:48:17'),
(88, 'R KASIVISWANATHAN', 14, '8012555914', '2014-04-01', '2014-04-01', '1981-04-16', NULL, NULL, 11, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:50:02', '2023-04-29 06:50:02'),
(89, 'B SATHAMUSEN', 14, '8012555924', '2014-04-01', '2014-04-01', '1992-07-29', NULL, NULL, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:51:36', '2023-04-29 06:51:36'),
(90, 'BALAVENUGOPAL V', 14, '8012555926', '2015-04-01', '2015-04-01', '1972-05-12', NULL, NULL, 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:21:20', '2023-04-29 07:21:20'),
(91, 'RAMESH D', 14, '8012555964', '2015-04-01', '2015-04-01', '1978-01-21', NULL, NULL, 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:22:18', '2023-05-04 12:39:55'),
(92, 'RAVINDRAN M', 14, '8012555970', '2015-04-01', '2015-04-01', '1974-05-02', NULL, NULL, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:23:13', '2023-04-29 07:23:13'),
(93, 'MANIKANDAN K R', 14, '8012555985', '2015-04-01', '2015-04-01', '1980-01-07', NULL, NULL, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:24:55', '2023-04-29 07:24:55'),
(94, 'RAJA M', 14, '8012555994', '2015-04-01', '2015-04-01', '1983-10-13', NULL, NULL, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:28:19', '2023-04-29 07:28:19'),
(95, 'KADHARMYDEEN R', 14, '8012555981', '2015-04-01', '2015-04-01', '1983-04-24', NULL, NULL, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:31:31', '2023-04-29 07:31:31'),
(96, 'MAHALINGAM', 14, '8012555979', '2015-04-01', '2015-04-01', '1977-07-19', NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:32:25', '2023-04-29 07:32:25'),
(97, 'RAMACHANDRAN', 14, '8012555977', '2015-04-01', '2015-04-01', '1984-05-10', NULL, NULL, 13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:33:20', '2023-04-29 07:33:20'),
(98, 'C.NALLENDRAKUMAR', 14, '8012555983', '2015-12-01', '2015-12-01', '1988-06-28', NULL, NULL, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:34:17', '2023-04-29 07:34:17'),
(99, 'V.VIJAY', 14, '8012555953', '2015-12-01', '2015-12-01', '1986-07-01', NULL, NULL, 12, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:35:22', '2023-04-29 07:35:22'),
(100, 'R.MUTHU', 14, '8012555995', '2015-12-01', '2015-12-01', '1973-02-22', NULL, NULL, 10, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:37:19', '2023-04-29 07:37:19'),
(101, 'M.VINOTH', 14, '8012555943', '2015-12-01', '2015-12-01', '1989-04-14', NULL, NULL, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:05', '2023-04-29 07:38:05'),
(102, 'KAMATCHI', 14, '8012555912', '2019-03-01', '2019-03-01', '1979-04-05', NULL, NULL, 14, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:48', '2023-04-29 07:38:48'),
(103, 'SATHISHKUMAR C', 14, '8012555909', '2012-10-01', '2019-06-01', '1986-06-15', NULL, NULL, 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:39:50', '2023-04-29 07:39:50'),
(104, 'ABDHULLAH', 14, '8012555923', '2019-12-01', '2019-07-01', '1981-01-10', NULL, NULL, 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:40:36', '2023-04-29 07:40:36'),
(105, 'ALAGESAN', 14, '8012555993', '2021-07-01', '2021-07-01', '1983-03-15', NULL, NULL, 12, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:41:23', '2023-04-29 07:41:23'),
(106, 'S BALAMURUGAN', 14, '8012555992', '2021-07-01', '2021-07-01', '1995-09-29', '28', NULL, 11, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:42:48', '2023-07-05 06:20:07'),
(107, 'MADURAIVEERAN', 14, '8012555930', '2021-07-01', '2021-07-01', '1981-12-26', NULL, NULL, 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:44:24', '2023-04-29 07:44:24'),
(108, 'KURUMBAN', 14, '8012555910', '2021-07-01', '2021-11-01', '1989-06-01', NULL, NULL, 10, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:45:27', '2023-04-29 07:45:27'),
(109, 'C.RAMALINGAM', 14, '8012555921', '2021-08-01', '2022-07-01', '1976-02-12', NULL, NULL, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:46:16', '2023-04-29 07:46:16'),
(110, 'BOOMINATHAN', 14, '8012555982', '2022-10-06', '2022-10-06', '1974-05-11', NULL, NULL, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:47:00', '2023-04-29 07:47:00'),
(111, 'RAVICHANDRAN', 14, '8012555936', '2022-10-06', '2022-10-06', '1980-01-10', NULL, NULL, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:48:09', '2023-04-29 07:48:09'),
(112, 'DURAI', 14, '8012555908', '2022-11-05', '2022-11-05', '1986-05-23', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:00', '2023-04-29 07:50:00'),
(113, 'SARAVANAKUMAR', 14, '8012555980', '2023-01-02', '2023-01-02', '1977-07-31', NULL, NULL, 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:41', '2023-04-29 07:50:41'),
(114, 'DAYANA', 20, '8438073809', '2019-03-12', '2023-04-01', '1995-05-10', NULL, '2022-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:37:23', '2023-04-29 08:37:23'),
(115, 'PRIYADHARSHINI', 16, '8189877959', '2017-04-17', '2023-04-01', '1999-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:38:41', '2023-04-29 08:38:41'),
(116, 'R VIJAY', 14, '9843604701', '2015-04-11', '2015-04-01', '1983-05-06', NULL, NULL, 16, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:33:55', '2023-05-02 05:33:55'),
(117, 'NITHISHKUMAR R', 14, '8012555989', '2023-01-02', '2023-01-02', '1994-05-11', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:35:06', '2023-05-02 05:35:06'),
(120, 'RATHIDEVI SENTHILKUMAR', 9, '9942103199', '1994-01-01', '2020-10-01', '1980-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-03 08:54:50', '2023-05-03 08:54:50'),
(161, 'DEVA', 26, '8122660503', '2003-05-03', NULL, '1980-05-25', '41', '2009-02-03', NULL, NULL, NULL, 'T SARITHA', 'Spouse', '7358864420', 'M SALAIMUTHAIAH', 'Parent', '7200764428', 'No', '2023-05-29 04:58:51', '2023-05-29 04:58:51'),
(162, 'N RAJANGAM', 26, '9600087024', '2023-02-18', NULL, '1953-02-16', '70', '1978-06-28', NULL, NULL, NULL, 'R VIJAYALAKSHMI', 'Spouse', '6380709820', 'R MANIKANDAN', 'Sibling', '8754573434', 'No', '2023-05-29 05:01:41', '2023-05-29 05:01:41'),
(163, 'M PRIYANKA', 18, '9500561227', '2023-02-15', NULL, '1994-06-12', '29', '2012-09-26', NULL, NULL, NULL, 'B MARIMUTHU', 'Spouse', '9500777146', 'M KARTHICK RAJA', 'Sibling', '7530008449', 'No', '2023-05-29 05:10:35', '2023-05-29 05:10:35'),
(164, 'Manasvini @ Meenakshi.B', 18, '8438448434', '2023-01-23', NULL, '1997-06-12', '26', '2021-09-10', NULL, NULL, NULL, 'N PRAKASH', 'Spouse', '7010095940', 'B RAMALAKSHMI', 'Parent', '8072841517', 'No', '2023-05-29 05:13:01', '2023-05-29 05:13:01'),
(165, 'S ABIRAMI', 19, '9514086284', '2023-02-27', NULL, '1999-08-26', '24', '2022-04-06', NULL, NULL, NULL, 'M SARAVANAN', 'Spouse', '7418858074', 'SARANYA', 'Friend', '9176207368', 'No', '2023-05-29 05:17:09', '2023-05-29 05:17:09'),
(166, 'M MUTHULAKSHMI', 18, '8220773555', '2023-04-26', NULL, '2001-04-30', '22', '2020-10-29', NULL, NULL, NULL, 'M VINOTH', 'Spouse', '8438285350', 'M KASTHURI', 'Parent', '9655124575', 'No', '2023-05-29 05:43:18', '2023-05-29 05:43:18'),
(167, 'AMIRTHA', 38, '7200658808', '2023-03-23', NULL, '2003-01-28', '20', NULL, NULL, NULL, NULL, 'MALARVIZHI', 'Parent', '9363471863', 'PALANISAMY', 'Parent', '6374552344', 'No', '2023-06-01 05:56:17', '2023-06-07 11:21:54'),
(168, 'ARCHANA', 16, '8438075700', '2023-05-08', NULL, '2002-07-15', '21', '2023-01-23', NULL, NULL, NULL, 'AJITHKUMAR', 'Spouse', '8012555942', 'CHELLAM', 'Sibling', '8012938291', 'No', '2023-06-01 06:04:06', '2023-06-01 06:09:21'),
(169, 'ATHIRSTALAKSHMI A', 18, '9514475543', '2023-05-27', NULL, '1997-03-12', '26', '2022-04-06', NULL, NULL, NULL, 'SANKAR', 'Spouse', '8608600572', 'ASURAJAN', 'Parent', '9994575543', 'No', '2023-06-01 08:05:32', '2023-06-01 08:05:32'),
(170, 'AJITHKUMAR', 19, '9524754969', '2023-03-06', NULL, '1996-09-30', '27', '2023-01-23', NULL, NULL, NULL, 'ARCHANA', 'Spouse', '8438075700', 'CHELLAM', 'Parent', '8012938291', 'No', '2023-06-01 08:09:53', '2023-06-01 08:09:53'),
(171, 'SAJITHARANI', 16, '9092043173', '2023-03-20', NULL, '1985-05-20', '38', NULL, NULL, NULL, NULL, 'ABITHA', 'Sibling', '9003593173', NULL, NULL, NULL, 'No', '2023-06-01 08:15:12', '2023-06-01 08:15:12'),
(172, 'PANDIYARAJ', 26, '9787147604', '2018-05-16', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:30:05', '2023-06-01 08:30:05'),
(173, 'KARUPPASAMY', 24, '9942656271', '2022-06-04', NULL, '1980-07-10', '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:33:28', '2023-06-01 08:33:28'),
(174, 'SURESHKUMAR', 24, '8870827284', '2022-03-05', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:37:53', '2023-06-01 08:37:53'),
(175, 'KARTHIKEYAN', 24, '9787020716', '2023-04-01', NULL, '1981-11-17', '42', '2017-11-23', NULL, NULL, NULL, 'K KALEESWARI', 'Spouse', '7502342825', 'A UMAVATHI', 'Parent', '9943338865', 'No', '2023-06-01 08:39:38', '2023-06-01 09:06:17'),
(176, 'ALAGUPANDI', 14, '8012555925', '2022-07-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:41:37', '2023-06-01 08:41:37'),
(177, 'SELVARAJ', 14, '8012555940', '2015-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:43:53', '2023-06-01 08:43:53'),
(178, 'GANESAN', 14, '9442032239', '2018-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:45:05', '2023-06-01 08:45:05'),
(179, 'Dhanapakiam', 32, '1234567890', '0001-01-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:47:06', '2023-06-01 08:47:06'),
(180, 'MARIAMMAL', 32, '9940823540', '2015-07-06', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:48:11', '2023-06-01 08:48:11'),
(181, 'PAPPA', 32, '6385229518', '2014-06-02', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:49:35', '2023-06-01 08:49:35'),
(182, 'MURUGAN', 32, '9367740105', '2014-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:50:56', '2023-06-01 08:50:56'),
(183, 'GUNA', 27, '8012555971', '2023-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:13:56', '2023-06-02 13:13:56'),
(184, 'THILAGAR', 27, '8012555918', '2023-05-23', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:15:24', '2023-06-02 13:15:24'),
(33, 'JEYAPANDIAN', 21, '9842113949', '1983-07-05', '1992-01-01', '1964-06-08', '59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:42:09', '2023-07-03 12:40:30'),
(34, 'SENGUTTUVAN MOORTHY', 25, '9842913434', '1986-08-10', '1992-01-02', '1965-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:43:49', '2023-04-27 13:43:49'),
(35, 'MUTHUPANDI R', 9, '9842913949', '2004-01-25', '2006-09-01', '1979-08-02', NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:45:07', '2023-05-02 13:54:05'),
(36, 'J.PRABHU', 21, '9095013949', '2007-01-22', '2012-09-01', '1974-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:46:28', '2023-04-27 13:46:28'),
(37, 'MUTHUKUMAR NARASINGAM', 21, '9942884496', '2017-11-01', '2017-11-01', '1986-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:48:53', '2023-04-27 13:48:53'),
(38, 'VEERASUBRAMANIAN ARUMUGAM', 21, '9443015804', '2005-11-06', '2012-09-01', '1966-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:50:25', '2023-04-27 13:50:25'),
(39, 'A P KANNAN', 21, '9994107649', '2015-04-01', '2015-04-01', '1979-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:56:32', '2023-04-27 13:56:32'),
(40, 'BALAMURUGAN', 21, '7373713949', '2016-11-24', '2018-05-01', '1991-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 14:01:35', '2023-04-27 14:01:35'),
(41, 'P GANESAN', 27, '9894440030', '2016-06-04', '2017-12-01', '1989-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:20:41', '2023-04-28 07:20:41'),
(42, 'NAGESHVARAN', 9, '9698778711', '2018-02-10', '2018-04-01', '1977-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:22:55', '2023-04-28 07:22:55'),
(43, 'C SANKAR', 17, '7448395506', '2018-07-27', '2018-10-01', '1997-05-30', '26', NULL, NULL, NULL, NULL, 'CHINNAKKANNAN', 'Parent', '9698965045', 'MARY', 'Guardian', '9751940532', 'No', '2023-04-28 07:26:28', '2023-07-03 13:48:53'),
(44, 'KANNAN S', 27, '6369303198', '2021-02-01', '2021-04-01', '1999-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:29:08', '2023-05-04 12:55:09'),
(45, 'A YESURAJ', 9, '9597139163', '2015-01-04', '2019-06-01', '1990-12-18', NULL, '2019-11-03', NULL, NULL, NULL, 'ARUL SUTHA', 'Spouse', '9791235920', 'EMERANCE MARY', 'Parent', '7200304416', 'Yes', '2023-04-28 07:30:29', '2023-04-28 07:32:26'),
(46, 'SUBA SURENDIRAN', 9, '9665640012', '2018-03-05', '2018-04-01', '1963-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:37:28', '2023-04-28 07:37:28'),
(47, 'PALANIKUMAR', 17, '9788420232', '2019-08-12', '2020-01-01', '1990-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:38:53', '2023-04-28 07:38:53'),
(48, 'CHELLAPANDI', 35, '7305353870', '2020-11-11', '2021-01-01', '1993-02-03', NULL, '2021-05-17', NULL, NULL, NULL, 'C.PRIYADHASHINI', 'Spouse', '7904789647', 'K.MUTHU', 'Parent', '9790519733', 'Yes', '2023-04-28 07:40:50', '2023-05-02 13:56:05'),
(49, 'PANDIYARAJ A', 20, '9751801806', '2022-08-01', '2023-01-02', '2002-05-17', '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-04-28 07:42:38', '2023-07-06 13:13:47'),
(50, 'S MUTHURAJA', 20, '7708539670', '2022-10-06', '2022-10-06', '2002-04-21', NULL, NULL, NULL, NULL, NULL, 'MARIYAMMAL', 'Parent', '9597716390', 'THAALAMUTHU', 'Sibling', NULL, 'Yes', '2023-04-28 07:45:21', '2023-04-29 05:39:18'),
(51, 'R MURALI', 25, '9345680136', '2021-02-01', '2022-07-01', '1976-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:46:35', '2023-04-28 07:46:35'),
(52, 'PANDIYAMMAL S', 25, '9788154940', '2015-09-01', '2015-09-01', '1968-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:48:58', '2023-04-29 04:48:58'),
(53, 'RANI', 36, '9843372784', '2018-03-13', '2019-04-01', '1988-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:51:27', '2023-04-29 04:51:27'),
(54, 'PRABAVATHI', 9, '9940757877', '2018-04-01', '2018-07-01', '1990-09-16', NULL, '2015-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:56:21', '2023-04-29 04:56:21'),
(55, 'RAJALAKSHMI', 18, '9585263093', '2018-02-21', '2018-04-01', '1987-03-15', NULL, '2012-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:58:20', '2023-04-29 04:58:20'),
(56, 'MANIMALA', 9, '9003640130', '2012-01-25', '2020-02-04', '1986-01-08', NULL, '2007-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:00:08', '2023-04-29 05:00:08'),
(57, 'SONIYA', 19, '9384742459', '2021-11-13', '2022-08-04', '2001-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:01:45', '2023-04-29 05:01:45'),
(58, 'KANNAN', 35, '9629600849', '2015-09-01', '2015-09-01', '1982-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:02:45', '2023-04-29 05:02:45');
INSERT INTO `staff` (`id`, `name`, `department_id`, `phone_number`, `actual_date_of_joining`, `date_of_incorporation_in_pf`, `date_of_birth`, `age`, `wedding_day`, `supply_zone_id`, `supply_area_id`, `number_of_active_customers`, `emergency_contact_name`, `relation`, `contact_number`, `emergency_contact_name2`, `relation2`, `contact_number2`, `pf_or_esi`, `created_at`, `updated_at`) VALUES
(59, 'S.PRADEEP', 35, '8012555933', '2015-09-01', '2015-09-01', '1983-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:05:17', '2023-04-29 05:05:17'),
(60, 'M SIVAKUMAR', 35, '9087979906', '2015-12-01', '2016-12-01', '1984-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:06:10', '2023-04-29 05:06:10'),
(61, 'NAVANEETHAN', 35, '9159678689', '2019-09-21', '2019-10-01', '1991-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:08:31', '2023-04-29 05:08:31'),
(62, 'JEYAKUMAR', 35, '9047220980', '2019-12-03', '2020-07-07', '1984-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:10:41', '2023-04-29 05:10:41'),
(63, 'VINOTHKUMAR A', 35, '9965478072', '2021-02-26', '2021-07-01', '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:11:44', '2023-04-29 05:11:44'),
(64, 'KALIDOSS', 14, '9842140708', '2022-10-06', '2022-10-06', '1989-03-18', NULL, NULL, 16, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:14:17', '2023-04-29 05:14:17'),
(65, 'ANTHONY XAVIER', 35, '9940881759', '2017-11-02', '2021-01-01', '1968-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:15:33', '2023-04-29 05:15:33'),
(66, 'ARPUTHARAJ', 35, '8883139846', '2019-08-29', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:17:54', '2023-04-29 05:17:54'),
(67, 'SIVASAKTHIVEL', 35, '9943330962', '2020-01-18', '2021-01-01', '1969-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:18:52', '2023-04-29 05:18:52'),
(68, 'VINOTH', 35, '9791373892', '2019-11-24', '2021-01-01', '1992-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:19:29', '2023-04-29 05:19:29'),
(69, 'ARUNACHALAM', 35, '8012555960', '2015-04-01', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:20:08', '2023-04-29 05:20:08'),
(70, 'SUNDHARAPANDI S', 35, '8012555934', '2015-04-01', '2015-04-01', '1986-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:21:12', '2023-04-29 05:21:12'),
(71, 'NAGARAJAN S', 35, '8012555928', '2019-06-11', '2019-06-11', '1982-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:22:59', '2023-04-29 05:22:59'),
(72, 'A VIVEKANANDAN', 35, '8012555938', '2019-06-06', '2021-02-01', '1986-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:24:40', '2023-04-29 05:24:40'),
(73, 'RANJITHKUMAR', 35, '9567474621', '2022-03-15', '2022-04-01', '1988-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:25:22', '2023-04-29 05:25:22'),
(74, 'JOTHIBASU C', 14, '9843695839', '2013-01-01', '2013-01-01', '1983-04-20', NULL, NULL, 15, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:26:58', '2023-04-29 05:26:58'),
(75, 'K.CHELLAM', 14, '8870313265', '2017-06-01', '2017-06-01', '1981-07-01', NULL, NULL, 15, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:28:45', '2023-04-29 05:28:45'),
(76, 'KARTHICK B', 14, '9626653542', '2018-07-14', '2018-07-14', '1990-04-15', NULL, NULL, 15, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:31:58', '2023-04-29 05:31:58'),
(77, 'BHARATH B', 14, '8012555987', '2022-10-08', '2022-10-08', '1990-04-15', NULL, NULL, 15, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:35:12', '2023-04-29 05:35:12'),
(78, 'JEYAPRAKASH J', 14, '8012555990', '2023-01-02', '2023-01-02', '1994-04-10', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:41:57', '2023-04-29 05:41:57'),
(79, 'P RAGUNATHAN', 14, '8012555902', '2007-07-01', '2007-07-01', '1974-03-09', NULL, NULL, 14, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:43:05', '2023-04-29 05:43:05'),
(80, 'J SURESHKUMAR', 14, '8012555904', '2008-12-01', '2008-12-01', '1981-06-11', NULL, NULL, 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:05:30', '2023-04-29 06:05:30'),
(81, 'M.SEKAR', 14, '8012555945', '2011-08-10', '2011-08-10', '1981-10-11', NULL, NULL, 11, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:11', '2023-04-29 06:07:11'),
(82, 'S.MUTHUPANDI', 14, '8012555916', '2012-02-01', '2012-02-01', '1974-05-02', NULL, NULL, 10, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:57', '2023-04-29 06:07:57'),
(83, 'M.MAYILRAJ', 14, '8012555907', '2012-12-01', '2012-10-01', '1975-07-30', NULL, NULL, 10, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:08:55', '2023-04-29 06:08:55'),
(84, 'MURUGESAN', 14, '8012555927', '2012-10-01', '2012-10-01', '1962-06-10', NULL, NULL, 13, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:10:06', '2023-04-29 06:10:06'),
(85, 'P.MARIYAPPAN', 14, '8012555905', '2012-10-01', '2012-10-01', '1983-10-30', NULL, NULL, 11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:11:08', '2023-04-29 06:11:08'),
(86, 'S.PERUMAL', 14, '9843370762', '2012-10-01', '2012-10-01', '1982-02-03', NULL, NULL, 14, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:46:33', '2023-04-29 06:46:33'),
(87, 'J KANNAN', 14, '8012555941', '2014-04-01', '2014-04-01', '1973-07-04', NULL, NULL, 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:48:17', '2023-04-29 06:48:17'),
(88, 'R KASIVISWANATHAN', 14, '8012555914', '2014-04-01', '2014-04-01', '1981-04-16', NULL, NULL, 11, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:50:02', '2023-04-29 06:50:02'),
(89, 'B SATHAMUSEN', 14, '8012555924', '2014-04-01', '2014-04-01', '1992-07-29', NULL, NULL, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:51:36', '2023-04-29 06:51:36'),
(90, 'BALAVENUGOPAL V', 14, '8012555926', '2015-04-01', '2015-04-01', '1972-05-12', NULL, NULL, 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:21:20', '2023-04-29 07:21:20'),
(91, 'RAMESH D', 14, '8012555964', '2015-04-01', '2015-04-01', '1978-01-21', NULL, NULL, 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:22:18', '2023-05-04 12:39:55'),
(92, 'RAVINDRAN M', 14, '8012555970', '2015-04-01', '2015-04-01', '1974-05-02', NULL, NULL, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:23:13', '2023-04-29 07:23:13'),
(93, 'MANIKANDAN K R', 14, '8012555985', '2015-04-01', '2015-04-01', '1980-01-07', NULL, NULL, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:24:55', '2023-04-29 07:24:55'),
(94, 'RAJA M', 14, '8012555994', '2015-04-01', '2015-04-01', '1983-10-13', NULL, NULL, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:28:19', '2023-04-29 07:28:19'),
(95, 'KADHARMYDEEN R', 14, '8012555981', '2015-04-01', '2015-04-01', '1983-04-24', NULL, NULL, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:31:31', '2023-04-29 07:31:31'),
(96, 'MAHALINGAM', 14, '8012555979', '2015-04-01', '2015-04-01', '1977-07-19', NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:32:25', '2023-04-29 07:32:25'),
(97, 'RAMACHANDRAN', 14, '8012555977', '2015-04-01', '2015-04-01', '1984-05-10', NULL, NULL, 13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:33:20', '2023-04-29 07:33:20'),
(98, 'C.NALLENDRAKUMAR', 14, '8012555983', '2015-12-01', '2015-12-01', '1988-06-28', NULL, NULL, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:34:17', '2023-04-29 07:34:17'),
(99, 'V.VIJAY', 14, '8012555953', '2015-12-01', '2015-12-01', '1986-07-01', NULL, NULL, 12, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:35:22', '2023-04-29 07:35:22'),
(100, 'R.MUTHU', 14, '8012555995', '2015-12-01', '2015-12-01', '1973-02-22', NULL, NULL, 10, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:37:19', '2023-04-29 07:37:19'),
(101, 'M.VINOTH', 14, '8012555943', '2015-12-01', '2015-12-01', '1989-04-14', NULL, NULL, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:05', '2023-04-29 07:38:05'),
(102, 'KAMATCHI', 14, '8012555912', '2019-03-01', '2019-03-01', '1979-04-05', NULL, NULL, 14, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:48', '2023-04-29 07:38:48'),
(103, 'SATHISHKUMAR C', 14, '8012555909', '2012-10-01', '2019-06-01', '1986-06-15', NULL, NULL, 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:39:50', '2023-04-29 07:39:50'),
(104, 'ABDHULLAH', 14, '8012555923', '2019-12-01', '2019-07-01', '1981-01-10', NULL, NULL, 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:40:36', '2023-04-29 07:40:36'),
(105, 'ALAGESAN', 14, '8012555993', '2021-07-01', '2021-07-01', '1983-03-15', NULL, NULL, 12, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:41:23', '2023-04-29 07:41:23'),
(106, 'S BALAMURUGAN', 14, '8012555992', '2021-07-01', '2021-07-01', '1995-09-29', '28', NULL, 11, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:42:48', '2023-07-05 06:20:07'),
(107, 'MADURAIVEERAN', 14, '8012555930', '2021-07-01', '2021-07-01', '1981-12-26', NULL, NULL, 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:44:24', '2023-04-29 07:44:24'),
(108, 'KURUMBAN', 14, '8012555910', '2021-07-01', '2021-11-01', '1989-06-01', NULL, NULL, 10, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:45:27', '2023-04-29 07:45:27'),
(109, 'C.RAMALINGAM', 14, '8012555921', '2021-08-01', '2022-07-01', '1976-02-12', NULL, NULL, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:46:16', '2023-04-29 07:46:16'),
(110, 'BOOMINATHAN', 14, '8012555982', '2022-10-06', '2022-10-06', '1974-05-11', NULL, NULL, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:47:00', '2023-04-29 07:47:00'),
(111, 'RAVICHANDRAN', 14, '8012555936', '2022-10-06', '2022-10-06', '1980-01-10', NULL, NULL, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:48:09', '2023-04-29 07:48:09'),
(112, 'DURAI', 14, '8012555908', '2022-11-05', '2022-11-05', '1986-05-23', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:00', '2023-04-29 07:50:00'),
(113, 'SARAVANAKUMAR', 14, '8012555980', '2023-01-02', '2023-01-02', '1977-07-31', NULL, NULL, 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:41', '2023-04-29 07:50:41'),
(114, 'DAYANA', 20, '8438073809', '2019-03-12', '2023-04-01', '1995-05-10', NULL, '2022-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:37:23', '2023-04-29 08:37:23'),
(115, 'PRIYADHARSHINI', 16, '8189877959', '2017-04-17', '2023-04-01', '1999-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:38:41', '2023-04-29 08:38:41'),
(116, 'R VIJAY', 14, '9843604701', '2015-04-11', '2015-04-01', '1983-05-06', NULL, NULL, 16, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:33:55', '2023-05-02 05:33:55'),
(117, 'NITHISHKUMAR R', 14, '8012555989', '2023-01-02', '2023-01-02', '1994-05-11', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:35:06', '2023-05-02 05:35:06'),
(120, 'RATHIDEVI SENTHILKUMAR', 9, '9942103199', '1994-01-01', '2020-10-01', '1980-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-03 08:54:50', '2023-05-03 08:54:50'),
(161, 'DEVA', 26, '8122660503', '2003-05-03', NULL, '1980-05-25', '41', '2009-02-03', NULL, NULL, NULL, 'T SARITHA', 'Spouse', '7358864420', 'M SALAIMUTHAIAH', 'Parent', '7200764428', 'No', '2023-05-29 04:58:51', '2023-05-29 04:58:51'),
(162, 'N RAJANGAM', 26, '9600087024', '2023-02-18', NULL, '1953-02-16', '70', '1978-06-28', NULL, NULL, NULL, 'R VIJAYALAKSHMI', 'Spouse', '6380709820', 'R MANIKANDAN', 'Sibling', '8754573434', 'No', '2023-05-29 05:01:41', '2023-05-29 05:01:41'),
(163, 'M PRIYANKA', 18, '9500561227', '2023-02-15', NULL, '1994-06-12', '29', '2012-09-26', NULL, NULL, NULL, 'B MARIMUTHU', 'Spouse', '9500777146', 'M KARTHICK RAJA', 'Sibling', '7530008449', 'No', '2023-05-29 05:10:35', '2023-05-29 05:10:35'),
(164, 'Manasvini @ Meenakshi.B', 18, '8438448434', '2023-01-23', NULL, '1997-06-12', '26', '2021-09-10', NULL, NULL, NULL, 'N PRAKASH', 'Spouse', '7010095940', 'B RAMALAKSHMI', 'Parent', '8072841517', 'No', '2023-05-29 05:13:01', '2023-05-29 05:13:01'),
(165, 'S ABIRAMI', 19, '9514086284', '2023-02-27', NULL, '1999-08-26', '24', '2022-04-06', NULL, NULL, NULL, 'M SARAVANAN', 'Spouse', '7418858074', 'SARANYA', 'Friend', '9176207368', 'No', '2023-05-29 05:17:09', '2023-05-29 05:17:09'),
(166, 'M MUTHULAKSHMI', 18, '8220773555', '2023-04-26', NULL, '2001-04-30', '22', '2020-10-29', NULL, NULL, NULL, 'M VINOTH', 'Spouse', '8438285350', 'M KASTHURI', 'Parent', '9655124575', 'No', '2023-05-29 05:43:18', '2023-05-29 05:43:18'),
(167, 'AMIRTHA', 38, '7200658808', '2023-03-23', NULL, '2003-01-28', '20', NULL, NULL, NULL, NULL, 'MALARVIZHI', 'Parent', '9363471863', 'PALANISAMY', 'Parent', '6374552344', 'No', '2023-06-01 05:56:17', '2023-06-07 11:21:54'),
(168, 'ARCHANA', 16, '8438075700', '2023-05-08', NULL, '2002-07-15', '21', '2023-01-23', NULL, NULL, NULL, 'AJITHKUMAR', 'Spouse', '8012555942', 'CHELLAM', 'Sibling', '8012938291', 'No', '2023-06-01 06:04:06', '2023-06-01 06:09:21'),
(169, 'ATHIRSTALAKSHMI A', 18, '9514475543', '2023-05-27', NULL, '1997-03-12', '26', '2022-04-06', NULL, NULL, NULL, 'SANKAR', 'Spouse', '8608600572', 'ASURAJAN', 'Parent', '9994575543', 'No', '2023-06-01 08:05:32', '2023-06-01 08:05:32'),
(170, 'AJITHKUMAR', 19, '9524754969', '2023-03-06', NULL, '1996-09-30', '27', '2023-01-23', NULL, NULL, NULL, 'ARCHANA', 'Spouse', '8438075700', 'CHELLAM', 'Parent', '8012938291', 'No', '2023-06-01 08:09:53', '2023-06-01 08:09:53'),
(171, 'SAJITHARANI', 16, '9092043173', '2023-03-20', NULL, '1985-05-20', '38', NULL, NULL, NULL, NULL, 'ABITHA', 'Sibling', '9003593173', NULL, NULL, NULL, 'No', '2023-06-01 08:15:12', '2023-06-01 08:15:12'),
(172, 'PANDIYARAJ', 26, '9787147604', '2018-05-16', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:30:05', '2023-06-01 08:30:05'),
(173, 'KARUPPASAMY', 24, '9942656271', '2022-06-04', NULL, '1980-07-10', '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:33:28', '2023-06-01 08:33:28'),
(174, 'SURESHKUMAR', 24, '8870827284', '2022-03-05', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:37:53', '2023-06-01 08:37:53'),
(175, 'KARTHIKEYAN', 24, '9787020716', '2023-04-01', NULL, '1981-11-17', '42', '2017-11-23', NULL, NULL, NULL, 'K KALEESWARI', 'Spouse', '7502342825', 'A UMAVATHI', 'Parent', '9943338865', 'No', '2023-06-01 08:39:38', '2023-06-01 09:06:17'),
(176, 'ALAGUPANDI', 14, '8012555925', '2022-07-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:41:37', '2023-06-01 08:41:37'),
(177, 'SELVARAJ', 14, '8012555940', '2015-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:43:53', '2023-06-01 08:43:53'),
(178, 'GANESAN', 14, '9442032239', '2018-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:45:05', '2023-06-01 08:45:05'),
(179, 'Dhanapakiam', 32, '1234567890', '0001-01-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:47:06', '2023-06-01 08:47:06'),
(180, 'MARIAMMAL', 32, '9940823540', '2015-07-06', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:48:11', '2023-06-01 08:48:11'),
(181, 'PAPPA', 32, '6385229518', '2014-06-02', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:49:35', '2023-06-01 08:49:35'),
(182, 'MURUGAN', 32, '9367740105', '2014-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:50:56', '2023-06-01 08:50:56'),
(183, 'GUNA', 27, '8012555971', '2023-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:13:56', '2023-06-02 13:13:56'),
(184, 'THILAGAR', 27, '8012555918', '2023-05-23', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:15:24', '2023-06-02 13:15:24'),
(33, 'JEYAPANDIAN', 21, '9842113949', '1983-07-05', '1992-01-01', '1964-06-08', '59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:42:09', '2023-07-03 12:40:30'),
(34, 'SENGUTTUVAN MOORTHY', 25, '9842913434', '1986-08-10', '1992-01-02', '1965-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:43:49', '2023-04-27 13:43:49'),
(35, 'MUTHUPANDI R', 9, '9842913949', '2004-01-25', '2006-09-01', '1979-08-02', NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:45:07', '2023-05-02 13:54:05'),
(36, 'J.PRABHU', 21, '9095013949', '2007-01-22', '2012-09-01', '1974-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:46:28', '2023-04-27 13:46:28'),
(37, 'MUTHUKUMAR NARASINGAM', 21, '9942884496', '2017-11-01', '2017-11-01', '1986-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:48:53', '2023-04-27 13:48:53'),
(38, 'VEERASUBRAMANIAN ARUMUGAM', 21, '9443015804', '2005-11-06', '2012-09-01', '1966-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:50:25', '2023-04-27 13:50:25'),
(39, 'A P KANNAN', 21, '9994107649', '2015-04-01', '2015-04-01', '1979-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:56:32', '2023-04-27 13:56:32'),
(40, 'BALAMURUGAN', 21, '7373713949', '2016-11-24', '2018-05-01', '1991-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 14:01:35', '2023-04-27 14:01:35'),
(41, 'P GANESAN', 27, '9894440030', '2016-06-04', '2017-12-01', '1989-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:20:41', '2023-04-28 07:20:41'),
(42, 'NAGESHVARAN', 9, '9698778711', '2018-02-10', '2018-04-01', '1977-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:22:55', '2023-04-28 07:22:55'),
(43, 'C SANKAR', 17, '7448395506', '2018-07-27', '2018-10-01', '1997-05-30', '26', NULL, NULL, NULL, NULL, 'CHINNAKKANNAN', 'Parent', '9698965045', 'MARY', 'Guardian', '9751940532', 'No', '2023-04-28 07:26:28', '2023-07-03 13:48:53'),
(44, 'KANNAN S', 27, '6369303198', '2021-02-01', '2021-04-01', '1999-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:29:08', '2023-05-04 12:55:09'),
(45, 'A YESURAJ', 9, '9597139163', '2015-01-04', '2019-06-01', '1990-12-18', NULL, '2019-11-03', NULL, NULL, NULL, 'ARUL SUTHA', 'Spouse', '9791235920', 'EMERANCE MARY', 'Parent', '7200304416', 'Yes', '2023-04-28 07:30:29', '2023-04-28 07:32:26'),
(46, 'SUBA SURENDIRAN', 9, '9665640012', '2018-03-05', '2018-04-01', '1963-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:37:28', '2023-04-28 07:37:28'),
(47, 'PALANIKUMAR', 17, '9788420232', '2019-08-12', '2020-01-01', '1990-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:38:53', '2023-04-28 07:38:53'),
(48, 'CHELLAPANDI', 35, '7305353870', '2020-11-11', '2021-01-01', '1993-02-03', NULL, '2021-05-17', NULL, NULL, NULL, 'C.PRIYADHASHINI', 'Spouse', '7904789647', 'K.MUTHU', 'Parent', '9790519733', 'Yes', '2023-04-28 07:40:50', '2023-05-02 13:56:05'),
(49, 'PANDIYARAJ A', 20, '9751801806', '2022-08-01', '2023-01-02', '2002-05-17', '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-04-28 07:42:38', '2023-07-06 13:13:47'),
(50, 'S MUTHURAJA', 20, '7708539670', '2022-10-06', '2022-10-06', '2002-04-21', NULL, NULL, NULL, NULL, NULL, 'MARIYAMMAL', 'Parent', '9597716390', 'THAALAMUTHU', 'Sibling', NULL, 'Yes', '2023-04-28 07:45:21', '2023-04-29 05:39:18'),
(51, 'R MURALI', 25, '9345680136', '2021-02-01', '2022-07-01', '1976-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:46:35', '2023-04-28 07:46:35'),
(52, 'PANDIYAMMAL S', 25, '9788154940', '2015-09-01', '2015-09-01', '1968-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:48:58', '2023-04-29 04:48:58'),
(53, 'RANI', 36, '9843372784', '2018-03-13', '2019-04-01', '1988-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:51:27', '2023-04-29 04:51:27'),
(54, 'PRABAVATHI', 9, '9940757877', '2018-04-01', '2018-07-01', '1990-09-16', NULL, '2015-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:56:21', '2023-04-29 04:56:21'),
(55, 'RAJALAKSHMI', 18, '9585263093', '2018-02-21', '2018-04-01', '1987-03-15', NULL, '2012-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:58:20', '2023-04-29 04:58:20'),
(56, 'MANIMALA', 9, '9003640130', '2012-01-25', '2020-02-04', '1986-01-08', NULL, '2007-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:00:08', '2023-04-29 05:00:08'),
(57, 'SONIYA', 19, '9384742459', '2021-11-13', '2022-08-04', '2001-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:01:45', '2023-04-29 05:01:45'),
(58, 'KANNAN', 35, '9629600849', '2015-09-01', '2015-09-01', '1982-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:02:45', '2023-04-29 05:02:45'),
(59, 'S.PRADEEP', 35, '8012555933', '2015-09-01', '2015-09-01', '1983-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:05:17', '2023-04-29 05:05:17'),
(60, 'M SIVAKUMAR', 35, '9087979906', '2015-12-01', '2016-12-01', '1984-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:06:10', '2023-04-29 05:06:10'),
(61, 'NAVANEETHAN', 35, '9159678689', '2019-09-21', '2019-10-01', '1991-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:08:31', '2023-04-29 05:08:31'),
(62, 'JEYAKUMAR', 35, '9047220980', '2019-12-03', '2020-07-07', '1984-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:10:41', '2023-04-29 05:10:41'),
(63, 'VINOTHKUMAR A', 35, '9965478072', '2021-02-26', '2021-07-01', '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:11:44', '2023-04-29 05:11:44'),
(64, 'KALIDOSS', 14, '9842140708', '2022-10-06', '2022-10-06', '1989-03-18', NULL, NULL, 16, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:14:17', '2023-04-29 05:14:17'),
(65, 'ANTHONY XAVIER', 35, '9940881759', '2017-11-02', '2021-01-01', '1968-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:15:33', '2023-04-29 05:15:33'),
(66, 'ARPUTHARAJ', 35, '8883139846', '2019-08-29', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:17:54', '2023-04-29 05:17:54'),
(67, 'SIVASAKTHIVEL', 35, '9943330962', '2020-01-18', '2021-01-01', '1969-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:18:52', '2023-04-29 05:18:52'),
(68, 'VINOTH', 35, '9791373892', '2019-11-24', '2021-01-01', '1992-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:19:29', '2023-04-29 05:19:29'),
(69, 'ARUNACHALAM', 35, '8012555960', '2015-04-01', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:20:08', '2023-04-29 05:20:08'),
(70, 'SUNDHARAPANDI S', 35, '8012555934', '2015-04-01', '2015-04-01', '1986-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:21:12', '2023-04-29 05:21:12'),
(71, 'NAGARAJAN S', 35, '8012555928', '2019-06-11', '2019-06-11', '1982-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:22:59', '2023-04-29 05:22:59'),
(72, 'A VIVEKANANDAN', 35, '8012555938', '2019-06-06', '2021-02-01', '1986-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:24:40', '2023-04-29 05:24:40'),
(73, 'RANJITHKUMAR', 35, '9567474621', '2022-03-15', '2022-04-01', '1988-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:25:22', '2023-04-29 05:25:22'),
(74, 'JOTHIBASU C', 14, '9843695839', '2013-01-01', '2013-01-01', '1983-04-20', NULL, NULL, 15, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:26:58', '2023-04-29 05:26:58'),
(75, 'K.CHELLAM', 14, '8870313265', '2017-06-01', '2017-06-01', '1981-07-01', NULL, NULL, 15, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:28:45', '2023-04-29 05:28:45'),
(76, 'KARTHICK B', 14, '9626653542', '2018-07-14', '2018-07-14', '1990-04-15', NULL, NULL, 15, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:31:58', '2023-04-29 05:31:58'),
(77, 'BHARATH B', 14, '8012555987', '2022-10-08', '2022-10-08', '1990-04-15', NULL, NULL, 15, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:35:12', '2023-04-29 05:35:12'),
(78, 'JEYAPRAKASH J', 14, '8012555990', '2023-01-02', '2023-01-02', '1994-04-10', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:41:57', '2023-04-29 05:41:57'),
(79, 'P RAGUNATHAN', 14, '8012555902', '2007-07-01', '2007-07-01', '1974-03-09', NULL, NULL, 14, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:43:05', '2023-04-29 05:43:05'),
(80, 'J SURESHKUMAR', 14, '8012555904', '2008-12-01', '2008-12-01', '1981-06-11', NULL, NULL, 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:05:30', '2023-04-29 06:05:30'),
(81, 'M.SEKAR', 14, '8012555945', '2011-08-10', '2011-08-10', '1981-10-11', NULL, NULL, 11, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:11', '2023-04-29 06:07:11'),
(82, 'S.MUTHUPANDI', 14, '8012555916', '2012-02-01', '2012-02-01', '1974-05-02', NULL, NULL, 10, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:57', '2023-04-29 06:07:57'),
(83, 'M.MAYILRAJ', 14, '8012555907', '2012-12-01', '2012-10-01', '1975-07-30', NULL, NULL, 10, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:08:55', '2023-04-29 06:08:55'),
(84, 'MURUGESAN', 14, '8012555927', '2012-10-01', '2012-10-01', '1962-06-10', NULL, NULL, 13, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:10:06', '2023-04-29 06:10:06'),
(85, 'P.MARIYAPPAN', 14, '8012555905', '2012-10-01', '2012-10-01', '1983-10-30', NULL, NULL, 11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:11:08', '2023-04-29 06:11:08'),
(86, 'S.PERUMAL', 14, '9843370762', '2012-10-01', '2012-10-01', '1982-02-03', NULL, NULL, 14, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:46:33', '2023-04-29 06:46:33'),
(87, 'J KANNAN', 14, '8012555941', '2014-04-01', '2014-04-01', '1973-07-04', NULL, NULL, 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:48:17', '2023-04-29 06:48:17'),
(88, 'R KASIVISWANATHAN', 14, '8012555914', '2014-04-01', '2014-04-01', '1981-04-16', NULL, NULL, 11, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:50:02', '2023-04-29 06:50:02'),
(89, 'B SATHAMUSEN', 14, '8012555924', '2014-04-01', '2014-04-01', '1992-07-29', NULL, NULL, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:51:36', '2023-04-29 06:51:36'),
(90, 'BALAVENUGOPAL V', 14, '8012555926', '2015-04-01', '2015-04-01', '1972-05-12', NULL, NULL, 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:21:20', '2023-04-29 07:21:20'),
(91, 'RAMESH D', 14, '8012555964', '2015-04-01', '2015-04-01', '1978-01-21', NULL, NULL, 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:22:18', '2023-05-04 12:39:55'),
(92, 'RAVINDRAN M', 14, '8012555970', '2015-04-01', '2015-04-01', '1974-05-02', NULL, NULL, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:23:13', '2023-04-29 07:23:13'),
(93, 'MANIKANDAN K R', 14, '8012555985', '2015-04-01', '2015-04-01', '1980-01-07', NULL, NULL, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:24:55', '2023-04-29 07:24:55'),
(94, 'RAJA M', 14, '8012555994', '2015-04-01', '2015-04-01', '1983-10-13', NULL, NULL, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:28:19', '2023-04-29 07:28:19'),
(95, 'KADHARMYDEEN R', 14, '8012555981', '2015-04-01', '2015-04-01', '1983-04-24', NULL, NULL, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:31:31', '2023-04-29 07:31:31'),
(96, 'MAHALINGAM', 14, '8012555979', '2015-04-01', '2015-04-01', '1977-07-19', NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:32:25', '2023-04-29 07:32:25'),
(97, 'RAMACHANDRAN', 14, '8012555977', '2015-04-01', '2015-04-01', '1984-05-10', NULL, NULL, 13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:33:20', '2023-04-29 07:33:20'),
(98, 'C.NALLENDRAKUMAR', 14, '8012555983', '2015-12-01', '2015-12-01', '1988-06-28', NULL, NULL, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:34:17', '2023-04-29 07:34:17'),
(99, 'V.VIJAY', 14, '8012555953', '2015-12-01', '2015-12-01', '1986-07-01', NULL, NULL, 12, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:35:22', '2023-04-29 07:35:22'),
(100, 'R.MUTHU', 14, '8012555995', '2015-12-01', '2015-12-01', '1973-02-22', NULL, NULL, 10, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:37:19', '2023-04-29 07:37:19'),
(101, 'M.VINOTH', 14, '8012555943', '2015-12-01', '2015-12-01', '1989-04-14', NULL, NULL, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:05', '2023-04-29 07:38:05'),
(102, 'KAMATCHI', 14, '8012555912', '2019-03-01', '2019-03-01', '1979-04-05', NULL, NULL, 14, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:48', '2023-04-29 07:38:48'),
(103, 'SATHISHKUMAR C', 14, '8012555909', '2012-10-01', '2019-06-01', '1986-06-15', NULL, NULL, 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:39:50', '2023-04-29 07:39:50'),
(104, 'ABDHULLAH', 14, '8012555923', '2019-12-01', '2019-07-01', '1981-01-10', NULL, NULL, 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:40:36', '2023-04-29 07:40:36'),
(105, 'ALAGESAN', 14, '8012555993', '2021-07-01', '2021-07-01', '1983-03-15', NULL, NULL, 12, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:41:23', '2023-04-29 07:41:23'),
(106, 'S BALAMURUGAN', 14, '8012555992', '2021-07-01', '2021-07-01', '1995-09-29', '28', NULL, 11, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:42:48', '2023-07-05 06:20:07'),
(107, 'MADURAIVEERAN', 14, '8012555930', '2021-07-01', '2021-07-01', '1981-12-26', NULL, NULL, 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:44:24', '2023-04-29 07:44:24'),
(108, 'KURUMBAN', 14, '8012555910', '2021-07-01', '2021-11-01', '1989-06-01', NULL, NULL, 10, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:45:27', '2023-04-29 07:45:27'),
(109, 'C.RAMALINGAM', 14, '8012555921', '2021-08-01', '2022-07-01', '1976-02-12', NULL, NULL, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:46:16', '2023-04-29 07:46:16'),
(110, 'BOOMINATHAN', 14, '8012555982', '2022-10-06', '2022-10-06', '1974-05-11', NULL, NULL, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:47:00', '2023-04-29 07:47:00'),
(111, 'RAVICHANDRAN', 14, '8012555936', '2022-10-06', '2022-10-06', '1980-01-10', NULL, NULL, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:48:09', '2023-04-29 07:48:09'),
(112, 'DURAI', 14, '8012555908', '2022-11-05', '2022-11-05', '1986-05-23', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:00', '2023-04-29 07:50:00'),
(113, 'SARAVANAKUMAR', 14, '8012555980', '2023-01-02', '2023-01-02', '1977-07-31', NULL, NULL, 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:41', '2023-04-29 07:50:41'),
(114, 'DAYANA', 20, '8438073809', '2019-03-12', '2023-04-01', '1995-05-10', NULL, '2022-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:37:23', '2023-04-29 08:37:23'),
(115, 'PRIYADHARSHINI', 16, '8189877959', '2017-04-17', '2023-04-01', '1999-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:38:41', '2023-04-29 08:38:41'),
(116, 'R VIJAY', 14, '9843604701', '2015-04-11', '2015-04-01', '1983-05-06', NULL, NULL, 16, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:33:55', '2023-05-02 05:33:55'),
(117, 'NITHISHKUMAR R', 14, '8012555989', '2023-01-02', '2023-01-02', '1994-05-11', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:35:06', '2023-05-02 05:35:06'),
(120, 'RATHIDEVI SENTHILKUMAR', 9, '9942103199', '1994-01-01', '2020-10-01', '1980-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-03 08:54:50', '2023-05-03 08:54:50'),
(161, 'DEVA', 26, '8122660503', '2003-05-03', NULL, '1980-05-25', '41', '2009-02-03', NULL, NULL, NULL, 'T SARITHA', 'Spouse', '7358864420', 'M SALAIMUTHAIAH', 'Parent', '7200764428', 'No', '2023-05-29 04:58:51', '2023-05-29 04:58:51'),
(162, 'N RAJANGAM', 26, '9600087024', '2023-02-18', NULL, '1953-02-16', '70', '1978-06-28', NULL, NULL, NULL, 'R VIJAYALAKSHMI', 'Spouse', '6380709820', 'R MANIKANDAN', 'Sibling', '8754573434', 'No', '2023-05-29 05:01:41', '2023-05-29 05:01:41'),
(163, 'M PRIYANKA', 18, '9500561227', '2023-02-15', NULL, '1994-06-12', '29', '2012-09-26', NULL, NULL, NULL, 'B MARIMUTHU', 'Spouse', '9500777146', 'M KARTHICK RAJA', 'Sibling', '7530008449', 'No', '2023-05-29 05:10:35', '2023-05-29 05:10:35'),
(164, 'Manasvini @ Meenakshi.B', 18, '8438448434', '2023-01-23', NULL, '1997-06-12', '26', '2021-09-10', NULL, NULL, NULL, 'N PRAKASH', 'Spouse', '7010095940', 'B RAMALAKSHMI', 'Parent', '8072841517', 'No', '2023-05-29 05:13:01', '2023-05-29 05:13:01'),
(165, 'S ABIRAMI', 19, '9514086284', '2023-02-27', NULL, '1999-08-26', '24', '2022-04-06', NULL, NULL, NULL, 'M SARAVANAN', 'Spouse', '7418858074', 'SARANYA', 'Friend', '9176207368', 'No', '2023-05-29 05:17:09', '2023-05-29 05:17:09'),
(166, 'M MUTHULAKSHMI', 18, '8220773555', '2023-04-26', NULL, '2001-04-30', '22', '2020-10-29', NULL, NULL, NULL, 'M VINOTH', 'Spouse', '8438285350', 'M KASTHURI', 'Parent', '9655124575', 'No', '2023-05-29 05:43:18', '2023-05-29 05:43:18'),
(167, 'AMIRTHA', 38, '7200658808', '2023-03-23', NULL, '2003-01-28', '20', NULL, NULL, NULL, NULL, 'MALARVIZHI', 'Parent', '9363471863', 'PALANISAMY', 'Parent', '6374552344', 'No', '2023-06-01 05:56:17', '2023-06-07 11:21:54'),
(168, 'ARCHANA', 16, '8438075700', '2023-05-08', NULL, '2002-07-15', '21', '2023-01-23', NULL, NULL, NULL, 'AJITHKUMAR', 'Spouse', '8012555942', 'CHELLAM', 'Sibling', '8012938291', 'No', '2023-06-01 06:04:06', '2023-06-01 06:09:21'),
(169, 'ATHIRSTALAKSHMI A', 18, '9514475543', '2023-05-27', NULL, '1997-03-12', '26', '2022-04-06', NULL, NULL, NULL, 'SANKAR', 'Spouse', '8608600572', 'ASURAJAN', 'Parent', '9994575543', 'No', '2023-06-01 08:05:32', '2023-06-01 08:05:32'),
(170, 'AJITHKUMAR', 19, '9524754969', '2023-03-06', NULL, '1996-09-30', '27', '2023-01-23', NULL, NULL, NULL, 'ARCHANA', 'Spouse', '8438075700', 'CHELLAM', 'Parent', '8012938291', 'No', '2023-06-01 08:09:53', '2023-06-01 08:09:53'),
(171, 'SAJITHARANI', 16, '9092043173', '2023-03-20', NULL, '1985-05-20', '38', NULL, NULL, NULL, NULL, 'ABITHA', 'Sibling', '9003593173', NULL, NULL, NULL, 'No', '2023-06-01 08:15:12', '2023-06-01 08:15:12'),
(172, 'PANDIYARAJ', 26, '9787147604', '2018-05-16', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:30:05', '2023-06-01 08:30:05'),
(173, 'KARUPPASAMY', 24, '9942656271', '2022-06-04', NULL, '1980-07-10', '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:33:28', '2023-06-01 08:33:28'),
(174, 'SURESHKUMAR', 24, '8870827284', '2022-03-05', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:37:53', '2023-06-01 08:37:53'),
(175, 'KARTHIKEYAN', 24, '9787020716', '2023-04-01', NULL, '1981-11-17', '42', '2017-11-23', NULL, NULL, NULL, 'K KALEESWARI', 'Spouse', '7502342825', 'A UMAVATHI', 'Parent', '9943338865', 'No', '2023-06-01 08:39:38', '2023-06-01 09:06:17'),
(176, 'ALAGUPANDI', 14, '8012555925', '2022-07-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:41:37', '2023-06-01 08:41:37'),
(177, 'SELVARAJ', 14, '8012555940', '2015-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:43:53', '2023-06-01 08:43:53'),
(178, 'GANESAN', 14, '9442032239', '2018-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:45:05', '2023-06-01 08:45:05'),
(179, 'Dhanapakiam', 32, '1234567890', '0001-01-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:47:06', '2023-06-01 08:47:06'),
(180, 'MARIAMMAL', 32, '9940823540', '2015-07-06', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:48:11', '2023-06-01 08:48:11'),
(181, 'PAPPA', 32, '6385229518', '2014-06-02', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:49:35', '2023-06-01 08:49:35'),
(182, 'MURUGAN', 32, '9367740105', '2014-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:50:56', '2023-06-01 08:50:56'),
(183, 'GUNA', 27, '8012555971', '2023-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:13:56', '2023-06-02 13:13:56'),
(184, 'THILAGAR', 27, '8012555918', '2023-05-23', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:15:24', '2023-06-02 13:15:24'),
(33, 'JEYAPANDIAN', 21, '9842113949', '1983-07-05', '1992-01-01', '1964-06-08', '59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:42:09', '2023-07-03 12:40:30'),
(34, 'SENGUTTUVAN MOORTHY', 25, '9842913434', '1986-08-10', '1992-01-02', '1965-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:43:49', '2023-04-27 13:43:49'),
(35, 'MUTHUPANDI R', 9, '9842913949', '2004-01-25', '2006-09-01', '1979-08-02', NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:45:07', '2023-05-02 13:54:05'),
(36, 'J.PRABHU', 21, '9095013949', '2007-01-22', '2012-09-01', '1974-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:46:28', '2023-04-27 13:46:28'),
(37, 'MUTHUKUMAR NARASINGAM', 21, '9942884496', '2017-11-01', '2017-11-01', '1986-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:48:53', '2023-04-27 13:48:53'),
(38, 'VEERASUBRAMANIAN ARUMUGAM', 21, '9443015804', '2005-11-06', '2012-09-01', '1966-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:50:25', '2023-04-27 13:50:25'),
(39, 'A P KANNAN', 21, '9994107649', '2015-04-01', '2015-04-01', '1979-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:56:32', '2023-04-27 13:56:32'),
(40, 'BALAMURUGAN', 21, '7373713949', '2016-11-24', '2018-05-01', '1991-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 14:01:35', '2023-04-27 14:01:35'),
(41, 'P GANESAN', 27, '9894440030', '2016-06-04', '2017-12-01', '1989-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:20:41', '2023-04-28 07:20:41'),
(42, 'NAGESHVARAN', 9, '9698778711', '2018-02-10', '2018-04-01', '1977-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:22:55', '2023-04-28 07:22:55'),
(43, 'C SANKAR', 17, '7448395506', '2018-07-27', '2018-10-01', '1997-05-30', '26', NULL, NULL, NULL, NULL, 'CHINNAKKANNAN', 'Parent', '9698965045', 'MARY', 'Guardian', '9751940532', 'No', '2023-04-28 07:26:28', '2023-07-03 13:48:53'),
(44, 'KANNAN S', 27, '6369303198', '2021-02-01', '2021-04-01', '1999-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:29:08', '2023-05-04 12:55:09'),
(45, 'A YESURAJ', 9, '9597139163', '2015-01-04', '2019-06-01', '1990-12-18', NULL, '2019-11-03', NULL, NULL, NULL, 'ARUL SUTHA', 'Spouse', '9791235920', 'EMERANCE MARY', 'Parent', '7200304416', 'Yes', '2023-04-28 07:30:29', '2023-04-28 07:32:26'),
(46, 'SUBA SURENDIRAN', 9, '9665640012', '2018-03-05', '2018-04-01', '1963-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:37:28', '2023-04-28 07:37:28'),
(47, 'PALANIKUMAR', 17, '9788420232', '2019-08-12', '2020-01-01', '1990-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:38:53', '2023-04-28 07:38:53'),
(48, 'CHELLAPANDI', 35, '7305353870', '2020-11-11', '2021-01-01', '1993-02-03', NULL, '2021-05-17', NULL, NULL, NULL, 'C.PRIYADHASHINI', 'Spouse', '7904789647', 'K.MUTHU', 'Parent', '9790519733', 'Yes', '2023-04-28 07:40:50', '2023-05-02 13:56:05'),
(49, 'PANDIYARAJ A', 20, '9751801806', '2022-08-01', '2023-01-02', '2002-05-17', '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-04-28 07:42:38', '2023-07-06 13:13:47'),
(50, 'S MUTHURAJA', 20, '7708539670', '2022-10-06', '2022-10-06', '2002-04-21', NULL, NULL, NULL, NULL, NULL, 'MARIYAMMAL', 'Parent', '9597716390', 'THAALAMUTHU', 'Sibling', NULL, 'Yes', '2023-04-28 07:45:21', '2023-04-29 05:39:18'),
(51, 'R MURALI', 25, '9345680136', '2021-02-01', '2022-07-01', '1976-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:46:35', '2023-04-28 07:46:35'),
(52, 'PANDIYAMMAL S', 25, '9788154940', '2015-09-01', '2015-09-01', '1968-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:48:58', '2023-04-29 04:48:58'),
(53, 'RANI', 36, '9843372784', '2018-03-13', '2019-04-01', '1988-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:51:27', '2023-04-29 04:51:27'),
(54, 'PRABAVATHI', 9, '9940757877', '2018-04-01', '2018-07-01', '1990-09-16', NULL, '2015-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:56:21', '2023-04-29 04:56:21'),
(55, 'RAJALAKSHMI', 18, '9585263093', '2018-02-21', '2018-04-01', '1987-03-15', NULL, '2012-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:58:20', '2023-04-29 04:58:20'),
(56, 'MANIMALA', 9, '9003640130', '2012-01-25', '2020-02-04', '1986-01-08', NULL, '2007-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:00:08', '2023-04-29 05:00:08'),
(57, 'SONIYA', 19, '9384742459', '2021-11-13', '2022-08-04', '2001-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:01:45', '2023-04-29 05:01:45'),
(58, 'KANNAN', 35, '9629600849', '2015-09-01', '2015-09-01', '1982-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:02:45', '2023-04-29 05:02:45'),
(59, 'S.PRADEEP', 35, '8012555933', '2015-09-01', '2015-09-01', '1983-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:05:17', '2023-04-29 05:05:17'),
(60, 'M SIVAKUMAR', 35, '9087979906', '2015-12-01', '2016-12-01', '1984-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:06:10', '2023-04-29 05:06:10'),
(61, 'NAVANEETHAN', 35, '9159678689', '2019-09-21', '2019-10-01', '1991-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:08:31', '2023-04-29 05:08:31'),
(62, 'JEYAKUMAR', 35, '9047220980', '2019-12-03', '2020-07-07', '1984-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:10:41', '2023-04-29 05:10:41'),
(63, 'VINOTHKUMAR A', 35, '9965478072', '2021-02-26', '2021-07-01', '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:11:44', '2023-04-29 05:11:44'),
(64, 'KALIDOSS', 14, '9842140708', '2022-10-06', '2022-10-06', '1989-03-18', NULL, NULL, 16, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:14:17', '2023-04-29 05:14:17'),
(65, 'ANTHONY XAVIER', 35, '9940881759', '2017-11-02', '2021-01-01', '1968-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:15:33', '2023-04-29 05:15:33'),
(66, 'ARPUTHARAJ', 35, '8883139846', '2019-08-29', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:17:54', '2023-04-29 05:17:54'),
(67, 'SIVASAKTHIVEL', 35, '9943330962', '2020-01-18', '2021-01-01', '1969-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:18:52', '2023-04-29 05:18:52'),
(68, 'VINOTH', 35, '9791373892', '2019-11-24', '2021-01-01', '1992-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:19:29', '2023-04-29 05:19:29'),
(69, 'ARUNACHALAM', 35, '8012555960', '2015-04-01', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:20:08', '2023-04-29 05:20:08'),
(70, 'SUNDHARAPANDI S', 35, '8012555934', '2015-04-01', '2015-04-01', '1986-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:21:12', '2023-04-29 05:21:12'),
(71, 'NAGARAJAN S', 35, '8012555928', '2019-06-11', '2019-06-11', '1982-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:22:59', '2023-04-29 05:22:59'),
(72, 'A VIVEKANANDAN', 35, '8012555938', '2019-06-06', '2021-02-01', '1986-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:24:40', '2023-04-29 05:24:40'),
(73, 'RANJITHKUMAR', 35, '9567474621', '2022-03-15', '2022-04-01', '1988-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:25:22', '2023-04-29 05:25:22'),
(74, 'JOTHIBASU C', 14, '9843695839', '2013-01-01', '2013-01-01', '1983-04-20', NULL, NULL, 15, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:26:58', '2023-04-29 05:26:58'),
(75, 'K.CHELLAM', 14, '8870313265', '2017-06-01', '2017-06-01', '1981-07-01', NULL, NULL, 15, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:28:45', '2023-04-29 05:28:45'),
(76, 'KARTHICK B', 14, '9626653542', '2018-07-14', '2018-07-14', '1990-04-15', NULL, NULL, 15, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:31:58', '2023-04-29 05:31:58'),
(77, 'BHARATH B', 14, '8012555987', '2022-10-08', '2022-10-08', '1990-04-15', NULL, NULL, 15, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:35:12', '2023-04-29 05:35:12'),
(78, 'JEYAPRAKASH J', 14, '8012555990', '2023-01-02', '2023-01-02', '1994-04-10', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:41:57', '2023-04-29 05:41:57'),
(79, 'P RAGUNATHAN', 14, '8012555902', '2007-07-01', '2007-07-01', '1974-03-09', NULL, NULL, 14, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:43:05', '2023-04-29 05:43:05'),
(80, 'J SURESHKUMAR', 14, '8012555904', '2008-12-01', '2008-12-01', '1981-06-11', NULL, NULL, 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:05:30', '2023-04-29 06:05:30'),
(81, 'M.SEKAR', 14, '8012555945', '2011-08-10', '2011-08-10', '1981-10-11', NULL, NULL, 11, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:11', '2023-04-29 06:07:11'),
(82, 'S.MUTHUPANDI', 14, '8012555916', '2012-02-01', '2012-02-01', '1974-05-02', NULL, NULL, 10, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:57', '2023-04-29 06:07:57'),
(83, 'M.MAYILRAJ', 14, '8012555907', '2012-12-01', '2012-10-01', '1975-07-30', NULL, NULL, 10, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:08:55', '2023-04-29 06:08:55'),
(84, 'MURUGESAN', 14, '8012555927', '2012-10-01', '2012-10-01', '1962-06-10', NULL, NULL, 13, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:10:06', '2023-04-29 06:10:06'),
(85, 'P.MARIYAPPAN', 14, '8012555905', '2012-10-01', '2012-10-01', '1983-10-30', NULL, NULL, 11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:11:08', '2023-04-29 06:11:08');
INSERT INTO `staff` (`id`, `name`, `department_id`, `phone_number`, `actual_date_of_joining`, `date_of_incorporation_in_pf`, `date_of_birth`, `age`, `wedding_day`, `supply_zone_id`, `supply_area_id`, `number_of_active_customers`, `emergency_contact_name`, `relation`, `contact_number`, `emergency_contact_name2`, `relation2`, `contact_number2`, `pf_or_esi`, `created_at`, `updated_at`) VALUES
(86, 'S.PERUMAL', 14, '9843370762', '2012-10-01', '2012-10-01', '1982-02-03', NULL, NULL, 14, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:46:33', '2023-04-29 06:46:33'),
(87, 'J KANNAN', 14, '8012555941', '2014-04-01', '2014-04-01', '1973-07-04', NULL, NULL, 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:48:17', '2023-04-29 06:48:17'),
(88, 'R KASIVISWANATHAN', 14, '8012555914', '2014-04-01', '2014-04-01', '1981-04-16', NULL, NULL, 11, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:50:02', '2023-04-29 06:50:02'),
(89, 'B SATHAMUSEN', 14, '8012555924', '2014-04-01', '2014-04-01', '1992-07-29', NULL, NULL, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:51:36', '2023-04-29 06:51:36'),
(90, 'BALAVENUGOPAL V', 14, '8012555926', '2015-04-01', '2015-04-01', '1972-05-12', NULL, NULL, 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:21:20', '2023-04-29 07:21:20'),
(91, 'RAMESH D', 14, '8012555964', '2015-04-01', '2015-04-01', '1978-01-21', NULL, NULL, 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:22:18', '2023-05-04 12:39:55'),
(92, 'RAVINDRAN M', 14, '8012555970', '2015-04-01', '2015-04-01', '1974-05-02', NULL, NULL, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:23:13', '2023-04-29 07:23:13'),
(93, 'MANIKANDAN K R', 14, '8012555985', '2015-04-01', '2015-04-01', '1980-01-07', NULL, NULL, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:24:55', '2023-04-29 07:24:55'),
(94, 'RAJA M', 14, '8012555994', '2015-04-01', '2015-04-01', '1983-10-13', NULL, NULL, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:28:19', '2023-04-29 07:28:19'),
(95, 'KADHARMYDEEN R', 14, '8012555981', '2015-04-01', '2015-04-01', '1983-04-24', NULL, NULL, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:31:31', '2023-04-29 07:31:31'),
(96, 'MAHALINGAM', 14, '8012555979', '2015-04-01', '2015-04-01', '1977-07-19', NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:32:25', '2023-04-29 07:32:25'),
(97, 'RAMACHANDRAN', 14, '8012555977', '2015-04-01', '2015-04-01', '1984-05-10', NULL, NULL, 13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:33:20', '2023-04-29 07:33:20'),
(98, 'C.NALLENDRAKUMAR', 14, '8012555983', '2015-12-01', '2015-12-01', '1988-06-28', NULL, NULL, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:34:17', '2023-04-29 07:34:17'),
(99, 'V.VIJAY', 14, '8012555953', '2015-12-01', '2015-12-01', '1986-07-01', NULL, NULL, 12, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:35:22', '2023-04-29 07:35:22'),
(100, 'R.MUTHU', 14, '8012555995', '2015-12-01', '2015-12-01', '1973-02-22', NULL, NULL, 10, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:37:19', '2023-04-29 07:37:19'),
(101, 'M.VINOTH', 14, '8012555943', '2015-12-01', '2015-12-01', '1989-04-14', NULL, NULL, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:05', '2023-04-29 07:38:05'),
(102, 'KAMATCHI', 14, '8012555912', '2019-03-01', '2019-03-01', '1979-04-05', NULL, NULL, 14, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:48', '2023-04-29 07:38:48'),
(103, 'SATHISHKUMAR C', 14, '8012555909', '2012-10-01', '2019-06-01', '1986-06-15', NULL, NULL, 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:39:50', '2023-04-29 07:39:50'),
(104, 'ABDHULLAH', 14, '8012555923', '2019-12-01', '2019-07-01', '1981-01-10', NULL, NULL, 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:40:36', '2023-04-29 07:40:36'),
(105, 'ALAGESAN', 14, '8012555993', '2021-07-01', '2021-07-01', '1983-03-15', NULL, NULL, 12, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:41:23', '2023-04-29 07:41:23'),
(106, 'S BALAMURUGAN', 14, '8012555992', '2021-07-01', '2021-07-01', '1995-09-29', '28', NULL, 11, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:42:48', '2023-07-05 06:20:07'),
(107, 'MADURAIVEERAN', 14, '8012555930', '2021-07-01', '2021-07-01', '1981-12-26', NULL, NULL, 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:44:24', '2023-04-29 07:44:24'),
(108, 'KURUMBAN', 14, '8012555910', '2021-07-01', '2021-11-01', '1989-06-01', NULL, NULL, 10, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:45:27', '2023-04-29 07:45:27'),
(109, 'C.RAMALINGAM', 14, '8012555921', '2021-08-01', '2022-07-01', '1976-02-12', NULL, NULL, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:46:16', '2023-04-29 07:46:16'),
(110, 'BOOMINATHAN', 14, '8012555982', '2022-10-06', '2022-10-06', '1974-05-11', NULL, NULL, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:47:00', '2023-04-29 07:47:00'),
(111, 'RAVICHANDRAN', 14, '8012555936', '2022-10-06', '2022-10-06', '1980-01-10', NULL, NULL, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:48:09', '2023-04-29 07:48:09'),
(112, 'DURAI', 14, '8012555908', '2022-11-05', '2022-11-05', '1986-05-23', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:00', '2023-04-29 07:50:00'),
(113, 'SARAVANAKUMAR', 14, '8012555980', '2023-01-02', '2023-01-02', '1977-07-31', NULL, NULL, 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:41', '2023-04-29 07:50:41'),
(114, 'DAYANA', 20, '8438073809', '2019-03-12', '2023-04-01', '1995-05-10', NULL, '2022-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:37:23', '2023-04-29 08:37:23'),
(115, 'PRIYADHARSHINI', 16, '8189877959', '2017-04-17', '2023-04-01', '1999-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:38:41', '2023-04-29 08:38:41'),
(116, 'R VIJAY', 14, '9843604701', '2015-04-11', '2015-04-01', '1983-05-06', NULL, NULL, 16, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:33:55', '2023-05-02 05:33:55'),
(117, 'NITHISHKUMAR R', 14, '8012555989', '2023-01-02', '2023-01-02', '1994-05-11', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:35:06', '2023-05-02 05:35:06'),
(120, 'RATHIDEVI SENTHILKUMAR', 9, '9942103199', '1994-01-01', '2020-10-01', '1980-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-03 08:54:50', '2023-05-03 08:54:50'),
(161, 'DEVA', 26, '8122660503', '2003-05-03', NULL, '1980-05-25', '41', '2009-02-03', NULL, NULL, NULL, 'T SARITHA', 'Spouse', '7358864420', 'M SALAIMUTHAIAH', 'Parent', '7200764428', 'No', '2023-05-29 04:58:51', '2023-05-29 04:58:51'),
(162, 'N RAJANGAM', 26, '9600087024', '2023-02-18', NULL, '1953-02-16', '70', '1978-06-28', NULL, NULL, NULL, 'R VIJAYALAKSHMI', 'Spouse', '6380709820', 'R MANIKANDAN', 'Sibling', '8754573434', 'No', '2023-05-29 05:01:41', '2023-05-29 05:01:41'),
(163, 'M PRIYANKA', 18, '9500561227', '2023-02-15', NULL, '1994-06-12', '29', '2012-09-26', NULL, NULL, NULL, 'B MARIMUTHU', 'Spouse', '9500777146', 'M KARTHICK RAJA', 'Sibling', '7530008449', 'No', '2023-05-29 05:10:35', '2023-05-29 05:10:35'),
(164, 'Manasvini @ Meenakshi.B', 18, '8438448434', '2023-01-23', NULL, '1997-06-12', '26', '2021-09-10', NULL, NULL, NULL, 'N PRAKASH', 'Spouse', '7010095940', 'B RAMALAKSHMI', 'Parent', '8072841517', 'No', '2023-05-29 05:13:01', '2023-05-29 05:13:01'),
(165, 'S ABIRAMI', 19, '9514086284', '2023-02-27', NULL, '1999-08-26', '24', '2022-04-06', NULL, NULL, NULL, 'M SARAVANAN', 'Spouse', '7418858074', 'SARANYA', 'Friend', '9176207368', 'No', '2023-05-29 05:17:09', '2023-05-29 05:17:09'),
(166, 'M MUTHULAKSHMI', 18, '8220773555', '2023-04-26', NULL, '2001-04-30', '22', '2020-10-29', NULL, NULL, NULL, 'M VINOTH', 'Spouse', '8438285350', 'M KASTHURI', 'Parent', '9655124575', 'No', '2023-05-29 05:43:18', '2023-05-29 05:43:18'),
(167, 'AMIRTHA', 38, '7200658808', '2023-03-23', NULL, '2003-01-28', '20', NULL, NULL, NULL, NULL, 'MALARVIZHI', 'Parent', '9363471863', 'PALANISAMY', 'Parent', '6374552344', 'No', '2023-06-01 05:56:17', '2023-06-07 11:21:54'),
(168, 'ARCHANA', 16, '8438075700', '2023-05-08', NULL, '2002-07-15', '21', '2023-01-23', NULL, NULL, NULL, 'AJITHKUMAR', 'Spouse', '8012555942', 'CHELLAM', 'Sibling', '8012938291', 'No', '2023-06-01 06:04:06', '2023-06-01 06:09:21'),
(169, 'ATHIRSTALAKSHMI A', 18, '9514475543', '2023-05-27', NULL, '1997-03-12', '26', '2022-04-06', NULL, NULL, NULL, 'SANKAR', 'Spouse', '8608600572', 'ASURAJAN', 'Parent', '9994575543', 'No', '2023-06-01 08:05:32', '2023-06-01 08:05:32'),
(170, 'AJITHKUMAR', 19, '9524754969', '2023-03-06', NULL, '1996-09-30', '27', '2023-01-23', NULL, NULL, NULL, 'ARCHANA', 'Spouse', '8438075700', 'CHELLAM', 'Parent', '8012938291', 'No', '2023-06-01 08:09:53', '2023-06-01 08:09:53'),
(171, 'SAJITHARANI', 16, '9092043173', '2023-03-20', NULL, '1985-05-20', '38', NULL, NULL, NULL, NULL, 'ABITHA', 'Sibling', '9003593173', NULL, NULL, NULL, 'No', '2023-06-01 08:15:12', '2023-06-01 08:15:12'),
(172, 'PANDIYARAJ', 26, '9787147604', '2018-05-16', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:30:05', '2023-06-01 08:30:05'),
(173, 'KARUPPASAMY', 24, '9942656271', '2022-06-04', NULL, '1980-07-10', '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:33:28', '2023-06-01 08:33:28'),
(174, 'SURESHKUMAR', 24, '8870827284', '2022-03-05', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:37:53', '2023-06-01 08:37:53'),
(175, 'KARTHIKEYAN', 24, '9787020716', '2023-04-01', NULL, '1981-11-17', '42', '2017-11-23', NULL, NULL, NULL, 'K KALEESWARI', 'Spouse', '7502342825', 'A UMAVATHI', 'Parent', '9943338865', 'No', '2023-06-01 08:39:38', '2023-06-01 09:06:17'),
(176, 'ALAGUPANDI', 14, '8012555925', '2022-07-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:41:37', '2023-06-01 08:41:37'),
(177, 'SELVARAJ', 14, '8012555940', '2015-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:43:53', '2023-06-01 08:43:53'),
(178, 'GANESAN', 14, '9442032239', '2018-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:45:05', '2023-06-01 08:45:05'),
(179, 'Dhanapakiam', 32, '1234567890', '0001-01-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:47:06', '2023-06-01 08:47:06'),
(180, 'MARIAMMAL', 32, '9940823540', '2015-07-06', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:48:11', '2023-06-01 08:48:11'),
(181, 'PAPPA', 32, '6385229518', '2014-06-02', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:49:35', '2023-06-01 08:49:35'),
(182, 'MURUGAN', 32, '9367740105', '2014-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:50:56', '2023-06-01 08:50:56'),
(183, 'GUNA', 27, '8012555971', '2023-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:13:56', '2023-06-02 13:13:56'),
(184, 'THILAGAR', 27, '8012555918', '2023-05-23', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:15:24', '2023-06-02 13:15:24'),
(33, 'JEYAPANDIAN', 21, '9842113949', '1983-07-05', '1992-01-01', '1964-06-08', '59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:42:09', '2023-07-03 12:40:30'),
(34, 'SENGUTTUVAN MOORTHY', 25, '9842913434', '1986-08-10', '1992-01-02', '1965-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:43:49', '2023-04-27 13:43:49'),
(35, 'MUTHUPANDI R', 9, '9842913949', '2004-01-25', '2006-09-01', '1979-08-02', NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:45:07', '2023-05-02 13:54:05'),
(36, 'J.PRABHU', 21, '9095013949', '2007-01-22', '2012-09-01', '1974-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:46:28', '2023-04-27 13:46:28'),
(37, 'MUTHUKUMAR NARASINGAM', 21, '9942884496', '2017-11-01', '2017-11-01', '1986-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:48:53', '2023-04-27 13:48:53'),
(38, 'VEERASUBRAMANIAN ARUMUGAM', 21, '9443015804', '2005-11-06', '2012-09-01', '1966-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:50:25', '2023-04-27 13:50:25'),
(39, 'A P KANNAN', 21, '9994107649', '2015-04-01', '2015-04-01', '1979-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 13:56:32', '2023-04-27 13:56:32'),
(40, 'BALAMURUGAN', 21, '7373713949', '2016-11-24', '2018-05-01', '1991-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-27 14:01:35', '2023-04-27 14:01:35'),
(41, 'P GANESAN', 27, '9894440030', '2016-06-04', '2017-12-01', '1989-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:20:41', '2023-04-28 07:20:41'),
(42, 'NAGESHVARAN', 9, '9698778711', '2018-02-10', '2018-04-01', '1977-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:22:55', '2023-04-28 07:22:55'),
(43, 'C SANKAR', 17, '7448395506', '2018-07-27', '2018-10-01', '1997-05-30', '26', NULL, NULL, NULL, NULL, 'CHINNAKKANNAN', 'Parent', '9698965045', 'MARY', 'Guardian', '9751940532', 'No', '2023-04-28 07:26:28', '2023-07-03 13:48:53'),
(44, 'KANNAN S', 27, '6369303198', '2021-02-01', '2021-04-01', '1999-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:29:08', '2023-05-04 12:55:09'),
(45, 'A YESURAJ', 9, '9597139163', '2015-01-04', '2019-06-01', '1990-12-18', NULL, '2019-11-03', NULL, NULL, NULL, 'ARUL SUTHA', 'Spouse', '9791235920', 'EMERANCE MARY', 'Parent', '7200304416', 'Yes', '2023-04-28 07:30:29', '2023-04-28 07:32:26'),
(46, 'SUBA SURENDIRAN', 9, '9665640012', '2018-03-05', '2018-04-01', '1963-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:37:28', '2023-04-28 07:37:28'),
(47, 'PALANIKUMAR', 17, '9788420232', '2019-08-12', '2020-01-01', '1990-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:38:53', '2023-04-28 07:38:53'),
(48, 'CHELLAPANDI', 35, '7305353870', '2020-11-11', '2021-01-01', '1993-02-03', NULL, '2021-05-17', NULL, NULL, NULL, 'C.PRIYADHASHINI', 'Spouse', '7904789647', 'K.MUTHU', 'Parent', '9790519733', 'Yes', '2023-04-28 07:40:50', '2023-05-02 13:56:05'),
(49, 'PANDIYARAJ A', 20, '9751801806', '2022-08-01', '2023-01-02', '2002-05-17', '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-04-28 07:42:38', '2023-07-06 13:13:47'),
(50, 'S MUTHURAJA', 20, '7708539670', '2022-10-06', '2022-10-06', '2002-04-21', NULL, NULL, NULL, NULL, NULL, 'MARIYAMMAL', 'Parent', '9597716390', 'THAALAMUTHU', 'Sibling', NULL, 'Yes', '2023-04-28 07:45:21', '2023-04-29 05:39:18'),
(51, 'R MURALI', 25, '9345680136', '2021-02-01', '2022-07-01', '1976-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-28 07:46:35', '2023-04-28 07:46:35'),
(52, 'PANDIYAMMAL S', 25, '9788154940', '2015-09-01', '2015-09-01', '1968-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:48:58', '2023-04-29 04:48:58'),
(53, 'RANI', 36, '9843372784', '2018-03-13', '2019-04-01', '1988-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:51:27', '2023-04-29 04:51:27'),
(54, 'PRABAVATHI', 9, '9940757877', '2018-04-01', '2018-07-01', '1990-09-16', NULL, '2015-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:56:21', '2023-04-29 04:56:21'),
(55, 'RAJALAKSHMI', 18, '9585263093', '2018-02-21', '2018-04-01', '1987-03-15', NULL, '2012-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 04:58:20', '2023-04-29 04:58:20'),
(56, 'MANIMALA', 9, '9003640130', '2012-01-25', '2020-02-04', '1986-01-08', NULL, '2007-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:00:08', '2023-04-29 05:00:08'),
(57, 'SONIYA', 19, '9384742459', '2021-11-13', '2022-08-04', '2001-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:01:45', '2023-04-29 05:01:45'),
(58, 'KANNAN', 35, '9629600849', '2015-09-01', '2015-09-01', '1982-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:02:45', '2023-04-29 05:02:45'),
(59, 'S.PRADEEP', 35, '8012555933', '2015-09-01', '2015-09-01', '1983-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:05:17', '2023-04-29 05:05:17'),
(60, 'M SIVAKUMAR', 35, '9087979906', '2015-12-01', '2016-12-01', '1984-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:06:10', '2023-04-29 05:06:10'),
(61, 'NAVANEETHAN', 35, '9159678689', '2019-09-21', '2019-10-01', '1991-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:08:31', '2023-04-29 05:08:31'),
(62, 'JEYAKUMAR', 35, '9047220980', '2019-12-03', '2020-07-07', '1984-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:10:41', '2023-04-29 05:10:41'),
(63, 'VINOTHKUMAR A', 35, '9965478072', '2021-02-26', '2021-07-01', '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:11:44', '2023-04-29 05:11:44'),
(64, 'KALIDOSS', 14, '9842140708', '2022-10-06', '2022-10-06', '1989-03-18', NULL, NULL, 16, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:14:17', '2023-04-29 05:14:17'),
(65, 'ANTHONY XAVIER', 35, '9940881759', '2017-11-02', '2021-01-01', '1968-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:15:33', '2023-04-29 05:15:33'),
(66, 'ARPUTHARAJ', 35, '8883139846', '2019-08-29', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:17:54', '2023-04-29 05:17:54'),
(67, 'SIVASAKTHIVEL', 35, '9943330962', '2020-01-18', '2021-01-01', '1969-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:18:52', '2023-04-29 05:18:52'),
(68, 'VINOTH', 35, '9791373892', '2019-11-24', '2021-01-01', '1992-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:19:29', '2023-04-29 05:19:29'),
(69, 'ARUNACHALAM', 35, '8012555960', '2015-04-01', '2021-01-01', '1979-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:20:08', '2023-04-29 05:20:08'),
(70, 'SUNDHARAPANDI S', 35, '8012555934', '2015-04-01', '2015-04-01', '1986-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:21:12', '2023-04-29 05:21:12'),
(71, 'NAGARAJAN S', 35, '8012555928', '2019-06-11', '2019-06-11', '1982-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:22:59', '2023-04-29 05:22:59'),
(72, 'A VIVEKANANDAN', 35, '8012555938', '2019-06-06', '2021-02-01', '1986-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:24:40', '2023-04-29 05:24:40'),
(73, 'RANJITHKUMAR', 35, '9567474621', '2022-03-15', '2022-04-01', '1988-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:25:22', '2023-04-29 05:25:22'),
(74, 'JOTHIBASU C', 14, '9843695839', '2013-01-01', '2013-01-01', '1983-04-20', NULL, NULL, 15, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:26:58', '2023-04-29 05:26:58'),
(75, 'K.CHELLAM', 14, '8870313265', '2017-06-01', '2017-06-01', '1981-07-01', NULL, NULL, 15, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:28:45', '2023-04-29 05:28:45'),
(76, 'KARTHICK B', 14, '9626653542', '2018-07-14', '2018-07-14', '1990-04-15', NULL, NULL, 15, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:31:58', '2023-04-29 05:31:58'),
(77, 'BHARATH B', 14, '8012555987', '2022-10-08', '2022-10-08', '1990-04-15', NULL, NULL, 15, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:35:12', '2023-04-29 05:35:12'),
(78, 'JEYAPRAKASH J', 14, '8012555990', '2023-01-02', '2023-01-02', '1994-04-10', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:41:57', '2023-04-29 05:41:57'),
(79, 'P RAGUNATHAN', 14, '8012555902', '2007-07-01', '2007-07-01', '1974-03-09', NULL, NULL, 14, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 05:43:05', '2023-04-29 05:43:05'),
(80, 'J SURESHKUMAR', 14, '8012555904', '2008-12-01', '2008-12-01', '1981-06-11', NULL, NULL, 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:05:30', '2023-04-29 06:05:30'),
(81, 'M.SEKAR', 14, '8012555945', '2011-08-10', '2011-08-10', '1981-10-11', NULL, NULL, 11, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:11', '2023-04-29 06:07:11'),
(82, 'S.MUTHUPANDI', 14, '8012555916', '2012-02-01', '2012-02-01', '1974-05-02', NULL, NULL, 10, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:07:57', '2023-04-29 06:07:57'),
(83, 'M.MAYILRAJ', 14, '8012555907', '2012-12-01', '2012-10-01', '1975-07-30', NULL, NULL, 10, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:08:55', '2023-04-29 06:08:55'),
(84, 'MURUGESAN', 14, '8012555927', '2012-10-01', '2012-10-01', '1962-06-10', NULL, NULL, 13, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:10:06', '2023-04-29 06:10:06'),
(85, 'P.MARIYAPPAN', 14, '8012555905', '2012-10-01', '2012-10-01', '1983-10-30', NULL, NULL, 11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:11:08', '2023-04-29 06:11:08'),
(86, 'S.PERUMAL', 14, '9843370762', '2012-10-01', '2012-10-01', '1982-02-03', NULL, NULL, 14, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:46:33', '2023-04-29 06:46:33'),
(87, 'J KANNAN', 14, '8012555941', '2014-04-01', '2014-04-01', '1973-07-04', NULL, NULL, 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:48:17', '2023-04-29 06:48:17'),
(88, 'R KASIVISWANATHAN', 14, '8012555914', '2014-04-01', '2014-04-01', '1981-04-16', NULL, NULL, 11, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:50:02', '2023-04-29 06:50:02'),
(89, 'B SATHAMUSEN', 14, '8012555924', '2014-04-01', '2014-04-01', '1992-07-29', NULL, NULL, 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 06:51:36', '2023-04-29 06:51:36'),
(90, 'BALAVENUGOPAL V', 14, '8012555926', '2015-04-01', '2015-04-01', '1972-05-12', NULL, NULL, 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:21:20', '2023-04-29 07:21:20'),
(91, 'RAMESH D', 14, '8012555964', '2015-04-01', '2015-04-01', '1978-01-21', NULL, NULL, 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:22:18', '2023-05-04 12:39:55'),
(92, 'RAVINDRAN M', 14, '8012555970', '2015-04-01', '2015-04-01', '1974-05-02', NULL, NULL, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:23:13', '2023-04-29 07:23:13'),
(93, 'MANIKANDAN K R', 14, '8012555985', '2015-04-01', '2015-04-01', '1980-01-07', NULL, NULL, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:24:55', '2023-04-29 07:24:55'),
(94, 'RAJA M', 14, '8012555994', '2015-04-01', '2015-04-01', '1983-10-13', NULL, NULL, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:28:19', '2023-04-29 07:28:19'),
(95, 'KADHARMYDEEN R', 14, '8012555981', '2015-04-01', '2015-04-01', '1983-04-24', NULL, NULL, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:31:31', '2023-04-29 07:31:31'),
(96, 'MAHALINGAM', 14, '8012555979', '2015-04-01', '2015-04-01', '1977-07-19', NULL, NULL, 13, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:32:25', '2023-04-29 07:32:25'),
(97, 'RAMACHANDRAN', 14, '8012555977', '2015-04-01', '2015-04-01', '1984-05-10', NULL, NULL, 13, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:33:20', '2023-04-29 07:33:20'),
(98, 'C.NALLENDRAKUMAR', 14, '8012555983', '2015-12-01', '2015-12-01', '1988-06-28', NULL, NULL, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:34:17', '2023-04-29 07:34:17'),
(99, 'V.VIJAY', 14, '8012555953', '2015-12-01', '2015-12-01', '1986-07-01', NULL, NULL, 12, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:35:22', '2023-04-29 07:35:22'),
(100, 'R.MUTHU', 14, '8012555995', '2015-12-01', '2015-12-01', '1973-02-22', NULL, NULL, 10, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:37:19', '2023-04-29 07:37:19'),
(101, 'M.VINOTH', 14, '8012555943', '2015-12-01', '2015-12-01', '1989-04-14', NULL, NULL, 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:05', '2023-04-29 07:38:05'),
(102, 'KAMATCHI', 14, '8012555912', '2019-03-01', '2019-03-01', '1979-04-05', NULL, NULL, 14, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:38:48', '2023-04-29 07:38:48'),
(103, 'SATHISHKUMAR C', 14, '8012555909', '2012-10-01', '2019-06-01', '1986-06-15', NULL, NULL, 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:39:50', '2023-04-29 07:39:50'),
(104, 'ABDHULLAH', 14, '8012555923', '2019-12-01', '2019-07-01', '1981-01-10', NULL, NULL, 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:40:36', '2023-04-29 07:40:36'),
(105, 'ALAGESAN', 14, '8012555993', '2021-07-01', '2021-07-01', '1983-03-15', NULL, NULL, 12, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:41:23', '2023-04-29 07:41:23'),
(106, 'S BALAMURUGAN', 14, '8012555992', '2021-07-01', '2021-07-01', '1995-09-29', '28', NULL, 11, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:42:48', '2023-07-05 06:20:07'),
(107, 'MADURAIVEERAN', 14, '8012555930', '2021-07-01', '2021-07-01', '1981-12-26', NULL, NULL, 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:44:24', '2023-04-29 07:44:24'),
(108, 'KURUMBAN', 14, '8012555910', '2021-07-01', '2021-11-01', '1989-06-01', NULL, NULL, 10, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:45:27', '2023-04-29 07:45:27'),
(109, 'C.RAMALINGAM', 14, '8012555921', '2021-08-01', '2022-07-01', '1976-02-12', NULL, NULL, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:46:16', '2023-04-29 07:46:16'),
(110, 'BOOMINATHAN', 14, '8012555982', '2022-10-06', '2022-10-06', '1974-05-11', NULL, NULL, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:47:00', '2023-04-29 07:47:00'),
(111, 'RAVICHANDRAN', 14, '8012555936', '2022-10-06', '2022-10-06', '1980-01-10', NULL, NULL, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:48:09', '2023-04-29 07:48:09'),
(112, 'DURAI', 14, '8012555908', '2022-11-05', '2022-11-05', '1986-05-23', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:00', '2023-04-29 07:50:00'),
(113, 'SARAVANAKUMAR', 14, '8012555980', '2023-01-02', '2023-01-02', '1977-07-31', NULL, NULL, 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 07:50:41', '2023-04-29 07:50:41'),
(114, 'DAYANA', 20, '8438073809', '2019-03-12', '2023-04-01', '1995-05-10', NULL, '2022-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:37:23', '2023-04-29 08:37:23'),
(115, 'PRIYADHARSHINI', 16, '8189877959', '2017-04-17', '2023-04-01', '1999-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-04-29 08:38:41', '2023-04-29 08:38:41'),
(116, 'R VIJAY', 14, '9843604701', '2015-04-11', '2015-04-01', '1983-05-06', NULL, NULL, 16, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:33:55', '2023-05-02 05:33:55'),
(117, 'NITHISHKUMAR R', 14, '8012555989', '2023-01-02', '2023-01-02', '1994-05-11', NULL, NULL, 15, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-02 05:35:06', '2023-05-02 05:35:06'),
(120, 'RATHIDEVI SENTHILKUMAR', 9, '9942103199', '1994-01-01', '2020-10-01', '1980-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-05-03 08:54:50', '2023-05-03 08:54:50'),
(161, 'DEVA', 26, '8122660503', '2003-05-03', NULL, '1980-05-25', '41', '2009-02-03', NULL, NULL, NULL, 'T SARITHA', 'Spouse', '7358864420', 'M SALAIMUTHAIAH', 'Parent', '7200764428', 'No', '2023-05-29 04:58:51', '2023-05-29 04:58:51'),
(162, 'N RAJANGAM', 26, '9600087024', '2023-02-18', NULL, '1953-02-16', '70', '1978-06-28', NULL, NULL, NULL, 'R VIJAYALAKSHMI', 'Spouse', '6380709820', 'R MANIKANDAN', 'Sibling', '8754573434', 'No', '2023-05-29 05:01:41', '2023-05-29 05:01:41'),
(163, 'M PRIYANKA', 18, '9500561227', '2023-02-15', NULL, '1994-06-12', '29', '2012-09-26', NULL, NULL, NULL, 'B MARIMUTHU', 'Spouse', '9500777146', 'M KARTHICK RAJA', 'Sibling', '7530008449', 'No', '2023-05-29 05:10:35', '2023-05-29 05:10:35'),
(164, 'Manasvini @ Meenakshi.B', 18, '8438448434', '2023-01-23', NULL, '1997-06-12', '26', '2021-09-10', NULL, NULL, NULL, 'N PRAKASH', 'Spouse', '7010095940', 'B RAMALAKSHMI', 'Parent', '8072841517', 'No', '2023-05-29 05:13:01', '2023-05-29 05:13:01'),
(165, 'S ABIRAMI', 19, '9514086284', '2023-02-27', NULL, '1999-08-26', '24', '2022-04-06', NULL, NULL, NULL, 'M SARAVANAN', 'Spouse', '7418858074', 'SARANYA', 'Friend', '9176207368', 'No', '2023-05-29 05:17:09', '2023-05-29 05:17:09'),
(166, 'M MUTHULAKSHMI', 18, '8220773555', '2023-04-26', NULL, '2001-04-30', '22', '2020-10-29', NULL, NULL, NULL, 'M VINOTH', 'Spouse', '8438285350', 'M KASTHURI', 'Parent', '9655124575', 'No', '2023-05-29 05:43:18', '2023-05-29 05:43:18'),
(167, 'AMIRTHA', 38, '7200658808', '2023-03-23', NULL, '2003-01-28', '20', NULL, NULL, NULL, NULL, 'MALARVIZHI', 'Parent', '9363471863', 'PALANISAMY', 'Parent', '6374552344', 'No', '2023-06-01 05:56:17', '2023-06-07 11:21:54'),
(168, 'ARCHANA', 16, '8438075700', '2023-05-08', NULL, '2002-07-15', '21', '2023-01-23', NULL, NULL, NULL, 'AJITHKUMAR', 'Spouse', '8012555942', 'CHELLAM', 'Sibling', '8012938291', 'No', '2023-06-01 06:04:06', '2023-06-01 06:09:21'),
(169, 'ATHIRSTALAKSHMI A', 18, '9514475543', '2023-05-27', NULL, '1997-03-12', '26', '2022-04-06', NULL, NULL, NULL, 'SANKAR', 'Spouse', '8608600572', 'ASURAJAN', 'Parent', '9994575543', 'No', '2023-06-01 08:05:32', '2023-06-01 08:05:32'),
(170, 'AJITHKUMAR', 19, '9524754969', '2023-03-06', NULL, '1996-09-30', '27', '2023-01-23', NULL, NULL, NULL, 'ARCHANA', 'Spouse', '8438075700', 'CHELLAM', 'Parent', '8012938291', 'No', '2023-06-01 08:09:53', '2023-06-01 08:09:53'),
(171, 'SAJITHARANI', 16, '9092043173', '2023-03-20', NULL, '1985-05-20', '38', NULL, NULL, NULL, NULL, 'ABITHA', 'Sibling', '9003593173', NULL, NULL, NULL, 'No', '2023-06-01 08:15:12', '2023-06-01 08:15:12'),
(172, 'PANDIYARAJ', 26, '9787147604', '2018-05-16', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:30:05', '2023-06-01 08:30:05'),
(173, 'KARUPPASAMY', 24, '9942656271', '2022-06-04', NULL, '1980-07-10', '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:33:28', '2023-06-01 08:33:28'),
(174, 'SURESHKUMAR', 24, '8870827284', '2022-03-05', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:37:53', '2023-06-01 08:37:53'),
(175, 'KARTHIKEYAN', 24, '9787020716', '2023-04-01', NULL, '1981-11-17', '42', '2017-11-23', NULL, NULL, NULL, 'K KALEESWARI', 'Spouse', '7502342825', 'A UMAVATHI', 'Parent', '9943338865', 'No', '2023-06-01 08:39:38', '2023-06-01 09:06:17'),
(176, 'ALAGUPANDI', 14, '8012555925', '2022-07-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:41:37', '2023-06-01 08:41:37'),
(177, 'SELVARAJ', 14, '8012555940', '2015-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:43:53', '2023-06-01 08:43:53'),
(178, 'GANESAN', 14, '9442032239', '2018-09-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:45:05', '2023-06-01 08:45:05'),
(179, 'Dhanapakiam', 32, '1234567890', '0001-01-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:47:06', '2023-06-01 08:47:06'),
(180, 'MARIAMMAL', 32, '9940823540', '2015-07-06', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:48:11', '2023-06-01 08:48:11'),
(181, 'PAPPA', 32, '6385229518', '2014-06-02', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:49:35', '2023-06-01 08:49:35'),
(182, 'MURUGAN', 32, '9367740105', '2014-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-01 08:50:56', '2023-06-01 08:50:56'),
(183, 'GUNA', 27, '8012555971', '2023-05-01', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:13:56', '2023-06-02 13:13:56'),
(184, 'THILAGAR', 27, '8012555918', '2023-05-23', NULL, '0001-01-01', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-06-02 13:15:24', '2023-06-02 13:15:24');

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
(1, 1, 'Laddu', 'Laddu-1404', 'Active', '2024-10-09 07:43:48', '2024-10-09 07:43:48');

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
(81, 'NEFT', 51, 'active', '2023-05-11 06:04:28', '2023-05-11 06:04:28'),
(82, 'Cash', 51, 'active', '2023-05-11 06:34:39', '2023-05-11 06:34:39'),
(83, 'Bata', 51, 'active', '2023-05-11 06:34:49', '2023-05-11 06:34:49'),
(84, 'Advance', 51, 'active', '2023-05-11 06:35:05', '2023-05-11 06:35:05'),
(85, 'External Consultant', 51, 'active', '2023-05-11 06:35:31', '2023-05-11 06:35:31'),
(86, 'Coffee / Tea / Water / Snacks', 53, 'active', '2023-05-11 06:38:42', '2023-05-11 06:38:42'),
(87, 'Vehicle Maintenance', 53, 'active', '2023-05-11 06:39:08', '2023-05-11 06:39:08'),
(88, 'Petrol', 53, 'active', '2023-05-11 06:39:19', '2023-05-11 06:39:19'),
(89, '5 kg', 54, 'active', '2023-05-11 06:39:35', '2023-05-11 06:39:35'),
(90, '14.2 kg', 54, 'active', '2023-05-11 06:39:44', '2023-05-11 06:39:44'),
(91, 'Staff Salary (Prabhu / Kumar /...)', 55, 'active', '2023-05-11 06:40:26', '2023-05-11 06:40:26'),
(92, 'Agrini Office Maintenance', 55, 'active', '2023-05-11 06:40:53', '2023-05-11 06:40:53'),
(93, '35 kg', 55, 'active', '2023-05-11 06:41:05', '2023-05-11 06:41:05'),
(94, 'NC', 56, 'active', '2023-05-11 06:41:17', '2023-05-11 06:41:17'),
(95, 'Refill', 56, 'active', '2023-05-11 06:41:30', '2023-05-11 06:41:30'),
(96, 'POS', 56, 'active', '2023-05-11 06:41:40', '2023-05-11 06:41:40'),
(97, '19 kg', 57, 'active', '2023-05-11 06:42:13', '2023-05-11 06:42:13'),
(98, 'From Nagamalai Godown to Showroom', 58, 'active', '2023-05-11 07:08:46', '2023-05-11 07:08:46'),
(99, 'From CKN Godown to Showroom', 58, 'active', '2023-05-11 07:09:01', '2023-05-11 07:09:01'),
(100, 'From Thanathavam Godown to Showroom', 58, 'active', '2023-05-11 07:09:33', '2023-05-11 07:09:33'),
(101, 'From Nagamalai Godown to Bank', 58, 'active', '2023-05-11 07:10:21', '2023-05-11 07:10:21'),
(102, 'From CKN Godown to Bank', 58, 'active', '2023-05-11 07:10:35', '2023-05-11 07:10:35'),
(103, 'From Thanathavam Godown to Bank', 58, 'active', '2023-05-11 07:10:57', '2023-05-11 07:10:57'),
(104, 'From Showroom to Nagamalai Godown', 58, 'active', '2023-05-11 07:11:49', '2023-05-11 07:11:49'),
(105, 'From Showroom to CKN Godown', 58, 'active', '2023-05-11 07:12:06', '2023-05-11 07:12:06'),
(106, 'From Showroom to Thanathavam Godown', 58, 'active', '2023-05-11 07:12:26', '2023-05-11 07:12:26'),
(107, 'From Showroom to Bank', 58, 'active', '2023-05-11 07:12:41', '2023-05-11 07:12:41'),
(108, 'Transport Amount Credit', 60, 'active', '2023-05-11 07:14:39', '2023-05-11 07:14:39'),
(109, 'Domestic Lorry Driver salary', 60, 'active', '2023-05-11 07:15:35', '2023-05-11 07:15:35'),
(110, 'Domestic Lorry Driver Bata', 60, 'active', '2023-05-11 07:16:02', '2023-05-11 07:16:02'),
(111, 'Domestic Lorry Driver Pay Advance', 60, 'active', '2023-05-11 07:16:25', '2023-05-11 07:16:25'),
(112, 'Domestic Lorry Unloading Charges at Plant', 60, 'active', '2023-05-11 07:17:07', '2023-05-11 07:17:07'),
(113, 'Domestic Lorry Unloading Charges at Godown', 60, 'active', '2023-05-11 07:17:21', '2023-05-11 07:17:21'),
(114, '2727 Maintenance', 60, 'active', '2023-05-11 07:17:38', '2023-05-11 07:17:38'),
(115, '2923 Maintenance', 60, 'active', '2023-05-11 07:17:49', '2023-05-11 07:17:49'),
(116, '6088 Maintenance', 60, 'active', '2023-05-11 07:18:00', '2023-05-11 07:18:00'),
(117, '8642 Maintenance', 60, 'active', '2023-05-11 07:18:14', '2023-05-11 07:18:14'),
(118, '2727 Diesel', 60, 'active', '2023-05-11 07:18:39', '2023-05-11 07:19:25'),
(119, '2923 Diesel', 60, 'active', '2023-05-11 07:18:50', '2023-05-11 07:19:37'),
(120, '6088 Diesel', 60, 'active', '2023-05-11 07:19:05', '2023-05-11 07:19:47'),
(121, '8642 Diesel', 60, 'active', '2023-05-11 07:20:08', '2023-05-11 07:20:08'),
(122, '2727 Fastag', 60, 'active', '2023-05-11 07:20:26', '2023-05-11 07:20:26'),
(123, '2923 Fastag', 60, 'active', '2023-05-11 07:20:37', '2023-05-11 07:20:37'),
(124, '6088 Fastag', 60, 'active', '2023-05-11 07:20:46', '2023-05-11 07:20:46'),
(125, '8642 Fastag', 60, 'active', '2023-05-11 07:21:02', '2023-05-11 07:21:02'),
(126, '19kg Sales', 61, 'active', '2023-05-11 07:21:29', '2023-05-11 07:21:29'),
(127, '35 kg Sales', 61, 'active', '2023-05-11 07:21:41', '2023-05-11 07:21:41'),
(128, '47.5 kg LOT Sales', 61, 'active', '2023-05-11 07:22:29', '2023-05-11 07:22:29'),
(129, 'Commercial Lorry Driver Bata', 61, 'active', '2023-05-11 07:39:08', '2023-05-11 07:39:08'),
(130, 'Commercial Lorry Unloading Charges at Plant', 61, 'active', '2023-05-11 07:40:02', '2023-05-11 07:40:02'),
(131, 'Commercial Lorry Unloading Charges at Godown', 61, 'active', '2023-05-11 07:40:17', '2023-05-11 07:40:17'),
(132, 'Commercial van Driver Bata', 61, 'active', '2023-05-11 07:40:36', '2023-05-11 07:40:36'),
(133, 'Commercial Van Cleanar Salary', 61, 'active', '2023-05-11 07:41:16', '2023-05-11 07:41:16'),
(134, 'Commercial Staff Salary (Manimala / Soniya / Abirami / Nagesh / Ajith kumar )', 61, 'active', '2023-05-11 07:45:25', '2023-05-11 07:45:25'),
(135, 'Staff Welfare - Vehicle Maintenance /', 61, 'active', '2023-05-11 07:46:40', '2023-05-11 07:46:40'),
(136, 'Commercial Cylinder Rent', 61, 'active', '2023-05-11 07:48:06', '2023-05-11 07:48:06'),
(137, '0403 Maintenance', 61, 'active', '2023-05-11 07:48:31', '2023-05-11 07:48:31'),
(138, '0403 Diesal', 61, 'active', '2023-05-11 07:48:46', '2023-05-11 07:48:46'),
(139, '0403 Fastag', 61, 'active', '2023-05-11 07:49:00', '2023-05-11 07:49:00'),
(140, '0403 Driver Salary / Incentive / Bata', 61, 'active', '2023-05-11 07:50:02', '2023-05-11 07:50:02'),
(141, 'TN 58 AJ 6923 Maintenance', 61, 'active', '2023-05-11 07:50:30', '2023-05-11 07:50:30'),
(142, 'TN 58 AJ 6923 Diesel', 61, 'active', '2023-05-11 07:50:47', '2023-05-11 07:50:47'),
(143, 'TN 58 AJ 6923 Fastag', 61, 'active', '2023-05-11 07:51:04', '2023-05-11 07:51:04'),
(144, 'TN 58 AJ 6923 Driver Salary / Incentive / Bata', 61, 'active', '2023-05-11 07:51:38', '2023-05-11 07:51:38'),
(145, 'Short Amount', 93, 'active', '2023-05-11 07:52:09', '2023-05-11 07:52:09'),
(146, 'Extra Amount', 93, 'active', '2023-05-11 07:52:27', '2023-05-11 07:52:27'),
(147, 'TN 58 BF 3541 - Diesel', 94, 'active', '2023-05-11 07:53:11', '2023-05-11 07:53:11'),
(148, 'TN 58 BF 3558 - Diesel', 94, 'active', '2023-05-11 07:53:23', '2023-05-11 07:53:23'),
(149, 'TN 58 BF 4559 - Diesel', 94, 'active', '2023-05-11 07:53:35', '2023-05-11 07:53:35'),
(150, 'TN 58 BF 4574 - Diesel', 94, 'active', '2023-05-11 07:53:48', '2023-05-11 07:53:48'),
(151, 'TN 58 BF 3541 - Fastag', 94, 'active', '2023-05-11 07:54:26', '2023-05-11 07:54:26'),
(152, 'TN 58 BF 3558 - Fastag', 94, 'active', '2023-05-11 07:54:38', '2023-05-11 07:54:38'),
(153, 'TN 58 BF 4559 - Fastag', 94, 'active', '2023-05-11 07:54:51', '2023-05-11 07:54:51'),
(154, 'TN 58 BF 4574 - Fastag', 94, 'active', '2023-05-11 07:55:04', '2023-05-11 07:55:04'),
(155, 'Delivery Charges - Perayur', 94, 'active', '2023-05-11 07:55:37', '2023-05-11 07:55:37'),
(156, 'Delivery Charges - Kallupatti', 94, 'active', '2023-05-11 07:55:58', '2023-05-11 07:55:58'),
(157, 'Perayur Van Driver Salary / Incentive', 94, 'active', '2023-05-11 07:57:21', '2023-05-11 07:57:21'),
(158, 'SALES', 101, 'active', '2023-05-11 08:56:24', '2023-05-11 08:56:24'),
(159, 'PURCHES', 101, 'active', '2023-05-11 08:56:34', '2023-05-11 08:56:34'),
(160, 'TN 58 BF 3541 - Maintenance', 94, 'active', '2023-05-11 11:20:15', '2023-05-11 11:20:15'),
(161, 'TN 58 BF 3558 - Maintenance', 94, 'active', '2023-05-11 11:20:28', '2023-05-11 11:20:28'),
(162, 'TN 58 BF 4559 - Maintenance', 94, 'active', '2023-05-11 11:20:43', '2023-05-11 11:20:43'),
(163, 'TN 58 BF 4574 - Maintenance', 94, 'active', '2023-05-11 11:20:59', '2023-05-11 11:20:59'),
(164, 'Staff Salary', 101, 'active', '2023-05-11 11:21:37', '2023-05-11 11:21:37'),
(165, '4422 Petrol', 101, 'active', '2023-05-11 11:22:08', '2023-05-11 11:22:08'),
(166, '4422 Maintenance', 101, 'active', '2023-05-11 11:22:23', '2023-05-11 11:22:23'),
(167, 'Cartage', 101, 'active', '2023-05-11 11:22:36', '2023-05-11 11:22:36'),
(168, 'COINS', 99, 'active', '2023-05-12 05:25:48', '2023-05-12 05:25:48'),
(169, 'COINS', 100, 'active', '2023-05-12 05:26:06', '2023-05-12 05:26:06'),
(171, 'Card Payment / Swipe', 114, 'active', '2023-05-20 05:39:10', '2023-05-20 05:39:10'),
(172, 'Gpay', 114, 'active', '2023-05-20 05:39:25', '2023-05-20 05:39:25'),
(173, 'Paytm', 114, 'active', '2023-05-20 05:39:35', '2023-05-20 05:39:35'),
(174, 'NEFT', 114, 'active', '2023-05-20 05:39:58', '2023-05-20 05:39:58'),
(175, 'Others', 114, 'active', '2023-05-20 05:40:11', '2023-05-20 05:40:11'),
(176, 'Single With Stove', 119, 'active', '2023-06-23 06:26:18', '2023-07-03 06:14:20'),
(177, 'Single Without Stove', 119, 'active', '2023-06-23 06:26:35', '2023-07-03 06:14:32'),
(178, 'Double with Stove', 119, 'active', '2023-06-23 06:26:52', '2023-07-03 06:14:45'),
(179, 'Double without Stove', 119, 'active', '2023-06-23 06:27:09', '2023-07-03 06:14:59'),
(180, 'Delivery Boys', 58, 'active', '2023-06-23 06:43:30', '2023-06-23 06:43:30'),
(181, 'Reading Amount', 55, 'active', '2023-07-05 06:46:00', '2023-07-05 06:46:00'),
(182, 'TN 58 BC 7168', 120, 'active', '2023-07-05 07:00:47', '2023-07-05 07:00:47');

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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_status` enum('Success','Failure') NOT NULL DEFAULT 'Success',
  `payment_id` varchar(191) NOT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Super Admin', 'admin@sbamadurai.com', '$2y$10$5M/4pTqxNJpIQm2n9giWiehhJ7XEht2xYVdpbWdWt8htypi1uzxoe', '898989897', NULL, 'Web', 'No', NULL, 'Super Admin', 'Active', '4321', NULL, 'No', NULL, NULL, 'No', NULL, 'ztHZRb1pC1tgGgLmBKi03Dl6Z0gQLggMmixIbLzacdU01qyckS8rxXIWZiiv', '2020-10-14 17:26:08', '2024-10-09 07:18:30'),
(2, 'Rajesh', 'rajesh@mailinator.com', '$2y$10$O1aKPDGBMfzBRlkpC7PzOe1Gb0om0Knzonj1A6259MH2EslHO3P4i', '8610292918', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-01-12 20:28:04', 'Yes', '1234', '2023-01-12 20:21:45', 'Yes', NULL, NULL, '2023-01-12 16:14:40', '2023-11-03 19:54:21'),
(3, 'Raj', 'raj@mailinator.com', '$2y$10$vezHyBW0wnBiAdwNXvNVweE9it/LP8RzHU76GDmzvzQJeviPNwHGW', '7777777777', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-01-20 11:13:47', 'Yes', '1234', '2023-01-20 11:13:47', 'Yes', NULL, NULL, '2023-01-20 11:03:47', '2023-01-20 11:03:53'),
(4, 'Anu', 'anu@mailinator.com', '$2y$10$EbJkyUHC4BRexcXgiGrfYOO79dzTKUrG1BqSpwtCrAPgmyNCbk9s.', '6523985527', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-01-23 12:56:12', 'Yes', '1234', '2023-01-23 12:56:12', 'Yes', NULL, 'N44uynzKvF0TwrIk9Yv4Y4NHEupB0Rp5m1iJ6CTapiMxwQ4OhlfqnHsEfwS5', '2023-01-23 12:46:12', '2023-11-08 14:49:04'),
(5, 'Pari', 'pari@yahoo.com', '$2y$10$LNlb4se3dUqXhfzSqZ5TjuGaOZieD2B4R08oN93yfDHnMObvuew1.', '9090898789', NULL, 'Web', 'No', NULL, 'Executive', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-02-08 10:31:45', '2023-02-10 18:29:50'),
(6, 'Shri Balaji Agencies Madurai', 'sbahobey@gmail.com', '$2y$10$U9LfCBowobwGanj3N8vSCu/ikce5dAwMdnhxSxtiwAEj0/0/X4W1C', '8012555969', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-02-15 11:50:39', 'Yes', '', '2023-02-15 11:50:39', 'Yes', NULL, NULL, '2023-02-15 11:40:39', '2023-10-19 17:57:16'),
(7, 'Shri Balaji Agencies Madurai', 'shribalajiagenciesmdu@gmail.com', '$2y$10$QZD3r8QRAHNXSLSCfHQmKOGQJXi5NKW5sn2RGacmndbfZrOF55piO', '6369893419', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-02-15 11:52:38', 'Yes', '1234', '2023-02-15 11:52:38', 'Yes', NULL, NULL, '2023-02-15 11:42:38', '2023-02-15 11:42:38'),
(8, 'Prabavathi K', 'maduraikadai2023@gmail.com', '$2y$10$Yqyqi.qopy1lsMaZqJxhc.76Kx9jk0WIcdOPzHDud3AhxPgqUrQee', '8012555969', NULL, 'Web', 'No', NULL, 'Admin', 'Active', '1234', '2023-04-18 13:41:33', 'Yes', '', NULL, 'No', NULL, 'iPTc2aAZVsXqJHLbcSkD0tOvrgL13tz8vuh064TpV6d3nVxY84oWmyKBX8lD', '2023-03-11 18:27:01', '2023-12-14 10:38:29'),
(9, 'aaa', 'aaa@mailinator.com', '$2y$10$LwaGt2Yu4u8FvSUjNvnp6ehFTlXwngUL/77r1wYZOaoPnURXrdYny', '9638527410', NULL, 'Web', 'No', NULL, 'Admin', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-03-24 12:56:41', '2023-03-24 12:56:41'),
(10, 'abc', 'abc@mailinator.com', '$2y$10$.iQtaetXQr/Y89oOsK30VeMZZElQIZi/hzFlRjkkH/drMVevhF.aO', '1234567890', NULL, 'Web', 'No', NULL, 'Rider', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-03-24 13:16:37', '2023-03-24 13:16:37'),
(11, 'Test', 'test@mailinator.com', '$2y$10$ShMN0FjMGbB9h2LBNtnzaO114yL3lFhH/KfufwsqK64ek9rYCPgBy', '1234569842', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-01 13:18:34', 'Yes', '1234', '2023-04-01 13:18:34', 'Yes', NULL, NULL, '2023-04-01 13:08:34', '2023-04-01 13:08:34'),
(12, 'Test', 'test1@mailinator.com', '$2y$10$cRMEfI865KHvrYgyx7x4oe0FS.qPV7ECVN2UMzHcJSOQuQXlo/mZS', '9163836140', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-01 13:19:34', 'Yes', '1234', '2023-04-01 13:19:12', 'Yes', NULL, NULL, '2023-04-01 13:09:12', '2023-04-01 13:09:34'),
(13, 'Sumit Dalakiya', 'sumitdalakiya@gmail.com', '$2y$10$vwcXoUHkO4tGdz.WOSCMzOEVY4cHVkHxHLBnqpDReg6GedNs92c4e', '9033073049', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-01 14:41:31', 'Yes', '1234', '2023-04-01 14:41:31', 'Yes', NULL, NULL, '2023-04-01 14:31:31', '2023-04-01 14:31:37'),
(14, 'Arvinth', 'vasudevanarvinth@gmail.com', '$2y$10$.pcAkTX3afwefClstz/y1eLwbNMdFgtK5Jsx4lnYqmxgdn9nfxF2G', '6369893419', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-15 09:01:10', 'Yes', '1234', '2023-04-15 09:01:10', 'Yes', NULL, NULL, '2023-04-15 08:51:10', '2023-04-15 08:51:24'),
(15, 'Rajesh Rathod', 'rajesh.rathod@gmail.com', '$2y$10$rSUCiOA0u8XSnsyKiRNcguDx1kyfzMTp9MRkJbPisaUnvM3bLevXe', '9662590621', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-17 17:57:06', 'Yes', '1234', '2023-04-17 17:57:06', 'Yes', NULL, NULL, '2023-04-17 17:47:06', '2023-04-17 17:47:12'),
(16, 'Aakash', 'aakashlll@gmail.com', '$2y$10$k9gKvshRtASHLKcFDuOqseatvEolN.6Daal7nFIXji9j5pVc9svky', '1258963456', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-18 11:43:46', 'Yes', '1234', '2023-04-18 11:43:46', 'Yes', NULL, NULL, '2023-04-18 11:33:46', '2023-04-18 11:33:57'),
(17, 'Prabavathi', 'prabamuthu77@gmail.com', '$2y$10$IiHE04.v4ZE4kFFM2xpKj.kLqx5Qs4g1UjstZBjhgBTltZJePpPXq', '9199407578', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-04-18 13:34:23', 'Yes', '', '2023-04-18 13:34:23', 'Yes', NULL, NULL, '2023-04-18 13:24:23', '2024-02-27 12:47:48'),
(18, 'Abi', 'abi@mailinator.com', '$2y$10$fCWeOl7qstYHOQ1sfco40.UxDLHxxvi7bd.rUXywPksZmC1R7PXpu', '9163836140', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-09 17:42:00', 'Yes', '1234', '2023-05-09 17:42:00', 'Yes', NULL, NULL, '2023-05-09 17:32:00', '2023-05-09 17:32:00'),
(19, 'Aathi', 'aathi@mailinator.com', '$2y$10$EVtYimquj9qYts04t2BECus0.3dzzKJt7GT6d10OuCjUAL3Xzl.Dq', '3216547890', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-09 17:45:14', 'Yes', '1234', '2023-05-09 17:45:14', 'Yes', NULL, NULL, '2023-05-09 17:35:14', '2023-05-09 17:35:14'),
(20, 'Anil', 'anil@mailinator.com', '$2y$10$kYYWBQmLP7luFvNsdIpG7u9zLyLVAbEpu/Z11XkaitoQ6fzgPfME2', '9638527410', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-10 13:16:04', 'Yes', '1234', '2023-05-10 13:16:04', 'Yes', NULL, NULL, '2023-05-10 13:06:04', '2023-05-10 13:06:04'),
(21, 'Banu', 'banu@mailinator.com', '$2y$10$qUIfmcal55UAeXTFpz1dRuFda88hBs7vMZflbb1GM7DFzvrQ4Iy5C', '6325897410', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-05-10 15:55:56', 'Yes', '1234', '2023-05-10 15:55:56', 'Yes', NULL, NULL, '2023-05-10 15:45:56', '2023-11-07 09:57:40'),
(22, 'Hello World! https://racetrack.top/go/hezwgobsmq5dinbw?hs=44f6e2394925ef9c4af645e4296a1d8d&', 'yhfee@chitthi.in', '$2y$10$8K4arJv/QiflOcRLnd.BjuooLb2nh0BRpKnEQmjqvqBwUojOvrT8a', '779172110040', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-05-17 18:09:48', '2023-05-17 18:09:48'),
(23, 'Mani', 'mani@mailinator.com', '$2y$10$Q5JQiTxDNgCy9lx0UNAgoulrLyTKDPGSRajzwnzcWPeIqCWCOxYSO', '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-15 13:51:39', 'Yes', '1234', '2023-09-15 13:51:39', 'Yes', NULL, NULL, '2023-09-15 13:41:39', '2023-09-15 13:41:49'),
(24, 'Sumit Dalakiya', 'sumit.dalakiya@gmail.com', '$2y$10$WbGijHlja1arw0uUN4BQH.XPIqOU8Bd541JpW1he4fi1Ab0YzeWEi', '9033073049', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-21 17:22:54', 'Yes', '1234', '2023-09-21 17:22:54', 'Yes', NULL, NULL, '2023-09-21 17:12:54', '2023-09-21 17:12:54'),
(25, 'Thulirsoft', 'thulirsoft@gmail.com', '$2y$10$jMKa8n7Tt59Z0rmAWUZ2KuDm.fTRzC0a37Ai8kCcVr8naBkWOCMpO', '8529836553', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-21 17:31:01', 'Yes', '1234', '2023-09-21 17:31:01', 'Yes', NULL, NULL, '2023-09-21 17:21:01', '2023-11-08 14:51:32'),
(26, 'Roselin Jenifer', 'testkkkk@mailinator.com', '$2y$10$Gx3/um9KOEqw7MKH0VaDCeKUH44Sb.fA36XEFNytkiabTor0p4L0q', '8366666666', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-21 17:33:51', 'Yes', '1234', '2023-09-21 17:33:51', 'Yes', NULL, NULL, '2023-09-21 17:23:51', '2023-09-21 17:23:51'),
(27, 'Roselin', 'testggg@gmi.com', '$2y$10$pwk1rb03HtU/.6h/3112wOB.nCSSNSlBh9bIumBRZCI.I6sWqVsli', '5266666666', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-21 17:37:00', 'Yes', '1234', '2023-09-21 17:37:00', 'Yes', NULL, NULL, '2023-09-21 17:27:00', '2023-09-21 17:27:00'),
(28, 'Nithya', 'nithya@mailinator.com', '$2y$10$xL4P0gl.26xGzFSBx0Jh3ed5MqEDOQARO14BgOg3MdT5ELmJ.3e.O', '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-22 12:46:59', 'Yes', '1234', '2023-09-22 12:46:59', 'Yes', NULL, NULL, '2023-09-22 12:36:59', '2023-09-22 12:36:59'),
(29, '70b944831848c84a', 'r1@mailinator.com', '$2y$10$iQL73pZzFBCjfIYIcMfNp.e46QKlYpgPSJfjrwl04PPux2eUy0z9y', '+91 123333333', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-09-29 17:20:49', 'Yes', '1234', '2023-09-29 17:20:49', 'Yes', NULL, NULL, '2023-09-29 17:10:49', '2023-09-29 17:10:49'),
(30, 'Surendiran', 'subasurendiran@gmail.com', '$2y$10$Y5ezeZpmXpKsiu3RGgRJkerptbniKEfIfGWAnsOo6Dvftr9TO/SsW', '9843162347', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-10-17 05:39:26', 'Yes', '1234', '2023-10-17 05:39:26', 'Yes', NULL, NULL, '2023-10-17 05:29:26', '2023-10-17 05:29:26'),
(31, 'Arvinth', 'arvinthv1994@gmail.com', '$2y$10$Q6OGNqF7JWhsi0X9PYIdLu8hAb3xKruTZP72DQbtzvF5N2JOPqgRW', '6369893419', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-10-17 08:33:40', 'Yes', '1234', '2023-10-17 08:33:40', 'Yes', NULL, NULL, '2023-10-17 08:23:40', '2023-10-17 08:23:40'),
(32, 'Muthu Raja', 'muthuraja42000@gmail.com', '$2y$10$Bcv5QEDDXmuAxgB3NOGfM.tBwuAcC3.a26PUKvrS2nkGkR0geFA8G', '9193447230', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-10-17 18:42:02', 'Yes', '1234', '2023-10-17 18:42:02', 'Yes', NULL, NULL, '2023-10-17 18:32:02', '2023-10-17 18:32:02'),
(33, 'Prem', 'ajithchef7@gmail.com', '$2y$10$TITPabW6bKzZH2LLmSOt6eLur9knGhPjIh.9tdn3RSpNoDE1B8zXK', '8754746283', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-10-17 18:43:14', 'Yes', '1234', '2023-10-17 18:43:14', 'Yes', NULL, NULL, '2023-10-17 18:33:14', '2023-10-17 18:33:14'),
(34, 'Rajkumar Bala', 'rajkumarmahabalan@gmail.com', '$2y$10$t4jx1DK/JQeban9LvOQaN.GCUrp1ivAYZ8TPwSD2m3uQpfn5hEfp6', '9629386687', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-10-18 20:52:31', 'Yes', '1234', '2023-10-18 20:52:31', 'Yes', NULL, NULL, '2023-10-18 20:42:31', '2023-10-18 20:42:31'),
(35, 'Dayana', 'shribalajiagenciesmdu@gmailcom', '$2y$10$uXSdfvwxExTBI14LdKS8XOhKvYDGS6CKTU8SWEtLddU/HHk01XmJC', '8012555950', NULL, 'Web', 'Yes', 'Daya4185', 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-10-30 13:08:18', '2023-10-30 13:08:18'),
(36, 'Ajay', 'ajay@gmail.com', '$2y$10$fsDt754bXOaxDNRV3513Du3ePictFJcJ/Qm7z9MIoQgydoKrx/BkC', '8678452685', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-11-01 19:41:53', '2023-11-01 19:41:53'),
(37, 'Vijay@gmail.com', 'vijay@gmail.com', '$2y$10$bclQ6fpEcWqjkO0X/9pQy.EtLjRVu9iyZiv4yVTQ7KBwXW0GyKYG2', '8765432109', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2023-11-07 08:58:30', '2023-11-07 08:58:30'),
(38, 'Operations', 'adminops@sbamadurai.com', '$2y$10$5M/4pTqxNJpIQm2n9giWiehhJ7XEht2xYVdpbWdWt8htypi1uzxoe', '898989897', NULL, 'Web', 'No', NULL, 'Accountant', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, 'LtBVKao9DvJXPI3JId4Dct6uDdtmfPInvsfgt8DeKqSwBwK5b7Kw0fSUhbpo', '2023-11-10 10:47:08', '2023-11-10 10:47:08'),
(39, 'Saranya', 'saranya@mailinator.com', '$2y$10$m0kry5tZhGX5SPSvnVCfNu1M2rnvZhZMWAUi8RR9d4.3.nhmuYjwe', '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-17 16:51:09', 'Yes', '1234', '2023-11-17 16:51:09', 'Yes', NULL, NULL, '2023-11-17 16:41:09', '2024-10-09 06:54:59'),
(40, 'Rajalakshmi', 'rajidanyas@gmail.com', '$2y$10$UnH0NEFqs4H2dy6zoM50Pu1e0Ql2mbCz0cH2vEJreStg9O6FAmaxa', '9585263093', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-27 11:35:21', 'Yes', '1234', '2023-11-27 11:35:21', 'Yes', NULL, NULL, '2023-11-27 11:25:21', '2023-11-27 11:25:21'),
(41, 'Preethi', 'spsp902531@gmail.com', '$2y$10$SCOEwXBuss9TEPQh5vzGIOXIAlTtv5rRR7ODqOVHVSbfUoLdP1FNW', '9025313708', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-28 00:24:43', 'Yes', '1234', '2023-11-28 00:24:43', 'Yes', NULL, NULL, '2023-11-28 00:14:43', '2023-11-28 00:14:43'),
(42, 'Anjali Sankar', 'anjalisankar9397@gmail.com', '$2y$10$QkaefnBDUc3vCVUIKpaSr.L9DE0.khVWhrOUYCDM7CR.Bc26v02Ma', '9195144755', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-28 17:27:46', 'Yes', '1234', '2023-11-28 17:27:46', 'Yes', NULL, NULL, '2023-11-28 17:17:46', '2023-11-28 17:17:46'),
(43, 'Kavitha', 'jaikavimukikani@gmail.com', '$2y$10$OZWwysJoq/PLLSTB0WfOROYJ4lOaWioNZ.RWrz/6qpY8rQmHp7RNe', '9500893704', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-28 17:37:11', 'Yes', '1234', '2023-11-28 17:37:11', 'Yes', NULL, NULL, '2023-11-28 17:27:11', '2023-11-28 17:27:11'),
(44, 'Priyanka', 'priyamari1261994@gmail.com', '$2y$10$r7skjkTz7y0.mVE8kYelfelfYSK.Z23CW2LC9yP3P5JYicTOUnwpi', '9500561227', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-28 18:34:29', 'Yes', '1234', '2023-11-28 18:34:29', 'Yes', NULL, NULL, '2023-11-28 18:24:29', '2023-11-28 18:24:29'),
(45, 'Anjalisankar', 'anjalisankar93@gmail.com', '$2y$10$eoSymzUiOZGcNk1iLKMT8.CpiR/Kq4G1ZbgnsjEVC6OTBXwmIkrpy', '9514475543', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-11-28 18:38:17', 'Yes', '1234', '2023-11-28 18:38:17', 'Yes', NULL, NULL, '2023-11-28 18:28:17', '2023-11-28 18:28:17'),
(46, 'Nageswaran C', 'nwaran820@gmail.com', '$2y$10$R7lYZlrHV98AcKLTQHbQXOj6r82Iwan2xBefqqp2i.20S4It4eWxe', '9042948572', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 07:33:44', 'Yes', '1234', '2023-12-01 07:33:44', 'Yes', NULL, NULL, '2023-12-01 07:23:44', '2023-12-01 07:23:44'),
(47, 'Priya', 'epzipriya60@gmail.com', '$2y$10$6TokLKFOw5kcKlvUDz6VBOi0XygpUlXsNMo0ER6yOGOOukrfpZuh2', '9514283482', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 08:38:11', 'Yes', '1234', '2023-12-01 08:38:11', 'Yes', NULL, NULL, '2023-12-01 08:28:11', '2023-12-01 08:28:11'),
(48, 'Sujitha', 'sujithakannan1998@gmail.com', '$2y$10$7IJt3mNb8VOAfu75OVZ6VO3AEuUfS6t8.Ue8JVKnv7oND3TxBpL.K', '9444673043', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 09:13:07', 'Yes', '1234', '2023-12-01 09:13:07', 'Yes', NULL, NULL, '2023-12-01 09:03:07', '2023-12-01 09:03:07'),
(49, 'Vinayaka', 'vinayakasubramanian.s@gmail.com', '$2y$10$PsLIMkusrNQ.23wN.kNnfuHXpLnSKsxQ4NXfxQZG6g85bays20me.', '9500084813', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 11:19:16', 'Yes', '1234', '2023-12-01 11:19:16', 'Yes', NULL, NULL, '2023-12-01 11:09:16', '2023-12-01 11:09:16'),
(50, 'Rajaraman', 'vrraman10@yahoo.com', '$2y$10$lnmaD8zAkm0acNJ4OTHaK.pzIBc3CIAw7cdqNDfS7JUhewri59fmu', '9442246520', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 12:09:37', 'Yes', '1234', '2023-12-01 12:09:37', 'Yes', NULL, NULL, '2023-12-01 11:59:37', '2023-12-01 11:59:37'),
(51, 'Lakshmi Ravindran', 'lakshmiravindran52@gmail.com', '$2y$10$l7Ylumigc2DOJb3QI3suhO/Isuvapc3UIf2u05.69dcLUBSPcySTa', '9842150943', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 13:30:45', 'Yes', '1234', '2023-12-01 13:30:45', 'Yes', NULL, NULL, '2023-12-01 13:20:45', '2023-12-01 13:20:45'),
(52, 'A S KALIESWARI', 'mahekalish94@gmail.com', '$2y$10$zp6QDm.n.Lqr7MUPV0RGPe5w2v/49ygLEuwgU91PXbyv9lUkeO4NC', '6374942887', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 14:59:38', 'Yes', '1234', '2023-12-01 14:59:38', 'Yes', NULL, NULL, '2023-12-01 14:49:38', '2023-12-01 14:49:38'),
(53, 'Venkatesan', 'venkatesan.avkt@gmail.com', '$2y$10$X.hdQbUSFMuAAZYa8AhuRefWiLr0tX2rJHrXxVWC6PT3rL/IeRoeO', '9894505273', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 15:52:13', 'Yes', '1234', '2023-12-01 15:52:13', 'Yes', NULL, NULL, '2023-12-01 15:42:13', '2023-12-01 15:42:13'),
(54, 'Priya', 'priyakayal0712@gmail.com', '$2y$10$e6/sbVC1mUEBRgJYkVxfiOdY3IIolZJhaOJptFgg.nkRPXvklsc82', '9181898779', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-01 17:02:15', 'Yes', '1234', '2023-12-01 17:02:15', 'Yes', NULL, NULL, '2023-12-01 16:52:15', '2023-12-01 16:52:15'),
(55, 'Kadhar Maidheen', 'kadharmaidheen1983@gmail.com', '$2y$10$yNrPo/Y2gSjT9BBF6bJQc.zIebZ7bPLPLK1k.vjwI7SGk0EtuvmCG', '7010486979', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-02 14:43:29', 'Yes', '1234', '2023-12-02 14:43:29', 'Yes', NULL, NULL, '2023-12-02 14:33:29', '2023-12-02 14:33:29'),
(56, 'Pratheepa', 'pratheepa.sk@gmail.com', '$2y$10$GEDjVv.DxKyRlAZ.M6BDVem.bb594Zc4Ec5KwjuNyrPPapj4njjUm', '9445599472', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-03 21:00:40', 'Yes', '1234', '2023-12-03 21:00:40', 'Yes', NULL, NULL, '2023-12-03 20:50:40', '2023-12-03 20:50:40'),
(57, 'S.kirthikha', 'lakshmikirthikha@gmail.com', '$2y$10$G3px1MRAzk/60X0mmBbhWe3QalYPgH1RvKA0tna8o7fatnOQ67Mve', '9443576465', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-04 10:57:44', 'Yes', '1234', '2023-12-04 10:57:44', 'Yes', NULL, NULL, '2023-12-04 10:47:44', '2023-12-04 10:52:39'),
(58, 'Sajitha Rani', 'abithavictoria120@gmail.com', '$2y$10$UhMgMntsBIg2WGY2NoNobeJbor1YPW7YjcYtQJM20drL1LuPzf23.', '9092043173', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-04 15:37:11', 'Yes', '1234', '2023-12-04 15:37:11', 'Yes', NULL, NULL, '2023-12-04 15:27:11', '2023-12-04 15:27:11'),
(59, 'Sajitha Rani', 'lissyrani11@gmail.com', '$2y$10$4Dp36raqJjTOLHlFCCQdee6LMj56vrh8gdw1OdVy35k98I5A7J3la', '9092043173', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-04 15:43:07', 'Yes', '1234', '2023-12-04 15:43:07', 'Yes', NULL, NULL, '2023-12-04 15:33:07', '2023-12-04 15:33:07'),
(60, 'Geetha S', 'yesgee7star@gmail.com', '$2y$10$7QzClBGILIBD1U08ut91POrj1qffp1lqV0S7TgX8D0cbP3eiRrib6', '9865033365', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-05 19:42:07', 'Yes', '1234', '2023-12-05 19:42:07', 'Yes', NULL, NULL, '2023-12-05 19:32:07', '2023-12-05 19:32:07'),
(61, 'Hema R', 'hema96296@gmail.com', '$2y$10$b.td1ajEq3A3jtwW.LNLRObY/fvNyLQjHsY9qS8vXF43NUmnxSTEC', '9629693088', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-07 16:54:30', 'Yes', '1234', '2023-12-07 16:54:30', 'Yes', NULL, NULL, '2023-12-07 16:44:30', '2023-12-07 16:44:30'),
(62, 'Renuka', 'renukamaharajan04101997@gmail.com', '$2y$10$nOpuUdMMsgwi.SQAlSfIu.iIPKWduIlvxqMqD8ZRbuDtPJBmjCw1e', '9597349159', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-08 12:09:15', 'Yes', '1234', '2023-12-08 12:09:15', 'Yes', NULL, NULL, '2023-12-08 11:59:15', '2023-12-08 11:59:15'),
(63, 'Muthupandi', 'rajendranmuthupandy@gmail.com', '$2y$10$SeWeZjajXvH6dizNElk.P.t.QtozjzjBjIwmUDzWCb86Ykt7wBqMi', '9842913949', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-08 14:19:29', 'Yes', '1234', '2023-12-08 14:19:29', 'Yes', NULL, NULL, '2023-12-08 14:09:29', '2023-12-08 14:09:29'),
(64, 'jawahar java', 'jawajawahar606@gmail.com', '$2y$10$bCgbI1wTK1pJycQz4oxtdOY9a.YeFXytB4YcUdA/q8uUyLHs6e0fO', 'jawajawaha', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-11 13:51:02', 'Yes', '1234', '2023-12-11 13:51:02', 'Yes', NULL, NULL, '2023-12-11 13:41:02', '2023-12-11 13:41:02'),
(65, 'Nandhini Srinivasan', 'cutenandhini1435@gmail.com', '$2y$10$z5hN0H7W1KmYgpTVaBLEfewd3JYNA42lJhM5wseZ1QzhQKHLqy4r6', '9944188779', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-11 15:09:54', 'Yes', '1234', '2023-12-11 15:09:54', 'Yes', NULL, NULL, '2023-12-11 14:59:54', '2023-12-11 14:59:54'),
(66, 'TAMILSELVAM. K', 'mkkt.selvam21@gmail.com', '$2y$10$l6Qa5LlMm1UGwMvMaHr9Ie1h3c2gaOynSidCFZ65ElbbYuUZmhkAm', '9080480571', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-12 13:11:30', 'Yes', '1234', '2023-12-12 13:11:30', 'Yes', NULL, NULL, '2023-12-12 13:01:30', '2023-12-12 13:01:30'),
(67, 'ravindran senthilkumar', 'sugirthavel@gmail.com', '$2y$10$5Ozle4Gy1ex2jtBUlM4aTecX3cy.2DpkiPB0DWV7LFBZY2UanBKZa', '9842103199', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-14 10:49:06', 'Yes', '1234', '2023-12-14 10:49:06', 'Yes', NULL, NULL, '2023-12-14 10:39:06', '2023-12-14 10:39:06'),
(68, 'Vignesh', 'vignesh05vel@gmail.com', '$2y$10$HW15qOVhuUxpZ5s4H4jB/eMQY.6VnY1wmbpSpzBAvaVCYNDdG9cuu', '9600371842', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-17 20:18:11', 'Yes', '1234', '2023-12-17 20:18:11', 'Yes', NULL, NULL, '2023-12-17 20:08:11', '2023-12-17 20:08:11'),
(69, 'J Hashbaz', 'hashbaz.7@gmail.com', '$2y$10$yN2vaWMah9deV3WP.g2nUerJIb8HpJDNiWOZOBduN3OZ9lms/vBMi', '9677414909', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-20 14:51:53', 'Yes', '1234', '2023-12-20 14:51:53', 'Yes', NULL, NULL, '2023-12-20 14:41:53', '2023-12-20 14:41:53'),
(70, 'Nivetha Kasthuri', 'nivethakasthuri97@gmail.com', '$2y$10$qidDwRIIYQh/v9ptplupY.NZSISQdEyw4mZwg3USDsNkzaw9Nheqm', '7339447780', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-20 16:29:41', 'Yes', '1234', '2023-12-20 16:29:41', 'Yes', NULL, NULL, '2023-12-20 16:19:41', '2023-12-20 16:19:41'),
(71, 'Syed Ali Fathima', 'fathima85097@gmail.com', '$2y$10$eP8qE3TvK8PB9dG.UChRF.ePDJK9BSMLPygMTWfmH.8uzEeOYQi3S', '7418016997', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-21 13:23:31', 'Yes', '1234', '2023-12-21 13:23:31', 'Yes', NULL, NULL, '2023-12-21 13:13:31', '2023-12-21 13:13:31'),
(72, 'S. Vijay', 'vijaysveera145@gmail.com', '$2y$10$hO9qOWdiOeW4n93v8fYam.u9wQm/WiIZcYMvDLNJDpmZwKpGQ/Jqa', '9894185597', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-22 15:26:20', 'Yes', '1234', '2023-12-22 15:26:20', 'Yes', NULL, NULL, '2023-12-22 15:16:20', '2023-12-22 15:16:20'),
(73, 'Kannan', 'kannankarthika1998@gmail.com', '$2y$10$NlJn1cNJnb6F4khaRuMIqOTdq8w2Ip.Yi5CS44p1j80xhH1Nc85se', '8870176705', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-25 19:49:25', 'Yes', '1234', '2023-12-25 19:49:25', 'Yes', NULL, NULL, '2023-12-25 19:39:25', '2023-12-25 19:39:25'),
(74, 'sathish', 'thirusatiz333@gmail.com', '$2y$10$9rwhBIrCt3GWtLieAR/5PuuWLHT37nOcTC4Ns7yJ0LqyJxMCnUNE6', '9944804499', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-27 15:57:34', 'Yes', '1234', '2023-12-27 15:57:34', 'Yes', NULL, NULL, '2023-12-27 15:47:34', '2023-12-27 15:47:34'),
(75, 'Arun', 'kumarbms1001@gmail.com', '$2y$10$2GBDXu4fSXc9WCH5ZvUTL.WN23fZyzTkOsnSZCC/UXR8vE6DhCrTm', '8639623650', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2023-12-30 09:46:56', 'Yes', '1234', '2023-12-30 09:46:56', 'Yes', NULL, NULL, '2023-12-30 09:36:56', '2023-12-30 09:36:56'),
(76, 'Deepa Vivek', 'pdeepa274@gmail.com', '$2y$10$m57w4iqgRJZRE/Ig6MPFUOrsmcDEe7trFcRmcccIaOhZMNXPSaF0O', '8870764652', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-02 10:29:23', 'Yes', '1234', '2024-01-02 10:29:23', 'Yes', NULL, NULL, '2024-01-02 10:19:23', '2024-01-02 10:19:23'),
(77, 'Nishar', 'sailwithashik@gmail.com', '$2y$10$LZ2LZoIioqO4f.BsANJhfOw/W946vqidOReTYVQEV5p/yUMhLRqeK', '8883354070', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-10 23:16:49', 'Yes', '1234', '2024-01-10 23:16:49', 'Yes', NULL, NULL, '2024-01-10 23:06:49', '2024-01-10 23:06:49'),
(78, 'sathish kumar', 'sathish071181@gmail.com', '$2y$10$jFeeZvPNIuF9ou8BCIDjeOduB3qBxGiLF3qaCDbycd4lKZwfE9GKi', '9750162211', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-11 14:24:22', 'Yes', '1234', '2024-01-11 14:24:22', 'Yes', NULL, NULL, '2024-01-11 14:14:22', '2024-01-11 14:14:22'),
(79, 'Rajesh', 'rajesh1243@gmail.com', '$2y$10$E/tJK6LsO1drmFikrDbd7eYieVNvWcTRpOaos37bnboDIuZJraiei', '9786966555', NULL, 'Web', 'Yes', 'Raje3627', 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-01-11 16:46:32', '2024-01-11 16:46:32'),
(80, 'Hemashree', 'hema2005kayal@gmail.com', '$2y$10$kpqR.KzPLpA2lPebfiKupecQnE48LLRomoQn5/gfWRdiTlZW8lUU.', '6379990573', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-16 18:56:07', 'Yes', '1234', '2024-01-16 18:56:07', 'Yes', NULL, NULL, '2024-01-16 18:46:07', '2024-01-16 18:46:07'),
(81, 'K. Pavithra', 'thirupavitheena@gmail.com', '$2y$10$.WM53ZFnhJH/oxlh08eYLeBy7cBaPEM1ytqROJZTbjmDVooKRiRfe', '8807658535', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-17 16:04:53', 'Yes', '1234', '2024-01-17 16:04:53', 'Yes', NULL, NULL, '2024-01-17 15:54:53', '2024-01-17 15:54:53'),
(82, 'Seena', 'vickyastro143@gmail.com', '$2y$10$QnuBmHnfgDUyxsWfUkS26.FHVP21j9/d2J6t.b1/69fhQWsgHjzP.', '6382599427', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-17 23:46:21', 'Yes', '1234', '2024-01-17 23:46:21', 'Yes', NULL, NULL, '2024-01-17 23:36:21', '2024-01-17 23:36:21'),
(83, 'Rama Das', 'pksrvph123@gmail.com', '$2y$10$xRazNOLy0AuW0m6NpQuHM.hDRyrPNbPMG0iL3dTQGMc4P7jrjILpe', '+917092161', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-01-21 20:55:58', 'Yes', '1234', '2024-01-21 20:55:58', 'Yes', NULL, NULL, '2024-01-21 20:45:58', '2024-01-21 20:45:58'),
(84, 'Ishu', 'ishukohila36@gmail.com', '$2y$10$7fevQChCBbrx.gNlvCp6/u3qza.Kn/XuLLDSDJQ0kjwC7JfVmPlse', '8248706980', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-07 18:19:04', 'Yes', '1234', '2024-02-07 18:19:04', 'Yes', NULL, NULL, '2024-02-07 18:09:04', '2024-02-07 18:09:04'),
(85, 'Subathra', 'subathragopalakrishnan19111998@gmail.com', '$2y$10$jcltmFIUffZkA8G48S5ug.X/z7G2ZsEOVpoGz22y/Ywm31jpjmTmm', '9597211302', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-08 13:07:31', 'Yes', '1234', '2024-02-08 13:07:31', 'Yes', NULL, NULL, '2024-02-08 12:57:31', '2024-02-08 12:57:31'),
(86, 'sampath kumar', 'sampath10613@gmail.com', '$2y$10$2/XkYVI84CIKTZzCpFRxm.i3vAks1zmG5qf5DI.v5.tjxiejkgkXa', '9629550767', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-09 06:35:39', 'Yes', '1234', '2024-02-09 06:35:39', 'Yes', NULL, NULL, '2024-02-09 06:25:39', '2024-02-09 06:25:39'),
(87, 'Mani Kandan', 'rmk30020@gmail.com', '$2y$10$nFfEP/xNcF8tWquELcJ4mur9Re6FrqIWKhnBayUBpF8UMMBlb5K2q', '9344457794', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-09 11:50:12', 'Yes', '1234', '2024-02-09 11:50:12', 'Yes', NULL, NULL, '2024-02-09 11:40:12', '2024-02-09 11:40:12'),
(88, 'R.VISHNU SAKTHI', 'rvishnuramesh0@gmail.com', '$2y$10$z906WLrywm.NTuf4OMiqNu11F1R1pvZxSUelsSMKZloLbjBeDi6Yu', '9489101773', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-09 20:38:51', 'Yes', '1234', '2024-02-09 20:38:51', 'Yes', NULL, NULL, '2024-02-09 20:28:51', '2024-02-09 20:28:51'),
(89, 'Swathika', 'swathikakannan31@gmail.com', '$2y$10$lO/Sx1VGP66B7s9XvllF3.vNk4o9f1HU.sY1mCgixkvM8BFz.dALa', '8220813449', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-13 16:47:58', 'Yes', '1234', '2024-02-13 16:47:58', 'Yes', NULL, NULL, '2024-02-13 16:37:58', '2024-02-13 16:37:58'),
(90, 'Sudalai', 'rajasudalai956@gmail.com', '$2y$10$vKrSBBuM509NRjeMl1CRpudIz5HE3O3ivlMLxk45HjkWrs/44V9zy', '6379541135', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-18 13:54:34', 'Yes', '1234', '2024-02-18 13:54:34', 'Yes', NULL, NULL, '2024-02-18 13:44:34', '2024-02-18 13:44:34'),
(91, 'S Balakumar', 'srinivasanbalakumar1951@gmail.com', '$2y$10$mB.uVh4U6CrPMQeqwrA5kOzAB.aL6RASLXrKXrePNE2x3zRTWld.y', '9443571836', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-18 18:19:31', 'Yes', '1234', '2024-02-18 18:19:31', 'Yes', NULL, NULL, '2024-02-18 18:09:31', '2024-02-18 18:09:31'),
(92, 'Jesudoss', 'teenamathimalar@gmail.com', '$2y$10$9Bu/sxN4LW9BrqbI21KRO.wB6g/YWkoDj0RCOCY9vWVdgXR6UVM5y', 'teenamathi', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-20 22:50:30', 'Yes', '1234', '2024-02-20 22:50:30', 'Yes', NULL, NULL, '2024-02-20 22:40:30', '2024-02-20 22:40:30'),
(93, 'sathish kumar', 'c2hmdusathish21@gmail.com', '$2y$10$LcNdzjwtnbLI/v0ifSQII.fJwKHBvXxoPJDmNcxCe4wwFhzYoCOGq', '9894717743', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-21 07:52:10', 'Yes', '1234', '2024-02-21 07:52:10', 'Yes', NULL, NULL, '2024-02-21 07:42:10', '2024-02-21 07:42:10'),
(94, 'Vignesh', 'tnvicky2614@gmail.com', '$2y$10$aablX4h07Ho7.edkhwYz6O.VxxuPsNNtN.1nmqZzIZcDhC3XXi84e', '8870704835', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-21 13:23:19', 'Yes', '1234', '2024-02-21 13:23:19', 'Yes', NULL, NULL, '2024-02-21 13:13:19', '2024-02-21 13:13:19'),
(95, 'Hema', 'hemathevar9@gmail.com', '$2y$10$UJu/.8fOzvw2R0iElrcgvuzR9wPN.ykg77yrLJjtqFTjptpIfIFZ.', '9087818939', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-22 06:29:49', 'Yes', '1234', '2024-02-22 06:29:49', 'Yes', NULL, NULL, '2024-02-22 06:19:49', '2024-02-22 06:19:49'),
(96, 'Senthil Murugan T', 'gtsenthil0804@gmail.com', '$2y$10$jNoNyQ2V/w2eyHXLUqqKs.0pP7mJaAxs25kqeYHxJul3/QYY6peaW', '8072759857', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-22 20:01:56', 'Yes', '1234', '2024-02-22 20:01:56', 'Yes', NULL, NULL, '2024-02-22 19:51:56', '2024-02-22 19:51:56'),
(97, 'Maniyarasi Manokaran', 'bellqueen.mani@gmail.com', '$2y$10$q4QC1q3UZ8sWBMo2tYlIYOWSvgqD6HGVEEmSgIIZ5yo5ZW8vuQoUC', '9994575376', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-23 01:15:52', 'Yes', '1234', '2024-02-23 01:15:52', 'Yes', NULL, NULL, '2024-02-23 01:05:52', '2024-02-23 01:05:52'),
(98, 'S P Ramesh', 'rengancoir@yahoo.co.i', '$2y$10$8o6ayXlo/rUCbsol3cGLDu/qXXPbEJFXIDFkQ6D8K96JCmeQNQ9Iu', '9942361554', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-25 10:10:10', 'Yes', '1234', '2024-02-25 10:10:10', 'Yes', NULL, NULL, '2024-02-25 10:00:10', '2024-02-25 10:00:10'),
(99, 'Rama Subramanian', 'sramasubramanian17@gmail.com', '$2y$10$U3YwFHsGBYuFRIz//TdpIukQ0lg9a7Nt0MWhIawfHh1uf3XX9lj6W', '9003453255', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-28 16:12:39', 'Yes', '1234', '2024-02-28 16:12:39', 'Yes', NULL, NULL, '2024-02-28 16:02:39', '2024-02-28 16:02:39'),
(100, 'VAAHINI M', 'vaahini19@gmail.com', '$2y$10$ClBABTbCt5gWOndyj5tuCewZHhnJcI.sxRLEqGoNVNrP/uTQ.ToFO', '9345231043', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-28 16:27:59', 'Yes', '1234', '2024-02-28 16:27:59', 'Yes', NULL, NULL, '2024-02-28 16:17:59', '2024-02-28 16:17:59'),
(101, 'Milton', 'miltondd89@gmail.com', '$2y$10$uobaYulypFAR64TBG72nXeb4hRtP6YlQ.V6sGdXcoE5AmXVQ7DSZK', '9994134428', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-28 17:00:33', 'Yes', '1234', '2024-02-28 17:00:33', 'Yes', NULL, NULL, '2024-02-28 16:50:33', '2024-02-28 16:50:33'),
(102, 'Bala Murugan', 'bm1571988@gmail.com', '$2y$10$tz//otSjUaLahC71crogf.KVS5fA77girRgpPfflgSVitUPtfr8kS', 'bm1571988@', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-02-29 13:29:31', 'Yes', '1234', '2024-02-29 13:29:31', 'Yes', NULL, NULL, '2024-02-29 13:19:31', '2024-02-29 13:19:31'),
(103, 'Mur', 'muthuvelperumal@gmail.com', '$2y$10$fuqVtJEwDSJDerClbBBxw.Dga62j0qECoA1hPIvQcT7R3CPk6DAD6', '9841595103', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-01 04:31:00', 'Yes', '1234', '2024-03-01 04:31:00', 'Yes', NULL, NULL, '2024-03-01 04:21:00', '2024-03-01 04:21:00'),
(104, 'Peer Mohamed', 'akmalmech05@gmail.com', '$2y$10$ZnbO94.9ri5m26bqcLun5u5ScvUYy5u.HToktyOTMX.pSnDnrMzJu', '9791420004', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-01 14:55:34', 'Yes', '1234', '2024-03-01 14:55:34', 'Yes', NULL, NULL, '2024-03-01 14:45:34', '2024-03-01 14:45:34'),
(105, 'SENTHIL KUMAR G', 'senthilsuganya799@gmail.com', '$2y$10$2cc5xboj1J3WT9/efzWL1eWVeSi2yAHtLPdTOsBq8UZ1FCHIqaJUK', '9095668368', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-03 09:47:08', 'Yes', '1234', '2024-03-03 09:47:08', 'Yes', NULL, NULL, '2024-03-03 09:37:08', '2024-03-03 09:37:08'),
(106, 'Kavitha Kavi', 'kk2528614@gmail.com', '$2y$10$57hXGu2l/3/tmqlnkHlE7eD7/I9gA1jf3pmTaO7GPl1Q.bm.NalFu', '+918838906', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-05 08:25:05', 'Yes', '1234', '2024-03-05 08:25:05', 'Yes', NULL, NULL, '2024-03-05 08:15:05', '2024-03-05 08:15:05'),
(107, 'Maharaja', 'rajarajan3083@gmail.com', '$2y$10$2wxcnICKfT5JSK22j.Ooz.qhBDIWNKPN.7jPo1kIsMS7iusYnwbEC', '7092919761', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-05 16:20:07', 'Yes', '1234', '2024-03-05 16:20:07', 'Yes', NULL, NULL, '2024-03-05 16:10:07', '2024-03-05 16:10:07'),
(108, 'Ananthiganeshkumar', 'ananthiganeshkumar@gmail.com', '$2y$10$Gqr5t7mesolsHUk8Hll2sed51NBeU0tOVxPNQdlD2H.7yMBUifNuK', '6383262265', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-08 20:39:38', 'Yes', '1234', '2024-03-08 20:39:38', 'Yes', NULL, NULL, '2024-03-08 20:29:38', '2024-03-08 20:29:38'),
(109, 'J ANITHA', 'anithani6530@gmail.com', '$2y$10$UmaegfiowCXpTFbW0p/8tOAaIF2IKbrjn0METx01Fz7MI5HQOLWU2', '9095808095', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-10 00:10:06', 'Yes', '1234', '2024-03-10 00:10:06', 'Yes', NULL, NULL, '2024-03-10 00:00:06', '2024-03-10 00:00:06'),
(110, 'Sugumar', 'sakthikumar3553@gmail.com', '$2y$10$HT660oqYrq/NJki5P5CIQ.iOsVncxwGqZLjrEY0S/MfwMCGqxVXIm', '9443138126', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-10 15:18:08', 'Yes', '1234', '2024-03-10 15:18:08', 'Yes', NULL, NULL, '2024-03-10 15:08:08', '2024-03-10 15:08:08'),
(111, 'Poovalingam', 'spoovalingam6@gmail.com', '$2y$10$3fM1JvE7BAZGZw2S1KI8uOVrcPIO035uxxtw1mNaeS6/krBC6b5RS', '9244151513', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-12 18:16:52', 'Yes', '1234', '2024-03-12 18:16:52', 'Yes', NULL, NULL, '2024-03-12 18:06:52', '2024-03-12 18:06:52'),
(112, 'SethuRaman', 'sethunandha007@gmail.com', '$2y$10$pyTgnoVds3SRCGPm87u9lubTU.6hWVUNea/4f1tpGgsJGSKBVOrL6', '9244151513', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-12 19:25:39', 'Yes', '1234', '2024-03-12 19:25:39', 'Yes', NULL, NULL, '2024-03-12 19:15:39', '2024-03-12 19:15:39'),
(113, 'Sakthi', 'sakthi.suke@gmail.com', '$2y$10$qiMp3/b.JHT8xJafY8RdvOxtZPPNsHCVwwxcg.48oRz5mz/ulWZte', '9944423044', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-13 14:28:41', 'Yes', '1234', '2024-03-13 14:28:41', 'Yes', NULL, NULL, '2024-03-13 14:18:41', '2024-03-13 14:18:41'),
(114, 'Vinoth', 'sundarivinoth@gmail.com', '$2y$10$LoZGZ.inX9TjumiQC41/E.JcrvDb25QbK1qTf7r0Y/aCWpnXlCPXe', '7094517747', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-13 14:59:28', 'Yes', '1234', '2024-03-13 14:59:28', 'Yes', NULL, NULL, '2024-03-13 14:49:28', '2024-03-13 14:49:28'),
(115, 'Selvam Chinna', 'mailtoshelvam@gmail.com', '$2y$10$CrJn0cSV2Ch6PQ0CH6OOeek5zXXMkJComH3ET..MlLuJq0wgzHira', '9790719950', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-14 06:50:54', 'Yes', '1234', '2024-03-14 06:50:54', 'Yes', NULL, NULL, '2024-03-14 06:40:54', '2024-03-14 06:40:54'),
(116, 'N Mageshkannan', 'mageshkannan1976@hotmail.com', '$2y$10$gIg.vqt.cTGsf8NoV0RFFObX3djhWE7Mr.69412foUlglyR8DENZ2', '9994810488', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-14 09:57:01', 'Yes', '1234', '2024-03-14 09:57:01', 'Yes', NULL, NULL, '2024-03-14 09:47:01', '2024-03-14 09:47:01'),
(117, 'Muthu Chithu', 'chitradevi4141986@gmail.com', '$2y$10$7ZTDpOpiAeb.iJ7R9VDbne8mSkLAUglbei6VnA9qOXXgDN2tAhrnS', '9193630032', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-15 14:06:46', 'Yes', '1234', '2024-03-15 14:06:46', 'Yes', NULL, NULL, '2024-03-15 13:56:46', '2024-03-15 13:56:46'),
(118, 'Gopi Rani', 'gobirani@gmail.com', '$2y$10$H9IchW.n8SHCkae3gJ2BP.FsOQrNZvW2/uZ3K.baZ4.haXwKoWiza', '8248189732', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-16 14:50:01', 'Yes', '1234', '2024-03-16 14:50:01', 'Yes', NULL, NULL, '2024-03-16 14:40:01', '2024-03-16 14:40:01'),
(119, 'jayakumar', 'jayakumarjayakumar58053@gmail.com', '$2y$10$98h7IMvP7YdDtjePwFhwKOYVoMPi5D4T4mb57ySiQwrvJErV4z/Ze', '9994269100', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-17 18:27:51', 'Yes', '1234', '2024-03-17 18:27:51', 'Yes', NULL, NULL, '2024-03-17 18:17:51', '2024-03-17 18:17:51'),
(120, 'Mithun', 'mithun@mailinator.com', '$2y$10$h8SNFFLGQWI7PdjAtfcdq.SLNCUD94SyN81BGbWVwQ92e7PGT6Ll6', '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-19 18:56:44', 'Yes', '1234', '2024-03-19 18:56:44', 'Yes', NULL, NULL, '2024-03-19 18:46:44', '2024-03-19 18:46:44'),
(121, 'Anan', 'anan@mailinator.com', '$2y$10$60U5hsjluql9OFVupT5N/.6sHB7.8xIodPNBZw4T9tS/V6duPp32i', '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-19 18:58:18', 'Yes', '1234', '2024-03-19 18:58:18', 'Yes', NULL, NULL, '2024-03-19 18:48:18', '2024-03-19 18:48:18'),
(122, 'Pavithra Rajasekar', 'rajasekarpavithra936@gmail.com', '$2y$10$/3ey.Q1uUwPMH.IDIgOk8uiLC58ZiwfL/LPwGA0OxrypFF1pO2my6', '8838724531', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-20 12:35:01', 'Yes', '1234', '2024-03-20 12:35:01', 'Yes', NULL, NULL, '2024-03-20 12:25:01', '2024-03-20 12:25:01'),
(123, 'eswaran t', 'eswarant06@gmail.com', '$2y$10$7U1hDpueGeFBHI9Wt0bEcOedZGFv/bbtiupae5IEbKAtwdbLmpSe2', 'eswarant06', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-20 13:47:09', 'Yes', '1234', '2024-03-20 13:47:09', 'Yes', NULL, NULL, '2024-03-20 13:37:09', '2024-03-20 13:37:09'),
(124, 'itachi', 'itachi@mailinator.com', '$2y$10$4Tgs036TvqOFNstOoeHgjuMlv3BFnaw9xOJDDCZRkMpgZRR7kZemW', '+911234567890', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-26 17:15:45', '2024-03-26 17:15:45'),
(125, 'Ananya', 'ananya@mailinator.com', '$2y$10$ID5lnBzxcHF6w5HEZMXQrOlZD0iR1OIAa1lp7ObqltNA0hZJPE4Iq', '+916383614065', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-27 10:37:05', '2024-03-27 10:37:05'),
(126, 'Deepa', 'deepa@mailinator.com', '$2y$10$jESTFtzHDe8Ueo94BPQHAO6PNXQm0vWGXgtQ9ZfF17zgjQSleaPhG', '+919443273789', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-27 11:08:06', '2024-03-27 11:08:06'),
(127, 'Nithish', 'nithish@mailinator.com', '$2y$10$uJF2fuNgy8Tfv3AA5ZQG2e1nClUDH6URPqWQQTco0fUAtxWWBpdvq', '9443273789', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-27 15:25:41', '2024-03-27 15:25:41'),
(128, 'itachi', 'itachi@gmail.com', '$2y$10$bm.yp2wYOCwxzIGiDEqnlevdrjiLISxacGxeYA5fLlDSq5HIttJvG', '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-27 19:19:16', '2024-03-27 19:19:16'),
(129, 'John', 'john@mailinator.com', '$2y$10$LL1nm.K.PDCIv3czovBuGefG9PWkdgKd.N7uFmMQcBIKvp5767ici', '9863254100', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-28 12:15:35', '2024-03-28 12:15:35'),
(130, 'LOyala12', 'l12@mailinator.com', '$2y$10$yfG5mXVaNB8QS4EFRIoCIOEBts3CV65Sjcw/TniqyaoQEmzqz.LHu', '9876543210', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-03-28 12:17:43', '2024-03-28 12:17:43'),
(131, 'vs', 'vselvan@gmail.com', NULL, '9176874158', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-03-30 13:30:10', 'Yes', '1234', '2024-03-30 13:30:10', 'Yes', NULL, NULL, '2024-03-30 13:20:10', '2024-03-30 13:20:10'),
(132, 'Ram', 'ram@mailinator.com', NULL, '9876543210', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-01 11:53:35', 'Yes', '1234', '2024-04-01 11:53:35', 'Yes', NULL, NULL, '2024-04-01 11:43:35', '2024-04-01 11:43:35'),
(133, 'vs', 'sumit.test@gmail.com', NULL, '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-01 18:03:51', 'Yes', '1234', '2024-04-01 18:03:51', 'Yes', NULL, NULL, '2024-04-01 17:53:51', '2024-04-01 17:53:51'),
(134, 'vs', 'sumit.test2@gmail.com', NULL, '9176860276', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-01 18:06:06', 'Yes', '1234', '2024-04-01 18:06:06', 'Yes', NULL, NULL, '2024-04-01 17:56:06', '2024-04-01 17:56:06'),
(135, 'vs', 'vsreave@gmail.com', NULL, '9176874158', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-02 16:06:27', 'Yes', '1234', '2024-04-02 16:06:27', 'Yes', NULL, NULL, '2024-04-02 15:56:27', '2024-04-02 15:56:27'),
(136, 'vs', 'v@gmail.com', NULL, '917687000', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-02 16:12:10', 'Yes', '1234', '2024-04-02 16:12:10', 'Yes', NULL, NULL, '2024-04-02 16:02:10', '2024-04-02 16:02:10'),
(137, 'vs', 'vsdfsdfsdf@gmail.com', NULL, '917687000', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-02 16:15:24', 'Yes', '1234', '2024-04-02 16:15:24', 'Yes', NULL, NULL, '2024-04-02 16:05:24', '2024-04-02 16:05:24'),
(138, 'devil', 'devil@gmail.com', NULL, '1478523690', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-02 17:31:19', 'Yes', '1234', '2024-04-02 17:31:19', 'Yes', NULL, NULL, '2024-04-02 17:21:19', '2024-04-02 17:21:19'),
(139, 'vs', 'vsdfsd@gmail.com', NULL, '9176860279', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-02 20:25:18', 'Yes', '1234', '2024-04-02 20:25:18', 'Yes', NULL, NULL, '2024-04-02 20:15:18', '2024-04-02 20:15:18'),
(140, 'Narendra Modi', 'narendra.modi@gmail.com', NULL, '9924165042', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-03 11:55:50', 'Yes', '1234', '2024-04-03 11:55:50', 'Yes', NULL, NULL, '2024-04-03 11:45:50', '2024-04-03 11:45:50'),
(141, 'vs', 'vs324@gmail.com', NULL, '917687000', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-03 15:02:21', 'Yes', '1234', '2024-04-03 15:02:21', 'Yes', NULL, NULL, '2024-04-03 14:52:21', '2024-04-03 14:52:21'),
(142, 'vs', 'vs1234@gmail.com', NULL, '917687000', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-04 10:53:15', 'Yes', '1234', '2024-04-04 10:53:15', 'Yes', NULL, NULL, '2024-04-04 10:43:15', '2024-04-04 10:43:15'),
(143, 'mani', 'mani@gmail.com', NULL, '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-04 13:34:06', 'Yes', '1234', '2024-04-04 13:34:06', 'Yes', NULL, NULL, '2024-04-04 13:24:06', '2024-04-04 13:24:06'),
(144, 'Pradhan', 'pradhan@gmail.com', NULL, '9924165041', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-04 15:58:57', 'Yes', '1234', '2024-04-04 15:58:57', 'Yes', NULL, NULL, '2024-04-04 15:48:57', '2024-04-04 15:48:57'),
(145, 'abi', 'abi@gmail.com', NULL, '9876543210', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-04 18:57:51', 'Yes', '1234', '2024-04-04 18:57:51', 'Yes', NULL, NULL, '2024-04-04 18:47:51', '2024-04-04 18:47:51'),
(146, 'selvan', 'vselvanr@gmail.com', NULL, '7854963210', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 12:15:29', 'Yes', '1234', '2024-04-05 12:15:29', 'Yes', NULL, NULL, '2024-04-05 12:05:29', '2024-04-05 12:05:29'),
(147, 'anusha', 'sha@gmail.com', NULL, '69874563210', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 12:19:03', 'Yes', '1234', '2024-04-05 12:19:03', 'Yes', NULL, NULL, '2024-04-05 12:09:03', '2024-04-05 12:09:03'),
(148, 'selvam', 'selvam@gmail.com', NULL, '9638527410', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 12:21:44', 'Yes', '1234', '2024-04-05 12:21:44', 'Yes', NULL, NULL, '2024-04-05 12:11:44', '2024-04-05 12:11:44'),
(149, 'vetri', 'vetri@gmail.com', NULL, '8529764130', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 15:11:42', 'Yes', '1234', '2024-04-05 15:11:42', 'Yes', NULL, NULL, '2024-04-05 15:01:42', '2024-04-05 15:01:42'),
(150, 'abcd', 'abcd@gmail.com', NULL, '8965412300', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 16:19:38', 'Yes', '1234', '2024-04-05 16:19:38', 'Yes', NULL, NULL, '2024-04-05 16:09:38', '2024-04-05 16:09:38'),
(151, 'efgh', 'efgh@gmail.com', NULL, '8796541230', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 17:15:21', 'Yes', '1234', '2024-04-05 17:15:21', 'Yes', NULL, NULL, '2024-04-05 17:05:21', '2024-04-05 17:05:21'),
(152, 'ijkl', 'ijkl@gmail.com', NULL, '3216549870', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 18:52:04', 'Yes', '1234', '2024-04-05 18:52:04', 'Yes', NULL, NULL, '2024-04-05 18:42:04', '2024-04-05 18:42:04'),
(153, 'mnop', 'mnop@gmail.com', NULL, '6932563210', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 18:57:59', 'Yes', '1234', '2024-04-05 18:57:59', 'Yes', NULL, NULL, '2024-04-05 18:47:59', '2024-04-05 18:47:59'),
(154, 'selvi', 'selvi@gmail.com', NULL, '9856321000', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 19:15:18', 'Yes', '1234', '2024-04-05 19:15:18', 'Yes', NULL, NULL, '2024-04-05 19:05:18', '2024-04-05 19:05:18'),
(155, 'prakash', 'prakash@gmail.com', NULL, '9924165043', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-05 19:38:51', 'Yes', '1234', '2024-04-05 19:38:51', 'Yes', NULL, NULL, '2024-04-05 19:28:51', '2024-04-05 19:28:51'),
(156, 'Test', 'test@gmail.com', NULL, '9924165044', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-09 16:31:23', 'Yes', '1234', '2024-04-09 16:31:23', 'Yes', NULL, NULL, '2024-04-09 16:21:23', '2024-04-09 16:21:23'),
(157, 'Test', 'test.test@gmail.com', NULL, '9033073043', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-10 14:27:07', 'Yes', '1234', '2024-04-10 14:27:07', 'Yes', NULL, NULL, '2024-04-10 14:17:07', '2024-04-10 14:17:07'),
(158, 'Test', 'test.test2@gmail.com', NULL, '9033073045', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-10 15:42:11', 'Yes', '1234', '2024-04-10 15:42:11', 'Yes', NULL, NULL, '2024-04-10 15:32:11', '2024-04-10 15:32:11'),
(159, 'Abinaya', 'abin@mailinator.com', NULL, '9952073789', NULL, 'Web', 'No', NULL, 'Customer', 'Active', '1234', '2024-04-10 18:39:23', 'Yes', '1234', '2024-04-10 18:39:23', 'Yes', NULL, NULL, '2024-04-10 18:29:23', '2024-04-10 18:29:23'),
(160, 'Rathi', 'rathi@mailinator.com', '$2y$10$7wjIweWd95QoI6UBsGu5h.6Lfn6yo0ndXggZoIXaikZKq3PplIFKK', '6985632140', NULL, 'Web', 'No', NULL, 'Rider', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-04-11 16:22:40', '2024-04-11 16:22:40'),
(161, 'Anusri A', 'dharmarajace007@gmail.com', NULL, '9940757877', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-04-17 12:20:28', '2024-04-17 12:20:28'),
(162, 'anu', 'anu@gmail.com', NULL, '916383614060', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-04-19 12:59:29', '2024-04-19 12:59:29'),
(163, 'Venkat', 'venkat@gmail.com', NULL, '6987452130', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-06 15:13:38', '2024-05-06 15:13:38'),
(164, 'anusha', 'anusha@gmail.com', NULL, '9999999999', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-08 15:41:56', '2024-05-08 15:41:56'),
(165, 'Arun', 'arun@gmail.com', NULL, '8939108274', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-08 15:45:11', '2024-05-08 15:45:11'),
(166, 'saranya', 'saranyaa@mailinator.com', NULL, '9345445421', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-08 17:28:11', '2024-05-08 17:28:11'),
(167, 'Abina', 'abinaya@mailinator.com', NULL, '6383614062', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-08 18:21:54', '2024-06-25 12:24:13'),
(168, 'Sumit Kumar', 'sumit.kumar@gmail.com', NULL, '9033073048', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-09 17:31:07', '2024-05-09 17:31:07'),
(169, 'Veera', 'veera@mailinator.com', NULL, '7826041579', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-10 10:33:13', '2024-05-10 10:33:13'),
(170, 'Sumit Sharma', 'sumit.sharma@gmail.com', NULL, '9033073047', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-10 16:47:29', '2024-05-10 16:47:29'),
(171, 'selvan', 'vs@gmail.com', NULL, '9876543210', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-10 18:57:36', '2024-05-10 18:57:36'),
(172, 'Test', 'test12@mailinator.com', NULL, '3692581447', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-13 15:15:16', '2024-05-13 15:15:16'),
(173, 'Ravi', 'ravi@mailinator.com', NULL, '9685743210', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-13 18:09:51', '2024-05-13 18:09:51'),
(174, 'Abcd', 'abcd@mailinator.com', NULL, '2345678900', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-14 10:49:16', '2024-05-14 10:49:16'),
(175, 'Sekar', 'sekar@gmail.com', NULL, '1235648790', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-14 10:57:16', '2024-05-14 10:57:16'),
(176, 'Ysbdnf', 'nchdudbd@gmail.com', NULL, '8521346795', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-14 11:38:36', '2024-05-14 11:38:36'),
(177, 'selvan', 'sumit.123@gmail.com', NULL, '9123456780', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-14 12:39:40', '2024-06-13 13:01:46');
INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `social`, `login_type`, `bill_user`, `bill_password`, `role`, `status`, `mobile_otp`, `mobile_otp_expired_at`, `is_mobile_verified`, `email_otp`, `email_otp_expired_at`, `is_email_verified`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(178, 'azar', 'azar@gmail.com', NULL, '7410852963', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-14 13:26:23', '2024-05-14 13:26:23'),
(179, 'Rani', 'rani@mailinator.com', NULL, '6938527410', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-16 11:38:27', '2024-05-16 11:38:27'),
(180, 'Arun', 'arun@mailinator.com', NULL, '3214569870', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-16 16:04:05', '2024-05-16 16:04:05'),
(181, 'Sathish', 'sathish@mailinator.com', NULL, '9638635274', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-16 16:45:18', '2024-05-16 16:45:18'),
(182, 'Name', 'name@gmail.com', NULL, '5236147890', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-17 11:13:49', '2024-05-17 11:13:49'),
(183, 'Jack', 'jack@mailinator.com', NULL, '9512369580', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-17 15:29:34', '2024-05-17 15:29:34'),
(184, 'Jane', 'jane@mailinator.com', NULL, '9512365480', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-17 16:20:31', '2024-05-17 16:20:31'),
(185, 'James', 'james@mailinator.com', NULL, '6547890321', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-17 19:43:32', '2024-05-17 19:43:32'),
(186, 'Joe', 'joe@mailinator.com', NULL, '6985321447', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-18 09:33:56', '2024-05-18 09:33:56'),
(187, 'Vji', 'vji@gmail.com', NULL, '7010970099', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 12:01:31', '2024-05-21 12:01:31'),
(188, 'Josh', 'josh@mailnator.com', NULL, '8976543210', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 14:54:12', '2024-05-21 14:54:12'),
(189, 'Jose', 'jose@mailinator.com', NULL, '8765432190', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 16:41:14', '2024-05-21 16:41:14'),
(190, 'Jdhd', 'shdh@gmail.com', NULL, '6134257896', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 17:26:57', '2024-05-21 17:26:57'),
(191, 'Yhh', 'vsvs@gmail.com', NULL, '2518486434', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 17:43:55', '2024-05-21 17:43:55'),
(192, 'Ray', 'ray@mailinator.com', NULL, '8563290741', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 18:01:29', '2024-05-21 18:01:29'),
(193, 'Hshd', 'sbdhs@gmail.com', NULL, '3698521478', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 18:02:20', '2024-05-21 18:02:20'),
(194, 'Hdhd', 'hshdv@gmail.com', NULL, '3256981470', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 18:07:01', '2024-05-21 18:07:01'),
(195, 'Sumit Kharva', 'test1234@gmail.com', NULL, '9033073030', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-21 18:15:58', '2024-06-14 11:50:56'),
(196, 'New', 'new@gmail.com', NULL, '2580147369', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-22 10:17:19', '2024-05-22 10:17:19'),
(197, 'selvan', '456r@gmail.com', NULL, '7854963240', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-22 10:30:24', '2024-06-03 18:19:51'),
(198, 'Rav', 'rav@mailinator.com', NULL, '7896543210', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-05-22 14:58:36', '2024-05-22 14:58:36'),
(199, 'Sindhu', 'sindhu@mailinator.com', NULL, '9056237890', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-21 15:36:25', '2024-06-21 15:36:25'),
(200, 'Siva', 'siva@mailimator.com', NULL, '9809609680', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-21 15:45:07', '2024-06-21 15:45:07'),
(201, 'Shanthi', 'sss@mailinator.com', NULL, '9634596800', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-24 11:09:55', '2024-06-24 11:09:55'),
(202, NULL, 'maduraikadai.in', NULL, '9176860270', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-25 11:46:10', '2024-06-25 11:46:53'),
(203, NULL, 'maduraikadai.in', NULL, '9176860270', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-25 12:09:32', '2024-06-25 12:10:06'),
(204, NULL, 'maduraikadai.in', NULL, '9176860270', NULL, 'Web', 'No', NULL, 'Customer', 'Active', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-25 12:11:30', '2024-06-25 12:11:58'),
(205, 'Vsmadurai', 'sriganeshjewellersofficial@gmail.com', '$2y$10$9Ju30bB64rbbJepki/JBceB1UHFVqgFmevPAZMfCpm0hueiLUsSr2', '9176860274', NULL, 'Web', 'No', NULL, 'Customer', 'Inactive', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL, '2024-06-25 12:13:24', '2024-06-25 12:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` bigint(20) UNSIGNED NOT NULL,
  `notified_as` enum('Customer','Rider') NOT NULL,
  `read` enum('No','Yes') NOT NULL DEFAULT 'No',
  `read_time` datetime DEFAULT NULL,
  `deleted` enum('No','Yes') NOT NULL DEFAULT 'No',
  `deleted_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `notification_id`, `notified_as`, `read`, `read_time`, `deleted`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 17, 1, 'Customer', 'No', NULL, 'No', NULL, '2023-04-27 18:50:51', '2023-04-27 18:50:51'),
(2, 6, 2, 'Customer', 'No', NULL, 'No', NULL, '2023-04-27 18:52:00', '2023-04-27 18:52:00'),
(3, 6, 3, 'Customer', 'No', NULL, 'No', NULL, '2023-04-27 18:52:09', '2023-04-27 18:52:09'),
(4, 10, 4, 'Rider', 'No', NULL, 'No', NULL, '2024-04-11 16:19:38', '2024-04-11 16:19:38'),
(5, 10, 5, 'Rider', 'No', NULL, 'No', NULL, '2024-04-11 16:23:18', '2024-04-11 16:23:18'),
(6, 159, 6, 'Customer', 'No', NULL, 'No', NULL, '2024-04-11 16:31:31', '2024-04-11 16:31:31'),
(7, 167, 7, 'Customer', 'Yes', '2024-05-08 19:30:11', 'Yes', '2024-05-08 19:34:28', '2024-05-08 19:29:55', '2024-05-08 19:34:28'),
(8, 2, 8, 'Customer', 'No', NULL, 'No', NULL, '2024-05-08 19:31:24', '2024-05-08 19:31:24'),
(9, 2, 9, 'Customer', 'No', NULL, 'No', NULL, '2024-05-08 19:31:36', '2024-05-08 19:31:36'),
(10, 167, 10, 'Customer', 'Yes', '2024-05-08 19:34:15', 'No', NULL, '2024-05-08 19:34:00', '2024-05-08 19:34:15'),
(11, 167, 11, 'Customer', 'Yes', '2024-05-10 10:55:28', 'No', NULL, '2024-05-08 19:35:36', '2024-05-10 10:55:28'),
(12, 172, 12, 'Customer', 'Yes', '2024-05-13 15:32:13', 'No', NULL, '2024-05-13 15:31:45', '2024-05-13 15:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('Customer','Rider','Vendor') NOT NULL DEFAULT 'Customer',
  `tag` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `address`, `password`, `mobile`, `gst`, `created_at`, `updated_at`) VALUES
(1, 'M RAMSINGH AGRO FOOD PVT LTD', 'Test', '$2y$10$qwMfT5cdNN1P1GEGrLCjAeeSD0RElSgSiE.FPWBBB7SM7TKdDvbl6', '9865188730', 'ewewe1', '2023-03-30 08:39:07', '2023-08-09 12:15:08'),
(2, 'MALTHY  SONS', '143/27, PARUTHIMAAL VANIGA VALAGAM,\r\nOLD TRUNK ROAD, SATTUR', '$2y$10$qTY6CqQaX5arJdhGwjo5yO186YTw6SRymwSCdGaqcAExv1L31T.x2', '9943599936', '33ABRPD4113F1Z4', '2023-03-30 19:02:37', '2023-08-09 12:19:24'),
(3, 'SRI RAJ TRADERS', '115/4,P.V SOMASUNDARA NAGAR LANE,\r\nEAST MASI STREET,MADURAI', '$2y$10$nLD8YxUX76RQoNd2Eujr6uz6YVFK0VuGjHR4bEJGqGmr.t3nktIaK', '9489665883', '33ACTFS7027G1ZT', '2023-04-01 18:58:12', '2023-08-09 12:21:14'),
(4, 'SRI MEENAKSHI TRADERS', '21, OLD VETRILAI KADAI STREET,\r\nSAMY SANNATHI, MADURAI', '$2y$10$mmX9NQECwsIr0qV5nkDdC.nIKwO/mi8rwIyQoUX.NUQdBgQ7er66m', '9952439937', '33AAXFS6088B1ZS', '2023-04-27 18:43:06', '2023-08-09 12:24:16'),
(5, 'RIAZ TRADERS', 'L306,MALLIGAI NAGAR, ANAIYUR', '$2y$10$CT/5jcGWjQkn8Te1M3zUJeNhvWC39QFABXo8rMn5kdm9.PcpbExQS', '6369891797', '33EPMPA7768J1ZF', '2023-05-15 10:32:39', '2023-08-09 12:26:38'),
(6, 'S V SANKARALINGA NADAR', '16,SWAMI SANNATHI LANE,EAST MASI STREET,\r\nMADURAI', '$2y$10$bPPaI6wdV2Hy7jqp7lyIPejGqSl9qxL3QcaVK81CYlLeStKJ0pJgq', '9944412616', '33AASFS1685D1Z0', '2023-08-09 12:29:17', '2023-08-09 12:29:17'),
(7, 'SRI JAYACHAKARA CORPORATION', 'D.NO : 33, PLOT NO : 21&22, 4TH MAIN STREET,\r\nMADURAI', '$2y$10$8Ak0RMB6QlPwzlEcb5gHU.phe9WcJ9omFigukm2MkrWgQGyNkRkTy', '9000627265', '33CAFPR4264N1Z9', '2023-08-09 12:31:29', '2023-08-09 12:31:29'),
(8, 'SRI MAGNA STORE', '367, EAST MASI STREET,\r\nMADURAI', '$2y$10$J8gBcrLCAH6.4fnWYFR6leDPU0gi0YeBRtGP//x3BCoRXyp7u9LOC', '9894352266', '33AEEFS6900F1ZA', '2023-08-09 12:33:17', '2023-08-09 12:33:17'),
(9, 'ABINAYA MARKETING', '58E, MUNICHALAI ROAD, MADRURAI', '$2y$10$BJNMapeCzcW1Yd2UutK.luXBENaNCd8v8gpZObR0ME0jYrfFHmP/m', '9940657097', '33AAEFA1784F1ZS', '2023-08-09 13:49:01', '2023-08-09 13:49:01'),
(10, 'AMUDHAM SPECIALITY FOODS', '87A-1, ATHAIKONDAN ROAD, GANDHI NAGAR,\r\nKOVILPATTI, TUTICORIN', '$2y$10$VbHl1iac6KKpsFVBUf5kl.vI2kDLT7z30fAEiAnpUIUDIRTpyM6xm', '9842133115', '33ADBPA1478J1ZW', '2023-08-09 14:03:32', '2023-08-09 14:03:32'),
(11, 'ANNAPOORNA AGENCY', 'B.O:85-A, EAST MASI STREET,\r\nMADURAI 01', '$2y$10$afUBJgFBbIwqRvTRjsRlN.Zkn54hPp3XdvrbudUtrDT8LlFy0jzlu', '9894880386', '33ALDPP9329H1ZX', '2023-08-09 14:07:15', '2023-08-09 14:07:15'),
(12, 'ARUNJUNAI AGENCIES', '11, VENKARALA KADAI II STREET,MADURAI', '$2y$10$sCMzsxGYcSBcMWVRjBlw9uQaBNAm2LCGHAqU4BKHKRqI5p4ERrP.C', '9443571341', '33AIDPA1883A2Z0', '2023-08-10 17:27:38', '2023-08-10 17:27:38'),
(13, 'ADANAWIN AMMA FOOD PRODUCTS PVT LTD', 'R.S.NO.21/2, P.NO.32,KAMARAJ NAGAR,\r\nAVANIYAPURAM, MADURAI', '$2y$10$GJUoojh3uSziYrDJMgdZEuahCNl8WDozljVECpZRuNFlU6VyNuhVe', '9597278465', '33AARCA8428L1Z5', '2023-08-10 17:29:49', '2023-08-10 17:29:49'),
(14, 'BALU TRADERS', '13/6, PILLAIYAR KOIL STREET,\r\nS.S COLONY, MADURAI', '$2y$10$U.0LgZGnEs3rPNd.P1IgkOG.egDvwVQ/60MN0Wnlbcj.utdE1dWaS', '9629337717', '33EYLPK5403A1ZV', '2023-08-10 17:37:12', '2023-08-10 17:37:37'),
(15, 'BHAGAVATHI AGENCY', 'BRANCH : 19, AYYANAR KOVIL 2ND STREET,\r\nSELLUR, MADURAI', '$2y$10$fp4G3Qb.AuST4xkDX69HhODIpk9.7NB75bg53jmWOzfIpDY2Hya76', '9385665235', '33BEAPN8128P1Z4', '2023-08-10 17:40:23', '2023-08-10 17:40:23'),
(16, 'CHAIRMAN ENTERPRISES', '67C, MANOJ COMPLEX, II FLOOR,\r\nTHENI MAIN ROAD,KALAVASAL, MADURAI', '$2y$10$eYuVmg.wXwjRbmnu59zDzubgzNfnlSGO.6R1KFKw4ikBMFyEpZ1Gq', '9345620323', '33CBKPP8567N1ZQ', '2023-08-10 18:06:25', '2023-08-10 18:06:25'),
(17, 'DEEPA TRADERS', '1,WEST VADAMPOKKI STREET,\r\nMADURAI', '$2y$10$m3kz2KcDEoRhjf5vbwRSLOoPPFDZFnliJfSRySd09T6Sla4inLow2', '7540000603', '33ACWPP2955R1ZI', '2023-08-10 18:10:43', '2023-08-10 18:10:43'),
(18, 'HAKIMI ENTERPRISES', '21,PERIYANNA MAISTRY STREET,', '$2y$10$VkNQvGzi1G8QWrL4UYfQ2.pC6uJ/yF6cKOFH8jb00lICsLUT/eZLO', '9444054668', '33AACFH0020P1ZR', '2023-08-10 18:14:17', '2023-08-10 18:14:17'),
(19, 'INDIRA MARKETINGS', '69/1,ASTALAKSHMI NAGAR,\r\nMELAKKAL ROAD,KEELAMATHUR, MADURAI', '$2y$10$mj/vLPQhRsHEzR2Q5nVLGuK733B0HyXLqtLbtjZeP0WMg5MhJPA6K', '9245413853', '33AGDPJ5573E1ZM', '2023-08-10 18:16:16', '2023-08-10 18:16:16'),
(20, 'KARNESH MANUFACTURERS', '61/1, KURUVANPET ROAD,MADUKARAI 605105,PUDUCHERRY', '$2y$10$Tnt6G8vEb2VJatIwygPZheu6BBMg7Fote5CHy3g.HNBeCuiw1z1v6', '9499022883', '33AASFK7109G1Z5', '2023-08-10 18:18:47', '2023-08-10 18:18:47'),
(21, 'KARUDA FOOD PRODUCTS', '42/69,V.M.SAVADI STREET,\r\nALLINAGARAM,THENI', '$2y$10$/c8XmZcq4MaUzA6KcA9hTOxwcNVQyXypk7DaMe4bth.LmzPEyUcO.', '9842945431', '33AHGPN5645K1Z3', '2023-08-10 18:24:01', '2023-08-10 18:24:01'),
(22, 'KBS TRADERS', '#222T, CHENNAI SALAI, \r\nLAKSHMINARAYANAPURAM, PANRUTI', '$2y$10$z1nL75zyxZbJQ3LdHL4AnunTpSL0.FQCONV1x.dBmDsucb768NIx.', '9443666399', '33AAVFK5137D1ZA', '2023-08-10 18:39:16', '2023-08-10 18:39:16'),
(23, 'KS OIL MILL', '487,MUTHALAKKAMPATTI,NEAR VAIGAI DAM,\r\nVARADHARAJ NAGAR(PO), PERIYAKULAM', '$2y$10$egV67y3dHykcRQRbI.qR9.51VrdSanWE3x2MXOllyMejacrmTgJ3u', '9446420652', '33DXLPK3441L1Z9', '2023-08-10 18:42:08', '2023-08-10 18:42:08'),
(24, 'MAGNET TRADING CO', '5/69, MARUTHI NAGAR,MELA ANUPANADI,\r\nMADURAI', '$2y$10$YIE5JHj6gQrTw9mMkdfhQ.vGZP5VJZUFoQrna3tT6H9iXtoxI.ZRO', '9345620323', '33CMIPK4259B1ZA', '2023-08-11 16:48:49', '2023-08-11 16:48:49'),
(25, 'MAHAVEER MARKETING', '287,R.G STREET,COIMBATORE-1', '$2y$10$lB7b0DXqY6E9vkyXt9mvD.XfIWmlyRCxmj8PNH1Cx6Hk4xsNeBeAO', '9600403151', '33AAEHM4925Q1ZS', '2023-08-11 16:50:40', '2023-08-11 16:50:40'),
(26, 'MK GROUPS', '1A,BHARATHIYAR 3RD STREET,S.S COLONY, MADURAI', '$2y$10$HdwMpIlzdoQLR9VHU4OvdOyzuGiMBTHwOr..xwwFAvd6cmDhRS8zK', '9080998981', '33AVMPV1858L1ZV', '2023-08-11 16:59:25', '2023-08-11 16:59:25'),
(27, 'N S MUTHAIAH  AND SONS', '43,CHITRAKARA STREET, MADURAI', '$2y$10$ARXe2/H/2l5wnbb018q5R.LfTXTwT1WtQJS34zL7QqyArqySpFUM2', '8903239666', '33AABFN9067H1Z6', '2023-08-11 17:07:00', '2023-08-11 17:07:00'),
(28, 'OJAS GAS LIGHTER COMAPANY', '206, YOGI TOWER, MOTI TANKI CHOWK,RAJ KOT', '$2y$10$UByyu9aOSHUZTlyvAcqhOO/ULa9s7CDlATN72kBj.6j1pYnvPGtXO', '9825229029', '24ADGPK8921R1ZY', '2023-08-11 17:08:26', '2023-08-11 17:08:26'),
(29, 'OMS TAMARIND MERCHANTS P LTD', '185,EAST MASI STREET,MADURAI', '$2y$10$aCf//3VrLLRle0fDwTgg8.nBdVLcF5LNUhuxZyBydq9S6S4gIw5gu', '9843067766', '33AAACO3605Q1ZD', '2023-08-11 17:09:44', '2023-08-11 17:09:44'),
(30, 'PADMASHRI MARKETING', '197-A,EAST VELI STREET,MADURAI', '$2y$10$vukopn.BmszDtJQYWe58c.O8ZLX54wsG4IPeI0KXHcgUHXHarUhLq', '9976066633', '33ADPPS7023K1Z5', '2023-08-11 17:11:41', '2023-08-11 17:11:41'),
(31, 'R S M TRADERS', '13C,CHITRAKARA STREET,MADURAI', '$2y$10$X5OzTdRmfY7rdmgmmg3pDuOrK.xw14f4i6YxVVmSl2ioOzxh/Y4YO', '9659716571', '33AAYFR3766L1ZC', '2023-08-11 17:19:59', '2023-08-11 17:19:59'),
(32, 'SAI FOODS PRODUCTS', '18B,PONPOZHI ROAD,\r\nMELAKADAYANNALUR,KADAYANALLUR TK', '$2y$10$9HmZQ1ctPeY3I7apsUmSz.wxp1QQHR5hRnBANbSwCrzJt094.7TbS', '9443109346', '33ADZPH5409G2ZC', '2023-08-11 17:41:55', '2023-08-11 17:41:55'),
(33, 'SAI HOME APPLIANCES', 'NO.762, CROSS LANE, GR NAGAR 5TH STREET,\r\nKANNANENTHAL, IYER BUNGLOW,MADURAI', '$2y$10$cwlmO9iYSMqAS55fpksPHO4O4YJtYsrr76wiIVUWzbRDQRPNcaTYC', '9361272873', '33BOBPG2795A1ZF', '2023-08-11 17:53:47', '2023-08-11 17:53:47'),
(34, 'SAI PONS AGENCIES', '5,VIVEKANANDHAR STREET,\r\nS.S COLONY, MADURAI', '$2y$10$3TY1V4mFM8o/3UsfUeglvu7Z43BSDcU8zUMMH.4TUH/Ad014wqYGO', '8973477333', '33ALOPP8391G1ZK', '2023-08-11 17:57:00', '2023-08-11 17:57:00'),
(35, 'S T AGENCIES', 'D.NO:44,NEW D.NO:37, 2ND STREET,\r\nOLD POST OFFICE ROAD,SS COLONY,MADURAI', '$2y$10$2XlSP9QQPPnzpLZsJbTjx.rYZXYUHSWosu0fbHRExhogUGzsxB7KK', '9865240445', '33AMEPT1837A1ZF', '2023-08-11 17:59:11', '2023-08-11 17:59:11'),
(36, 'S V TRADERS', '4/42, THIRUVALLUVAR STREET,BETHANIYAPURAM,\r\nMADURAI', '$2y$10$ByyFMTX30RIayo4mL2eRnOp3KGfbZuDd0DR1H1Ihg4YmuMTVjH5Cq', '9842153628', '33AEGPV3242P1Z2', '2023-08-11 18:12:48', '2023-08-11 18:12:48'),
(37, 'THEKKADY SPICES', '424B,LF ROAD,CUMBUM', '$2y$10$84YtL.WS19wiAa0ZlYPl2OTu3uVK26NIDsvAXvk5yMiyZUoyg.hB2', '9944789777', '33AFRPR5719M1ZP', '2023-08-11 18:13:59', '2023-08-11 18:13:59'),
(38, 'THE NATURAL FARMER', 'PATTIVEERANPATTI', '$2y$10$Vp9om13Jq6CrOBY1QVUkZutDKE.0upYFb89wY8OpFUIHWA99zRX.2', '9842199516', '00000000', '2023-08-11 18:19:04', '2023-08-11 18:19:04'),
(39, 'T M MATHANLAL AND  CO', '104-105, EAST MASI STREET,MADURAI', '$2y$10$2/5xD3Jd/rNi1/Ee8rgAbuGOx6AlUBcDIuNS1.0oWAlx1bdmIrNji', '9842921841', '33AABFT3302K1ZJ', '2023-08-11 18:20:49', '2023-08-11 18:20:49'),
(40, 'VANITHA ENTERPRISES', '64/3,SRI LAKSHMI VILLA,PONMENI, MADURAI', '$2y$10$mt5BVeqGJ.msfYG.5C3RD.oxPt5VQhW/ubMwtOb8J3bHNWkUHlkwK', '9845620323', '33BDQPV2727K1ZZ', '2023-08-11 18:22:15', '2023-08-11 18:22:15'),
(41, 'VEW KAY HYGIENE PRODUCTS', '3-113, AMBAI ROAD,KALATHIMADAM,\r\nALANGULAM', '$2y$10$sco2m6dqNV91qeX57JXtF.Rto21a/n93/f7IKhOrSY6aZCVaL5vRq', '1234567891', '33AASFV7235L1ZI', '2023-08-11 18:25:10', '2023-08-11 18:25:10'),
(42, 'VISALAKSHI LOGISTICS', '4-6-2/2,ALAMELU NAGAR,WARD 3,\r\nPATTIMEDU,ANAIYUR POST,MADURAI', '$2y$10$mTl.WHIBfNqQwNHhMQbIH.VW2db9fcSSW8JiiHStS2YiYOKvVB2OO', '1234568791', '33ADKPS0695J1Z4', '2023-08-11 18:28:19', '2023-08-11 18:28:19'),
(43, 'Bharat Shop', 'Madurai', '$2y$10$arl4oAyCynX4jAb2aA.3kuOYsmyInCdWTtLUvg6YHN6CZ0GCEY/Ea', '8012555969', '123456789', '2023-09-11 13:29:14', '2023-09-11 13:29:14'),
(44, 'Sabari Agency', '18-A, Kottukannara Street,\r\nManjanakaran street,Madurai', '$2y$10$WJoEEHX7rIBDJsiH.D/oMO5hVbd0950kxKx.udfdbEq0wHqj3zWAK', '1234567809', '33CEUPS0864Q1ZH', '2023-09-11 18:00:35', '2023-09-11 18:00:35'),
(45, 'Sha Manakchand  Sons', '30, East Avani moola street,\r\nMadurai', '$2y$10$ZRA9gVu7wuJdT.AAhYmh0OFlB/siL.X88IRl4byDJsVIKL9wscd2e', '1234568097', '33AAVPN9394H1ZV', '2023-09-11 18:05:09', '2023-09-11 18:05:09'),
(46, 'Gandhimathi Appliances', 'Visalakshi Enterprises', '$2y$10$0UO43550znvaOnr1lZRrfOQXFSujbEFYkETPK9nELjUvIOHb1qd9a', '9047037411', '33AAACG2038F1Z7', '2023-10-28 13:18:20', '2023-10-28 13:18:20'),
(47, 'Roja Mark appalam', 'Plot No 50, Ramanashree Garden, Meenambigai Nagar 5th street, Jeeva Nagar, Madurai-11', '$2y$10$BoTgLugHWOHMhry9i/afd.ZX2SNDdpNVzr.U.EqD/oDk7zA4IRf3K', '9677771944', '33ATNPM1958P1ZY', '2023-11-14 16:43:07', '2023-11-14 16:43:07'),
(48, 'Ya Creations', '308A,7th street, Shri Krishna Nagar, Thirupalai, Madurai', '$2y$10$PrCEssF9OYpoY11YCjOoTuBbK9XdojnMA4Bu5d5yxmQlAfQOe5Szq', '9384115178', '33EENPS3871C1ZA', '2023-11-21 14:28:40', '2023-11-21 14:28:40'),
(49, 'Pandian Food P Ltd', '71.A,Thathaneri Main Road, Madurai', '$2y$10$6qS.5pdUJyJOVcXsEyWGi.MiWAzBsximH1fYMDoTIdMrSicQftjh2', '9626759027', '33AAACP8402A1Z4', '2023-11-30 12:26:30', '2023-11-30 12:26:30'),
(50, 'M.R & Sons', 'NO.29, HARVEY NAGAR 2ND STREET,ARASARADI, MADURAI - 625016.', '$2y$10$3mhMZmTM5VXQb.JYNMf9vOLP1R3idgpDqq2O9euOCvumH8451pvvG', '9047037434', '33ACIPB6349K1ZK', '2023-12-12 10:42:14', '2023-12-12 10:42:14'),
(51, 'MC Company', '5/1, New Ramnad Road, Theppakulam South, Madurai 625009', '$2y$10$LvB6NhbL9tuWgq6p0BentexE6jRaeBVrJKe6hqdPWAAg7oU5o3KFe', '9498846711', '33AAHFM0449E1ZN', '2023-12-27 11:35:09', '2023-12-27 11:35:09'),
(52, 'SR Sivasakthi Pickles', '51A,Aarapalayam Main Road,Madurai-16', '$2y$10$N9WJ6jQ9zRMBptMQ78C3UOUxEWcQswJPaZJGKDhvfUtXmwEAqfX06', '8668007233', '33HBUPS5950M1ZL', '2023-12-27 12:08:43', '2023-12-27 12:08:43'),
(53, 'Srimaanya Consumer Products Pvt Ltd', '3/E 94, Duraisamy Road, TVS Nagar, Madurai 625003', '$2y$10$DzJeQWLMS4OVkHb2eh7hxuvvnZ5HjnyUUyi7s4UaSputrwfGg3E32', '9994368291', '33AAXCS7453B1Z3', '2023-12-27 14:09:07', '2023-12-27 14:09:07'),
(54, 'Thiagarajan Agro Products P ltd,', '#22, Visuvasapuri 4th street,  Gnanaolivupuram, Madurai 16', '$2y$10$hY5v5Xksk9tY.UK1hAdJ/e0xhfTz5hINLvnBufvT48JvdeVQuhdJS', '8940400593', '33AABCT9963D1Z9', '2024-01-06 12:56:57', '2024-01-06 12:56:57'),
(55, 'SIM Marketing', 'Plot No : 899, TNHB Colony, Near Taqwa Pallivasal Back side,\r\nVillapuram, Madurai - 625011', '$2y$10$8kTK3J4uwCMiXwc1VktocOQo4aSmtHDa78OzyqqqCAUHqP8vP7Bde', '9942126733', '33GPJPM6903N1ZD', '2024-01-24 17:23:25', '2024-01-24 17:23:25'),
(56, 'Roja Agency', 'No.1, Amsari Nagar 2nd west street, Mahaboobpalayam, Madurai-16', '$2y$10$0nZPx2ntfjOdDeGJN67u4.PYStzV3/5XPRFxjQvppB5IdP7f7dgPm', '9942126733', '33BOFPP9196C1ZP', '2024-01-24 17:26:22', '2024-01-24 17:26:22'),
(57, 'Chitra Home Foods', '218D/49,Arunachalam Colony,Asampu Road, Vasasery, Nagercoil, Kanniyakumari - 629001', '$2y$10$Hn4Z/3GVop3cOlXc69DkpuMDCgBJbMjxJExM63uhLrzt.MOUKqrfi', '9047025577', '33KXAPS1639J1Z5', '2024-02-09 19:11:11', '2024-02-09 19:11:11'),
(58, 'Jaishree Distributors', '2G,Venkadaswamy naidu agraharam, Near Saratha School,\r\nSimmakkal,Madurai - 625001', '$2y$10$F6ScYA04B2oVve.Gsh796.ZWmcHXP4TcdcUeDghj0cRRkEfUpseae', '9514822224', '33BIWPP0071M1ZR', '2024-02-20 14:10:02', '2024-02-20 14:10:02'),
(59, 'Sevvel Trading Company', '1/12/6B1,South Street, Opp TVS Pct Ltd, Ngri Kumaram Main raod\r\nVayalur, Madurai', '$2y$10$VAWSiky5zeRtMq5D7S68c.3Pf3Q5srIEEZ0B5xFU/EIuFWTWKOBKG', '8072004908', '33AJPPV4901K1ZS', '2024-02-23 12:57:42', '2024-02-23 12:57:42'),
(60, 'Shri Balaji Agencies', 'No : 7, North Gate, S.S Colony, Madurai', '$2y$10$oVKur1VZ9qWGoburUEEzfOOnnmJ.GEsN7LfiyXZzbGEEegq6ZY0Fu', '9095003434', '33AASFS8290A1ZZ', '2024-03-18 12:50:22', '2024-03-18 12:50:22'),
(61, 'Shriram', 'South street,Madurai', '$2y$10$zGoiHQ6t3HA3voY.hnzP2eG/Grlh7tQTsoSYYUIMZwSnevlv/wyZi', '9988776656', 'KLMN001', '2024-06-04 12:25:29', '2024-06-04 12:26:30'),
(62, 'Shreebalaji', 'North street,Madurai', '$2y$10$mftR8xjv03Da0c.JStjQEOBc3jO9ZUh4I.Ma.gH1ns0z58Pd0JvCe', '9638527410', 'MLK001', '2024-06-04 12:40:56', '2024-06-04 12:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `vendors_products`
--

CREATE TABLE `vendors_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendors_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(8,2) NOT NULL,
  `discount_to_customer` decimal(5,2) NOT NULL,
  `margin_to_distribution` decimal(5,2) NOT NULL,
  `gst` varchar(244) NOT NULL,
  `hsn_code` varchar(255) NOT NULL,
  `minimum_order` int(11) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `lot_no` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors_products`
--

INSERT INTO `vendors_products` (`id`, `vendors_id`, `item_name`, `purchase_price`, `discount_to_customer`, `margin_to_distribution`, `gst`, `hsn_code`, `minimum_order`, `quantity`, `expiry_date`, `lot_no`, `created_at`, `updated_at`) VALUES
(3, 3, 'Refined Oil 3l', 9997.00, 2.00, 2.00, '2.00', '090909', 10, '-37', '2023-12-29', '123456789', '2023-04-29 12:57:21', '2024-03-27 11:14:58'),
(4, 1, NULL, 10000.00, 2.00, 2.00, '2.00', '090909', 10, '10', '2023-12-29', '12345678955', '2023-04-29 12:57:34', '2023-04-29 13:22:59'),
(5, 1, NULL, 10000.00, 2.00, 2.00, '2.00', '090909', 10, '10', '2023-12-29', '12354567891', '2023-04-29 12:57:42', '2023-04-29 13:23:02'),
(6, 3, NULL, 50000.00, 5.00, 10.00, '3.00', '89632', 5, NULL, '2023-05-06', '0102', '2023-04-29 15:36:18', '2023-04-29 15:36:18'),
(7, 3, 'Zebra Nattu Ponni Rice', 2000.00, 3.00, 5.00, '3.00', '1001', 30, NULL, '2023-08-09', '5005', '2023-05-09 15:32:51', '2023-07-03 12:14:15'),
(10, 5, 'Dry Fruits and Nuts', 1500.00, 3.00, 5.00, '5', '1001', 50, '17', '2024-05-15', 'DRF5432', '2023-05-15 10:40:09', '2024-01-12 19:13:41'),
(12, 61, 'Oil', 5000.00, 1.00, 2.00, '2', '001', 20, '0', '2024-06-12', 'MN001', '2024-06-04 12:28:54', '2024-06-04 12:28:54'),
(13, 62, 'Pooja', 5000.00, 1.00, 2.00, 'ML002', '003', 50, '0', '2024-08-31', 'NM002', '2024-06-04 12:41:44', '2024-07-01 10:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(25, 4, 163, '2023-08-22 18:50:25', '2023-08-22 18:50:25'),
(27, 28, 162, '2023-09-22 13:00:00', '2023-09-22 13:00:00'),
(28, 42, 399, '2023-11-28 17:24:36', '2023-11-28 17:24:36'),
(29, 74, 841, '2023-12-27 15:49:05', '2023-12-27 15:49:05'),
(30, 74, 842, '2023-12-27 15:49:06', '2023-12-27 15:49:06'),
(31, 74, 844, '2023-12-27 15:49:07', '2023-12-27 15:49:07'),
(32, 74, 845, '2023-12-27 15:49:07', '2023-12-27 15:49:07'),
(33, 74, 843, '2023-12-27 15:49:10', '2023-12-27 15:49:10'),
(35, 90, 842, '2024-02-18 13:46:16', '2024-02-18 13:46:16'),
(36, 90, 841, '2024-02-18 13:46:17', '2024-02-18 13:46:17'),
(37, 90, 843, '2024-02-18 13:46:17', '2024-02-18 13:46:17'),
(38, 90, 844, '2024-02-18 13:46:20', '2024-02-18 13:46:20'),
(39, 90, 845, '2024-02-18 13:46:22', '2024-02-18 13:46:22'),
(41, 96, 183, '2024-02-22 19:53:16', '2024-02-22 19:53:16'),
(42, 96, 184, '2024-02-22 19:53:18', '2024-02-22 19:53:18'),
(43, 96, 197, '2024-02-22 19:57:19', '2024-02-22 19:57:19'),
(44, 96, 198, '2024-02-22 19:57:32', '2024-02-22 19:57:32'),
(45, 96, 182, '2024-02-22 19:57:58', '2024-02-22 19:57:58'),
(46, 109, 339, '2024-03-10 00:15:06', '2024-03-10 00:15:06'),
(47, 39, 297, '2024-03-11 11:19:33', '2024-03-11 11:19:33'),
(50, 110, 166, '2024-03-21 00:40:24', '2024-03-21 00:40:24'),
(51, 110, 188, '2024-03-21 00:41:42', '2024-03-21 00:41:42'),
(52, 110, 748, '2024-03-21 00:42:32', '2024-03-21 00:42:32'),
(53, 125, 221, '2024-03-27 11:01:45', '2024-03-27 11:01:45'),
(55, 155, 163, '2024-04-08 16:18:29', '2024-04-08 16:18:29'),
(56, 167, 682, '2024-05-22 15:06:47', '2024-05-22 15:06:47'),
(57, 167, 255, '2024-05-22 15:07:09', '2024-05-22 15:07:09'),
(58, 167, 256, '2024-05-22 15:07:11', '2024-05-22 15:07:11');

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
(22, 'March 2023', 30, 4, 2, '2023-05-03 09:26:10', '2023-05-03 10:58:19'),
(23, 'January 2024', 31, 4, 3, '2024-02-03 05:16:31', '2024-02-03 05:16:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_product_price_id_foreign` (`product_price_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `cust_required_product`
--
ALTER TABLE `cust_required_product`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `discount`
--
ALTER TABLE `discount`
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
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `order_deliveries`
--
ALTER TABLE `order_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_deliveries_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_product_price_id_foreign` (`product_price_id`);

--
-- Indexes for table `order_notifications`
--
ALTER TABLE `order_notifications`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_pickups`
--
ALTER TABLE `order_pickups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_pickups_order_id_foreign` (`order_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_features_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_specifications_product_id_foreign` (`product_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

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
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`),
  ADD KEY `user_notifications_notification_id_foreign` (`notification_id`);

--
-- Indexes for table `user_tags`
--
ALTER TABLE `user_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_tags_user_id_foreign` (`user_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_products`
--
ALTER TABLE `vendors_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cust_required_product`
--
ALTER TABLE `cust_required_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `daybooks`
--
ALTER TABLE `daybooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `delivery_days`
--
ALTER TABLE `delivery_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `delivery_slots`
--
ALTER TABLE `delivery_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `denominations`
--
ALTER TABLE `denominations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `godown_day_books`
--
ALTER TABLE `godown_day_books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `headings`
--
ALTER TABLE `headings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `order_deliveries`
--
ALTER TABLE `order_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1028;

--
-- AUTO_INCREMENT for table `order_notifications`
--
ALTER TABLE `order_notifications`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `order_pickups`
--
ALTER TABLE `order_pickups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subheadings`
--
ALTER TABLE `subheadings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

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
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_tags`
--
ALTER TABLE `user_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `vendors_products`
--
ALTER TABLE `vendors_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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

--
-- Constraints for table `order_deliveries`
--
ALTER TABLE `order_deliveries`
  ADD CONSTRAINT `order_deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`);

--
-- Constraints for table `order_pickups`
--
ALTER TABLE `order_pickups`
  ADD CONSTRAINT `order_pickups_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `product_features_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
