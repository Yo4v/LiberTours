<?php
require_once 'mydbfunc.php';
$name = $desc = $startDate = $duration = $price = $kosher = $AudienceCode = '';
$err = '';
$succ = '';
$kashrut = '';
$journeyNum = $_GET['id'];
$currentTourDtls = currentTour($journeyNum);
$row = $currentTourDtls[0];
session_start();
if ($_SESSION["usr_type"] != "מ") {
    header("Location: index.html");
    die;
}
if ($_SERVER['REQUEST_METHOD'] === "POST") {
    $name = trim(filter_input(INPUT_POST, 'name', FILTER_SANITIZE_SPECIAL_CHARS));
    $desc = trim(filter_input(INPUT_POST, 'desc', FILTER_SANITIZE_SPECIAL_CHARS));
    $startDate = trim(filter_input(INPUT_POST, 'startdate', FILTER_SANITIZE_SPECIAL_CHARS));
    $duration = trim(filter_input(INPUT_POST, 'duration', FILTER_SANITIZE_SPECIAL_CHARS));
    $name = $_POST['name'];
    $desc = $_POST['desc'];
    $startDate = $_POST['startDate'];
    $duration = $_POST['duration'];
    $price = $_POST['price'];
    $AudienceCode = $_POST['AudienceCode'];
    if (isset($_POST['kosher'])) {
        $kosher = 'כן';
        $kashrut = 'checked';
    } else {
        $kosher = 'לא';
    }
    if (empty($name) || empty($desc) || empty($startDate) || empty($duration) || empty($price) || empty($AudienceCode)) {
        $err = "נא למלא הנדרש";
    } else {
        $tripdtls = updateTour($journeyNum, $name, $desc, $startDate, $duration, $price, $kosher, $AudienceCode);
        header("refresh:3;url=touradmin.php");
        $succ = '<span>הטיול עודכן בהצלחה!  
            אנא המתן או             <a href="touradmin.php">לחץ כאן</a></span>';
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LT - UpdateTour</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-updatetouradmin.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php require_once 'menu.php'; ?>
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>
        <?php if ($succ): ?>
            <div class="succ"><?= $succ ?></div>
        <?php else : ?>
            <div class="tour">
                <div class="oldTour">
                    <fieldset class="old"><legend>פרטים נוכחיים</legend> 
                        <div class="input_form"><label for="name">כותרת הטיול</label><input required type="text" id="oldName" name="name" readonly value="<?= $row['journeyName'] ?>"/> </div>
                        <div class="input_form"><label for="desc">תיאור הטיול</label><a class="p0p" href="#plz">לחץ כאן!</a>
                        </div>
                        <div id="plz" class="overlay">
                            <div class="popup">
                                <a class="close" href="#">&times;</a>
                                <div class="content"><?= $row['journeyDescription'] ?></div>
                            </div>
                        </div>
                        <div class="input_form"><label for="startDate">תאריך התחלה</label><input required type="text" id="oldStartDate" name="startDate" readonly value="<?= (new DateTime($row["journeyStartDate"]))->format('d/m/Y') ?>"/></div>
                        <div class="input_form"><label for="duration">אורך הטיול</label><input required type="text" id="oldDuration" name="duration" readonly value="<?= $row['journeyDuration'] ?> ימים" /></div>
                        <div class="input_form"><label for="price">מחיר ליחיד</label><input required type="text" id="oldPrice" name="price" readonly value="<?= $row['journeyPrice'] ?>$" /></div>
                        <div class="input_form"><label for="kosher">כשרות</label><input type="text" id="oldKosher" name="kosher" readonly value="<?= $row['journeyKosher'] ?>" /></div>
                        <div class="input_form"><label for="AudienceCode">קהל יעד</label><input id="oldAudienceCode" name="AudienceCode" readonly value="<?= $row['journeyAudienceCode'] ?>"/></div></fieldset></div> 
                <form method="post" id="form">
                    <fieldset>
                        <legend>עדכון טיול</legend>
                        <div class="input_form"><label for="name">כותרת הטיול</label><input required type="text" id="name" name="name" placeholder="בחר שם לטיול" value="<?= $name ?>"/> </div>
                        <div class="input_form"><label for="textarea">תיאור הטיול</label>
                            <textarea name="desc" form="form" placeholder="תאר את הטיול..." ><?= $desc ?></textarea></div>
                        <div class="input_form"><label for="startDate">תאריך התחלה</label><input required type="date" id="startDate" name="startDate"/></div>
                        <div class="input_form"><label for="duration">אורך הטיול</label><input required type="text" placeholder="מה משך הטיול? (בימים)" id="duration" name="duration" value="<?= $duration ?>" /></div>
                        <div class="input_form"><label for="price">מחיר</label><input required type="number" id="price" name="price" placeholder="מחיר לנפש (ב$)" <?= $price ?> /></div>        
                        <div class="input_form"><label for="kosher">כשרות</label><input type="checkbox" id="kosher" name="kosher" value="<?= $kosher ?>" /></div>
                        <div class="input_form"><label for="select">קהל יעד</label> <select id="AudienceCode" name="AudienceCode">
                                <option value="<?= $AudienceCode ?>">--נא לבחור קהל יעד--</option>
                                <?php
                                foreach ($journeyType as $key => $value) :
                                    echo '<option value="' . $key . '">' . $value . '</option>';
                                endforeach;
                                ?>
                            </select></div>
                        <div class="action"><input type="submit" class="button" value="עדכון טיול"/></div>
                    <?php endif ?>
                    <?php if ($err): ?>
                        <div class="error"><?= $err ?></div>
                    <?php endif ?>
                </fieldset>
            </form>
        </div>
    </body>
</html>
