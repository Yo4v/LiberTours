<?php
require_once 'mydbfunc.php';
$uid = "";
$pwd = "";
$realname = "";
$err = "";
$succ = "";
if ($_SERVER['REQUEST_METHOD'] === "POST") {
    $uid = trim(filter_input(INPUT_POST, 'uid', FILTER_SANITIZE_SPECIAL_CHARS));
    $pwd = trim(filter_input(INPUT_POST, 'pwd', FILTER_SANITIZE_SPECIAL_CHARS));
    $hashed_pwd = password_hash($pwd, PASSWORD_DEFAULT);
    $realname = trim(filter_input(INPUT_POST, 'realname', FILTER_SANITIZE_SPECIAL_CHARS));
    if (strlen($pwd) >= '12' || strlen($pwd) <= '4') {
        $err = "על הסיסמא להכיל לא פחות מ4 תווים ולא יותר מ12 תווים!";
    } else if (addUser($uid, $hashed_pwd, $realname) != 0) {
        header("refresh:3;url=login.php");
        $succ = '<span>נרשמת בהצלחה!  
            אנא המתן או
    <a href="login.php">לחץ כאן</a></span>';
    } else {
        $err = "מייל זה כבר תפוס";
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>LiberTours - Register</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-reg.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>
        <?php if ($succ): ?>
            <div class="succ"><?= $succ ?></div>
        <?php else : ?>
            <form method="post">
                <fieldset>
                    <legend>הוספת משתמש חדש</legend>
                    <div class="input_form"><label for="uid">מזהה:</label><input required type="email" id="uid" name="uid" placeholder="כתובת המייל שלך" value="<?= $uid ?>"/> </div>
                    <div class="input_form"><label for="pwd">סיסמא:</label><input required type="password" id="pwd" name="pwd" placeholder="הסיסמא שלך" /></div>
                    <div class="input_form"><label for="realname">שם אמיתי:</label><input required type="text" id="realname" name="realname" placeholder="שם מלא" <?= $realname ?> /></div>
                    <div class="action"><input type="submit" class="button" value="שמור"/></div>
                <?php endif ?>
                <?php if ($err): ?>
                    <div class="error"><?= $err ?></div>
                <?php endif ?>
            </fieldset>
        </form>
    </body>
</html>