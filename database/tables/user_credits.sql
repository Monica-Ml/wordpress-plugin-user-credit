-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 05, 2018 at 10:26 AM
-- Server version: 5.6.38
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpmyd837_digiclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_credits`
--

CREATE TABLE `user_credits` (
  `credits_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `credit_fee` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_credits`
--

INSERT INTO `user_credits` (`credits_id`, `user_id`, `credit_fee`, `status`) VALUES
(17, 14, '1400', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_credits`
--
ALTER TABLE `user_credits`
  ADD PRIMARY KEY (`credits_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_credits`
--
ALTER TABLE `user_credits`
  MODIFY `credits_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
