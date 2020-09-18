<?php
require_once 'mydbfunc.php';
$err = '';
$succ = '';
$orderJourneyNum = '';
$now = new DateTime();
$date = $now->modify('+10 day')->format('d/m/Y');
session_start();
if ($_SESSION["usr_type"] != "ל") {
    header("Location: index.html");
    die;
}
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $orderJourneyNum = $_POST['deleteOrder'];
    if (deleteOrder($orderJourneyNum) != 0) {
        $succ = "מחיקה הצליחה";
    }
}
$tripdtls = joinedTours($_SESSION['usr_num']);
$err = "לא נמצאו טיולים ברשות המשתמש!";
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LT - UserTours</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-usertour.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php require_once 'menu.php'; ?>       
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>    
        <form method="post" onsubmit="return confirm('האם אתה בטוח שברצונך לבטל הרשמתך לטיול?')">
            <?php if ($tripdtls): ?>
                <table>
                    <caption>טיולים שנרשמת אליהם</caption>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>מספר טיול</th>
                        <th>שם הטיול</th>
                        <th>תאריך יציאה</th>
                        <th>כמות בהזמנה</th>
                        <th>סה"כ לתשלום</th>
                    </tr>  
                    <?php foreach ($tripdtls as $row) : ?>
                        <tr>
                            <td><input type=button class="button" onClick="location.href = 'updateorder.php?number=<?= $row['orderNum'] ?>'" value="עריכה"></td> 
                            <?php if ($date <= (new DateTime($row["journeyStartDate"]))->format('d/m/Y')) : ?>                
                                <td><button type = submit name = deleteOrder class = "button" value = "<?= $row['journeyNum'] ?>" >ביטול הרשמה</button></td>
                            <?php else: ?>
                                <td>לא ניתן לבטל את ההרשמה כעת!</td>
                            <?php endif ?>
                            <td><?= $row['journeyNum'] ?> </td>
                            <td><?= $row['journeyName'] ?></td>
                            <td> <?= (new DateTime($row["journeyStartDate"]))->format('d/m/Y') ?></td>
                            <td><?= $row['orderQuantity'] ?></td>
                            <td><?= $row['journeyPrice'] * $row['orderQuantity'] ?>$</td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <div class="error"><?= $err ?></div>
            <?php endif ?>
        </form>
    </body>
</html>
