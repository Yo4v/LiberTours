-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: אוגוסט 30, 2020 בזמן 05:10 PM
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
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__bookmark`
--

DROP TABLE IF EXISTS `pma__bookmark`;
CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__central_columns`
--

DROP TABLE IF EXISTS `pma__central_columns`;
CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__column_info`
--

DROP TABLE IF EXISTS `pma__column_info`;
CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- הוצאת מידע עבור טבלה `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES
(1, 'travelagencydb', 'tbljourneys', 'journeyStartDate', '', '', 'output/text_plain_dateformat.php', '0,\'%d-%b-%Y\',\'local\'', '', ''),
(2, 'travelagencydb', 'tblorders', 'orderDate', '', '', 'output/text_plain_dateformat.php', '0,\'%d-%b-%Y\',\'local\'', '', '');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__designer_settings`
--

DROP TABLE IF EXISTS `pma__designer_settings`;
CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__export_templates`
--

DROP TABLE IF EXISTS `pma__export_templates`;
CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__favorite`
--

DROP TABLE IF EXISTS `pma__favorite`;
CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__history`
--

DROP TABLE IF EXISTS `pma__history`;
CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__navigationhiding`
--

DROP TABLE IF EXISTS `pma__navigationhiding`;
CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__pdf_pages`
--

DROP TABLE IF EXISTS `pma__pdf_pages`;
CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__recent`
--

DROP TABLE IF EXISTS `pma__recent`;
CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- הוצאת מידע עבור טבלה `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"travelagencydb\",\"table\":\"tbljourneys\"},{\"db\":\"travelagencydb\",\"table\":\"tblorders\"},{\"db\":\"travelagencydb\",\"table\":\"tblusers\"}]');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__relation`
--

DROP TABLE IF EXISTS `pma__relation`;
CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__savedsearches`
--

DROP TABLE IF EXISTS `pma__savedsearches`;
CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__table_coords`
--

DROP TABLE IF EXISTS `pma__table_coords`;
CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__table_info`
--

DROP TABLE IF EXISTS `pma__table_info`;
CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__table_uiprefs`
--

DROP TABLE IF EXISTS `pma__table_uiprefs`;
CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- הוצאת מידע עבור טבלה `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'travelagencydb', 'tbljourneys', '{\"sorted_col\":\"`tbljourneys`.`journeyDescription` ASC\"}', '2020-08-28 16:14:18'),
('root', 'travelagencydb', 'tblusers', '{\"sorted_col\":\"`userNum` ASC\"}', '2020-08-29 07:56:27');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__tracking`
--

DROP TABLE IF EXISTS `pma__tracking`;
CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__userconfig`
--

DROP TABLE IF EXISTS `pma__userconfig`;
CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- הוצאת מידע עבור טבלה `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-08-30 14:58:37', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"he\"}');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__usergroups`
--

DROP TABLE IF EXISTS `pma__usergroups`;
CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `pma__users`
--

DROP TABLE IF EXISTS `pma__users`;
CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- אינדקסים לטבלה `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- אינדקסים לטבלה `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- אינדקסים לטבלה `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- אינדקסים לטבלה `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- אינדקסים לטבלה `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- אינדקסים לטבלה `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- אינדקסים לטבלה `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- אינדקסים לטבלה `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- אינדקסים לטבלה `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- אינדקסים לטבלה `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- אינדקסים לטבלה `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- אינדקסים לטבלה `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- אינדקסים לטבלה `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- אינדקסים לטבלה `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- אינדקסים לטבלה `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- אינדקסים לטבלה `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- אינדקסים לטבלה `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- אינדקסים לטבלה `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
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
  `journeyKosher` enum('לא','כן') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'כשר',
  `journeyAudienceCode` enum('מיטיבי לכת','משפחות עם ילדים','מתאים לכולם','פנסיונרים','מחפשים חברה','אחרי צבא') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'קוד קהל יעד'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `tbljourneys`
--

INSERT INTO `tbljourneys` (`journeyNum`, `journeyName`, `journeyDescription`, `journeyStartDate`, `journeyDuration`, `journeyPrice`, `journeyKosher`, `journeyAudienceCode`) VALUES
(1, 'ספארי לפלנד', 'דמיינו ממלכה קסומה שעוטה שלג, כולה לבנה ורק את צמרות העצים המוריקות ניתן לראות. בתי מגורים שגגות הרעפים שלהם גם הם לבנים וכבדים מהשלג, משובצים בדלילות. יערות לבנים וצפופים, עם דרכים מושלגות מזמינות אתכם מכל פינה. בעלי חיים בעלי פרווה סמיכה ונעימה, כמו איילי שלג, שועלים לבנים וכלבי האסקי מצפים בהתרגשות לפגוש אתכם – ובשעות החשיכה, השמיים רוקדים בסחרור של צבעים – אלו הם אורות הזוהר הצפוני, שיש שיאמרו כי הם התופעה העל טבעית ביותר שעין אנושית יכולה לצפות בה.\r\n\r\nזה אולי תיאור שנשמע כאילו לקוח מספרי האגדות – אבל זה בדיוק מה שמחכה לכם בסדרה של טיולים מאורגנים ללפלנד, צאו להרפתקה קסומה בלפלנד – ארץ השלג שהיא לא כמו שום דבר שראיתם.', '2021-03-20', 7, '2000.00', 'לא', 'מיטיבי לכת'),
(2, 'היער השחור', 'טיול מאורגן ליער השחור הוא טיול באחד האזורים היפים ביותר בגרמניה. על אף שמו המאיים, טיול ליער השחור מצטייר דווקא כאחת הפעילויות היותר יפות ומעניינות שיש לגרמניה להציע. חבל הארץ הנמצא בדרום מערב גרמניה, על הגבול עם שוויץ וצרפת, הוציא לעצמו שם בזכות הנופים היפים, העיירות הציוריות והכפרים הפסטורליים שבדרך\r\n', '2020-09-09', 9, '1500.00', 'כן', 'מתאים לכולם'),
(3, 'דרום אמריקה', 'הנופים המסעירים, התרבויות העתיקות, האתרים הארכיאולוגיים, תופעות הטבע המופלאות, הקצב הלטיני, הקרנבל הברזילאי, הכדורגל הסוחף, המטבח האקזוטי שמגרה את החושים, או בשתי מילים שאומרות את הכול – דרום אמריקה. כן כן, היבשת הרביעית בגודלה מספקת בנדיבות את החומרים מהם מורכב טיול בלתי נשכח. טיול מאורגן לדרום אמריקה מפעיל את כל החושים, עם מראות הנופים האדירים מאגן האמזונס ועד לפטגוניה, ריחות הקפה הקולומביאני, טעמי הבשר הארגנטינאי והסביצ’ה הפרואני, צלילי המוסיקה של תופי הקרנבל ומוסיקת הטנגו, ורעמם של מפלי האיגואסו האדירים.\r\n\r\n', '2021-01-01', 25, '4000.00', 'לא', 'אחרי צבא'),
(4, 'יפן בתקופת השלכת\r\n', 'בין אווירה אניגמטית ועתיקת יומין, לעושר מודרני מוגזם וחסר פרופורציות; בין תרבויות היסטוריות שלא נפגעו במרוצת השנים, למקומות שנראים כאילו זה עתה נלקחו מתוך ספר הרפתקאות; בין הירוק של הטבע והכחול של הים אל השווקים התוססים; בין רחובות דחוסים ורועשים למקדשים תמירים בעלי כיפות זהובות. ברוכים הבאים למזרח אסיה המציגה סתירות חריגות השזורות האחת בשנייה במארג בלתי מובן, אך בה בעת כזו המציעה עבור המטיילים במחוזותיה חוויות מעוררות התרגשות.\r\n', '2020-10-10', 19, '3000.00', 'כן', 'פנסיונרים'),
(5, 'בדיקה', '1', '2020-08-20', 5, '555.00', 'לא', 'פנסיונרים');

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

--
-- הוצאת מידע עבור טבלה `tblorders`
--

INSERT INTO `tblorders` (`orderNum`, `orderUserNum`, `orderJourneyNum`, `orderQuantity`, `orderDate`) VALUES
(1, 9, 2, 2, '2020-08-27');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
CREATE TABLE `tblusers` (
  `userNum` int(11) NOT NULL COMMENT 'מספר סידורי',
  `userEmail` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'מייל',
  `userPassword` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'סיסמא',
  `userType` enum('ל','מ') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ל' COMMENT 'סוג משתמש',
  `userRealname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'שם אמיתי'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `tblusers`
--

INSERT INTO `tblusers` (`userNum`, `userEmail`, `userPassword`, `userType`, `userRealname`) VALUES
(1, 'yoavous@gmail.com', '$2y$10$27gw.ZXJ2xw06PUjLaBHIedSRTYjV5Nrgd3sRxWer5vSOToCsy1mW', 'מ', 'יואב ליברמן'),
(2, 'etaylib@gmail.com', '$2y$10$Jqk4oClvrN41eiJSgCcWY.GiAbhynBENSsG7v002S.eFF1fAsEX1G', 'ל', 'איתי ליברמן'),
(3, 'ayy@lmao.kek', '$2y$10$hbbFliY8zYpL/azj7xTJq.QTgp1SXA.wwwvXh2D9BGDFA3okh/Fi.', 'ל', 'Ayy'),
(4, 'gaben@valvesoftware.com', '$2y$10$Tp1pwdeZNwFFoWlnXhzoC.GbU1jPoglCmywSSg3LF9OXseS1Zlixe', 'ל', 'Gabe'),
(5, 'setag.llib@coldmail.com', '$2y$10$NfALrjAFdQHpQtnWzXumze/fJbC0YTK/7yVWHqvN6O3sqxJFaDMQK', 'ל', 'setag'),
(6, 'email@elderscrollsonline.com', '$2y$10$BR8V2.ne5Ar0S9njixgdveGm4V6mlKJjRxrCNhz4UJL0oy4Auk2w2', 'ל', 'Gina'),
(7, 'johndoe@aol.com', '$2y$10$jEhJBlHB6gYVMAO2ASq.sOIDOG6kuXoshowpSEoIXUPJCV8luC6sy', 'ל', 'john'),
(8, 'zucc@facebook.com', '$2y$10$CjXM8LBxbkKs7xyOsGh0bucBtrnw1I9eSbDRgyxah3aPthBsw30OG', 'ל', 'Zucc'),
(9, 'test@coldmail.com', '$2y$10$FU24ZdtiP68XfrFCnrS9ou0Io/5Omql02ua0T6xmiSiQYScHH34Rm', 'ל', 'testy test'),
(10, 'liberman.yoav@live.biu.ac.il', '$2y$10$0qoOFFfxGnwPxWziePEOxOtX3/AesHTaQMEMLFBYdlu64IKWym6/W', 'מ', 'יואב ליברמן'),
(11, 'tcook@apple.com', '$2y$10$XhPvO9EjoDfApmutAEj0UOnh0RvVdjJJ273zz99ZCFOh/F8qsOPXu', 'ל', 'Tim Apple');

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
  MODIFY `journeyNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר הטיול', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `orderNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר הזמנה', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `userNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר סידורי', AUTO_INCREMENT=12;

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
