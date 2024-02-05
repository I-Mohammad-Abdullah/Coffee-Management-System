-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 05:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee management`
--
CREATE DATABASE IF NOT EXISTS `coffee management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coffee management`;

-- --------------------------------------------------------

--
-- Table structure for table `coffee_beans`
--

CREATE TABLE `coffee_beans` (
  `ID` int(11) NOT NULL,
  `Bean_Type` varchar(225) NOT NULL,
  `Bean_Price_small_cup` int(11) NOT NULL,
  `Bean_Price_medium_cup` int(11) NOT NULL,
  `Bean_Price_large_cup` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coffee_beans`
--

INSERT INTO `coffee_beans` (`ID`, `Bean_Type`, `Bean_Price_small_cup`, `Bean_Price_medium_cup`, `Bean_Price_large_cup`, `Quantity`) VALUES
(1, 'Arabica', 200, 300, 500, 40),
(2, 'Robusta', 250, 350, 420, 89),
(3, 'Excelsa', 150, 220, 250, 46),
(4, 'Liberica', 170, 240, 280, 10),
(15, 'Yeka', 1000, 4000, 5000, 54);

-- --------------------------------------------------------

--
-- Table structure for table `cup_type`
--

CREATE TABLE `cup_type` (
  `ID` int(11) NOT NULL,
  `Cup_Size` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cup_type`
--

INSERT INTO `cup_type` (`ID`, `Cup_Size`) VALUES
(1, 'small'),
(2, 'medium'),
(3, 'large');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`ID`, `Order_ID`, `Status`) VALUES
(1, 18, 'Completed'),
(2, 19, 'In Progress'),
(3, 20, 'In Progress'),
(4, 22, 'Completed'),
(5, 24, 'In Progress'),
(6, 25, 'Cancelled'),
(7, 26, 'In Progress'),
(8, 27, 'In Progress'),
(9, 28, 'Completed'),
(10, 29, 'Cancelled'),
(11, 30, 'Completed'),
(12, 31, 'In Progress'),
(13, 32, 'In Progress'),
(14, 33, 'In Progress'),
(15, 34, 'In Progress'),
(16, 35, 'In Progress'),
(17, 36, 'Completed'),
(18, 37, 'Cancelled'),
(19, 38, 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `order_coffee`
--

CREATE TABLE `order_coffee` (
  `ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Bean_ID` int(11) NOT NULL,
  `Cup_ID` int(11) NOT NULL,
  `Customer_Name` varchar(25) DEFAULT NULL,
  `Customer_Email` varchar(50) DEFAULT NULL,
  `Customer_Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_coffee`
--

INSERT INTO `order_coffee` (`ID`, `Quantity`, `Bean_ID`, `Cup_ID`, `Customer_Name`, `Customer_Email`, `Customer_Address`) VALUES
(1, 2, 4, 3, NULL, NULL, NULL),
(2, 10, 30, 40, NULL, NULL, NULL),
(3, 1, 0, 0, NULL, NULL, NULL),
(6, 25, 3, 3, NULL, NULL, NULL),
(7, 19, 1, 1, NULL, NULL, NULL),
(8, 15, 1, 1, NULL, NULL, NULL),
(9, 15, 1, 1, NULL, NULL, NULL),
(10, 15, 1, 1, NULL, NULL, NULL),
(11, 15, 1, 1, NULL, NULL, NULL),
(12, 2, 1, 2, NULL, NULL, NULL),
(13, 20, 2, 1, NULL, NULL, NULL),
(14, 20, 2, 1, NULL, NULL, NULL),
(15, 3, 2, 2, NULL, NULL, NULL),
(16, 3, 2, 2, NULL, NULL, NULL),
(17, 1, 2, 3, NULL, NULL, NULL),
(18, 5, 1, 3, NULL, NULL, NULL),
(19, 5, 2, 3, NULL, NULL, NULL),
(20, 2, 1, 3, NULL, NULL, NULL),
(21, 5, 4, 2, NULL, NULL, NULL),
(22, 10, 2, 1, NULL, NULL, NULL),
(23, 0, 0, 0, NULL, NULL, NULL),
(24, 1, 3, 2, 'Saad', 'Saad@gmail.com', 'lahore '),
(25, 3, 2, 1, 'hadi', 'HAdi@gmaiol.com', 'ldkj'),
(26, 3, 2, 1, 'Abdullah', 'Abdullah@gmail.com', 'karachi'),
(27, 3, 1, 1, 'Adeel', 'Adeel@gmail.com', 'Baldia'),
(28, 5, 3, 3, 'Danish', 'Danish@gmail.com', 'bhadurabad'),
(29, 1, 1, 1, 'user1', 'user2@gmail.com', 'karachi'),
(30, 12, 1, 1, 'Hussain', 'hussain12@gmai.com', 'Malir Cant'),
(31, 3, 2, 1, 'qwe', 'we@gmail.com', 'khi'),
(32, 2, 1, 1, 'juju', 'juuj@gmail.com', 'khi'),
(33, 1, 1, 1, 'jiiw', 'kje@gmail.com', 'khi'),
(34, 1, 1, 1, 'qwe', 'ewe@gmail.com', 'khi'),
(35, 1, 1, 1, 'qw', 'we@gmail.com', 'khi'),
(36, 5, 1, 1, 'we', 'ewe@gmail.om', 'khi'),
(37, 8, 3, 2, 'ali', 'alikhan@gmail.com', 'kkhhi'),
(38, 3, 3, 3, 'ali', 'ali@gmail.com', 'khi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coffee_beans`
--
ALTER TABLE `coffee_beans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cup_type`
--
ALTER TABLE `cup_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order_coffee`
--
ALTER TABLE `order_coffee`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coffee_beans`
--
ALTER TABLE `coffee_beans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cup_type`
--
ALTER TABLE `cup_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_coffee`
--
ALTER TABLE `order_coffee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
