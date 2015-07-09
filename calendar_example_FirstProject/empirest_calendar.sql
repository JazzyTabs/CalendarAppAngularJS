-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2015 at 11:44 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `empirest_calendar`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `calendar_entry_INS`(IN id INTEGER)
BEGIN
INSERT INTO tbl_calendar_entry(calendar_entry_endDate,calendar_entry_startDate,created, dev_Color)
VALUES(calendar_entry_endDate,calendar_entry_startDate,created, dev_Color);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `calendar_entry_SEL`()
BEGIN
SELECT * FROM tbl_calendar_entry;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `developer_INS`(IN `id` INT)
BEGIN
INSERT INTO tbl_developer(created,developer_Name) 
VALUES(created, developer_Name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `joinTry`()
BEGIN
SELECT tbl_calendar_entry.ID, tbl_calendar_entry.calendar_entry_startDate, tbl_calendar_entry.calendar_entry_endDate,  tbl_calendar_entry.dev_Color,tbl_calendar_entry.created,tbl_project.project_Name
FROM tbl_calendar_entry
INNER JOIN tbl_project
ON tbl_calendar_entry.project=tbl_project.ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `project_INS`(IN PROJECT_NAME TEXT)
BEGIN
INSERT INTO tbl_project(project_Name) VALUES(PROJECT_NAME);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `user_INS`(IN `Name` VARCHAR(255), IN `Email` VARCHAR(255), IN `Role` INT)
BEGIN
INSERT INTO tbl_user(user_Name,user_Email,user_Role) VALUES(Name,Email,Role);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_calendar_entry`
--

CREATE TABLE IF NOT EXISTS `tbl_calendar_entry` (
  `ID` int(11) NOT NULL,
  `calendar_entry_startDate` date DEFAULT NULL,
  `calendar_entry_endDate` date DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `dev_Color` varchar(45) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_calendar_entry`
--

INSERT INTO `tbl_calendar_entry` (`ID`, `calendar_entry_startDate`, `calendar_entry_endDate`, `project`, `dev_Color`, `created`) VALUES
(1, '2015-06-25', '2015-06-26', 5, '#1E925C', '2015-06-23 20:35:22'),
(2, '2015-06-08', '2015-06-09', 6, '#4D80C4', '2015-06-23 20:35:22'),
(3, '2015-06-02', '2015-06-03', 3, '#500000', '2015-06-23 22:37:11'),
(4, '2015-06-04', '2015-06-05', 4, '#433F3F', '2015-06-23 22:37:11'),
(5, '2015-06-10', '2015-06-13', 2, '#EB1717', '2015-06-24 06:18:22'),
(6, '2015-06-08', '2015-06-13', 5, '#2617EB', '2015-06-24 06:20:21'),
(7, '2015-06-15', '2015-06-20', 3, '#17EF6A', '2015-06-24 06:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_developer`
--

CREATE TABLE IF NOT EXISTS `tbl_developer` (
  `ID` int(11) NOT NULL,
  `develper_Name` varchar(45) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_developer`
--

INSERT INTO `tbl_developer` (`ID`, `develper_Name`, `created`) VALUES
(1, 'Matsobane', '2015-06-23 10:24:23'),
(2, 'Geoff', '2015-06-23 06:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

CREATE TABLE IF NOT EXISTS `tbl_project` (
  `ID` int(11) NOT NULL,
  `project_Name` varchar(45) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`ID`, `project_Name`, `created`) VALUES
(1, NULL, NULL),
(2, 'ABSA', '0000-00-00 00:00:00'),
(3, 'Netbank', '0000-00-00 00:00:00'),
(4, 'Maono', '0000-00-00 00:00:00'),
(5, 'THABANG', '0000-00-00 00:00:00'),
(6, 'FNB', '2015-06-23 20:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `ID` int(11) NOT NULL,
  `user_Name` varchar(45) NOT NULL,
  `user_Email` varchar(45) NOT NULL,
  `user_Role` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `user_Name`, `user_Email`, `user_Role`, `created`) VALUES
(4, 'admin', 'admin@empirestate.co.za', 1, '0000-00-00 00:00:00'),
(5, 'George', 'george@empirestate.co.za', 2, '0000-00-00 00:00:00'),
(6, 'Kapoya', 'kapoya@yahoo.com', 1, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_calendar_entry`
--
ALTER TABLE `tbl_calendar_entry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_developer`
--
ALTER TABLE `tbl_developer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_calendar_entry`
--
ALTER TABLE `tbl_calendar_entry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_developer`
--
ALTER TABLE `tbl_developer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
