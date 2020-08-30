<?php
require_once 'mydbfunc.php';
$uid = "";
$pwd = "";
$err = "";
$succ = "";
session_start();
if ($_SERVER['REQUEST_METHOD'] === "POST") {
    $uid = trim(filter_input(INPUT_POST, 'uid', FILTER_SANITIZE_SPECIAL_CHARS));
    $pwd = trim(filter_input    (INPUT_POST, 'pwd', FILTER_SANITIZE_SPECIAL_CHARS));
    $hashed_pwd = password_hash($pwd, PASSWORD_DEFAULT);
    $usrdtls = getUserCredentials($uid);
    if ($usrdtls && password_verify($_POST["pwd"],$usrdtls['userPassword'])) {
         $_SESSION['usr_ id'] = $uid;
        $_SESSION['usr_num'] = $usrdtls['userNum'];
        $_SESSION['usr_rlnm'] = $usrdtls['userRealname'];
        $_SESSION['usr_type'] = $usrdtls['userType'];
        if ($usrdtls['userType'] === 'מ') {
            header("refresh:3;url=touradmin.php");
            $succ = '<span>ברוך השב אדמין!  
            אנא המתן או
            <a href="touradmin.php">לחץ כאן</a></span>';
        } else {
            header("refresh:3;url=tourlist.php");
            $succ = '<span>נכנסת בהצלחה!  
            אנא המתן או
            <a href="tourlist.php">לחץ כאן</a></span>';
        }
    } else {
        $err = "מזהה משתמש לא מוכר או לא פעיל או הצירוף של שם המשתמש והסיסמא שגוי";
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LT - Login</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-login.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>
        <form method="post">
            <fieldset>
                <legend>מסך כניסה</legend>
                <?php if ($succ): ?>
                    <div class="succ"><?= $succ ?></div>
                <?php else : ?>
                    <div class="input_form"><label for="uid">מזהה:</label><input required type="email" id="uid" name="uid" placeholder="כתובת המייל שלך" value="<?= $uid ?>"/> </div>
                    <div class="input_form"><label for="pwd">סיסמא:</label><input required type="password" id="pwd" name="pwd" placeholder="הסיסמא שלך" /></div>
                    <div class="buttons"><input type="submit" class="button" value="כנס"/>
                        <input type="reset" class="button2" value="נקה"/>
                        <input type=button class="button3" onClick="location.href = 'reg.php'" value="הרשמה"></div>    
                <?php endif ?>
                <?php if ($err): ?>
                    <div class="error"><?= $err ?></div>
                <?php endif ?>
            </fieldset>
        </form>
    </body>
</html>
