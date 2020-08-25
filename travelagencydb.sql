-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: אוגוסט 25, 2020 בזמן 11:14 AM
-- גרסת שרת: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelagencydb`
--
CREATE DATABASE IF NOT EXISTS `travelagencydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `travelagencydb`;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `tbljourneys`
--

DROP TABLE IF EXISTS `tbljourneys`;
CREATE TABLE `tbljourneys` (
  `journeyNum` int(11) NOT NULL COMMENT 'מספר הטיול',
  `journeyName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'שם הטיול',
  `journeyDescription` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'תיאור המסלול',
  `journeyStartDate` date NOT NULL COMMENT 'תאריך התחלה',
  `journeyDuration` int(11) NOT NULL COMMENT 'משך הטיול',
  `journeyPrice` decimal(9,2) NOT NULL COMMENT 'מחיר ליחיד',
  `journeyKosher` enum('ל','כ') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'כשר',
  `journeyAudienceCode` enum('מיטיבי לכת','משפחות עם ילדים','מתאים לכולם','פנסיונרים','מחפשים חברה','אחרי צבא') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'קוד קהל יעד'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `tblorders`
--

DROP TABLE IF EXISTS `tblorders`;
CREATE TABLE `tblorders` (
  `orderNum` int(11) NOT NULL COMMENT 'מספר הזמנה',
  `orderUserNum` int(11) NOT NULL COMMENT 'מספר משתמש ',
  `orderJourneyNum` int(11) NOT NULL COMMENT 'מספר טיול',
  `orderQuantity` int(11) NOT NULL COMMENT 'כמות מוזמנת',
  `orderDate` date NOT NULL COMMENT 'תאריך הזמנה'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
CREATE TABLE `tblusers` (
  `userNum` int(11) NOT NULL COMMENT 'מספר סידורי',
  `userEmail` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'מייל',
  `userPassword` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'סיסמא',
  `userType` enum('ל','מ') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ל' COMMENT 'סוג משתמש',
  `userRealname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'שם אמיתי'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `tblusers`
--

INSERT INTO `tblusers` (`userNum`, `userEmail`, `userPassword`, `userType`, `userRealname`) VALUES
(1, 'yoavous@gmail.com', '123456', 'מ', 'יואב ליברמן'),
(2, 'etaylib@gmail.com', '12121212', 'ל', 'איתי ליברמן'),
(3, 'ayy@lmao.kek', '010101', 'ל', 'Ayy'),
(4, 'gaben@valvesoftware.com', 'hl3confirm', 'ל', 'Gabe'),
(5, 'setag.llib@coldmail.com', 'wind0wz', 'ל', 'setag'),
(6, 'email@elderscrollsonline.com', 'eso2020', 'ל', 'Gina'),
(7, 'johndoe@aol.com', '1812420', 'ל', 'john'),
(8, 'zucc@facebook.com', '42691337', 'ל', 'Zucc'),
(9, 'test@coldmail.com', '12341', 'ל', 'testy test'),
(10, 'liberman.yoav@live.biu.ac.il', '121212', 'מ', 'יואב ליברמן');

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `tbljourneys`
--
ALTER TABLE `tbljourneys`
  ADD PRIMARY KEY (`journeyNum`);

--
-- אינדקסים לטבלה `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`orderNum`),
  ADD KEY `orderUserNum` (`orderUserNum`),
  ADD KEY `orderJourneyNum` (`orderJourneyNum`);

--
-- אינדקסים לטבלה `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`userNum`),
  ADD UNIQUE KEY `emlKy` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbljourneys`
--
ALTER TABLE `tbljourneys`
  MODIFY `journeyNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר הטיול';

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `orderNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר הזמנה';

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `userNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר סידורי', AUTO_INCREMENT=11;

--
-- הגבלות לטבלאות שהוצאו
--

--
-- הגבלות לטבלה `tblorders`
--
ALTER TABLE `tblorders`
  ADD CONSTRAINT `tblorders_ibfk_1` FOREIGN KEY (`orderUserNum`) REFERENCES `tblusers` (`userNum`),
  ADD CONSTRAINT `tblorders_ibfk_2` FOREIGN KEY (`orderJourneyNum`) REFERENCES `tbljourneys` (`journeyNum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
