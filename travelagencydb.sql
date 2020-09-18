-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: ספטמבר 18, 2020 בזמן 11:21 AM
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
  `journeyKosher` enum('לא','כן') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'כשר',
  `journeyAudienceCode` enum('מיטיבי לכת','משפחות עם ילדים','מתאים לכולם','פנסיונרים','מחפשים חברה','אחרי צבא') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'קוד קהל יעד'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `tbljourneys`
--

INSERT INTO `tbljourneys` (`journeyNum`, `journeyName`, `journeyDescription`, `journeyStartDate`, `journeyDuration`, `journeyPrice`, `journeyKosher`, `journeyAudienceCode`) VALUES
(1, 'ספארי לפלנד', 'דמיינו ממלכה קסומה שעוטה שלג, כולה לבנה ורק את צמרות העצים המוריקות ניתן לראות. בתי מגורים שגגות הרעפים שלהם גם הם לבנים וכבדים מהשלג, משובצים בדלילות. יערות לבנים וצפופים, עם דרכים מושלגות מזמינות אתכם מכל פינה. בעלי חיים בעלי פרווה סמיכה ונעימה, כמו איילי שלג, שועלים לבנים וכלבי האסקי מצפים בהתרגשות לפגוש אתכם – ובשעות החשיכה, השמיים רוקדים בסחרור של צבעים – אלו הם אורות הזוהר הצפוני, שיש שיאמרו כי הם התופעה העל טבעית ביותר שעין אנושית יכולה לצפות בה.\r\n\r\nזה אולי תיאור שנשמע כאילו לקוח מספרי האגדות – אבל זה בדיוק מה שמחכה לכם בסדרה של טיולים מאורגנים ללפלנד, צאו להרפתקה קסומה בלפלנד – ארץ השלג שהיא לא כמו שום דבר שראיתם.', '2021-03-20', 7, '2000.00', 'לא', 'מיטיבי לכת'),
(2, 'היער השחור', 'טיול מאורגן ליער השחור הוא טיול באחד האזורים היפים ביותר בגרמניה. על אף שמו המאיים, טיול ליער השחור מצטייר דווקא כאחת הפעילויות היותר יפות ומעניינות שיש לגרמניה להציע. חבל הארץ הנמצא בדרום מערב גרמניה, על הגבול עם שוויץ וצרפת, הוציא לעצמו שם בזכות הנופים היפים, העיירות הציוריות והכפרים הפסטורליים שבדרך...\r\n\r\n', '2020-10-10', 9, '2666.00', 'כן', 'משפחות עם ילדים'),
(3, 'דרום אמריקה', 'הנופים המסעירים, התרבויות העתיקות, האתרים הארכיאולוגיים, תופעות הטבע המופלאות, הקצב הלטיני, הקרנבל הברזילאי, הכדורגל הסוחף, המטבח האקזוטי שמגרה את החושים, או בשתי מילים שאומרות את הכול – דרום אמריקה. כן כן, היבשת הרביעית בגודלה מספקת בנדיבות את החומרים מהם מורכב טיול בלתי נשכח. טיול מאורגן לדרום אמריקה מפעיל את כל החושים, עם מראות הנופים האדירים מאגן האמזונס ועד לפטגוניה, ריחות הקפה הקולומביאני, טעמי הבשר הארגנטינאי והסביצ’ה הפרואני, צלילי המוסיקה של תופי הקרנבל ומוסיקת הטנגו, ורעמם של מפלי האיגואסו האדירים.', '2021-01-01', 25, '5555.00', 'כן', 'אחרי צבא'),
(4, 'יפן בתקופת השלכת', 'בין אווירה אניגמטית ועתיקת יומין, לעושר מודרני מוגזם וחסר פרופורציות; בין תרבויות היסטוריות שלא נפגעו במרוצת השנים, למקומות שנראים כאילו זה עתה נלקחו מתוך ספר הרפתקאות; בין הירוק של הטבע והכחול של הים אל השווקים התוססים; בין רחובות דחוסים ורועשים למקדשים תמירים בעלי כיפות זהובות. ברוכים הבאים למזרח אסיה המציגה סתירות חריגות השזורות האחת בשנייה במארג בלתי מובן, אך בה בעת כזו המציעה עבור המטיילים במחוזותיה חוויות מעוררות התרגשות.', '2020-09-30', 19, '3888.00', 'כן', 'פנסיונרים'),
(5, 'טור דה פראנס', 'המולדת של הקרואסון והבגט, הגבינות האיכותיות והיינות המעודנים, היא ללא ספק אחת הרומנטיות, האנינות, העשירות והמספקות הקיימות באירופה.\r\n\r\nצרפת מציעה תמהיל מושך של עיירות היסטוריות ציוריות, נופים עוצרי נשימה וערים עשירות בתרבות, באומנות, באוכל טוב ובחיי לילה. הבולטת מבין הערים במדינה היא כמובן פאריס – אחת הערים המפורסמות בעולם, מקום משכנם של מלכי וקיסרי צרפת בזמנים מוקדמים והממשל הצרפתי בהווה. הטיול המאורגן בעיר לא פוסח על האטרקציות המרכזיות שבה: כיכר האופרה, כיכר קונקורד, שדרות שאנז אליזה ושער הניצחון, נהר הסיין, בית העירייה המרשים, מרכז פומפידו, גני טיולרי, קתדרלת נוטרדאם, פארק השעשועים הגדול אסטריקס ובו מופעי אקרובטיקה, מוזיקה וריקודים, גבעת מונמרטר ועוד רבות נוספות.\r\n\r\nהטיולים המאורגנים לצרפת מגוונים ומותאמים לאופי המטיילים והעניין במדינה. בין אם בביקור חד פעמי או בביקורים חוזרים, אנחנו נדאג כי גם אתם תאהבו אותה תמיד.', '2020-10-12', 10, '2789.00', 'כן', 'מחפשים חברה'),
(6, 'אמריקן ביוטי', 'ה-Coast to coast הקלסי: טיול שמאפשר לכם לחוות את תמצית החלום האמריקאי בעשרים יום. נפתח את הטיול בלוס אנג\'לס המסעירה בצדה המערבי של ארצות הברית לחופי האוקיינוס השקט, ונסיים אותו בתפוח הגדול של ניו יורק על גדות האוקיינוס האטלנטי. בין שתי הערים הנפלאות האלו נטעם מהפסיפס הנופי והתרבותי של ארצות הברית. בגזרת אתרי הטבע הבלתי נשכחים נבקר, בין היתר, בגרנד קניון, יוסמיטי פארק ומפלי הניאגרה. בנוסף, נחווה מהעושר התרבותי והמורשת ההיסטורית של אמריקה ונבקר בערים מרתקות כמו סן פרנסיסקו, וושינגטון וסאן דייגו ובאטרקציות כמו לאס וגאס ועיר הרפאים של \'המערב הפרוע\' קליקו.\r\n\r\n', '2020-10-04', 25, '4776.00', 'כן', 'מתאים לכולם'),
(7, 'גן העדן של המפרץ הפרסי', 'בטיולנו נגלה נוף משתנה במהירות של ערים בעלות נוף אורבני עתידני לצד מדבריות נידחות, נווה דקלים, חופים מרהיבי עין ועוד. בטיולנו נבקר בבירה אבו דאבי הגדולה שבאמירויות ומקום מושבם של מוסדות השלטון בעלי הארכיטקטורה חדשנית , נבקר מוזיאון הלובר המקומי ובמסגד שייח\' זאיד . בדובאי המפורסמת והתוססת המכונה גם \"עיר הזהב\" נעלה לתצפית ממגדל בורג\' חליפה, נבקר בשווקים הצבעונים , ונערוך ספארי ג\'יפים לדיונות המדבר ועוד ועוד .\r\n\r\n', '2020-10-31', 7, '2500.00', 'כן', 'מיטיבי לכת'),
(8, 'נופים וערים באפריקה', 'דרום אפריקה, המדינה היפהייפיה הזו הנמצאת בקצה הדרומי של היבשת המפוארת, היא אטרקציית טבע ראשונה במעלה. המטיילים במדינה נחשפים למגוון של מינים, מההיפופוטמים בנהר לימפופו ועד הפינגווינים בכף התקווה הטובה ובדרך, חיי הפרא בסוואנה. בעלי החיים משתלבים בנופים עוצרי נשימה: מדבריות, הרים, מפרצים ושמורות טבע מדהימות.\r\n\r\nאת החוויה הדרום אפריקאית בטיול משלימים ערים מודרניות עם אוכל טוב וחיי לילה כמו קייפטאון ויוהנסבורג ולעומתן, כפרים של שבטי מקומיים כמו שבט הזולו המקפידים לשמור על התרבות הייחודית להם.\r\n\r\nכל אלה ועוד הופכים את דרום אפריקה ליעד מומלץ במיוחד, במרחק נסיעה קצר של 9 שעות מישראל.\r\n\r\n', '2020-11-11', 15, '3000.00', 'כן', 'מתאים לכולם'),
(9, 'טיול שיצא כבר', 'בדיקה', '2020-08-29', 14, '55.00', 'לא', 'מיטיבי לכת'),
(10, 'טיול ערוך', 'דגכגכגעג', '2020-09-25', 12, '22.00', 'לא', 'משפחות עם ילדים');

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
  `orderDate` date NOT NULL DEFAULT current_timestamp() COMMENT 'תאריך הזמנה'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 'test@coldmail.com', '$2y$10$TmfCxRAuVu7Wstl0SrVkX.0JrUqYeDbgC0RLlTH.iGt1W.8hG28qO', 'ל', 'testy test'),
(10, 'liberman.yoav@live.biu.ac.il', '$2y$10$0qoOFFfxGnwPxWziePEOxOtX3/AesHTaQMEMLFBYdlu64IKWym6/W', 'מ', 'יואב ליברמן'),
(11, 'tcook@apple.com', '$2y$10$Uv9ilfvRf2/tohLQjBk3BOynzEOtC44r4OwUE4HZex3KCkrIG4Q16', 'ל', 'Tim Apple');

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
  MODIFY `journeyNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר הטיול', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `orderNum` int(11) NOT NULL AUTO_INCREMENT COMMENT 'מספר הזמנה';

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
