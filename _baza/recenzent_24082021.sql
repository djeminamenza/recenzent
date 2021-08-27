-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2021 at 06:25 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recenzent`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_activation_attempts`
--

INSERT INTO `auth_activation_attempts` (`id`, `ip_address`, `user_agent`, `token`, `created_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '072e2f4683dae329a901117db33c38d0', '2021-08-25 18:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator portala'),
(2, 'recenzent', 'Recenzent na portalu'),
(3, 'korisnik', 'Korisnik na portalu');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 1),
(2, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'pera', NULL, '2021-08-19 16:47:01', 0),
(2, '::1', 'pera@peric.com', 1, '2021-08-19 17:36:57', 1),
(3, '::1', 'pera@peric.com', 1, '2021-08-19 17:57:13', 1),
(4, '::1', 'pera@peric.com', 1, '2021-08-19 17:58:22', 1),
(5, '::1', 'pera@peric.com', 1, '2021-08-19 18:00:00', 1),
(6, '::1', 'pera@peric.com', 1, '2021-08-19 18:03:11', 1),
(7, '::1', 'pera@peric.com', 1, '2021-08-19 19:05:07', 1),
(8, '::1', 'pera@peric.com', 1, '2021-08-19 19:10:01', 1),
(9, '::1', 'pera@peric.com', 1, '2021-08-19 19:23:32', 1),
(10, '::1', 'pera@peric.com', 1, '2021-08-19 19:24:49', 1),
(11, '::1', 'pera@peric.com', 1, '2021-08-19 19:26:03', 1),
(12, '::1', 'pera@peric.com', 1, '2021-08-19 19:26:41', 1),
(13, '::1', 'pera@peric.com', 1, '2021-08-19 19:28:00', 1),
(14, '::1', 'pera@peric.com', 1, '2021-08-19 19:29:42', 1),
(15, '::1', 'pera@peric.com', 1, '2021-08-19 19:30:58', 1),
(16, '::1', 'pera@peric.com', 1, '2021-08-19 19:35:33', 1),
(17, '::1', 'pera@peric.com', 1, '2021-08-20 06:11:41', 1),
(18, '::1', 'pera@peric.com', 1, '2021-08-20 10:31:04', 1),
(19, '::1', 'pera@peric.com', 1, '2021-08-20 10:34:10', 1),
(20, '::1', 'pera@peric.com', 1, '2021-08-20 11:35:52', 1),
(21, '::1', 'pera@peric.com', 1, '2021-08-20 11:43:25', 1),
(22, '::1', 'pera@peric.com', 1, '2021-08-20 13:13:51', 1),
(23, '::1', 'pera@peric.com', 1, '2021-08-20 13:18:43', 1),
(24, '::1', 'zika@zikic.com', 4, '2021-08-20 13:27:34', 1),
(25, '::1', 'mika@mikic.com', 5, '2021-08-20 13:27:53', 1),
(26, '::1', 'mika@mikic.com', 5, '2021-08-20 13:29:50', 1),
(27, '::1', 'zika@zikic.com', 4, '2021-08-20 13:29:59', 1),
(28, '::1', 'pera@peric.com', 1, '2021-08-20 13:30:10', 1),
(29, '::1', 'zika@zikic.com', 4, '2021-08-20 13:30:29', 1),
(30, '::1', 'mika@mikic.com', 5, '2021-08-20 13:30:37', 1),
(31, '::1', 'mika@mikic.com', 5, '2021-08-20 13:31:00', 1),
(32, '::1', 'pera@peric.com', 1, '2021-08-20 13:32:03', 1),
(33, '::1', 'mika@mikic.com', 5, '2021-08-20 13:32:17', 1),
(34, '::1', 'mika@mikic.com', 5, '2021-08-20 13:32:57', 1),
(35, '::1', 'zika@zikic.com', 4, '2021-08-20 13:33:14', 1),
(36, '::1', 'zika@zikic.com', 4, '2021-08-20 13:34:37', 1),
(37, '::1', 'pera@peric.com', 1, '2021-08-21 10:29:08', 1),
(38, '::1', 'zika@zikic.com', 4, '2021-08-21 10:29:28', 1),
(39, '::1', 'mika@mikic.com', 5, '2021-08-21 10:29:55', 1),
(40, '::1', 'pera@peric.com', 1, '2021-08-21 10:30:21', 1),
(41, '::1', 'mika@mikic.com', 5, '2021-08-21 10:30:31', 1),
(42, '::1', 'zika@zikic.com', 4, '2021-08-21 10:30:42', 1),
(43, '::1', 'pera@peric.com', 1, '2021-08-21 12:06:41', 1),
(44, '::1', 'zika@zikic.com', 4, '2021-08-21 12:06:53', 1),
(45, '::1', 'mika@mikic.com', 5, '2021-08-21 12:07:03', 1),
(46, '::1', 'mika@mikic.com', 5, '2021-08-21 14:26:40', 1),
(47, '::1', 'zika@zikic.com', 4, '2021-08-21 14:27:05', 1),
(48, '::1', 'pera', NULL, '2021-08-23 10:03:03', 0),
(49, '::1', 'pera@peric.com', 1, '2021-08-23 10:03:08', 1),
(50, '::1', 'pera@peric.com', 1, '2021-08-23 12:03:38', 1),
(51, '::1', 'zika@zikic.com', 4, '2021-08-23 12:03:51', 1),
(52, '::1', 'mika@mikic.com', 5, '2021-08-23 12:04:02', 1),
(53, '::1', 'mika@mikic.com', 5, '2021-08-23 12:07:41', 1),
(54, '::1', 'pera@peric.com', 1, '2021-08-23 12:07:48', 1),
(55, '::1', 'pera@peric.com', 1, '2021-08-23 12:08:49', 1),
(56, '::1', 'pera@peric.com', 1, '2021-08-23 12:18:08', 1),
(57, '::1', 'pera@peric.com', 1, '2021-08-23 12:18:43', 1),
(58, '::1', 'mika@mikic.com', 5, '2021-08-23 12:19:42', 1),
(59, '::1', 'zika@zikic.com', 4, '2021-08-23 12:20:14', 1),
(60, '::1', 'pera@peric.com', 1, '2021-08-23 12:20:50', 1),
(61, '::1', 'zika@zikic.com', 4, '2021-08-23 12:22:57', 1),
(62, '::1', 'mika@mikic.com', 5, '2021-08-23 12:23:57', 1),
(63, '::1', 'pera@peric.com', 1, '2021-08-23 12:31:23', 1),
(64, '::1', 'pera@peric.com', 1, '2021-08-23 12:40:25', 1),
(65, '::1', 'pera@peric.com', 1, '2021-08-23 12:43:33', 1),
(66, '::1', 'zika@zikic.com', 4, '2021-08-23 12:45:36', 1),
(67, '::1', 'mika@mikic.com', 5, '2021-08-23 12:45:49', 1),
(68, '::1', 'pera@peric.com', 1, '2021-08-23 12:46:23', 1),
(69, '::1', 'pera@peric.com', 1, '2021-08-23 12:50:36', 1),
(70, '::1', 'pera@peric.com', 1, '2021-08-23 15:40:34', 1),
(71, '::1', 'pera@peric.com', 1, '2021-08-24 04:31:56', 1),
(72, '::1', 'pera@peric.com', 1, '2021-08-24 04:44:50', 1),
(73, '::1', 'pera@peric.com', 1, '2021-08-24 04:46:14', 1),
(74, '::1', 'pera@peric.com', 1, '2021-08-24 05:09:46', 1),
(75, '::1', 'pera@peric.com', 1, '2021-08-24 05:29:43', 1),
(76, '::1', 'pera@peric.com', 1, '2021-08-24 05:50:43', 1),
(77, '::1', 'pera@peric.com', 1, '2021-08-24 05:51:11', 1),
(78, '::1', 'pera@peric.com', 1, '2021-08-24 05:52:38', 1),
(79, '::1', 'pera@peric.com', 1, '2021-08-24 06:07:05', 1),
(80, '::1', 'pera@peric.com', 1, '2021-08-24 09:27:59', 1),
(81, '::1', 'pera@peric.com', 1, '2021-08-24 09:47:34', 1),
(82, '::1', 'pera@peric.com', 1, '2021-08-24 09:59:27', 1),
(83, '::1', 'pera@peric.com', 1, '2021-08-24 10:02:12', 1),
(84, '::1', 'pera@peric.com', 1, '2021-08-24 11:02:57', 1),
(85, '::1', 'pera@peric.com', 1, '2021-08-25 04:55:48', 1),
(86, '::1', 'mika@mikic.com', 5, '2021-08-25 05:12:34', 1),
(87, '::1', 'zika@zikic.com', 4, '2021-08-25 05:12:51', 1),
(88, '::1', 'pera@peric.com', 1, '2021-08-25 05:13:26', 1),
(89, '::1', 'pera@peric.com', 1, '2021-08-25 05:14:16', 1),
(90, '::1', 'pera@peric.com', 1, '2021-08-25 05:54:40', 1),
(91, '::1', 'pera@peric.com', 1, '2021-08-25 06:02:41', 1),
(92, '::1', 'pera@peric.com', 1, '2021-08-25 06:06:17', 1),
(93, '::1', 'pera@peric.com', 1, '2021-08-25 06:13:59', 1),
(94, '::1', 'pera@peric.com', 1, '2021-08-25 06:15:43', 1),
(95, '::1', 'pera@peric.com', 1, '2021-08-25 06:17:22', 1),
(96, '::1', 'pera@peric.com', 1, '2021-08-25 06:18:09', 1),
(97, '::1', 'pera@peric.com', 1, '2021-08-25 06:18:16', 1),
(98, '::1', 'zika@zikic.com', 4, '2021-08-25 06:18:26', 1),
(99, '::1', 'zika@zikic.com', 4, '2021-08-25 08:36:27', 1),
(100, '::1', 'pera@peric.com', 1, '2021-08-25 08:36:55', 1),
(101, '::1', 'pera@peric.com', 1, '2021-08-25 10:00:49', 1),
(102, '::1', 'pera@peric.com', 1, '2021-08-25 11:35:30', 1),
(103, '::1', 'pera@peric.com', 1, '2021-08-25 14:56:52', 1),
(104, '::1', 'zika@zikic.com', 4, '2021-08-25 14:57:12', 1),
(105, '::1', 'mika@mikic.com', 5, '2021-08-25 14:57:25', 1),
(106, '::1', 'pera@peric.com', 1, '2021-08-25 14:59:13', 1),
(107, '::1', 'pera@peric.com', 1, '2021-08-25 15:15:50', 1),
(108, '::1', 'pera@peric.com', 1, '2021-08-25 17:41:38', 1),
(109, '::1', 'pera@peric.com', 1, '2021-08-25 17:52:00', 1),
(110, '::1', 'mika@mikic.com', 5, '2021-08-25 17:52:08', 1),
(111, '::1', 'zika@zikic.com', 4, '2021-08-25 18:00:31', 1),
(112, '::1', 'pera@peric.com', 1, '2021-08-25 18:00:40', 1),
(113, '::1', 'Ana', NULL, '2021-08-25 18:24:55', 0),
(114, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-25 18:26:48', 1),
(115, '::1', 'mika@mikic.com', 5, '2021-08-25 18:28:56', 1),
(116, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-25 18:35:34', 1),
(117, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-25 18:36:39', 1),
(118, '::1', 'pera@peric.com', 1, '2021-08-25 18:36:47', 1),
(119, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 02:22:40', 1),
(120, '::1', 'pera@peric.com', 1, '2021-08-26 10:16:12', 1),
(121, '::1', 'pera@peric.com', 1, '2021-08-26 11:23:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'admin_perm', 'izmene koje vrsi administrator');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_users_permissions`
--

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1629401477, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pera@peric.com', 'pera', '$2y$10$/zR6v861LuPvDUYH778wu.B/nD1m0maY/r9ljjuhLgKkfp6SgLGTe', NULL, NULL, NULL, 'e700177ebea8776c3fdbae983420484b', NULL, NULL, 1, 0, '2021-08-19 17:35:42', '2021-08-19 17:35:42', NULL),
(4, 'zika@zikic.com', 'zika', '$2y$10$0XGxBsNMYmIQKr8cnsKDGOWBQcEYWhcepVDt85huzps.WgolcwrNa', NULL, NULL, NULL, 'b7085ea63f0175d5a137246f68a4d56a', NULL, NULL, 1, 0, '2021-08-20 13:26:23', '2021-08-20 13:26:23', NULL),
(5, 'mika@mikic.com', 'mika', '$2y$10$y39XRE0/Da4t5kBgfx7AO.5jt6tQ9aamH0xZhDC82fMtSx6IcD3PW', NULL, NULL, NULL, '30e6bfc45c3515518250e38843abce1c', NULL, NULL, 1, 0, '2021-08-20 13:27:03', '2021-08-20 13:27:03', NULL),
(6, 'recenzije.kontakt@gmail.com', 'Ana', '$2y$10$7ctQA4WmWawxkL8K0CQ4d.zdywWgjNDtsfUFYxLC9Dqxr7zl27MqK', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-08-25 18:23:03', '2021-08-25 18:26:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
