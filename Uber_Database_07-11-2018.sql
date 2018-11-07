-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 07, 2018 at 03:40 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uber`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountTypes`
--

CREATE TABLE `accountTypes` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Phone` varchar(200) NOT NULL,
  `Adress` varchar(200) NOT NULL,
  `Note` varchar(200) NOT NULL,
  `Status` int(11) NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`ID`, `Name`, `Phone`, `Adress`, `Note`, `Status`, `Latitude`, `Longitude`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 2, 40, 80),
(2, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(3, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(4, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(5, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(6, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(7, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(8, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(9, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(10, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(11, 'admin', 'admin', 'admin', 'admin', 1, 0, 0),
(12, 'admin', 'admin2', 'adress', 'note', 0, 0, 0),
(13, 'admin', 'admin2', 'adress', 'note', 0, 0, 0),
(14, 'admin', 'admin2', 'adress', 'note', 0, 0, 0),
(15, 'admin', 'admin2', 'adress', 'note', 0, 0, 0),
(16, 'admin', 'admin2', 'adress', 'note', 0, 0, 0),
(17, 'admin', 'admin3', 'adress', 'note', 0, 0, 0),
(18, 'undefined', 'admin3', 'adress', 'note', 0, 0, 0),
(19, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(20, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(21, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(22, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(23, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(24, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(25, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(26, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(27, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(28, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(29, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(30, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(31, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(32, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(33, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(34, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(35, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(36, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(37, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(38, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(39, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(40, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(41, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(42, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(43, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(44, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(45, 'OK', 'admin3', 'adress', 'note', 0, 0, 0),
(46, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(47, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(48, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(49, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(50, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(51, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(52, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(53, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(54, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(55, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(56, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(57, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(58, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(59, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(60, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(61, 'OKKK', 'admin3', 'London', 'note', 0, 0, 0),
(62, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(63, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(64, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(65, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(66, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(67, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(68, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(69, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(70, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(71, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(72, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(73, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(74, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(75, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(76, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(77, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(78, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(79, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758),
(80, 'OKKK', 'admin3', 'London', 'note', 0, 51.5074, -0.127758);

-- --------------------------------------------------------

--
-- Table structure for table `userRefreshTokenExt`
--

CREATE TABLE `userRefreshTokenExt` (
  `User_ID` text NOT NULL,
  `rfToken` text NOT NULL,
  `rdt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userRefreshTokenExt`
--

INSERT INTO `userRefreshTokenExt` (`User_ID`, `rfToken`, `rdt`) VALUES
('3', 'aUszblzD4AgAxRLAxdUkPwSPh0aGvWzAezFIVeFxckfpZq9ZDjgXGKOJrmqWNkxlVTf7Skevr3vMkhv2', '2018-11-07 13:21:35'),
('1', 'AmURM92uKYG3NYxorGwytVsDCbDI9jWTkOWWy6VWLtJemQMKKKwQLyKbSUYvQe0hshM2bDmISl7yLheK', '2018-11-07 15:39:32'),
('2', '7TB5y8VijpWhff5Sz2wmILRYddJEsLiZYPPQFO9z0dEFXPeta4BK3R4e7g0w1qOHYVRbLoOvCVSiOxqc', '2018-11-07 17:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Name` text NOT NULL,
  `Password` text NOT NULL,
  `AccountType_ID` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Username`, `Name`, `Password`, `AccountType_ID`, `Status`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1),
(2, 'admin2', 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 1),
(3, 'admin3', 'admin3', '21232f297a57a5a743894a0e4a801fc3', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountTypes`
--
ALTER TABLE `accountTypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountTypes`
--
ALTER TABLE `accountTypes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
