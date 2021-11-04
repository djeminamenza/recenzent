-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2021 at 10:24 PM
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
(1, 'Anketa o adekvatnosti naslova'),
(2, 'Anketa o originalnosti rada'),
(3, 'Anketa o naucnom doprinosu rada');

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
(3, 3, 'Da li rad ima naucni doprinos?'),
(4, 1, 'Da li je vazno da naslov odslikava citavu strukturu rada?'),
(5, 3, 'Da li je moguce oceniti naucni doprinos rada bez dodatnih istrazivanja?'),
(6, 2, 'Da li imate softver za proveru autenticnosti rada?');

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
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '072e2f4683dae329a901117db33c38d0', '2021-08-25 18:26:43'),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '62d0e3d5dd700300a3da0d52373e2db9', '2021-09-12 11:57:58'),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '62d0e3d5dd700300a3da0d52373e2db9', '2021-09-12 12:03:19'),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '62d0e3d5dd700300a3da0d52373e2db9', '2021-09-12 12:03:38'),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '62d0e3d5dd700300a3da0d52373e2db9', '2021-09-12 12:03:50'),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '62d0e3d5dd700300a3da0d52373e2db9', '2021-09-12 12:06:07'),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', '62fe2d79735d9bf38241d1a67a7b7c21', '2021-09-30 16:01:46'),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'dfc063d6f9608c703d2bd1c7be49659e', '2021-10-01 14:36:43'),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '8c631b251cd531a78f42035cf57a8887', '2021-10-13 14:20:11');

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
(1, 1),
(1, 1),
(1, 1),
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
(1, 27),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(3, 48),
(3, 49);

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
(172, '::1', 'pera@peric.com', 1, '2021-08-31 10:11:29', 1),
(173, '::1', 'pera@peric.com', 1, '2021-08-31 10:11:35', 1),
(174, '::1', 'mika@mikic.com', 5, '2021-08-31 10:34:01', 1),
(175, '::1', 'pera@peric.com', 1, '2021-08-31 10:46:38', 1),
(176, '::1', 'mika@mikic.com', 5, '2021-08-31 11:02:37', 1),
(177, '::1', 'zika@zikic.com', 4, '2021-08-31 11:50:55', 1),
(178, '::1', 'pera@peric.com', 1, '2021-09-01 02:42:19', 1),
(179, '::1', 'pera@peric.com', 1, '2021-09-01 02:42:25', 1),
(180, '::1', 'mika@mikic.com', 5, '2021-09-01 02:44:16', 1),
(181, '::1', 'mika@mikic.com', 5, '2021-09-01 17:11:56', 1),
(182, '::1', 'mika@mikic.com', 5, '2021-09-01 17:15:07', 1),
(183, '::1', 'zika@zikic.com', 4, '2021-09-01 17:20:03', 1),
(184, '::1', 'mika@mikic.com', 5, '2021-09-01 17:20:28', 1),
(185, '::1', 'mika@mikic.com', 5, '2021-09-01 17:35:28', 1),
(186, '::1', 'mika@mikic.com', 5, '2021-09-01 17:57:03', 1),
(187, '::1', 'zika@zikic.com', 4, '2021-09-01 17:58:42', 1),
(188, '::1', 'pera@peric.com', 1, '2021-09-01 17:59:46', 1),
(189, '::1', 'zika@zikic.com', 4, '2021-09-02 07:57:45', 1),
(190, '::1', 'mika@mikic.com', 5, '2021-09-02 07:57:54', 1),
(191, '::1', 'mika@mikic.com', 5, '2021-09-02 09:16:34', 1),
(192, '::1', 'zika@zikic.com', 4, '2021-09-02 09:16:54', 1),
(193, '::1', 'mika@mikic.com', 5, '2021-09-02 12:55:33', 1),
(194, '::1', 'mika@mikic.com', 5, '2021-09-02 12:55:39', 1),
(195, '::1', 'zika@zikic.com', 4, '2021-09-02 13:01:32', 1),
(196, '::1', 'Ana', NULL, '2021-09-02 13:02:04', 0),
(197, '::1', 'mika@mikic.com', 5, '2021-09-02 13:02:14', 1),
(198, '::1', 'mika@mikic.com', 5, '2021-09-02 13:08:14', 1),
(199, '::1', 'Ana', NULL, '2021-09-02 13:08:24', 0),
(200, '::1', 'pera@peric.com', NULL, '2021-09-02 13:09:04', 0),
(201, '::1', 'Ana', NULL, '2021-09-02 15:32:41', 0),
(202, '::1', 'mika@mikic.com', 5, '2021-09-02 15:32:59', 1),
(203, '::1', 'jela', 9, '2021-09-02 18:15:53', 0),
(204, '::1', 'jelenastn30@gmail.com', 9, '2021-09-02 18:17:01', 1),
(205, '::1', 'jelenastn30@gmail.com', 9, '2021-09-02 18:17:25', 1),
(206, '::1', 'zika@zikic.com', 4, '2021-09-04 17:11:33', 1),
(207, '::1', 'pera@peric.com', 1, '2021-09-04 17:11:54', 1),
(208, '::1', 'pera@peric.com', 1, '2021-09-04 17:33:42', 1),
(209, '::1', 'pera@peric.com', 1, '2021-09-04 17:33:49', 1),
(210, '::1', 'pera@peric.com', 1, '2021-09-05 15:05:05', 1),
(211, '::1', 'pera@peric.com', 1, '2021-09-06 15:26:56', 1),
(212, '::1', 'pera@peric.com', 1, '2021-09-07 12:33:12', 1),
(213, '::1', 'pera@peric.com', 1, '2021-09-07 12:33:17', 1),
(214, '::1', 'pera@peric.com', 1, '2021-09-07 16:03:47', 1),
(215, '::1', 'pera@peric.com', 1, '2021-09-08 14:14:27', 1),
(216, '::1', 'mika@mikic.com', 5, '2021-09-08 14:42:07', 1),
(217, '::1', 'pera@peric.com', 1, '2021-09-08 15:04:51', 1),
(218, '::1', 'pera@peric.com', 1, '2021-09-10 16:26:23', 1),
(219, '::1', 'mika@mikic.com', 5, '2021-09-10 19:06:02', 1),
(220, '::1', 'mika@mikic.com', 5, '2021-09-11 13:09:01', 1),
(221, '::1', 'pera@peric.com', 1, '2021-09-11 15:02:35', 1),
(222, '::1', 'mika@mikic.com', 5, '2021-09-12 09:26:02', 1),
(223, '::1', 'mika@mikic.com', 5, '2021-09-12 09:26:09', 1),
(224, '::1', 'pera@peric.com', 1, '2021-09-12 10:41:20', 1),
(225, '::1', 'mika@mikic.com', 5, '2021-09-12 14:34:14', 1),
(226, '::1', 'mika@mikic.com', 5, '2021-09-12 14:34:21', 1),
(227, '::1', 'zika@zikic.com', 4, '2021-09-12 17:11:35', 1),
(228, '::1', 'mika@mikic.com', 5, '2021-09-12 17:11:45', 1),
(229, '::1', 'matijastnc', NULL, '2021-09-12 17:16:11', 0),
(230, '::1', 'pera@peric.com', 1, '2021-09-12 17:16:41', 1),
(231, '::1', 'jelenastn30@gmail.com', 23, '2021-09-12 17:27:45', 1),
(232, '::1', 'pera@peric.com', 1, '2021-09-12 17:54:00', 1),
(233, '::1', 'mika@mikic.com', 5, '2021-09-13 02:15:30', 1),
(234, '::1', 'pera@peric.com', 1, '2021-09-13 02:15:49', 1),
(235, '::1', 'pera@peric.com', 1, '2021-09-13 14:44:55', 1),
(236, '::1', 'pera@peric.com', 1, '2021-09-13 15:56:13', 1),
(237, '::1', 'mika@mikic.com', 5, '2021-09-13 16:11:08', 1),
(238, '::1', 'pera@peric.com', 1, '2021-09-13 16:11:28', 1),
(239, '::1', 'pera@peric.com', 1, '2021-09-14 16:09:29', 1),
(240, '::1', 'pera@peric.com', 1, '2021-09-15 13:15:10', 1),
(241, '::1', 'pera@peric.com', 1, '2021-09-15 13:47:43', 1),
(242, '::1', 'zika@zikic.com', 4, '2021-09-15 18:20:44', 1),
(243, '::1', 'pera@peric.com', 1, '2021-09-17 05:18:50', 1),
(244, '::1', 'pera@peric.com', 1, '2021-09-17 06:58:34', 1),
(245, '::1', 'pera@peric.com', 1, '2021-09-17 07:14:07', 1),
(246, '::1', 'pera@peric.com', 1, '2021-09-17 14:22:43', 1),
(247, '::1', 'pera@peric.com', 1, '2021-09-18 15:30:42', 1),
(248, '::1', 'pera', NULL, '2021-09-19 16:11:34', 0),
(249, '::1', 'pera', NULL, '2021-09-19 16:12:29', 0),
(250, '::1', 'pera@peric.com', NULL, '2021-09-19 16:12:36', 0),
(251, '::1', 'pera', NULL, '2021-09-19 16:14:09', 0),
(252, '::1', 'pera', NULL, '2021-09-19 16:14:49', 0),
(253, '::1', 'pera@peric.com', 27, '2021-09-19 16:15:02', 1),
(254, '::1', 'pera@peric.com', 27, '2021-09-19 16:15:53', 1),
(255, '::1', 'pera@peric.com', 27, '2021-09-20 13:20:01', 1),
(256, '::1', 'pera@peric.com', 27, '2021-09-21 04:02:40', 1),
(257, '::1', 'mika@mikic.com', 5, '2021-09-21 04:04:29', 1),
(258, '::1', 'mika@mikic.com', 5, '2021-09-21 04:04:50', 1),
(259, '::1', 'pera@peric.com', 27, '2021-09-21 04:06:27', 1),
(260, '::1', 'mika@mikic.com', 5, '2021-09-21 04:07:12', 1),
(261, '::1', 'mika@mikic.com', 5, '2021-09-21 04:08:32', 1),
(262, '::1', 'mika@mikic.com', 5, '2021-09-21 04:08:37', 1),
(263, '::1', 'pera@peric.com', 27, '2021-09-21 14:49:57', 1),
(264, '::1', 'mika@mikic.com', 5, '2021-09-21 15:00:21', 1),
(265, '::1', 'ivastanic@gmail.com', 24, '2021-09-21 15:00:42', 1),
(266, '::1', 'jelenastn30@gmail.com', 23, '2021-09-21 15:00:57', 1),
(267, '::1', 'pera@peric.com', 27, '2021-09-21 15:01:26', 1),
(268, '::1', 'pera@peric.com', 27, '2021-09-21 18:01:02', 1),
(269, '::1', 'pera@peric.com', 27, '2021-09-21 18:02:06', 1),
(270, '::1', 'zika@zikic.com', 4, '2021-09-21 18:02:15', 1),
(271, '::1', 'pera@peric.com', 27, '2021-09-21 18:02:45', 1),
(272, '::1', 'pera@peric.com', 27, '2021-09-22 02:14:59', 1),
(273, '::1', 'zika@zikic.com', 4, '2021-09-22 02:37:54', 1),
(274, '::1', 'pera@peric.com', 27, '2021-09-22 02:52:05', 1),
(275, '::1', 'pera@peric.com', 27, '2021-09-22 06:12:56', 1),
(276, '::1', 'pera@peric.com', 27, '2021-09-22 15:48:39', 1),
(277, '::1', 'zika@zikic.com', 4, '2021-09-22 15:49:14', 1),
(278, '::1', 'pera@peric.com', 27, '2021-09-22 15:53:45', 1),
(279, '::1', 'pera@peric.com', 27, '2021-09-22 16:02:05', 1),
(280, '::1', 'pera@peric.com', 27, '2021-09-22 18:34:08', 1),
(281, '::1', 'pera@peric.com', 27, '2021-09-22 18:38:33', 1),
(282, '::1', 'pera@peric.com', 27, '2021-09-23 00:48:39', 1),
(283, '::1', 'pera@peric.com', 27, '2021-09-23 01:10:54', 1),
(284, '::1', 'pera@peric.com', 27, '2021-09-23 01:12:13', 1),
(285, '::1', 'pera@peric.com', 27, '2021-09-23 01:19:48', 1),
(286, '::1', 'zika@zikic.com', 4, '2021-09-23 02:30:43', 1),
(287, '::1', 'pera@peric.com', 27, '2021-09-23 02:32:02', 1),
(288, '::1', 'zika@zikic.com', 4, '2021-09-23 02:34:43', 1),
(289, '::1', 'mika', NULL, '2021-09-23 02:50:24', 0),
(290, '::1', 'mika', NULL, '2021-09-23 02:50:31', 0),
(291, '::1', 'zika@zikic.com', 4, '2021-09-23 02:50:36', 1),
(292, '::1', 'pera@peric.com', 27, '2021-09-23 03:02:40', 1),
(293, '::1', 'zika@zikic.com', 4, '2021-09-23 03:05:17', 1),
(294, '::1', 'jelenastn30@gmail.com', 23, '2021-09-23 03:07:38', 1),
(295, '::1', 'zika@zikic.com', 4, '2021-09-23 03:08:20', 1),
(296, '::1', 'jelenastn30@gmail.com', 23, '2021-09-23 03:09:33', 1),
(297, '::1', 'pera@peric.com', 27, '2021-09-23 03:14:29', 1),
(298, '::1', 'zika@zikic.com', 4, '2021-09-23 03:22:41', 1),
(299, '::1', 'jelenastn30@gmail.com', 23, '2021-09-23 03:23:37', 1),
(300, '::1', 'pera@peric.com', 27, '2021-09-23 03:24:10', 1),
(301, '::1', 'zika@zikic.com', 4, '2021-09-23 03:24:21', 1),
(302, '::1', 'pera@peric.com', 27, '2021-09-23 03:24:45', 1),
(303, '::1', 'zika@zikic.com', 4, '2021-09-23 03:25:22', 1),
(304, '::1', 'jelenastn30@gmail.com', 23, '2021-09-23 03:25:35', 1),
(305, '::1', 'zika@zikic.com', 4, '2021-09-23 03:26:07', 1),
(306, '::1', 'pera@peric.com', 27, '2021-09-23 03:32:35', 1),
(307, '::1', 'pera@peric.com', 27, '2021-09-23 07:31:45', 1),
(308, '::1', 'zika@zikic.com', 4, '2021-09-23 07:51:14', 1),
(309, '::1', 'jelenastn30@gmail.com', 23, '2021-09-23 07:57:08', 1),
(310, '::1', 'ivastanic@gmail.com', 24, '2021-09-23 12:56:24', 1),
(311, '::1', 'ivastanic@gmail.com', 24, '2021-09-23 12:56:30', 1),
(312, '::1', 'pera@peric.com', 27, '2021-09-23 16:54:32', 1),
(313, '::1', 'pera@peric.com', 27, '2021-09-24 15:25:48', 1),
(314, '::1', 'jelenastn30@gmail.com', 23, '2021-09-24 17:38:05', 1),
(315, '::1', 'pera@peric.com', 27, '2021-09-24 17:39:45', 1),
(316, '::1', 'jelenastn30@gmail.com', 23, '2021-09-24 17:59:59', 1),
(317, '::1', 'zika@zikic.com', 4, '2021-09-24 18:00:13', 1),
(318, '::1', 'zika@zikic.com', 4, '2021-09-24 18:00:54', 1),
(319, '::1', 'pera@peric.com', 27, '2021-09-24 18:01:04', 1),
(320, '::1', 'zika@zikic.com', 4, '2021-09-24 18:02:41', 1),
(321, '::1', 'pera@peric.com', 27, '2021-09-24 18:13:38', 1),
(322, '::1', 'zika@zikic.com', 4, '2021-09-24 18:41:31', 1),
(323, '::1', 'pera@peric.com', 27, '2021-09-24 18:58:05', 1),
(324, '::1', 'jelenastn30@gmail.com', 23, '2021-09-24 19:00:01', 1),
(325, '::1', 'zika@zikic.com', 4, '2021-09-24 19:00:15', 1),
(326, '::1', 'pera@peric.com', 27, '2021-09-24 19:11:49', 1),
(327, '::1', 'pera@peric.com', 27, '2021-09-25 01:46:27', 1),
(328, '::1', 'zika@zikic.com', 4, '2021-09-25 02:11:35', 1),
(329, '::1', 'jelenastn30@gmail.com', 23, '2021-09-25 02:11:56', 1),
(330, '::1', 'zika@zikic.com', 4, '2021-09-25 02:12:08', 1),
(331, '::1', 'jelenastn30@gmail.com', 23, '2021-09-25 02:33:52', 1),
(332, '::1', 'zika@zikic.com', 4, '2021-09-25 02:34:31', 1),
(333, '::1', 'pera@peric.com', 27, '2021-09-25 02:34:50', 1),
(334, '::1', 'zika@zikic.com', 4, '2021-09-25 02:39:15', 1),
(335, '::1', 'pera@peric.com', 27, '2021-09-25 02:40:02', 1),
(336, '::1', 'zika@zikic.com', 4, '2021-09-25 02:57:54', 1),
(337, '::1', 'jelenastn30@gmail.com', 23, '2021-09-25 03:00:32', 1),
(338, '::1', 'pera@peric.com', 27, '2021-09-25 03:09:50', 1),
(339, '::1', 'jelenastn30@gmail.com', 23, '2021-09-25 03:15:55', 1),
(340, '::1', 'pera@peric.com', 27, '2021-09-25 03:16:10', 1),
(341, '::1', 'pera@peric.com', 27, '2021-09-26 11:43:12', 1),
(342, '::1', 'pera@peric.com', 27, '2021-09-27 16:58:24', 1),
(343, '::1', 'pera@peric.com', 27, '2021-09-28 06:06:42', 1),
(344, '::1', 'pera@peric.com', 27, '2021-09-28 09:19:50', 1),
(345, '::1', 'pera@peric.com', 27, '2021-09-28 14:39:58', 1),
(346, '::1', 'pera@peric.com', 27, '2021-09-29 15:43:10', 1),
(347, '::1', 'pera@peric.com', 27, '2021-09-30 14:45:27', 1),
(348, '::1', 'zika@zikic.com', 4, '2021-09-30 15:03:23', 1),
(349, '::1', 'mika', NULL, '2021-09-30 15:03:35', 0),
(350, '::1', 'kiki@kiki.com', 21, '2021-09-30 15:03:40', 1),
(351, '::1', 'jelena', NULL, '2021-09-30 15:03:50', 0),
(352, '::1', 'jelena', NULL, '2021-09-30 15:03:59', 0),
(353, '::1', 'pera@peric.com', 27, '2021-09-30 15:33:37', 1),
(354, '::1', 'jelenastn30@gmail.com', 28, '2021-09-30 16:02:10', 1),
(355, '::1', 'jelenastn30@gmail.com', 28, '2021-09-30 16:02:25', 1),
(356, '::1', 'pera@peric.com', 27, '2021-09-30 16:03:07', 1),
(357, '::1', 'pera@peric.com', 27, '2021-10-01 13:40:11', 1),
(358, '::1', 'pera@peric.com', 27, '2021-10-01 14:34:51', 1),
(359, '::1', 'jelenastn30@gmail.com', 29, '2021-10-01 14:36:46', 1),
(360, '::1', 'pera@peric.com', 27, '2021-10-01 14:36:59', 1),
(361, '::1', 'pera@peric.com', 27, '2021-10-01 17:21:42', 1),
(362, '::1', 'pera@peric.com', 27, '2021-10-01 17:23:54', 1),
(363, '::1', 'ivastanic@gmail.com', 24, '2021-10-01 17:24:27', 1),
(364, '::1', 'zika@zikic.com', 4, '2021-10-01 17:24:38', 1),
(365, '::1', 'ivastanic@gmail.com', 24, '2021-10-01 17:25:15', 1),
(366, '::1', 'pera@peric.com', 27, '2021-10-01 17:35:24', 1),
(367, '::1', 'pera@peric.com', 27, '2021-10-02 13:12:29', 1),
(368, '::1', 'pera@peric.com', 27, '2021-10-04 15:37:07', 1),
(369, '::1', 'pera@peric.com', 27, '2021-10-05 03:04:28', 1),
(370, '::1', 'pera@peric.com', 27, '2021-10-05 06:47:11', 1),
(371, '::1', 'Jelena', NULL, '2021-10-05 06:47:23', 0),
(372, '::1', 'Ana', NULL, '2021-10-05 06:47:32', 0),
(373, '::1', 'zika@zikic.com', 4, '2021-10-05 06:47:38', 1),
(374, '::1', 'ivastanic@gmail.com', 24, '2021-10-05 06:47:52', 1),
(375, '::1', 'ivastanic@gmail.com', 24, '2021-10-05 08:51:51', 1),
(376, '::1', 'Ana', NULL, '2021-10-05 08:52:04', 0),
(377, '::1', 'mika', NULL, '2021-10-05 08:52:15', 0),
(378, '::1', 'maja', NULL, '2021-10-05 08:52:20', 0),
(379, '::1', 'pera@peric.com', NULL, '2021-10-05 08:52:27', 0),
(380, '::1', 'Jelena', NULL, '2021-10-05 08:52:35', 0),
(381, '::1', 'zika@zikic.com', 4, '2021-10-05 08:52:49', 1),
(382, '::1', 'zika@zikic.com', 4, '2021-10-05 13:33:05', 1),
(383, '::1', 'pera@peric.com', 27, '2021-10-05 13:41:19', 1),
(384, '::1', 'pera@peric.com', 27, '2021-10-07 15:08:08', 1),
(385, '::1', 'zika@zikic.com', 4, '2021-10-07 15:20:28', 1),
(386, '::1', 'Ana', NULL, '2021-10-07 15:48:46', 0),
(387, '::1', 'maja', NULL, '2021-10-07 15:48:52', 0),
(388, '::1', 'ivastanic@gmail.com', 24, '2021-10-07 15:48:59', 1),
(389, '::1', 'pera@peric.com', 27, '2021-10-07 16:08:31', 1),
(390, '::1', 'pera@peric.com', 27, '2021-10-08 13:28:04', 1),
(391, '::1', 'pera@peric.com', 27, '2021-10-08 13:32:15', 1),
(392, '::1', 'pera@peric.com', 27, '2021-10-08 17:46:29', 1),
(393, '::1', 'zika@zikic.com', 4, '2021-10-08 17:46:53', 1),
(394, '::1', 'zika@zikic.com', 4, '2021-10-09 03:44:08', 1),
(395, '::1', 'pera@peric.com', 27, '2021-10-09 04:26:27', 1),
(396, '::1', 'pera@peric.com', 27, '2021-10-09 14:17:16', 1),
(397, '::1', 'pera@peric.com', 27, '2021-10-10 03:41:09', 1),
(398, '::1', 'pera@peric.com', 27, '2021-10-10 13:30:21', 1),
(399, '::1', 'pera@peric.com', 27, '2021-10-11 14:06:49', 1),
(400, '::1', 'pera@peric.com', 27, '2021-10-11 16:43:23', 1),
(401, '::1', 'ivastanic@gmail.com', 24, '2021-10-11 17:37:53', 1),
(402, '::1', 'pera@peric.com', 27, '2021-10-12 03:07:10', 1),
(403, '::1', 'pera@peric.com', 27, '2021-10-12 08:25:40', 1),
(404, '::1', 'pera@peric.com', 27, '2021-10-13 12:29:31', 1),
(405, '::1', 'pera@peric.com', 27, '2021-10-13 14:58:40', 1),
(406, '::1', 'pera@peric.com', 27, '2021-10-13 15:02:19', 1),
(407, '::1', 'pera@peric.com', 27, '2021-10-13 15:03:29', 1),
(408, '::1', 'Jelena', NULL, '2021-10-13 15:03:44', 0),
(409, '::1', 'jelenastn@gmail.com', 47, '2021-10-13 15:04:01', 1),
(410, '::1', 'pera@peric.com', 27, '2021-10-13 15:04:52', 1),
(411, '::1', 'pera@peric.com', 27, '2021-10-14 08:50:49', 1),
(412, '::1', 'pera@peric.com', 27, '2021-10-14 13:51:02', 1),
(413, '::1', 'pera@peric.com', 27, '2021-10-15 08:34:47', 1),
(414, '::1', 'pera@peric.com', 27, '2021-10-15 14:34:46', 1),
(415, '::1', 'pera@peric.com', 27, '2021-10-16 05:53:04', 1),
(416, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 06:22:48', 1),
(417, '::1', 'misko', 48, '2021-10-16 09:46:43', 0),
(418, '::1', 'miodragstn@gmail.com', 48, '2021-10-16 09:48:41', 1),
(419, '::1', 'pera@peric.com', 27, '2021-10-16 09:49:51', 1),
(420, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 09:50:50', 1),
(421, '::1', 'pera', NULL, '2021-10-16 11:14:45', 0),
(422, '::1', 'pera@peric.com', 27, '2021-10-16 11:16:03', 1),
(423, '::1', 'nikola@gmail.rs', 45, '2021-10-16 11:16:49', 1),
(424, '::1', 'marija@gmail.com', 49, '2021-10-16 14:01:15', 1),
(425, '::1', 'pera@peric.com', 27, '2021-10-16 14:01:32', 1),
(426, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 14:02:13', 1),
(427, '::1', 'ana@gmail.com', 43, '2021-10-16 14:19:24', 1),
(428, '::1', 'pera@peric.com', 27, '2021-10-16 14:20:58', 1),
(429, '::1', 'nikola@gmail.rs', 45, '2021-10-16 14:21:47', 1),
(430, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 15:02:46', 1),
(431, '::1', 'nikola@gmail.rs', 45, '2021-10-16 15:03:27', 1),
(432, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 15:04:35', 1),
(433, '::1', 'nikola@gmail.rs', 45, '2021-10-16 15:11:23', 1),
(434, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 15:55:31', 1),
(435, '::1', 'pera@peric.com', 27, '2021-10-16 15:55:52', 1),
(436, '::1', 'ivastanic@gmail.com', 44, '2021-10-16 15:59:15', 1),
(437, '::1', 'ana@gmail.com', 43, '2021-10-16 16:01:35', 1),
(438, '::1', 'nikola@gmail.rs', 45, '2021-10-16 16:02:36', 1),
(439, '::1', 'pera@peric.com', 27, '2021-10-16 16:03:04', 1),
(440, '::1', 'matija', NULL, '2021-10-16 16:04:42', 0),
(441, '::1', 'matijastnc', NULL, '2021-10-16 16:04:51', 0),
(442, '::1', 'mata', NULL, '2021-10-16 16:05:15', 0),
(443, '::1', 'jelenastn30@gmail.com', 42, '2021-10-16 16:05:31', 1),
(444, '::1', 'pera@peric.com', 27, '2021-10-16 16:06:15', 1),
(445, '::1', 'pera@peric.com', 27, '2021-10-17 07:39:44', 1),
(446, '::1', 'ivastanic@gmail.com', 44, '2021-10-17 12:26:49', 1),
(447, '::1', 'ivastanic@gmail.com', 44, '2021-10-17 12:26:55', 1),
(448, '::1', 'jelenastn30@gmail.com', 42, '2021-10-17 12:27:21', 1),
(449, '::1', 'pera@peric.com', 27, '2021-10-17 12:37:14', 1),
(450, '::1', 'pera@peric.com', 27, '2021-10-17 15:21:11', 1),
(451, '::1', 'Jelena', NULL, '2021-10-17 15:23:29', 0),
(452, '::1', 'jelenastn@gmail.com', 47, '2021-10-17 15:23:35', 1),
(453, '::1', 'jelenastn@gmail.com', 47, '2021-10-17 15:23:45', 1),
(454, '::1', 'pera@peric.com', 27, '2021-10-17 15:27:44', 1),
(455, '::1', 'ivastanic@gmail.com', 44, '2021-10-17 16:23:01', 1),
(456, '::1', 'pera@peric.com', 27, '2021-10-17 16:27:12', 1),
(457, '::1', 'pera@peric.com', 27, '2021-10-18 08:25:40', 1),
(458, '::1', 'pera@peric.com', 27, '2021-10-18 13:11:25', 1);

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

-- --------------------------------------------------------

--
-- Stand-in structure for view `izmena`
-- (See below for the actual view)
--
CREATE TABLE `izmena` (
`id_rezult` int(11)
,`naziv` varchar(128)
,`Konacan_Status` varchar(32)
,`status` varchar(11)
);

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

--
-- Dumping data for table `poziv`
--

INSERT INTO `poziv` (`id`, `naziv`) VALUES
(14, 'Programiranje u službi osoba sa posebnim potrebama'),
(15, 'Umetnost na tlu Srbije'),
(17, 'Covid - 19'),
(18, 'Genotip i fenotip');

-- --------------------------------------------------------

--
-- Stand-in structure for view `primeni`
-- (See below for the actual view)
--
CREATE TABLE `primeni` (
`id_rezult` int(11)
,`status` varchar(1)
);

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

-- --------------------------------------------------------

--
-- Table structure for table `recenzent_rezultat`
--

CREATE TABLE `recenzent_rezultat` (
  `id` int(11) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_rezult` int(11) NOT NULL,
  `id_status` int(11) DEFAULT NULL,
  `datum_dodele` date NOT NULL,
  `datum_ocene` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recenzent_rezultat`
--

INSERT INTO `recenzent_rezultat` (`id`, `id_user`, `id_rezult`, `id_status`, `datum_dodele`, `datum_ocene`) VALUES
(29, 42, 56, 2, '2021-10-16', NULL),
(30, 45, 56, 2, '2021-10-16', NULL),
(32, 47, 57, 1, '2021-10-16', NULL),
(33, 43, 59, 1, '2021-10-01', '2021-10-02'),
(34, 44, 59, 1, '2021-10-16', '2021-10-17'),
(35, 42, 55, 1, '2021-10-16', NULL),
(36, 47, 58, 3, '2021-10-17', NULL),
(37, 46, 57, 3, '2021-10-18', NULL);

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
  `id_oblast` int(11) NOT NULL,
  `naziv` varchar(128) NOT NULL,
  `opis` varchar(256) NOT NULL,
  `clanovi` varchar(128) NOT NULL,
  `biografije` varchar(640) NOT NULL,
  `god_rez` varchar(16) NOT NULL,
  `datum_prijave` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rezultat`
--

INSERT INTO `rezultat` (`id`, `id_poziv`, `id_kateg`, `id_status`, `id_oblast`, `naziv`, `opis`, `clanovi`, `biografije`, `god_rez`, `datum_prijave`) VALUES
(55, 14, 7, 3, 2, 'Humanoidni roboti, pomoćnici', 'Reem-A je jedan od dizajniranih humanoidnih robota, napravljen u prirodnoj veličini, koji može da prepoznaje česta pitanja i komande, drži jednostavne objekte ili se zaustavlja na svom putu ukoliko naiđe na prepreku. ', 'Bill Stivenson, Marija Petković', '55.pdf', '2020.', '2021-10-03'),
(56, 14, 1, 2, 2, 'Bionička ruka', '', 'Sanja Perić, Dzon Price', '56.pdf', '2020.', '2021-10-04'),
(57, 15, 5, 3, 4, '\"Beli anđeo\" kroz vreme', 'Mileševski „Beli anđeo“ bio je među prvim kadrovima koji su predstavili Evropu Severnoj Americi u prvom satelitskom prenosu video signala između dva kontinenta, 1963. godine.', 'Slobodanka Milovanović, Nada Zarupski', '57.pdf', '2021.', '2021-10-01'),
(58, 15, 4, 3, 4, 'Utvrđeni gradovi na rekama Srbije', 'Maglič, iznad Ibra, nedaleko od Kraljeva, je grad za koji se pretpostavlja da ga je podigao Uroš I (ili Stefan Prvovenčani), a u kome je arhiepiskop Danilo II (biograf kralja Milutina) imao svoju palatu.', 'Vojislav Milovanović, Zorica Gajić', '58.pdf', '2021.', '2021-10-02'),
(59, 17, 5, 1, 5, 'Vakcine, da ili ne', 'Learn how the body fights infection and how COVID-19 vaccines protect people by producing immunity. Also see the different types of COVID-19 vaccines that currently are available ', 'Ana Banko, Milanko Sekler, Srdja Popovic', '59.pdf', '2021.', '2021-10-01'),
(60, 17, 6, 3, 5, 'Probiotics in Prevention and Treatment of COVID-19', 'Saving lives and flattening the curve are the foremost priorities during the ongoing pandemic spread of SARS-CoV-2. Developing cutting-edge technology and collating available evidence would support frontline health teams. Nutritional adequacy improves gene', 'Branislav Tiodorovic, Zoran Jovanovic', '60.pdf', '2021.', '2021-10-02');

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
(2, 'odbijen'),
(3, 'razmatra se');

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
  `id_status_prijave` int(11) NOT NULL DEFAULT 1,
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

INSERT INTO `users` (`id`, `email`, `username`, `ime`, `prezime`, `organizacija`, `id_zemlje`, `id_nac`, `id_oblast`, `id_zvanja`, `id_status_prijave`, `adresa`, `telefon`, `web_str`, `biografija`, `radovi`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(27, 'pera@peric.com', 'pera', 'Pera', 'Peric', '', 1, 1, 1, 1, 1, '', '', '', '', '', '$2y$10$kAk0NsJn1DaCAcqRgzkcm.NeSGLsa3dGPbblezmNgriES3EVjWWDS', NULL, NULL, NULL, '65aa92264fea011df5744932cb3bc365', NULL, NULL, 1, 0, '2021-09-18 16:32:53', '2021-09-18 16:32:53', NULL),
(42, 'jelenastn30@gmail.com', 'mata', 'Matija', 'Stanic', 'Apple', 1, 1, 1, 3, 3, 'Gandijeva 1', '069/123456', 'www.mata.com', '', 'Kanta.rs, pecpec.rs, robobob.com, antiskola.rs, robomatt.com, kanta.rs, pecpec.rs, robobob.com, antiskola.rs, robomatt.com,', '$2y$10$kkaMMjlJhJ51dmEMXuneA.qYVzJHa8vqPFgo6LUQ7X.66KYmNE8z2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-10-13 14:19:49', '2021-10-13 14:20:11', NULL),
(43, 'ana@gmail.com', 'ana', 'Ana ', 'Lukic', 'Euromedik', 15, 2, 5, 5, 3, 'Gandijeva 22', '063/123-462', 'www.ana.com', '', 'What is epidemiology?\r\nStudija Covid-19 i ucinak vakcinacije po zemljama.\r\nCovid 19 treatment algorithms\r\nAntioxidants: in depth\r\nRemdesivir\r\nWhat is epidemiolo', '$2y$10$Wp1AmGbAS3pEop3oIWcb0usH1KmE3w.xdC9OFYbPXiHvEApEGDSxO', NULL, NULL, NULL, '6e2c214aecdff2edad146809eacdcfcc', NULL, NULL, 1, 0, '2021-10-13 14:29:23', '2021-10-13 14:29:23', NULL),
(44, 'ivastanic@gmail.com', 'iva', 'Iva', 'Stanic', 'Medik', 17, 2, 5, 1, 3, 'Ulica lipa 11', '069/123456', 'www.iva.com', '', 'Delta variant\r\nWhat is Covid 19?\r\nEarly signs of Coronavirus\r\nAnimals and Covid 19\r\nCovid 22?\r\nDelta variant\r\nWhat is Covid 19?\r\nEarly signs of Coronavirus\r\nAni', '$2y$10$/8xcshHrqq4hl9ypqnnZd.3vfao881ArFs6wWDMaPxqAyLPxIy.p2', NULL, NULL, NULL, 'eb62ede6540960594cafe257671b6c3d', NULL, NULL, 1, 0, '2021-10-13 14:33:32', '2021-10-13 14:33:32', NULL),
(45, 'nikola@gmail.rs', 'nikola', 'Nikola', 'Lukic', 'Technobig', 1, 1, 2, 4, 3, 'Ulica jorgovana 5', '063/123-890', 'www.nikola.rs', '', 'Tehnoloske inovacije u medicini\r\nBionicke tehnologije\r\nModel 3D stampanja\r\nMolekularna medicina i biocipovi\r\nNuklearna tehnologija\r\nTehnoloske inovacije u medic', '$2y$10$sTjKsWhYvUqpOTiDQRD.zO0Mo901EHosYy/VlKdL9W3Tc/ZU/pckm', NULL, NULL, NULL, '09f251d96181e77ddea882e69aa2974e', NULL, NULL, 1, 0, '2021-10-13 14:38:52', '2021-10-13 14:38:52', NULL),
(46, 'darko@gmail.com', 'darko', 'Darko', 'Stankov', 'The World Art', 1, 1, 4, 4, 3, 'Sakishima', '063/123-567', 'www.darko.com', '', '40 Best Museums in the World\r\nFortifikaciona utvrde na teritoriji Srbije\r\nRomanicko zidno slikarstvo\r\nNaivno slikarstvo u Srbiji\r\nManastir Svete Melanije Rimlja', '$2y$10$oYL3CxscOhfzJRJ0qxYmZeD/zn5yeqB72jy9DZctDKaG1FwO5u3z.', NULL, NULL, NULL, '0061da4e617ee8a31e79bc4461d059da', NULL, NULL, 1, 0, '2021-10-13 14:50:29', '2021-10-13 14:50:29', NULL),
(47, 'jelenastn@gmail.com', 'jelena', 'Jelena', 'Stanic', 'Etnografski muzej', 1, 1, 4, 1, 3, 'Ulica jorgovana 10', '0697789012', 'www.jelena.rs', '', 'Golubacka tvrdjava\r\nSmederevska tvrdjava\r\nRamska tvrdjava\r\nManastir Tumane\r\nManastir Zaova\r\nGolubacka tvrdjava\r\nSmederevska tvrdjava\r\nRamska tvrdjava\r\nManastir ', '$2y$10$XsmhifUfNinDqn31.9lsDuLOPlEmMsfDogo/s3zeENnbjCncNYEa6', NULL, NULL, NULL, '82d6122a085b2fd019987e01dc791d25', NULL, NULL, 1, 0, '2021-10-13 14:54:15', '2021-10-13 14:54:15', NULL),
(48, 'miodragstn@gmail.com', 'misko', 'Miodrag', 'Stanic', 'Telesign', 1, 1, 2, 5, 4, 'Gandijeva 22', '063/123-123', 'www.miodrag.com', '', 'Google\'s worker robots\r\nMulti-tasking bots\r\nUR3 arm\r\n Asus Zenbo\r\n Paro\r\nGoogle\'s worker robots\r\nMulti-tasking bots\r\nUR3 arm\r\n Asus Zenbo\r\n Paro', '$2y$10$mqzFD0GWsKagO6JP8Y/WsOp5ZfXNliZZsOgAYK1N5vzJdBjSLedeO', NULL, NULL, NULL, '6fef2d0725c7f7e00fa049128c023014', NULL, NULL, 1, 0, '2021-10-16 09:46:16', '2021-10-16 09:46:16', NULL),
(49, 'nbosko@etf.rs', 'bosko', 'Bosko', 'Nikolic', 'NCR', 1, 1, 3, 5, 3, 'Ulica jorgovana 1', '069/123098', 'www.bole.com', '', 'Značaj multidisciplinarne saradnje i transdisciplinarnih istraživanja za prevladavanje krize u drustvu\r\nKognitivno-razvojni pristup moralnom vaspitanju kod dece', '$2y$10$126N/GLMa7hMbiEyOlV3p.mIkgJU2AGSxTihNSsxBjjb2aoUv.kvy', NULL, NULL, NULL, 'ce295ff71ed410fcc72a46676e911bf4', NULL, NULL, 1, 0, '2021-10-16 13:59:21', '2021-10-16 13:59:21', NULL);

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

-- --------------------------------------------------------

--
-- Structure for view `izmena`
--
DROP TABLE IF EXISTS `izmena`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `izmena`  AS SELECT `pom`.`id_rezult` AS `id_rezult`, `pom`.`naziv` AS `naziv`, `srez`.`opis` AS `Konacan_Status`, CASE WHEN `pom`.`Status` = 2 THEN 'prihvacen' WHEN `pom`.`Status` < 0 THEN 'odbijen' ELSE 'razmatra se' END AS `status` FROM (((select `rr`.`id_rezult` AS `id_rezult`,`rz`.`naziv` AS `naziv`,sum(case `rr`.`id_status` when 1 then 1 when 2 then -2 else 0 end) AS `Status` from (`recenzent_rezultat` `rr` join `rezultat` `rz` on(`rr`.`id_rezult` = `rz`.`id`)) group by `rr`.`id_rezult`,`rz`.`naziv`) `pom` join `rezultat` `rez` on(`pom`.`id_rezult` = `rez`.`id`)) join `status_rezultata` `srez` on(`rez`.`id_status` = `srez`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `primeni`
--
DROP TABLE IF EXISTS `primeni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `primeni`  AS SELECT `pom`.`id_rezult` AS `id_rezult`, CASE WHEN `pom`.`Status` = 2 THEN 'P' WHEN `pom`.`Status` < 0 THEN 'O' ELSE 'R' END AS `status` FROM (select `rr`.`id_rezult` AS `id_rezult`,sum(case `rr`.`id_status` when 1 then 1 when 2 then -2 else 0 end) AS `Status` from `recenzent_rezultat` `rr` group by `rr`.`id_rezult`) AS `pom` ;

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
  ADD KEY `rezultat_status_rezultata` (`id_status`),
  ADD KEY `rezultat_oblast` (`id_oblast`);

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
  ADD KEY `users_oblast` (`id_oblast`),
  ADD KEY `users_status_prijave` (`id_status_prijave`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `anketa_pitanja_vezna`
--
ALTER TABLE `anketa_pitanja_vezna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `recenzent_anketa`
--
ALTER TABLE `recenzent_anketa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recenzent_anketa_odgovor`
--
ALTER TABLE `recenzent_anketa_odgovor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recenzent_rezultat`
--
ALTER TABLE `recenzent_rezultat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `recenzent_rezultat_odgovor`
--
ALTER TABLE `recenzent_rezultat_odgovor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rezultat`
--
ALTER TABLE `rezultat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `status_prijave`
--
ALTER TABLE `status_prijave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status_rezultata`
--
ALTER TABLE `status_rezultata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
  ADD CONSTRAINT `anketa_pitanja_anketa` FOREIGN KEY (`id_anketa`) REFERENCES `anketa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anketa_pitanja_vezna`
--
ALTER TABLE `anketa_pitanja_vezna`
  ADD CONSTRAINT `anketa_pitanja_vezna_anketa` FOREIGN KEY (`id_anketa`) REFERENCES `anketa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anketa_pitanja_vezna_anketa_pitanja` FOREIGN KEY (`id_pitanja`) REFERENCES `anketa_pitanja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `pitanja`
--
ALTER TABLE `pitanja`
  ADD CONSTRAINT `pitanja_poziv` FOREIGN KEY (`id_poziv`) REFERENCES `poziv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recenzent_anketa`
--
ALTER TABLE `recenzent_anketa`
  ADD CONSTRAINT `recenzent_anketa_anketa` FOREIGN KEY (`id_anketa`) REFERENCES `anketa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzent_anketa_obavestenja_tip` FOREIGN KEY (`id_obavestenja`) REFERENCES `obavestenja_tip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzent_anketa_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recenzent_anketa_odgovor`
--
ALTER TABLE `recenzent_anketa_odgovor`
  ADD CONSTRAINT `Recenzent_anketa_odgovor_anketa_pitanja` FOREIGN KEY (`id_pitanja`) REFERENCES `anketa_pitanja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Recenzent_anketa_odgovor_recenzent_anketa` FOREIGN KEY (`id_recenzent_anketa`) REFERENCES `recenzent_anketa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recenzent_rezultat`
--
ALTER TABLE `recenzent_rezultat`
  ADD CONSTRAINT `recenzent_rezultat_rezultat` FOREIGN KEY (`id_rezult`) REFERENCES `rezultat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzent_rezultat_status_rezultata` FOREIGN KEY (`id_status`) REFERENCES `status_rezultata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzent_rezultat_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `rezultat_kategorija` FOREIGN KEY (`id_kateg`) REFERENCES `kategorija` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezultat_oblast` FOREIGN KEY (`id_oblast`) REFERENCES `oblast` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezultat_poziv` FOREIGN KEY (`id_poziv`) REFERENCES `poziv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezultat_status_rezultata` FOREIGN KEY (`id_status`) REFERENCES `status_rezultata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_nacionalnost` FOREIGN KEY (`id_nac`) REFERENCES `nacionalnost` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_oblast` FOREIGN KEY (`id_oblast`) REFERENCES `oblast` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_status_prijave` FOREIGN KEY (`id_status_prijave`) REFERENCES `status_prijave` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_zemlja` FOREIGN KEY (`id_zemlje`) REFERENCES `zemlja` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_zvanje` FOREIGN KEY (`id_zvanja`) REFERENCES `zvanje` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
