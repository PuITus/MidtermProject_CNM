-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2018 at 09:52 PM
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

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`ID`, `Name`, `Phone`, `Adress`, `Note`, `Status`, `Latitude`, `Longitude`, `Driver_ID`, `Driver_lat`, `Driver_lng`) VALUES
(497, 'Ngô Minh Phụng', '1237015928', '24/13 Võ Văn Ngân', 'video 1', 4, 10.8525, 106.766, 18, 10.8672837, 106.76445949999993),
(498, 'Ngô Minh Phụng', '1237015928', '227 Đường Nguyễn Văn Cừ, Phường 4, Quận 5, Hồ Chí Minh', 'video 2', 5, 10.7629, 106.681, -1, 0, NULL),
(501, 'Ngô Minh Phụng', '1237015928', '227 Đường Nguyễn Văn Cừ, Phường 4, Quận 5, Hồ Chí Minh', 'video 3', 4, 10.7616, 106.68, 19, 10.8672837, 106.76445949999993),
(515, 'Ngô Minh Phụng', '1237015928', '24/13 Võ Văn Ngân', 'video 4', 5, 10.8525, 106.765, -1, 0, NULL),
(516, 'customer 1', '1237015928', '24/13 Võ Văn Ngân', '', 4, 10.8525, 106.765, 18, 10.8672837, 106.76445949999993),
(517, 'customer 2', '1237015928', '24/13 Võ Văn Ngân', '', 4, 10.8525, 106.765, 19, 10.8672837, 106.76445949999993),
(518, 'customer 3', '1237015928', '24/13 Võ Văn Ngân', '', 4, 10.8525, 106.765, 20, 10.8672837, 106.76445949999993),
(519, 'customer 4', '1237015928', '24/13 Võ Văn Ngân', '', 4, 10.8525, 106.765, 21, 10.8672837, 106.76445949999993);

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
('1', 'D4HW1WsCgOLD0ZOOnQbxMmWkgipo9b7TuWxLivDZUGdwXUh8WofqyLxiZirZKh9LdlHNnTuyHLqAgMKb', '2018-11-28 10:34:19'),
('10', 'bZIziCpGchIsQLpgRdI6U0yakQCha8VooPebkkKHqGuY5Tjr7NsTRm7vUGuX5yrntxexUpLBnGLQBajh', '2018-12-09 21:47:54'),
('14', '7XErRqsiMRBQ9uOKgyq6h5ijYVi3wP0lE4jKwWmmNDF7MgTaV9BA3rb64Pu7tG4N8Lzb70syZFeuj2qw', '2018-12-09 21:47:58'),
('15', 'k7HISH1NGoSdFWDQcubUH2lr9jwjMgR63FD0xuoqZkkLS2ThcZSF6DPNKYCLzr8goWdOJzC5pBoUYnTE', '2018-12-09 22:10:40'),
('18', 'fQplSRORHUiKSwCniBISGVpsx7BsKaYHAkBwERViHZwQxr1fHtTlfmn6EAacGAS45ajGkt45qaUrU27S', '2018-12-09 22:10:48'),
('19', 'Hv0tViC664Yh3juDOmJTcE6MNrPHSueVj2XA34SKBa0tM60qHLvXREVumecGJq7dlLDkFH4LqSBsmEza', '2018-12-09 22:10:53'),
('20', 'rlkT3HV9wnfYhFWdD9dIp5TCxpW6e61lWwmE3ExFfJorHB0N9cBZZdybLHpevkakm5ZyCGdHldSCFvVC', '2018-12-09 22:10:59'),
('21', 'c9E2JyjiXkuGncoG9fMZKLx2uyXAwvOtT79mKQdc9ZZ42vjWJo3GV4jDHZ3fdxc50SSre76Z3sEaW45i', '2018-12-09 22:11:04'),
('22', 'DM0eNZYcmm3lsxmeNmGVbz8fasShPwyVE86euLnQEIt9Vvwh041a6RfniI2DvOrJBUt6GDZFkQPWFc0z', '2018-12-09 22:13:15');

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
(10, 'receiver1', 'Receiver 1', '21232f297a57a5a743894a0e4a801fc3', 1, 1),
(11, 'receiver2', 'Receiver 2', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(12, 'receiver3', 'Receiver 3', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(13, 'receiver4', 'Receiver 4', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(14, 'identifier1', 'Identifier 1', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(15, 'identifier2', 'Identifier 2', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(16, 'identifier3', 'Identifier 3', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(17, 'identifier4', 'Identifier 4', '21232f297a57a5a743894a0e4a801fc3', 2, 0),
(18, 'driver1', 'Driver 1', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(19, 'driver2', 'Driver 2', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(20, 'driver3', 'Driver 3', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(21, 'driver4', 'Driver 4', '21232f297a57a5a743894a0e4a801fc3', 3, 0),
(22, 'manager', 'Manager', '21232f297a57a5a743894a0e4a801fc3', 4, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=520;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
