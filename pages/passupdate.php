<?php
require_once 'mydbfunc.php';
session_start();
if (!isset($_SESSION['usr_num'])) {
    header("Location: login.php");
    die;
}
$err = '';
$succ = '';
$currentUsrDtls = getUserDtlsByNum($_SESSION['usr_num']);
$uid = $currentUsrDtls['userEmail'];
$currentPwd = $currentUsrDtls['userPassword'];
if ($_SERVER['REQUEST_METHOD'] === "POST") {
    $pwd = trim(filter_input(INPUT_POST, 'pwd', FILTER_SANITIZE_SPECIAL_CHARS));
    $newpwd = trim(filter_input(INPUT_POST, 'newpwd', FILTER_SANITIZE_SPECIAL_CHARS));
    $renewpwd = trim(filter_input(INPUT_POST, 'renewpwd', FILTER_SANITIZE_SPECIAL_CHARS));
    $hashed_pwd = password_hash($newpwd, PASSWORD_DEFAULT);
    if (empty($pwd) || empty($newpwd) || empty($renewpwd)) {
        $err = "חייבים להזין את כול הסיסמאות לפחות ";
    } else if (strlen($newpwd) >= '12' || strlen($newpwd) <= '4') {
        $err = "על הסיסמא להכיל לא פחות מ4 תווים ולא יותר מ12 תווים!";
    } else if (!password_verify($pwd, $currentPwd)) {
        $err = "סיסמא נוכחית שגויה!";
    } else if ($newpwd !== $renewpwd) {
        $err = "יש לאשר את הסיסמא החדשה!";
    } else if (password_verify($newpwd, $currentPwd)) {
        $err = "סיסמא חדשה חייבת להיות שונה מנוכחית ";
    }
    if ($err === "" && updatePassword($_SESSION['usr_num'], $hashed_pwd) != 0) {
        $succ = '<span>הסיסמא עודכנה בהצלחה!  
             <a href="logout.php">לחץ כאן על מנת להמשיך</a></span>';
    }
}
?> 
<!DOCTYPE html>
<html>
    <head>
        <title>LT - PassUpdate</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-passupdate.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php require_once 'menu.php';
        ?>
        <div>
            <img src="../images/liber.png" alt="liber" class="logo" />
            <h1>ניהול חברת נסיעות של טיולים מאורגנים</h1>
        </div>
        <?php if ($succ): ?>
            <div class="succ"><?= $succ ?></div>
        <?php else : ?>
            <form method="post" id="form">
                <fieldset>
                    <legend>עדכון סיסמת משתמש</legend>
                    <div class="input_form"><label for="uid">מזהה:</label><input required type="email" id="uid" name="uid" readonly value="<?= $uid ?>"/></div>
                    <div class="input_form"><label for="pwd">סיסמא נוכחית:</label><input required type="password" id="pwd" name="pwd" placeholder="הסיסמא הנוכחית שלך" /></div>
                    <div class="input_form"><label for="newpwd">סיסמא חדשה:</label><input required type="password" id="newpwd" name="newpwd" placeholder="בחר סיסמא חדשה" /></div>
                    <div class="input_form"><label for="renewpwd">אישור:</label><input required type="password" id="renewpwd" name="renewpwd" placeholder="אישור הסיסמא החדשה" /></div>
                    <div class="action"><input type="submit" class="button" value="עדכון סיסמא"/></div>
                <?php endif ?>
                <?php if ($err): ?>
                    <div class="error"><?= $err ?></div>
                <?php endif ?>
            </fieldset>
        </form>
    </body>
</html>