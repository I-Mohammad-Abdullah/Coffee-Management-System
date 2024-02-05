-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 10:04 AM
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
(1, ' Arabica', 200, 300, 500, 35),
(2, 'Robusta', 250, 350, 420, 80),
(3, 'Excelsa', 150, 220, 250, 30),
(4, 'Liberica', 170, 240, 280, 15);

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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `Name`, `Email`, `Address`) VALUES
(1, 'Zeeshan', 'Zeeshan@gmail.com', 'Gulistan e johar'),
(2, 'Adeel', 'Adeel@gmail.com', 'Malir Cant'),
(4, 'Saad', 'hadraam@gmail.com', 'Garden West'),
(5, 'hadi', 'hadi@gmail.com', 'phase 8'),
(6, 'hussain', 'hussain@maju.edu', 'malir cant');

-- --------------------------------------------------------

--
-- Table structure for table `order_coffee`
--

CREATE TABLE `order_coffee` (
  `ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Bean_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL,
  `Cup_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_coffee`
--

INSERT INTO `order_coffee` (`ID`, `Quantity`, `Bean_ID`, `Cust_ID`, `Cup_ID`) VALUES
(1, 2, 4, 1, 3),
(2, 10, 30, 20, 40),
(3, 1, 0, 0, 0),
(6, 25, 3, 4, 3),
(7, 19, 1, 4, 1),
(8, 15, 1, 4, 1),
(9, 15, 1, 4, 1),
(10, 15, 1, 4, 1),
(11, 15, 1, 4, 1),
(12, 2, 1, 4, 2);

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
-- Indexes for table `customer`
--
ALTER TABLE `customer`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cup_type`
--
ALTER TABLE `cup_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_coffee`
--
ALTER TABLE `order_coffee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
