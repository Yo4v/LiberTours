<?php
require_once 'mydbfunc.php';
$err = '';
$succ = '';
session_start();
if ($_SESSION["usr_type"] != "מ") {
    header("Location: index.html");
    die;
}
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $journeyNum = $_POST['deleteTour'];
    if (deleteTour($journeyNum) != 0) {
        $succ = "מחיקה הצליחה";
    } else {
        $err = "מחיקה נכשלה";
    }
}
$tripdtls = adminTours();
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LT - TourList - Admin</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-touradmin.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php require_once 'menu.php'; ?>       
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>   
        <form method="post" onsubmit="return confirm('האם אתה בטוח שברצונך למחוק הטיול ממסד הנתונים?')">
            <table>
                <caption>טיולים זמינים</caption>
                <tr>
                    <th></th>
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
                        <td><input type=button class="button" onClick="location.href = 'updatetouradmin.php?id=<?= $row['journeyNum'] ?>'" value="עריכה"></td> 
                        <td><button type=submit name=deleteTour class="button2" value="<?= $row['journeyNum'] ?>" >מחיקה</button></td>
                        <td><?= $row['journeyName'] ?> </td>
                        <td> <?= (new DateTime($row["journeyStartDate"]))->format('d/m/Y') ?></td>
                        <td><?= $row['journeyDuration'] ?> ימים </td>
                        <td><?= $row['journeyPrice'] ?>$</td>
                        <td><?= $row['journeyKosher'] ?> </td>
                        <td><?= $row['journeyAudienceCode'] ?> </td>
                    </tr>
                <?php endforeach; ?>
            </table>
        </form>
    </body>
</html>
