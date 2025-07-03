-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2025 at 07:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aquaaligned`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_usage`
--

CREATE TABLE `daily_usage` (
  `date` date NOT NULL,
  `total_refill` decimal(10,2) NOT NULL,
  `total_usage` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `activityType` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `activityType`, `amount`, `date`) VALUES
(4, 'Usage', 0.25, '2025-06-05 10:10:21'),
(5, 'Usage', 1, '2025-06-08 16:53:07'),
(6, 'Usage', 1, '2025-06-08 17:13:14'),
(7, 'Usage', 20, '2025-06-08 17:14:58'),
(8, 'Usage', 1, '2025-06-08 17:18:56'),
(9, 'Usage', 1, '2025-06-08 17:23:47'),
(10, 'Usage', 1, '2025-06-08 17:28:38'),
(11, 'Usage', 10, '2025-06-11 03:24:57'),
(12, 'Usage', 5, '2025-06-11 03:34:52'),
(13, 'Usage', 5, '2025-06-11 03:39:25'),
(14, 'Usage', 10, '2025-06-11 07:34:33'),
(15, 'Usage', 15, '2025-06-11 07:44:57'),
(16, 'Usage', 30, '2025-06-12 09:49:35'),
(17, 'Usage', 20, '2025-06-12 10:01:18'),
(18, 'Usage', 20, '2025-06-13 05:21:12'),
(19, 'Usage', 20, '2025-06-14 13:49:24'),
(22, 'Usage', 20, '2025-06-27 03:41:01'),
(60, 'Usage', 3.49, '2025-07-01 05:28:53'),
(62, 'Refill', 7.16, '2025-07-01 05:29:53'),
(66, 'Usage', 2.52, '2025-07-01 05:56:49'),
(67, 'Refill', 2.34, '2025-07-01 05:57:51');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `distance_cm` float NOT NULL,
  `recorded_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `temperature`, `distance_cm`, `recorded_at`) VALUES
(1, 27.69, 12.6, '2025-07-01 14:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `tankdata`
--

CREATE TABLE `tankdata` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `height` float(10,2) NOT NULL,
  `width` float(10,2) NOT NULL,
  `length` float(10,2) NOT NULL,
  `diameter` float(10,2) NOT NULL,
  `threshold_type` varchar(20) NOT NULL,
  `threshold_value` float(10,2) NOT NULL,
  `notifications_enabled` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `autolog_enabled` tinyint(1) DEFAULT 0,
  `autolog_interval_minutes` int(11) NOT NULL DEFAULT 5,
  `autolog_min_difference` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tankdata`
--

INSERT INTO `tankdata` (`id`, `type`, `height`, `width`, `length`, `diameter`, `threshold_type`, `threshold_value`, `notifications_enabled`, `updated_at`, `autolog_enabled`, `autolog_interval_minutes`, `autolog_min_difference`) VALUES
(1, 'cylindrical', 35.00, 0.00, 0.00, 27.00, 'liters', 5.00, 1, '2025-07-01 06:02:06', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`) VALUES
(1, 'jhyncierto@gmail.com', 'omgfml123', '2025-06-02 04:12:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daily_usage`
--
ALTER TABLE `daily_usage`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tankdata`
--
ALTER TABLE `tankdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tankdata`
--
ALTER TABLE `tankdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
