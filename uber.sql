-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2018 at 04:43 AM
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
  `Longitude` float NOT NULL,
  `Driver_ID` int(11) NOT NULL DEFAULT '-1',
  `Driver_lat` double NOT NULL,
  `Driver_lng` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('9', 'PJpBI8kLVpheSGoXj3LEeVDIA6lKA23GUY8N63CFMqGLbu0UIrI7bVnzRAAQD26M9xg1fWOurHXYy6SH', '2018-11-25 23:47:23'),
('3', 'zMOaygVfj9Yp2uuyyToIsXyi2afXVZ9rE0UlABtO9ukjvQJhnvcRY59JZVqT8FpuMyWAtPLVi70Ni2y3', '2018-11-26 00:09:22'),
('2', '9kQoVmAdfRwjkqGKEoQUFj4qYFawTSzEkakm7I7pOSMa6rMwDNggD6cqmx3Xu9za3oO2Dabui4iDN8Cz', '2018-11-26 00:09:36'),
('1', 'D4HW1WsCgOLD0ZOOnQbxMmWkgipo9b7TuWxLivDZUGdwXUh8WofqyLxiZirZKh9LdlHNnTuyHLqAgMKb', '2018-11-28 10:34:19');

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
(10, 'receiver1', 'receiver1', '21232f297a57a5a743894a0e4a801fc3', 1, 1),
(11, 'receiver2', 'receiver2', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(12, 'receiver3', 'receiver3', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(13, 'receiver4', 'receiver4', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(14, 'identifer1', 'identifer1', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(15, 'identifer2', 'identifer2', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(16, 'identifer3', 'identifer3', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(17, 'identifer4', 'identifer4', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(18, 'driver1', 'driver1', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(19, 'driver2', 'driver2', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(20, 'driver3', 'driver3', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(21, 'driver4', 'driver4', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(22, 'manager', 'manager', '21232f297a57a5a743894a0e4a801fc3', 4, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userRefreshTokenExt`
--
ALTER TABLE `userRefreshTokenExt`
  ADD UNIQUE KEY `ID` (`User_ID`(20));

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
