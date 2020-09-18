<?php
require_once 'mydbfunc.php';
$err = '';
$succ = '';
$desc = '';
session_start();
if ($_SESSION["usr_type"] != "ל") {
    header("Location: index.html");
    die;
}
if ($_SERVER['REQUEST_METHOD'] === "GET") {
    $desc = trim(filter_input(INPUT_GET, 'desc', FILTER_SANITIZE_SPECIAL_CHARS));
}
$tripdtls = userTours($_SESSION['usr_num'], $desc);
$err = "הטיול עם התיאור לעיל לא נמצא במערכת!";
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LT - TourList</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-tourlist.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php require_once 'menu.php'; ?>       
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>    
        <form action="tourlist.php" method="get"> 
            <div class="searchBar">
                <input type="search" placeholder="חפש את הטיול המתאים עבורך!" name="desc" value="<?= $desc ?>">  
                <input type="submit" class="button" value="חפש"></div>
            <?php if ($tripdtls): ?>
                <table>
                    <caption>טיולים זמינים</caption>
                    <tr>
                        <th></th>
                        <th>שם הטיול</th>
                        <th>תאריך התחלה</th>
                        <th>אורך הטיול</th>
                        <th>מחיר</th>
                        <th>כשרות</th>
                        <th>קהל יעד</th>      
                    </tr>  
                    <?php foreach ($tripdtls as $row) : ?>
                        <tr>
                            <td><input type=button class="button" onClick="location.href = 'jointour.php?id=<?= $row['journeyNum'] ?>'" value="הרשמה"></td> 
                            <td><?= $row['journeyName'] ?> </td>
                            <td> <?= (new DateTime($row["journeyStartDate"]))->format('d/m/Y') ?></td>
                            <td><?= $row['journeyDuration'] ?> ימים </td>
                            <td><?= $row['journeyPrice'] ?>$</td>
                            <td><?= $row['journeyKosher'] ?> </td>
                            <td><?= $row['journeyAudienceCode'] ?> </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <div class="error"><?= $err ?></div>
            <?php endif ?>
        </form>
    </body>
</html>
