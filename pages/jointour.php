<?php
require_once 'mydbfunc.php';
$orderQuantity = '';
$err = '';
$succ = '';
$journeyNum = $_GET['id'];
$currentTourDtls = currentTour($journeyNum);
$row = $currentTourDtls[0];
session_start();
if ($_SESSION["usr_type"] != "ל") {
    header("Location: index.html");
    die;
}
if ($_SERVER['REQUEST_METHOD'] === "POST") {
    $orderQuantity = trim(filter_input(INPUT_POST, 'quantity', FILTER_SANITIZE_SPECIAL_CHARS)) * 1;
    if (is_numeric($orderQuantity) || is_int($orderQuantity * 1) || $orderQuantity < 1) {

        $RegTour = joinTour($orderQuantity, $journeyNum);
        $succ = '<span>נרשמת לטיול בהצלחה!  
             <a href="usertour.php">לחץ כאן על מנת להמשיך</a></span>';
    } else {
        $err = "כמות נרשמים חייבת להיות מספר שלם וחיובי בלבד";
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LT - JoinTour</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-jointour.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php require_once 'menu.php'; ?>       
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>    
        <div class="jointour">
            <form method="post" action="jointour.php?id=<?= $row['journeyNum'] ?>" id="form">
                <fieldset>
                    <legend>רישום לטיול</legend>
                    <?php if ($orderQuantity): ?>
                        <div class="total"><label for="total">מחיר לתשלום:</label><input required type="text" id="total" name="total" readonly value="<?= $row['journeyPrice'] * $orderQuantity ?>$" /></div> 
                        <div class="succ"><?= $succ ?></div>
                    <?php else : ?>
                        <div class="input_form"><label for="name">כותרת הטיול</label><input required type="text" id="name" name="name" readonly value="<?= $row['journeyName'] ?>"/> </div>
                        <div class="input_form"><label for="startDate">תאריך התחלה</label><input required type="text" id="startDate" name="startDate" readonly value="<?= (new DateTime($row["journeyStartDate"]))->format('d/m/Y') ?>"/></div>
                        <div class="input_form"><label for="duration">אורך הטיול</label><input required type="text" id="duration" name="duration" readonly value="<?= $row['journeyDuration'] ?> ימים" /></div>
                        <div class="input_form"><label for="kosher">כשרות</label><input type="text" id="kosher" name="kosher" readonly value="<?= $row['journeyKosher'] ?>" /></div>
                        <div class="input_form"><label for="AudienceCode">קהל יעד</label><input id="AudienceCode" name="AudienceCode" readonly value="<?= $row['journeyAudienceCode'] ?>"/></div>
                        <div class="input_form"><label for="price">מחיר ליחיד</label><input required type="text" id="price" name="price" readonly value="<?= $row['journeyPrice'] ?>$" /></div>    
                        <div class="input_form"><label for="quantity">כמות מוזמנים</label><input required type="number" id="quantity" name="quantity" <?= $orderQuantity ?> placeholder="יש לבחור כמות מוזמנים!"/></div>  
                        <div class="action"><input type="submit" class="button" value="רישום לטיול"/></div>
                    </fieldset>
                </form>    
                <div class="image">
                    <?php
                    switch ($journeyNum) {
                        case 1:
                            echo '<img src="../images/tours/lapland.jpg" alt="lapland"/>';
                            break;
                        case 2:
                            echo '<img src="../images/tours/blackforest.jpg" alt="blackforest"/>';
                            break;
                        case 3:
                            echo '<img src="../images/tours/samerica.jpg" alt="samerica"/>';
                            break;
                        case 4:
                            echo '<img src="../images/tours/japan.jpg" alt="japan"/>';
                            break;
                        case 5:
                            echo '<img src="../images/tours/france.jpg" alt="paris"/>';
                            break;
                        case 6:
                            echo '<img src="../images/tours/ny.jpg" alt="usa"/>';
                            break;
                        case 7:
                            echo '<img src="../images/tours/uae.jpg" alt="uae"/>';
                            break;

                        case 8:
                            echo '<img src="../images/tours/africa.jpg" alt="africa"/>';
                            break;
                    }
                    ?>
                    <div class="desc"><label for="textarea">תיאור הטיול</label>
                        <textarea name="desc" readonly form="form"><?= $row['journeyDescription'] ?></textarea></div>
                    <?php if ($err): ?>
                        <div class="error"><?= $err ?></div>
                    <?php endif ?>
                <?php endif ?>
            </div>
        </div>
    </body>
</html>
