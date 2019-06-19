-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2019 at 06:24 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`, `remember_token`, `status`, `createdAt`, `updatedAt`) VALUES
(2, 'Saptarshi Biswas', 'saptarshi@gmail.com', '8926308294', '$2a$08$R56TFrHvYpVuD9sx85KpiuOMUhtXFPa0cLJ3OeNiNRrzovZPddj3i', NULL, 0, '2019-06-04 20:42:52', '2019-06-04 20:42:52'),
(6, 'Debajit Basu', 'debajit@gmail.com', '9830962711', '$2a$08$cN8fZnrnKFSHRs5mk2DyWOOjzuRuYe.v8mE2qJu4PMgYkDcuTFvK.', NULL, 0, '2019-06-04 21:13:17', '2019-06-04 21:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `assignedcrews`
--

CREATE TABLE `assignedcrews` (
  `id` int(10) NOT NULL,
  `cabid` int(10) DEFAULT NULL,
  `crewid` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) DEFAULT NULL,
  `tarifid` int(10) DEFAULT NULL,
  `bookingcode` varchar(255) DEFAULT NULL,
  `bookingtype` varchar(255) DEFAULT NULL,
  `cabid` int(10) NOT NULL,
  `crewid` int(10) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `pickuplocation` varchar(255) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `days` int(10) DEFAULT NULL,
  `hours` int(10) DEFAULT NULL,
  `bookingamount` int(10) NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `userid`, `tarifid`, `bookingcode`, `bookingtype`, `cabid`, `crewid`, `name`, `phone`, `email`, `license`, `address`, `pickuplocation`, `destination`, `days`, `hours`, `bookingamount`, `status`, `ip`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 'AD12SS5', 'self', 0, 5, 'Jhon Doe', '9879879875', 'jhon@gmail.com', 'WBFJG465', 'Kolkata', 'New Town', 'Sealdah', 2, 0, 500, 1, '1237.123.55.6', '2019-06-06 09:36:31', '2019-06-06 09:36:31'),
(2, 1, 1, 'AD12SS5', 'self', 0, 5, 'Jhon Doe', '9879879875', 'jhon@gmail.com', 'WBFJG465', 'Kolkata', 'New Town', 'Sealdah', 2, 0, 500, 1, '1237.123.55.6', '2019-06-06 22:42:55', '2019-06-06 22:42:55'),
(3, 1, NULL, '5TR50C78N9', NULL, 7, NULL, 'saptarshi null', '', 'saptarshi@gmail.com', 'WB1616161N', NULL, '', '', 9, 0, 9630, 0, NULL, '2019-06-06 22:45:00', '2019-06-06 22:45:00'),
(4, 1, NULL, 'HTQPGUFN46', NULL, 7, NULL, 'saptarshi null', '', 'saptarshi@gmail.com', 'WB1616161N', NULL, '', '', 1, 0, 2140, 0, NULL, '2019-06-06 22:48:26', '2019-06-06 22:48:26'),
(5, 1, NULL, 'KXEKQUJD5Q', NULL, 7, NULL, 'saptarshi null', '', 'saptarshi@gmail.com', 'WB1616161N', NULL, '', '', 1, 0, 2140, 0, NULL, '2019-06-06 22:48:38', '2019-06-06 22:48:38'),
(6, 16, NULL, 'N2P8360C1C', NULL, 7, NULL, 'Debajit Basu', '9830962714', 'debajit@gmail.com', 'WBLLC432911', 'howrah mouri', '', '', 7, 0, 29400, 0, NULL, '2019-06-07 07:40:46', '2019-06-07 07:40:46'),
(7, 16, NULL, 'BCKF708J2D', NULL, 8, NULL, 'Debajit Basu', '9830962714', 'debajit@gmail.com', 'WBLLC432911', 'howrah mouri', '', '', 1, 0, 1300, 0, NULL, '2019-06-07 08:03:22', '2019-06-07 08:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `cabs`
--

CREATE TABLE `cabs` (
  `id` int(10) NOT NULL,
  `imageid` int(10) DEFAULT NULL,
  `regno` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postalcode` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cabs`
--

INSERT INTO `cabs` (`id`, `imageid`, `regno`, `company`, `model`, `type`, `state`, `district`, `postalcode`, `status`, `createdAt`, `updatedAt`) VALUES
(7, NULL, 'AP 16G 5619', 'HUNDAI', 'i 10', 'sedan', 'Andra pradesh', 'jambul', '700001', NULL, '2019-06-05 15:56:45', '2019-06-05 15:56:45'),
(8, NULL, '123123', 'HONDA', 'VERENA', 'Mini', 'West Bengal', 'Kolkata', '700001', NULL, '2019-06-05 15:47:08', '2019-06-05 15:47:08'),
(9, NULL, 'WB 12AC 7891', 'Maruti', 'Swift', 'Prime', 'Karnataka', 'jagumari', '4567249', NULL, '2019-06-05 15:51:01', '2019-06-05 15:51:01'),
(10, NULL, 'WB 6FG 3945', 'Voxvagon', 'punto', 'Micro', 'west bengal', 'howrah', '711148', NULL, '2019-06-05 15:57:16', '2019-06-05 15:57:16'),
(11, NULL, 'BR 3R 6511', 'Maruti', 'alto', 'mini', 'west bengal', 'kolkata', '711102', NULL, '2019-06-06 10:04:01', '2019-06-06 10:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(140) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `name`, `email`, `ip`, `created_at`, `updated_at`) VALUES
(25, 'It\'s cool!', 'Ivan', '', '127.0.0.1', '2016-03-28 07:34:40', '2016-03-28 07:34:40'),
(26, ' vmxxhcxghb', 'Saptarshi Biswas', 'saptarshi@gmail.com', '::1', '2019-04-06 18:28:29', '2019-04-06 18:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `tel` varchar(30) NOT NULL,
  `info` varchar(140) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `tel`, `info`, `created_at`, `updated_at`) VALUES
(1, '+91 8926308294', 'Dispatcher', '0000-00-00 00:00:00', '2015-12-13 14:44:34'),
(5, '6546546545', 'Ambulance', '2015-12-13 15:12:35', '2019-03-13 13:42:27'),
(6, '6546546545', 'Sample street', '2015-12-19 12:39:46', '2019-03-13 13:42:42'),
(7, '321', 'Sample house', '2015-12-19 12:40:06', '2015-12-19 12:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `crews`
--

CREATE TABLE `crews` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(60) NOT NULL,
  `info` varchar(200) NOT NULL,
  `experience` int(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crews`
--

INSERT INTO `crews` (`id`, `name`, `phone`, `email`, `license`, `address`, `photo`, `info`, `experience`, `status`, `createdAt`, `updatedAt`) VALUES
(7, 'ashis majumdar', '123456789', 'ashish@gmail.com', 'WB14789E45', 'kolkata naktala north 700001', '', 'good driving skill 5 start', 2, 0, '2019-06-05 17:14:21', '2019-06-05 17:39:26'),
(8, 'amit mondal', '2457814789', 'amit@gmail.com', 'DL67tE45WJ55', 'delhi near gate majidtala chamrahati new', '', 'pug g player with good skill', 3, 0, '2019-06-05 17:16:46', '2019-06-05 17:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` varchar(255) NOT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `firewall`
--

CREATE TABLE `firewall` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_10_30_154506_create_crew_table', 1),
('2015_11_02_210130_create_crew_table', 2),
('2015_11_02_223000_create_comments_table', 3),
('2015_11_04_205940_create_orders_table', 4),
('2015_11_04_212705_add_ip_column', 5),
('2015_11_06_205748_create_super_user_table', 6),
('2015_11_06_205748_create_admin_table', 7),
('2015_11_08_154928_add_status_column', 8),
('2015_11_10_214558_create_firewall_tables', 9),
('2015_11_10_221931_add_ip_column', 10),
('2015_11_13_180214_add_remember_token', 11),
('2015_11_13_180851_add_timestamps', 12),
('2015_12_04_205434_create_contacts_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'USER', '2019-04-13 12:34:17', '2019-04-13 12:34:17'),
(2, 'ADMIN', '2019-04-13 12:34:17', '2019-04-13 12:34:17'),
(3, 'PM', '2019-04-13 12:34:17', '2019-04-13 12:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `tarifs`
--

CREATE TABLE `tarifs` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amountday` varchar(255) DEFAULT NULL,
  `amounthour` varchar(255) DEFAULT NULL,
  `nightcharge` varchar(255) DEFAULT NULL,
  `cabtype` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarifs`
--

INSERT INTO `tarifs` (`id`, `name`, `description`, `amountday`, `amounthour`, `nightcharge`, `cabtype`, `status`, `createdAt`, `updatedAt`) VALUES
(3, 'Delux+', 'city service with Delux plan', '2500', '50', '1700', 'Prime', 0, '2019-06-05 18:51:34', '2019-06-05 18:51:34'),
(4, 'Super+', 'city service', '1000', '20', '70', 'Sedan', 1, '2019-06-05 18:51:09', '2019-06-05 18:51:09'),
(5, 'simple go', 'This is simple go plan', '3000', '200', '500', 'Prime', 1, '2019-06-05 18:53:11', '2019-06-05 18:53:11'),
(6, 'sastaSundar+', 'This plan is very econimic', '1200', '100', '100', 'Mini', 1, '2019-06-06 10:05:53', '2019-06-06 10:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `driving` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `phone`, `email`, `password`, `state`, `city`, `pin`, `address`, `license`, `driving`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'saptarshi', NULL, '', 'saptarshi@gmail.com', '$2a$08$7buyLJGxdGTGir06QxtSV.wu/aNfcti82lo.EFbmYOKmtsJdjErHy', NULL, NULL, NULL, NULL, 'WB1616161N', NULL, 0, '2019-04-13 21:57:37', '2019-04-13 21:57:37'),
(2, 'Rii', 'Rupam', '6546546545', 'rupam@gmail.com', '$2a$08$BxgfxDvg81hDQnBrBvxnyO4EhrVbc4Yi0GKyZAnsLqtNtWDPAYnc6', 'West Bengal', 'Kolkata', '700001', 'Near Food Plaza, Alpha1', 'LLC123123654T', NULL, 0, '2019-04-13 22:27:29', '2019-06-05 15:51:20'),
(4, 'Rupam', NULL, '', 'rupam@gmail.com', '$2a$08$wJ1bgOV2/TA9rg1bYkU6a.Z.TC9qR8IJPIM.IP1IYn146VXkJqxZ2', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-10 15:37:14', '2019-05-10 15:37:14'),
(5, 'Roy', NULL, '', 'roy@gmail.com', '$2a$08$PHbXEgZ5sPlOyK7gXENT2.x7iJwZvxfMvEJbhlOi9pAcuRSGWTxbK', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-10 15:38:08', '2019-05-10 15:38:08'),
(6, 'Rri', NULL, '', 'rri@gmail.com', '$2a$08$8eDZiOBSz8MUVP4mlyZeM.lIoOFqZupuWOjbWmkjpDiw2SlwPlM/a', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-10 17:55:45', '2019-05-10 17:55:45'),
(7, 'Rupam', 'Rupam', '', 'rupam@gmail.com', '$2a$08$epyqjfMFHGqRB1jq0v233OR8q/ocRy64SzRVYVT0lGsE9h5fMHAKe', 'West Bengal', 'Kolkata', '700001', 'Near Food Plaza, Alpha1', 'LLC123123654T', NULL, 0, '2019-06-04 08:28:20', '2019-06-04 08:28:20'),
(8, 'ruuuuu', 'Rupam', '', 'rupam@gmail.com', '$2a$08$aCuAmq9vimj4ErN.Llj.hOVEnVup.qDWl.RxUzFtE4qQEv7t9HZxG', 'West Bengal', 'Kolkata', '700001', 'Near Food Plaza, Alpha1', 'LLC123123654T', NULL, 0, '2019-06-04 08:29:44', '2019-06-04 08:29:44'),
(9, 'test', 'Rupam', '', 'rupam@gmail.com', '$2a$08$MFyBaALKG3V29LRvlf3ga.Re4fKV/xtXDqvWgrE0ihwnnTovQ9sn.', 'West Bengal', 'Kolkata', '700001', 'Near Food Plaza, Alpha1', 'LLC123123654T', NULL, 0, '2019-06-04 08:30:46', '2019-06-04 08:30:46'),
(10, 'test', 'Test', '9879879875', 'rupam1@gmail.com', '$2a$08$Vfy468lH8bLGITcKwfOMzO3240OoBfjk5VQMriwmVrd4/GkIVSha6', 'West Bengal', 'Kolkata', '700001', 'Near Food Plaza, Alpha1', 'LLC123123654T', NULL, 0, '2019-06-04 08:58:35', '2019-06-04 08:58:35'),
(12, 'saptarshi', 'biswas', '8926308294', 'kure@gmail.com', '$2a$08$KsPiX9/Z8mXeBCfyJll.SOqOf6jlKKHZLsBx7JhLLoqVE/WI5AH9W', 'west bengal', 'kolkata', '711107', 'krishnanagar', 'aaaaaaaaa', 1, 0, '2019-06-04 11:36:08', '2019-06-04 11:36:08'),
(13, 'suman', 'bhowmick', '8974569874', 'google@gmail.com', '$2a$08$eUryPZdxL7fhL2Qojg1LquodjEo1JUtn3gRKat2lOCYN6fM66IOki', 'west bengal', 'gobordanga', '54789654', 'gobordanga', '', 0, 0, '2019-06-04 11:41:53', '2019-06-04 11:41:53'),
(14, 'amit', 'mondal', '6547896547', 'subrata@collegify.com', '$2a$08$GhvKKIBqLnfzbLuqRQtNM.N7gf3ib4r7jWHG4leN4hnvA5doAd0VW', 'delhi', 'delhi', '4578965', 'kolkata', '1123rrtw11110', 1, 0, '2019-06-04 11:55:21', '2019-06-04 11:55:21'),
(15, 'amit', 'mondol', '1234567890', 'amit@abcmail.com', '$2a$08$MJZ8ko00EV4XP7ymDnCfbu8X6vjiaRgfk5uFwD7rO8YDC0P3hODLm', 'west bengal', 'kolkata', '711108', 'kolkata', 'qqwjuyt25ft', 1, 0, '2019-06-04 19:54:51', '2019-06-04 19:54:51'),
(16, 'Debajit', 'Basu', '9830962714', 'debajit@gmail.com', '$2a$08$gjUzY.9AwXSL2BX12Lw8W.L0lZFFFCNd4gOtBp0PaGFh39.spBg8q', 'west bengal', 'howrah', '711108', 'howrah mouri', 'WBLLC432911', 1, NULL, '2019-06-06 17:49:31', '2019-06-06 17:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('2019-04-13 21:57:37', '2019-04-13 21:57:37', 1, 1),
('2019-04-13 22:27:30', '2019-04-13 22:27:30', 1, 2),
('2019-05-10 15:37:14', '2019-05-10 15:37:14', 1, 4),
('2019-05-10 15:38:08', '2019-05-10 15:38:08', 2, 5),
('2019-05-10 17:55:45', '2019-05-10 17:55:45', 2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignedcrews`
--
ALTER TABLE `assignedcrews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cab_id_fk` (`cabid`),
  ADD KEY `crew_id_fk` (`crewid`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cabs`
--
ALTER TABLE `cabs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crews`
--
ALTER TABLE `crews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `firewall`
--
ALTER TABLE `firewall`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `firewall_ip_address_unique` (`ip_address`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarifs`
--
ALTER TABLE `tarifs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `assignedcrews`
--
ALTER TABLE `assignedcrews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cabs`
--
ALTER TABLE `cabs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `crews`
--
ALTER TABLE `crews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `firewall`
--
ALTER TABLE `firewall`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tarifs`
--
ALTER TABLE `tarifs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignedcrews`
--
ALTER TABLE `assignedcrews`
  ADD CONSTRAINT `cab_id_fk` FOREIGN KEY (`cabid`) REFERENCES `cabs` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `crew_id_fk` FOREIGN KEY (`crewid`) REFERENCES `crews` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
