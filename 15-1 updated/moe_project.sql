-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2024 at 03:37 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moe_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_form`
--

CREATE TABLE `accreditation_form` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `applicantid` int(11) DEFAULT NULL,
  `educationid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `session_id`) VALUES
(2, '3', 'f941b2f2f09c7ff2d4a13ecf230e6f58'),
(3, '3', '51feaeef52c42b4c639e1e7cd4ee225e'),
(4, '3', 'a8cd5fbdb2a6640f71832fe7971b1592'),
(5, '3', '1c2936cb2d22c4d67cc0ea9424cda1fa'),
(6, '3', '074930bafabfee5967d3c2b2fffc5aa0'),
(7, '3', 'eb2cf1b2bfda08fc5c9d410d4f2b6882');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `files` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`, `message`, `files`) VALUES
(4, 'azri', 'Azri_Azih@outlook.com', 'Heloo', NULL),
(5, 'kambing', 'kambing76@gmail.com', '123 bah mana ', NULL),
(8, 'azrihandsome', 'ariee@gmail.com', 'hello world', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `ic_number` varchar(100) DEFAULT NULL,
  `email` text NOT NULL,
  `password` longtext NOT NULL,
  `confirmpass` longtext DEFAULT NULL,
  `type` text DEFAULT NULL,
  `terms_conditions` text DEFAULT NULL,
  `ic_color` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `birthdate` date NOT NULL,
  `address` longtext DEFAULT NULL,
  `postalcode` text DEFAULT NULL,
  `phonehome` varchar(100) NOT NULL,
  `phonemobile` varchar(100) DEFAULT NULL,
  `phoneoffice` varchar(100) DEFAULT NULL,
  `accreditationid` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `ic_number`, `email`, `password`, `confirmpass`, `type`, `terms_conditions`, `ic_color`, `gender`, `birthdate`, `address`, `postalcode`, `phonehome`, `phonemobile`, `phoneoffice`, `accreditationid`, `date_created`) VALUES
(18, 'ariee', '01103796', 'ariee_gato@gmail.com', '$2y$10$bOzF1MHcILFMXwHyWG9GzOOXEusZmZn4GZfunchj2s8ldXeJ9O1Xe', '$2y$10$qH/DoWaq8DI.28O978TCJOT.kUKi5PrnLn6r0IseG.5bXYmKezhxW', 'user', 'true', 'Yellow', 'Male', '1998-12-07', 'test', 'test', 'test', 'test', 'test', NULL, '0000-00-00 00:00:00'),
(19, 'azri', '01103790', 'azri_azih@outlook.com', '$2y$10$K9hrmK.mly1ZphvGZpK0gOtVKoQvgUtWyAPbzq/L/wkH.GLgnAzbC', '$2y$10$Ci4kzlnuI8jewywBb.7M1O10gMhhlQj/radvCJJD2Fk1J51z9SVdO', 'user', 'true', 'Yellow', 'Male', '2024-01-01', 'test', 'test', 'test', 'test', 'test', NULL, '0000-00-00 00:00:00'),
(20, 'Mohammad Azri bin Abd Azih', '01103770', 'azri.azih@gmail.com', '$2y$10$46fWwUP9rIzjlkev0KLAJ.aZZkyIf.bV.gki3si78Ax84rHfpQaCe', '$2y$10$uQ2daJZ0d9ADeElCT0FECuWNA9RQPYRssRn/H637Hjpwplp.elOR.', 'user', 'true', 'Yellow', 'Male', '2024-01-01', 'kampung kupang', 'TB2941', '-', '7409621', '-', NULL, '0000-00-00 00:00:00'),
(21, 'afiqah', '01123456', 'afiqah.azhar@outlook.com', '$2y$10$GHVh3Q9QySgD7sHyd3bGWuMUw4v9uaXxq2/dCoQEoXM1.wUepICLa', '$2y$10$w.su7O3a8z6fbObheYofie05ZcWANLGtz/ea0Dp12avNE.G6ViQay', 'user', 'true', 'Yellow', 'Female', '2024-01-01', 'test', 'test', 'test', 'test', 'test', NULL, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditation_form`
--
ALTER TABLE `accreditation_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
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
-- AUTO_INCREMENT for table `accreditation_form`
--
ALTER TABLE `accreditation_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
