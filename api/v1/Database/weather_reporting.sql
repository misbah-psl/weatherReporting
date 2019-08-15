-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2019 at 10:11 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather_reporting`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL COMMENT 'unique location id',
  `city` varchar(255) NOT NULL COMMENT 'city name',
  `country` varchar(255) NOT NULL COMMENT 'country name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `city`, `country`) VALUES
(1, 'Birmingham', 'GB'),
(2, 'Walsall', 'GB'),
(3, 'London', 'GB');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'user id',
  `email_id` varchar(255) NOT NULL COMMENT 'user''s email id',
  `company_name` varchar(50) DEFAULT NULL COMMENT 'Company name',
  `student` int(1) DEFAULT '0' COMMENT '0 - no 1 - yes',
  `api_key` varchar(255) NOT NULL COMMENT 'unique api key per user',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 - inactive 1 - active 2 - deleted',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email_id`, `company_name`, `student`, `api_key`, `status`, `created_on`, `updated_on`) VALUES
(1, 'simon@gmail.com', 'ABC Ltd', 0, 'fsdfsdfsdfsdgbvcbcvbcbcvb', 1, '2019-08-06 21:10:06', '2019-08-06 21:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `id` int(11) NOT NULL COMMENT 'weather id',
  `location_id` int(11) NOT NULL COMMENT 'id from locations table',
  `date` date NOT NULL COMMENT 'date ',
  `min_temp` int(11) NOT NULL COMMENT 'min temp of day',
  `max_temp` int(11) NOT NULL COMMENT 'max temp of day',
  `min_status` enum('partly_cloudy','cloudy','sunny','raining','snow','thunderstorm','clear') NOT NULL COMMENT 'weather status for min temp',
  `max_status` enum('partly_cloudy','cloudy','sunny','raining','snow','thunderstorm','clear') NOT NULL COMMENT 'weather status for max temp',
  `weather` text NOT NULL COMMENT 'hourly weather temp and status',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'created on date',
  `updated_on` datetime NOT NULL COMMENT 'updated on date',
  `updated_by` int(1) UNSIGNED NOT NULL COMMENT '0 - by cron 1 - manual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`id`, `location_id`, `date`, `min_temp`, `max_temp`, `min_status`, `max_status`, `weather`, `created_on`, `updated_on`, `updated_by`) VALUES
(1, 1, '2019-08-07', 15, 23, 'partly_cloudy', 'sunny', '{\r\n\"1\":{\r\n\"temp\":\"10\",\r\n\"status\":\"clear\"\r\n},\r\n\"2\":{\r\n\"temp\": \"11\",\r\n\"status\":\"clear\"\r\n}\r\n}', '2019-08-07 00:00:00', '2019-08-07 00:00:00', 1),
(2, 1, '2019-08-08', 15, 23, 'partly_cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"}, \"12\":{\"temp\":\"18\",\"status\":\"sunny\"}}', '2019-08-07 12:30:13', '0000-00-00 00:00:00', 1),
(3, 1, '2019-08-09', 11, 18, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"12\",\"status\":\"clear\"},\"6\":{\"temp\":\"12\",\"status\":\"clear\"},\"7\":{\"temp\":\"13\",\"status\":\"clear\"},\"8\":{\"temp\":\"13\",\"status\":\"clear\"},\"9\":{\"temp\":\"13\",\"status\":\"clear\"},\"10\":{\"temp\":\"14\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"16\",\"status\":\"clear\"},\"15\":{\"temp\":\"11\",\"status\":\"clear\"},\"16\":{\"temp\":\"11\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:16:40', '0000-00-00 00:00:00', 1),
(5, 2, '2019-08-09', 11, 18, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"12\",\"status\":\"clear\"},\"6\":{\"temp\":\"12\",\"status\":\"clear\"},\"7\":{\"temp\":\"13\",\"status\":\"clear\"},\"8\":{\"temp\":\"13\",\"status\":\"clear\"},\"9\":{\"temp\":\"13\",\"status\":\"clear\"},\"10\":{\"temp\":\"14\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"16\",\"status\":\"clear\"},\"15\":{\"temp\":\"11\",\"status\":\"clear\"},\"16\":{\"temp\":\"11\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:18:47', '0000-00-00 00:00:00', 1),
(6, 2, '2019-08-10', 15, 23, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:21:11', '0000-00-00 00:00:00', 1),
(7, 1, '2019-08-10', 15, 23, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:24:08', '0000-00-00 00:00:00', 1),
(8, 2, '2019-08-11', 15, 23, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:39:18', '0000-00-00 00:00:00', 1),
(9, 2, '2019-08-12', 18, 24, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:43:10', '0000-00-00 00:00:00', 1),
(10, 2, '2019-08-13', 15, 22, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:43:28', '0000-00-00 00:00:00', 1),
(11, 1, '2019-08-13', 15, 22, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:43:56', '0000-00-00 00:00:00', 1),
(12, 1, '2019-08-12', 15, 22, 'cloudy', 'sunny', '{\"1\":{\"temp\":\"10\",\"status\":\"clear\"},\"2\":{\"temp\":\"11\",\"status\":\"clear\"},\"3\":{\"temp\":\"11\",\"status\":\"clear\"},\"4\":{\"temp\":\"12\",\"status\":\"clear\"},\"5\":{\"temp\":\"14\",\"status\":\"clear\"},\"6\":{\"temp\":\"142\",\"status\":\"clear\"},\"7\":{\"temp\":\"16\",\"status\":\"clear\"},\"8\":{\"temp\":\"16\",\"status\":\"clear\"},\"9\":{\"temp\":\"16\",\"status\":\"clear\"},\"10\":{\"temp\":\"16\",\"status\":\"clear\"},\"11\":{\"temp\":\"17\",\"status\":\"clear\"},\"12\":{\"temp\":\"17\",\"status\":\"clear\"},\"13\":{\"temp\":\"18\",\"status\":\"clear\"},\"14\":{\"temp\":\"20\",\"status\":\"clear\"},\"15\":{\"temp\":\"22\",\"status\":\"clear\"},\"16\":{\"temp\":\"23\",\"status\":\"clear\"},\"17\":{\"temp\":\"12\",\"status\":\"clear\"},\"18\":{\"temp\":\"11\",\"status\":\"clear\"},\"19\":{\"temp\":\"11\",\"status\":\"clear\"},\"20\":{\"temp\":\"11\",\"status\":\"clear\"},\"21\":{\"temp\":\"10\",\"status\":\"clear\"},\"22\":{\"temp\":\"9\",\"status\":\"clear\"},\"23\":{\"temp\":\"8\",\"status\":\"clear\"},\"24\":{\"temp\":\"8\",\"status\":\"clear\"}}', '2019-08-08 23:44:24', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_id` (`email_id`),
  ADD UNIQUE KEY `api_key` (`api_key`);

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique location id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `weather`
--
ALTER TABLE `weather`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'weather id', AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
