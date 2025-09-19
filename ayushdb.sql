-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2025 at 03:54 PM
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
-- Database: `ayushdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `ID` int(11) NOT NULL,
  `FN` varchar(255) DEFAULT NULL,
  `LN` varchar(255) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `ZONE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`ID`, `FN`, `LN`, `AGE`, `ZONE`) VALUES
(1, 'Ayush', 'Sharma', 28, 'North'),
(2, 'Priya', 'Verma', 34, 'East'),
(3, 'Rohan', 'Mehta', 41, 'West'),
(4, 'Sneha', 'Patel', 25, 'South'),
(5, 'Karan', 'Singh', 30, 'Central'),
(6, 'Neha', 'Jain', 29, 'North-East'),
(8, 'Divya', 'Kapoor', 33, 'North-West'),
(9, 'Vikram', 'Joshi', 45, 'East'),
(10, 'Meera', 'Nair', 27, 'South-East'),
(11, 'Tanvi', 'Chopra', 26, 'North'),
(12, 'Aman', 'Gill', 32, 'West'),
(13, 'Ritika', 'Malhotra', 24, 'South-East'),
(14, 'Harsh', 'Thakur', 18, 'Central'),
(15, 'Simran', 'Kaur', 31, 'North-East'),
(16, 'Rajeev', 'Bansal', 40, 'South-West'),
(17, 'Isha', 'Arora', 28, 'East'),
(18, 'Nikhil', 'Dey', 35, 'North-West'),
(19, 'Tanya', 'Mishra', 30, 'South'),
(20, 'Yuvraj', 'Chandel', 42, 'West');

-- --------------------------------------------------------

--
-- Table structure for table `emp1`
--

CREATE TABLE `emp1` (
  `ID` int(11) NOT NULL,
  `FN` varchar(255) DEFAULT NULL,
  `LN` varchar(255) DEFAULT NULL,
  `ED` varchar(255) DEFAULT 'oprations'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp2`
--

CREATE TABLE `emp2` (
  `ID` int(11) NOT NULL,
  `FN` varchar(255) DEFAULT NULL,
  `LN` varchar(255) DEFAULT NULL,
  `Age` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `emp2`
--

INSERT INTO `emp2` (`ID`, `FN`, `LN`, `Age`) VALUES
(1, 'Ayush', 'Gupta', '22');

-- --------------------------------------------------------

--
-- Table structure for table `emp3`
--

CREATE TABLE `emp3` (
  `ID` int(11) NOT NULL,
  `fn` varchar(255) DEFAULT NULL,
  `ln` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `zone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp3`
--

INSERT INTO `emp3` (`ID`, `fn`, `ln`, `age`, `zone`) VALUES
(1, 'Ayush', 'gupta', 18, 'north'),
(2, 'Piyush', 'Gupta', 13, 'north'),
(7, 'sdafadfa', 'afadfad', 90, 'south'),
(8, 'dfa', 'adfsf', 45, 'west');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `emp3`
--
ALTER TABLE `emp3`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `demoindex2` (`fn`,`ln`,`zone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emp3`
--
ALTER TABLE `emp3`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
