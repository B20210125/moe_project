-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 09:25 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

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
  `password` text NOT NULL,
  `type` text DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `ic_number`, `email`, `password`, `type`, `date_created`) VALUES
(3, 'azri', '01103796', 'azri_azih@outlook.com', '$2y$10$GnGZSiv6lu37EB2Qo3Pa9ODlxKMEs6fMw1hHtFT6nhYbKxXineBLi', 'user', '2008-01-24 03:40:23'),
(4, 'azri', NULL, 'azih@gmail.com', '$2y$10$SVoEbQfVxgUWq7JMUiSttezkmxbxPUNOvJ3wRfvw7n8n23KDTnHuq', 'user', '2008-01-24 07:02:08'),
(5, 'test', '01109898', 'testing@gmail.com', '$2y$10$8X64BragVSfr794K4p1aWehsZ.0gMo6HZivFKfd5F7kPH/XeISNyi', NULL, '0000-00-00 00:00:00'),
(6, 'test', '01103790', 'testing123@gmail.com', '$2y$10$goyMHvDZyflwFCHru0Dnr.bz73LkG5NQwFjvnbLwp8wF7MwIXuwxa', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `usertest`
--

CREATE TABLE `usertest` (
  `UID` int(10) UNSIGNED NOT NULL,
  `NAME` varchar(45) NOT NULL DEFAULT '',
  `UNAME` varchar(45) NOT NULL DEFAULT '',
  `UPASS` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertest`
--

INSERT INTO `usertest` (`UID`, `NAME`, `UNAME`, `UPASS`) VALUES
(1, 'azri', 'azri', '123123');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `usertest`
--
ALTER TABLE `usertest`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usertest`
--
ALTER TABLE `usertest`
  MODIFY `UID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
