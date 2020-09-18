<?php

$dsn = 'mysql:host=localhost;dbname=travelagencydb';
$username = 'root';
$password = '';
$journeyType = ['1' => 'מיטבי לכת', '2' => 'משפחות עם ילדים', '3' => 'מתאים לכולם', '4' => 'פנסיונרים', '5' => 'מחפשים חברה', '6' => 'אחרי צבא',];
try {
    $db = new PDO($dsn, $username, $password, array(PDO::MYSQL_ATTR_FOUND_ROWS => true));
    $db->exec("set NAMES utf8");
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "db connection open failed due: " . $e->getMessage();
    exit();
}

function getUserCredentials($uid) {
    global $db;
    $query_text = "SELECT *"
            . "FROM `tblusers`"
            . "WHERE `userEmail`=:uid";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':uid', $uid);
        $cmd->execute();
        $result = $cmd->fetch();
        return $result;
    } catch (PDOException $ex) {
        echo "getUserCredentials failed due: " . $ex->getMessage();
        exit();
    }
}

function addUser($uid, $pwd, $realname) {
    global $db;
    $query_text = "INSERT INTO `tblusers` (`userEmail`,`userPassword`,`userRealname`) "
            . "values (:ulogin,:upwd,:urlnm)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':ulogin', $uid);
        $cmd->bindValue(':upwd', $pwd);
        $cmd->bindValue(':urlnm', $realname);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        If ($rowcount == 0) {
            return 0;
        } else {
            return $db->lastInsertId();
        }
    } catch (PDOException $ex) {
        echo "addUser  failed, due: " . $ex->getMessage();
        exit();
    }
}

function addTour($name, $desc, $startDate, $duration, $price, $kosher, $AudienceCode) {
    global $db;
    $query_text = "INSERT INTO `tbljourneys` (`journeyName`,`journeyDescription`,`journeyStartDate`,`journeyDuration`,`journeyPrice`,`journeyKosher`,`journeyAudienceCode`) "
            . "values (:name,:desc,:startDate,:duration,:price,:kosher,:AudienceCode)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':name', $name);
        $cmd->bindValue(':desc', $desc);
        $cmd->bindValue(':startDate', $startDate);
        $cmd->bindValue(':duration', $duration);
        $cmd->bindValue(':price', $price);
        $cmd->bindValue(':kosher', $kosher);
        $cmd->bindValue(':AudienceCode', $AudienceCode);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        If ($rowcount == 0) {
            return 0;
        } else {
            return $db->lastInsertId();
        }
    } catch (PDOException $ex) {
        echo "addTour  failed, due: " . $ex->getMessage();
        exit();
    }
}

function getUserDtlsByNum($usrnum) {
    global $db;
    $query_text = "SELECT * "
            . "FROM `tblusers` "
            . "WHERE `userNum`=:unum";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':unum', $usrnum);
        $cmd->execute();
        $result = $cmd->fetch();
        return $result;
    } catch (PDOException $ex) {
        echo "getUserDtlsByNum failed due: " . $ex->getMessage();
        exit();
    }
}

function updatePassword($usrnum, $hashed_pwd) {
    global $db;
    $query_text = "UPDATE `tblusers`"
            . " SET `userPassword`=:hash"
            . " WHERE `userNum`=:unum";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':unum', $usrnum);
        $cmd->bindValue(':hash', $hashed_pwd);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        return $rowcount;
    } catch (PDOException $ex) {
        echo "updatePassword failed, due: " . $ex->getMessage();
        exit();
    }
}

function userTours($usrnum, $desc) {
    global $db;
    $query_text = "SELECT *  "
            . "FROM `tbljourneys` "
            . "WHERE `journeyStartDate` > CURDATE() "
            . "AND `journeyDescription` LIKE :desc "
            . "AND `journeyNum` NOT IN (SELECT `orderJourneyNum` FROM `tblorders` "
            . "WHERE `orderUserNum`=:activeuser)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':activeuser', $usrnum);
        $cmd->bindValue(':desc', '%' . $desc . '%');
        $cmd->execute();
        $result = $cmd->fetchAll();
        return $result;
    } catch (PDOException $ex) {
        echo "userTours failed due: " . $ex->getMessage();
        exit();
    }
}

function currentTour($journeyNum) {
    global $db;
    $query_text = "SELECT *  "
            . "FROM `tbljourneys` "
            . "WHERE `journeyNum`=:journeyID";

    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':journeyID', $journeyNum);
        $cmd->execute();
        $result = $cmd->fetchAll();
        return $result;
    } catch (PDOException $ex) {
        echo "currentTour failed due: " . $ex->getMessage();
        exit();
    }
}

function joinTour($orderQuantity, $journeyNum) {
    global $db;
    $query_text = "INSERT INTO `tblorders` (`orderUserNum`,`orderJourneyNum`,`orderQuantity`) "
            . "values (:orderUserNum,:orderJourneyNum,:orderQuantity)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':orderUserNum', $_SESSION['usr_num']);
        $cmd->bindValue(':orderJourneyNum', $journeyNum);
        $cmd->bindValue(':orderQuantity', $orderQuantity);

        $cmd->execute();
        $rowcount = $cmd->rowCount();
        If ($rowcount == 0) {
            return 0;
        } else {
            return $db->lastInsertId();
        }
    } catch (PDOException $ex) {
        echo "joinTour  failed, due: " . $ex->getMessage();
        exit();
    }
}

function adminTours() {
    global $db;
    $query_text = "SELECT *  "
            . "FROM `tbljourneys` "
            . "WHERE `journeyStartDate` > CURDATE() "
            . "AND `journeyNum` NOT IN (SELECT `orderJourneyNum` FROM tblorders)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->execute();
        $result = $cmd->fetchAll();
        return $result;
    } catch (PDOException $ex) {
        echo "adminTours failed due: " . $ex->getMessage();
        exit();
    }
}

function deleteTour($journeyNum) {
    global $db;
    $query_text = "DELETE "
            . "FROM `tbljourneys` "
            . "WHERE `journeyNum`=:journeyID";
    "AND `journeyNum` NOT IN (SELECT `orderJourneyNum` FROM `tblorders`)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':journeyID', $journeyNum);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        return $rowcount;
    } catch (PDOException $ex) {
        echo "deleteTour failed, due: " . $ex->getMessage();
        exit();
    }
}

function updateTour($journeyNum, $name, $desc, $startDate, $duration, $price, $kosher, $AudienceCode) {
    global $db;
    $query_text = "UPDATE `tbljourneys`"
            . "SET `journeyName`=:name,`journeyDescription`=:desc,`journeyStartDate`=:startDate,`journeyDuration`=:duration,`journeyPrice`=:price,`journeyKosher`=:kosher,`journeyAudienceCode`=:AudienceCode"
            . "WHERE `journeyNum`=:journeyID";
    "AND `journeyNum` NOT IN (SELECT `orderJourneyNum` FROM `tblorders`)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':journeyID', $journeyNum);
        $cmd->bindValue(':name', $name);
        $cmd->bindValue(':desc', $desc);
        $cmd->bindValue(':startDate', $startDate);
        $cmd->bindValue(':duration', $duration);
        $cmd->bindValue(':price', $price);
        $cmd->bindValue(':kosher', $kosher);
        $cmd->bindValue(':AudienceCode', $AudienceCode);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        return $rowcount;
    } catch (PDOException $ex) {
        echo "updateTour  failed, due: " . $ex->getMessage();
        exit();
    }
}

function joinedTours($usrnum) {
    global $db;
    $query_text = "SELECT *"
            . "FROM `tbljourneys`"
            . "INNER JOIN `tblorders` 
ON `journeyNum`=`orderJourneyNum`"
            . "AND `journeyNum` IN (SELECT `orderJourneyNum` FROM `tblorders` "
            . "WHERE `orderUserNum`=:activeuser)";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':activeuser', $usrnum);
        $cmd->execute();
        $result = $cmd->fetchAll();
        return $result;
    } catch (PDOException $ex) {
        echo "joinedTours failed due: " . $ex->getMessage();
        exit();
    }
}

function deleteOrder($orderJourneyNum) {
    global $db;
    $query_text = "DELETE "
            . "FROM `tblorders` "
            . "WHERE `orderJourneyNum`=:journeyID";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':journeyID', $orderJourneyNum);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        return $rowcount;
    } catch (PDOException $ex) {
        echo "deleteTour failed, due: " . $ex->getMessage();
        exit();
    }
}
function updateOrder($orderNum, $orderQuantity) {
    global $db;
    $query_text = "UPDATE `tblorders`"
            . "SET `orderQuantity`=:orderQuantity"
            . "WHERE `orderNum`=:orderID";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':orderID', $orderNum);
        $cmd->bindValue(':orderQuantity', $orderQuantity);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        return $rowcount;
    } catch (PDOException $ex) {
        echo "updateOrder  failed, due: " . $ex->getMessage();
        exit();
    }
}
