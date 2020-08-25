<?php

$dsn = 'mysql:host=localhost;dbname=travelagencydb';
$username = 'root';
$password = '';
$tourType = ['1' => 'מיטבי לכת', '2' => 'משפחות עם ילדים', '3' => 'מתאים לכולם', '4' => 'פנסיונרים', '5' => 'מחפשים חברה', '6' => 'אחרי צבא',];
try {
    $db = new PDO($dsn, $username, $password, array(PDO::MYSQL_ATTR_FOUND_ROWS => true));
    $db->exec("set NAMES utf8");
//  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "db connection open failed due: " . $e->getMessage();
    exit();
}

function getUserCredentials($uid, $pwd) {
    global $db;
    $query_text = "SELECT `userNum`,`userRealname`,`userType`"
            . "FROM `tblusers`"
            . "WHERE `userEmail`=:uid AND `userPassword`=:pwd";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':uid', $uid);
        $cmd->bindValue(':pwd', $pwd);
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
    $query_text = "insert into tblusers (userEmail,userPassword,userRealname) " . "values (:ulogin,:upwd,:urlnm)";
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
    $query_text = "insert into tbljourneys (journeyName,journeyDescription,journeyStartDate,journeyDuration,journeyPrice,journeyKosher,journeyAudienceCode) " . "values (:name,:desc,:startDate,:duration,:price,:kosher, :AudienceCode)";
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
function getUsrDtlsByNum($usrnum) {
    global $db;
    $query_text = "SELECT * "
            . "FROM tblusers "
            . "WHERE `userNum`=:unum"; 
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':unum', $usrnum);
        $cmd->execute();
        $result = $cmd->fetch();
        return $result;
    } catch (PDOException $ex) {
        echo "getUsrDtlsByNum failed due: " . $ex->getMessage();
        exit();
    }
}
function updtUsrByNum($usrnum, $newpwd) {
    global $db;
    $query_text = "UPDATE tblusers"
            . " SET `userPassword`=:newpwd" 
            . " WHERE `userNum`=:unum";
    try {
        $cmd = $db->prepare($query_text);
        $cmd->bindValue(':unum', $usrnum);
        $cmd->bindValue(':newpwd', $newpwd);
        $cmd->execute();
        $rowcount = $cmd->rowCount();
        return $rowcount;
    } catch (PDOException $ex) {
        echo "updtUsrByNum  failed, due: " . $ex->getMessage();
        exit();
    }    
}