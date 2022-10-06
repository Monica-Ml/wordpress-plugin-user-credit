-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 05, 2018 at 10:25 AM
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
-- Table structure for table `credit_log`
--

CREATE TABLE `credit_log` (
  `record_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `operator_name` enum('admin','system','user','') COLLATE utf8_bin NOT NULL,
  `previous_credit` varchar(400) COLLATE utf8_bin NOT NULL,
  `operation_name` enum('sum','subtraction','equal','') COLLATE utf8_bin NOT NULL,
  `new_credit` varchar(400) COLLATE utf8_bin NOT NULL,
  `amount_transaction` varchar(400) COLLATE utf8_bin NOT NULL,
  `transaction_dis` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `credit_log`
--

INSERT INTO `credit_log` (`record_id`, `user_id`, `operator_name`, `previous_credit`, `operation_name`, `new_credit`, `amount_transaction`, `transaction_dis`, `date_time`) VALUES
(11, 14, 'admin', '500', 'sum', '900', '1400', 'شارژ حساب', '2017-12-22 01:36:23'),
(10, 14, 'admin', '100', 'sum', '400', '500', 'شارژ حساب', '2017-12-22 01:35:55'),
(9, 14, 'admin', '0', 'sum', '100', '100', 'شارژ حساب', '2017-12-22 01:35:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credit_log`
--
ALTER TABLE `credit_log`
  ADD PRIMARY KEY (`record_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `credit_log`
--
ALTER TABLE `credit_log`
  MODIFY `record_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
