-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2021 at 01:12 AM
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
-- Table structure for table `anketa`
--

CREATE TABLE `anketa` (
  `id` int(11) NOT NULL,
  `naziv` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anketa`
--

INSERT INTO `anketa` (`id`, `naziv`) VALUES
(1, 'Naslov rada'),
(2, 'Originalnost rada'),
(3, 'Naucni doprinos rada');

-- --------------------------------------------------------

--
-- Table structure for table `anketa_pitanja`
--

CREATE TABLE `anketa_pitanja` (
  `id` int(11) NOT NULL,
  `id_anketa` int(11) NOT NULL,
  `tekst_pitanja` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anketa_pitanja`
--

INSERT INTO `anketa_pitanja` (`id`, `id_anketa`, `tekst_pitanja`) VALUES
(1, 1, 'Da li je naslov odgovarajuci?'),
(2, 2, 'Da li postoje elementi originalnosti?'),
(3, 3, 'Da li rad ima naucni doprinos?');

-- --------------------------------------------------------

--
-- Table structure for table `anketa_pitanja_vezna`
--

CREATE TABLE `anketa_pitanja_vezna` (
  `id` int(11) NOT NULL,
  `id_pitanja` int(11) NOT NULL,
  `id_anketa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anketa_pitanja_vezna`
--

INSERT INTO `anketa_pitanja_vezna` (`id`, `id_pitanja`, `id_anketa`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

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
(3, 8);

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
(119, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 03:38:54', 1),
(120, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 03:40:41', 1),
(121, '::1', 'mika@mikic.com', 5, '2021-08-26 06:00:44', 1),
(122, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 06:02:03', 1),
(123, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 06:06:07', 1),
(124, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 06:06:47', 1),
(125, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 06:16:05', 1),
(126, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 06:31:25', 1),
(127, '::1', 'mika@mikic.com', 5, '2021-08-26 06:47:29', 1),
(128, '::1', 'mika@mikic.com', 5, '2021-08-26 12:31:55', 1),
(129, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 12:32:07', 1),
(130, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-26 13:56:01', 1),
(131, '::1', 'pera@peric.com', 1, '2021-08-26 13:57:46', 1),
(132, '::1', 'zika@zikic.com', 4, '2021-08-26 13:57:55', 1),
(133, '::1', 'pera@peric.com', 1, '2021-08-26 13:58:27', 1),
(134, '::1', 'pera@peric.com', 1, '2021-08-27 12:00:08', 1),
(135, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-27 12:00:38', 1),
(136, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-27 12:06:36', 1),
(137, '::1', 'pera@peric.com', 1, '2021-08-27 12:15:50', 1),
(138, '::1', 'pera@peric.com', 1, '2021-08-27 12:35:42', 1),
(139, '::1', 'mika@mikic.com', 5, '2021-08-27 12:36:07', 1),
(140, '::1', 'mika@mikic.com', 5, '2021-08-27 12:36:26', 1),
(141, '::1', 'mika@mikic.com', 5, '2021-08-27 12:38:10', 1),
(142, '::1', 'mika@mikic.com', 5, '2021-08-27 14:14:47', 1),
(143, '::1', 'mika@mikic.com', 5, '2021-08-27 14:27:21', 1),
(144, '::1', 'mika@mikic.com', 5, '2021-08-27 14:27:35', 1),
(145, '::1', 'zika@zikic.com', 4, '2021-08-27 14:58:41', 1),
(146, '::1', 'pera@peric.com', 1, '2021-08-27 14:58:54', 1),
(147, '::1', 'recenzije.kontakt@gmail.com', 6, '2021-08-27 14:59:07', 1),
(148, '::1', 'mika@mikic.com', 5, '2021-08-27 16:34:36', 1),
(149, '::1', 'mika@mikic.com', 5, '2021-08-27 16:46:57', 1),
(150, '::1', 'mika@mikic.com', 5, '2021-08-27 17:31:29', 1),
(151, '::1', 'mika@mikic.com', 5, '2021-08-28 04:38:31', 1),
(152, '::1', 'mika@mikic.com', 5, '2021-08-28 12:57:35', 1),
(153, '::1', 'mika@mikic.com', 5, '2021-08-28 14:13:52', 1),
(154, '::1', 'pera@peric.com', 1, '2021-08-28 14:14:04', 1),
(155, '::1', 'mika@mikic.com', 5, '2021-08-28 14:16:33', 1),
(156, '::1', 'pera@peric.com', 1, '2021-08-28 14:55:44', 1),
(157, '::1', 'pera@peric.com', 1, '2021-08-28 15:47:50', 1),
(158, '::1', 'pera@peric.com', 1, '2021-08-28 15:47:59', 1),
(159, '::1', 'pera@peric.com', 1, '2021-08-30 18:19:31', 1),
(160, '::1', 'pera@peric.com', 1, '2021-08-30 18:19:58', 1),
(161, '::1', 'pera@peric.com', 1, '2021-08-31 05:41:09', 1),
(162, '::1', 'mika@mikic.com', 5, '2021-08-31 05:41:38', 1),
(163, '::1', 'zika@zikic.com', 4, '2021-08-31 05:58:08', 1),
(164, '::1', 'mika@mikic.com', 5, '2021-08-31 06:17:36', 1),
(165, '::1', 'mika@mikic.com', 5, '2021-08-31 06:18:00', 1),
(166, '::1', 'mika@mikic.com', 5, '2021-08-31 06:19:17', 1),
(167, '::1', 'zika@zikic.com', 4, '2021-08-31 06:19:24', 1),
(168, '::1', 'pera@peric.com', 1, '2021-08-31 06:20:11', 1),
(169, '::1', 'zika@zikic.com', 4, '2021-08-31 06:23:18', 1),
(170, '::1', 'pera@peric.com', 1, '2021-08-31 06:23:33', 1),
(171, '::1', 'mika@mikic.com', 5, '2021-08-31 07:29:33', 1),
(172, '::1', 'pera@peric.com', 1, '2021-09-01 16:10:58', 1),
(173, '::1', 'Ana', NULL, '2021-09-01 16:32:14', 0),
(174, '::1', 'zika@zikic.com', 4, '2021-09-01 16:32:27', 1),
(175, '::1', 'mika@mikic.com', 5, '2021-09-01 16:32:34', 1),
(176, '::1', 'pera@peric.com', 1, '2021-09-01 16:47:17', 1),
(177, '::1', 'dzontra@volta.com', 8, '2021-09-01 18:06:23', 1);

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
-- Table structure for table `biografija`
--

CREATE TABLE `biografija` (
  `id` int(11) NOT NULL,
  `id_rezult` int(11) NOT NULL,
  `tekst` varchar(640) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `id` int(11) NOT NULL,
  `opis` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id`, `opis`) VALUES
(1, 'Patent'),
(2, 'Tehnicko resenje'),
(3, 'Originalan naucni rad'),
(4, 'Studija ili ekspertiza'),
(5, 'Rad u domacem strucnom casopisu'),
(6, 'Rad u stranom strucnom casopisu'),
(7, 'Nagrada na konkursu');

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
-- Table structure for table `nacionalnost`
--

CREATE TABLE `nacionalnost` (
  `id` int(11) NOT NULL,
  `naziv` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nacionalnost`
--

INSERT INTO `nacionalnost` (`id`, `naziv`) VALUES
(1, 'srpska'),
(2, 'strana');

-- --------------------------------------------------------

--
-- Table structure for table `obavestenja_tip`
--

CREATE TABLE `obavestenja_tip` (
  `id` int(11) NOT NULL,
  `naziv` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obavestenja_tip`
--

INSERT INTO `obavestenja_tip` (`id`, `naziv`) VALUES
(1, 'vidljivo na profilu'),
(2, 'salje se na mejl');

-- --------------------------------------------------------

--
-- Table structure for table `oblast`
--

CREATE TABLE `oblast` (
  `id` int(11) NOT NULL,
  `naziv` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oblast`
--

INSERT INTO `oblast` (`id`, `naziv`) VALUES
(1, 'Prirodno-matematicke discipline'),
(2, 'Tehnicko-tehnoloske nauke'),
(3, 'Drustvene nauke i discipline'),
(4, 'Humanisticke discipline'),
(5, 'Medicinske nauke i discipline');

-- --------------------------------------------------------

--
-- Table structure for table `pitanja`
--

CREATE TABLE `pitanja` (
  `id` int(11) NOT NULL,
  `id_poziv` int(11) NOT NULL,
  `tekst` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poziv`
--

CREATE TABLE `poziv` (
  `id` int(11) NOT NULL,
  `naziv` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prijava`
--

CREATE TABLE `prijava` (
  `id` int(11) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_status` int(11) NOT NULL,
  `datum_prijave` date NOT NULL,
  `datum_izmene` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `recenzent_anketa`
--

CREATE TABLE `recenzent_anketa` (
  `id` int(11) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_anketa` int(11) NOT NULL,
  `id_obavestenja` int(11) NOT NULL,
  `vidjeno_profil` int(11) NOT NULL,
  `datum_mejla` date NOT NULL,
  `datum_ankete` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recenzent_anketa`
--

INSERT INTO `recenzent_anketa` (`id`, `id_user`, `id_anketa`, `id_obavestenja`, `vidjeno_profil`, `datum_mejla`, `datum_ankete`) VALUES
(1, 4, 1, 2, 1, '2021-08-29', '2021-08-29');

-- --------------------------------------------------------

--
-- Table structure for table `recenzent_anketa_odgovor`
--

CREATE TABLE `recenzent_anketa_odgovor` (
  `id` int(11) NOT NULL,
  `id_recenzent_anketa` int(11) NOT NULL,
  `id_pitanja` int(11) NOT NULL,
  `tekst_odgovora` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recenzent_anketa_odgovor`
--

INSERT INTO `recenzent_anketa_odgovor` (`id`, `id_recenzent_anketa`, `id_pitanja`, `tekst_odgovora`) VALUES
(1, 1, 1, 'da'),
(2, 1, 2, 'da'),
(3, 1, 3, 'ne');

-- --------------------------------------------------------

--
-- Table structure for table `recenzent_rezultat`
--

CREATE TABLE `recenzent_rezultat` (
  `id` int(11) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_rezult` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `datum_dodele` date NOT NULL,
  `datum_ocene` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `recenzent_rezultat_odgovor`
--

CREATE TABLE `recenzent_rezultat_odgovor` (
  `id` int(11) NOT NULL,
  `id_pitanja` int(11) NOT NULL,
  `odgovori` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rezultat`
--

CREATE TABLE `rezultat` (
  `id` int(11) NOT NULL,
  `id_poziv` int(11) NOT NULL,
  `id_kateg` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `naziv` varchar(128) NOT NULL,
  `datum` date NOT NULL,
  `opis` varchar(256) NOT NULL,
  `clanovi` varchar(128) NOT NULL,
  `god_rez` varchar(16) NOT NULL,
  `datum_prijave` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rezultat_oblasti`
--

CREATE TABLE `rezultat_oblasti` (
  `id` int(11) NOT NULL,
  `id_oblast` int(11) NOT NULL,
  `id_rezult` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status_prijave`
--

CREATE TABLE `status_prijave` (
  `id` int(11) NOT NULL,
  `opis` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_prijave`
--

INSERT INTO `status_prijave` (`id`, `opis`) VALUES
(1, 'stigla'),
(2, 'razmatra se'),
(3, 'prihvacena'),
(4, 'odbijena');

-- --------------------------------------------------------

--
-- Table structure for table `status_rezultata`
--

CREATE TABLE `status_rezultata` (
  `id` int(11) NOT NULL,
  `opis` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_rezultata`
--

INSERT INTO `status_rezultata` (`id`, `opis`) VALUES
(1, 'prihvacen'),
(2, 'odbijen');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `ime` varchar(16) NOT NULL,
  `prezime` varchar(16) NOT NULL,
  `organizacija` varchar(32) NOT NULL,
  `id_zemlje` int(11) NOT NULL,
  `id_nac` int(11) NOT NULL,
  `id_oblast` int(11) NOT NULL,
  `id_zvanja` int(11) NOT NULL,
  `adresa` varchar(64) NOT NULL,
  `telefon` varchar(32) NOT NULL,
  `web_str` varchar(32) NOT NULL,
  `biografija` varchar(160) NOT NULL,
  `radovi` varchar(160) NOT NULL,
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

INSERT INTO `users` (`id`, `email`, `username`, `ime`, `prezime`, `organizacija`, `id_zemlje`, `id_nac`, `id_oblast`, `id_zvanja`, `adresa`, `telefon`, `web_str`, `biografija`, `radovi`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pera@peric.com', 'pera', '', '', '', 1, 1, 1, 1, '', '', '', '', '', '$2y$10$/zR6v861LuPvDUYH778wu.B/nD1m0maY/r9ljjuhLgKkfp6SgLGTe', NULL, NULL, NULL, 'e700177ebea8776c3fdbae983420484b', NULL, NULL, 1, 0, '2021-08-19 17:35:42', '2021-08-19 17:35:42', NULL),
(4, 'zika@zikic.com', 'zika', '', '', '', 5, 2, 2, 2, '', '', '', '', '', '$2y$10$0XGxBsNMYmIQKr8cnsKDGOWBQcEYWhcepVDt85huzps.WgolcwrNa', NULL, NULL, NULL, 'b7085ea63f0175d5a137246f68a4d56a', NULL, NULL, 1, 0, '2021-08-20 13:26:23', '2021-08-20 13:26:23', NULL),
(5, 'mika@mikic.com', 'mika', '', '', '', 3, 1, 3, 3, '', '', '', '', '', '$2y$10$y39XRE0/Da4t5kBgfx7AO.5jt6tQ9aamH0xZhDC82fMtSx6IcD3PW', NULL, NULL, NULL, '30e6bfc45c3515518250e38843abce1c', NULL, NULL, 1, 0, '2021-08-20 13:27:03', '2021-08-20 13:27:03', NULL),
(8, 'dzontra@volta.com', 'dzontra', '', '', '', 0, 0, 0, 0, '', '', '', '', '', '$2y$10$UZdAN2KX00Q2yk8jYKpHB.4DQ0y7newFIw9upOiO5m9q4FCBJGMUa', NULL, NULL, NULL, '5feddc0d0e818857df3bc47e8d87275e', NULL, NULL, 1, 0, '2021-09-01 18:04:38', '2021-09-01 18:04:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zemlja`
--

CREATE TABLE `zemlja` (
  `id` int(11) NOT NULL,
  `naziv` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zemlja`
--

INSERT INTO `zemlja` (`id`, `naziv`) VALUES
(1, 'Srbija'),
(2, 'BiH'),
(3, 'Slovenija'),
(4, 'Hrvatska'),
(5, 'Crna Gora'),
(6, 'Makedonija'),
(7, 'Grcka'),
(8, 'Bugarska'),
(9, 'Madjarska'),
(10, 'Rumunija'),
(11, 'Austrija'),
(12, 'Nemacka'),
(13, 'Svajcarska'),
(14, 'Italija'),
(15, 'Kipar'),
(16, 'SAD'),
(17, 'Spanija'),
(18, 'Kina'),
(19, 'Japan'),
(20, 'Rusija'),
(21, 'Kuba'),
(22, 'Brazil'),
(23, 'Indija'),
(24, 'Belgija'),
(25, 'Velika Britanija'),
(26, 'Francuska');

-- --------------------------------------------------------

--
-- Table structure for table `zvanje`
--

CREATE TABLE `zvanje` (
  `id` int(11) NOT NULL,
  `naziv` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zvanje`
--

INSERT INTO `zvanje` (`id`, `naziv`) VALUES
(1, 'visoka strucna sprema'),
(2, 'master'),
(3, 'specijalista'),
(4, 'magistar'),
(5, 'doktor nauka'),
(6, 'akademik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anketa`
--
ALTER TABLE `anketa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anketa_pitanja`
--
ALTER TABLE `anketa_pitanja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anketa_pitanja_anketa` (`id_anketa`);

--
-- Indexes for table `anketa_pitanja_vezna`
--
ALTER TABLE `anketa_pitanja_vezna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anketa_pitanja_vezna_anketa` (`id_anketa`),
  ADD KEY `anketa_pitanja_vezna_anketa_anketa_pitanja` (`id_pitanja`);

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
-- Indexes for table `biografija`
--
ALTER TABLE `biografija`
  ADD KEY `biografija_rezultat` (`id_rezult`);

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nacionalnost`
--
ALTER TABLE `nacionalnost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obavestenja_tip`
--
ALTER TABLE `obavestenja_tip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oblast`
--
ALTER TABLE `oblast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pitanja`
--
ALTER TABLE `pitanja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pitanja_poziv` (`id_poziv`);

--
-- Indexes for table `poziv`
--
ALTER TABLE `poziv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prijava`
--
ALTER TABLE `prijava`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prijava_status_prijave` (`id_status`),
  ADD KEY `prijava_users` (`id_user`);

--
-- Indexes for table `recenzent_anketa`
--
ALTER TABLE `recenzent_anketa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recenzent_anketa_anketa` (`id_anketa`),
  ADD KEY `recenzent_anketa_obavestenja_tip` (`id_obavestenja`),
  ADD KEY `recenzent_anketa_users` (`id_user`);

--
-- Indexes for table `recenzent_anketa_odgovor`
--
ALTER TABLE `recenzent_anketa_odgovor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Recenzent_anketa_odgovor_anketa_pitanja` (`id_pitanja`),
  ADD KEY `Recenzent_anketa_odgovor_recenzent_anketa` (`id_recenzent_anketa`);

--
-- Indexes for table `recenzent_rezultat`
--
ALTER TABLE `recenzent_rezultat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recenzent_rezultat_rezultat` (`id_rezult`),
  ADD KEY `recenzent_rezultat_users` (`id_user`),
  ADD KEY `recenzent_rezultat_status_rezu` (`id_status`);

--
-- Indexes for table `recenzent_rezultat_odgovor`
--
ALTER TABLE `recenzent_rezultat_odgovor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recenzent_rezultat_pitanja` (`id_pitanja`);

--
-- Indexes for table `rezultat`
--
ALTER TABLE `rezultat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rezultat_poziv` (`id_poziv`),
  ADD KEY `rezultat_kategorija` (`id_kateg`),
  ADD KEY `rezultat_status_rezultata` (`id_status`);

--
-- Indexes for table `rezultat_oblasti`
--
ALTER TABLE `rezultat_oblasti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rezultat_oblasti_rezultat` (`id_rezult`),
  ADD KEY `rezultat_oblasti_oblast` (`id_oblast`);

--
-- Indexes for table `status_prijave`
--
ALTER TABLE `status_prijave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_rezultata`
--
ALTER TABLE `status_rezultata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `users_nacionalnost` (`id_nac`),
  ADD KEY `users_zemlja` (`id_zemlje`),
  ADD KEY `users_zvanje` (`id_zvanja`),
  ADD KEY `users_oblast` (`id_oblast`);

--
-- Indexes for table `zemlja`
--
ALTER TABLE `zemlja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zvanje`
--
ALTER TABLE `zvanje`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anketa`
--
ALTER TABLE `anketa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `anketa_pitanja`
--
ALTER TABLE `anketa_pitanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `anketa_pitanja_vezna`
--
ALTER TABLE `anketa_pitanja_vezna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

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
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nacionalnost`
--
ALTER TABLE `nacionalnost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `obavestenja_tip`
--
ALTER TABLE `obavestenja_tip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oblast`
--
ALTER TABLE `oblast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pitanja`
--
ALTER TABLE `pitanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poziv`
--
ALTER TABLE `poziv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prijava`
--
ALTER TABLE `prijava`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recenzent_anketa`
--
ALTER TABLE `recenzent_anketa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recenzent_anketa_odgovor`
--
ALTER TABLE `recenzent_anketa_odgovor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recenzent_rezultat`
--
ALTER TABLE `recenzent_rezultat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recenzent_rezultat_odgovor`
--
ALTER TABLE `recenzent_rezultat_odgovor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rezultat`
--
ALTER TABLE `rezultat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rezultat_oblasti`
--
ALTER TABLE `rezultat_oblasti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_prijave`
--
ALTER TABLE `status_prijave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status_rezultata`
--
ALTER TABLE `status_rezultata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `zemlja`
--
ALTER TABLE `zemlja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `zvanje`
--
ALTER TABLE `zvanje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anketa_pitanja`
--
ALTER TABLE `anketa_pitanja`
  ADD CONSTRAINT `anketa_pitanja_anketa` FOREIGN KEY (`id_anketa`) REFERENCES `anketa` (`id`);

--
-- Constraints for table `anketa_pitanja_vezna`
--
ALTER TABLE `anketa_pitanja_vezna`
  ADD CONSTRAINT `anketa_pitanja_vezna_anketa` FOREIGN KEY (`id_anketa`) REFERENCES `anketa` (`id`),
  ADD CONSTRAINT `anketa_pitanja_vezna_anketa_anketa_pitanja` FOREIGN KEY (`id_pitanja`) REFERENCES `anketa_pitanja` (`id`);

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

--
-- Constraints for table `biografija`
--
ALTER TABLE `biografija`
  ADD CONSTRAINT `biografija_rezultat` FOREIGN KEY (`id_rezult`) REFERENCES `rezultat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pitanja`
--
ALTER TABLE `pitanja`
  ADD CONSTRAINT `pitanja_poziv` FOREIGN KEY (`id_poziv`) REFERENCES `poziv` (`id`);

--
-- Constraints for table `prijava`
--
ALTER TABLE `prijava`
  ADD CONSTRAINT `prijava_status_prijave` FOREIGN KEY (`id_status`) REFERENCES `status_prijave` (`id`),
  ADD CONSTRAINT `prijava_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recenzent_anketa`
--
ALTER TABLE `recenzent_anketa`
  ADD CONSTRAINT `recenzent_anketa_anketa` FOREIGN KEY (`id_anketa`) REFERENCES `anketa` (`id`),
  ADD CONSTRAINT `recenzent_anketa_obavestenja_tip` FOREIGN KEY (`id_obavestenja`) REFERENCES `obavestenja_tip` (`id`),
  ADD CONSTRAINT `recenzent_anketa_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `recenzent_anketa_odgovor`
--
ALTER TABLE `recenzent_anketa_odgovor`
  ADD CONSTRAINT `Recenzent_anketa_odgovor_anketa_pitanja` FOREIGN KEY (`id_pitanja`) REFERENCES `anketa_pitanja` (`id`),
  ADD CONSTRAINT `Recenzent_anketa_odgovor_recenzent_anketa` FOREIGN KEY (`id_recenzent_anketa`) REFERENCES `recenzent_anketa` (`id`);

--
-- Constraints for table `recenzent_rezultat`
--
ALTER TABLE `recenzent_rezultat`
  ADD CONSTRAINT `recenzent_rezultat_rezultat` FOREIGN KEY (`id_rezult`) REFERENCES `rezultat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzent_rezultat_status_rezu` FOREIGN KEY (`id_status`) REFERENCES `status_rezultata` (`id`),
  ADD CONSTRAINT `recenzent_rezultat_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `recenzent_rezultat_odgovor`
--
ALTER TABLE `recenzent_rezultat_odgovor`
  ADD CONSTRAINT `recenzent_rezultat_odgovor_recenzent_rezultat` FOREIGN KEY (`id`) REFERENCES `recenzent_rezultat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzent_rezultat_pitanja` FOREIGN KEY (`id_pitanja`) REFERENCES `pitanja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezultat`
--
ALTER TABLE `rezultat`
  ADD CONSTRAINT `rezultat_kategorija` FOREIGN KEY (`id_kateg`) REFERENCES `kategorija` (`id`),
  ADD CONSTRAINT `rezultat_poziv` FOREIGN KEY (`id_poziv`) REFERENCES `poziv` (`id`),
  ADD CONSTRAINT `rezultat_status_rezultata` FOREIGN KEY (`id_status`) REFERENCES `status_rezultata` (`id`);

--
-- Constraints for table `rezultat_oblasti`
--
ALTER TABLE `rezultat_oblasti`
  ADD CONSTRAINT `rezultat_oblasti_oblast` FOREIGN KEY (`id_oblast`) REFERENCES `oblast` (`id`),
  ADD CONSTRAINT `rezultat_oblasti_rezultat` FOREIGN KEY (`id_rezult`) REFERENCES `rezultat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
