<!DOCTYPE html>
<html>
    <head>
        <title>LT - Menu</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Yoav Liberman" />
        <link href="../css/style-menu.css" rel="stylesheet" type="text/css" />
        <link href="../css/styles-global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="header">
                    <h2>שלום, <?= $_SESSION['usr_rlnm'] ?>!</h2>
                </div>
                <div class="body">
                    <a class="bye" href=logout.php >התנתק</a>
                    <ul>
                        <li><a href=passupdate.php>עדכון פרטים</a></li>
                        <?php if ($_SESSION["usr_admin"] == "מ"): ?>
                            <li><a href=newtour.php>הוספת טיול חדש למסד</a></li>
                            <li><a href=touradmin.php>רשימת הטיולים הקיימים במסד הנתונים</a></li>
                        <?php else : ?>   
                            <li><a href=tourlist.php>רשימת הטיולים הפנויים</a></li>
                            <li><a href=usertour.php>טיולים שנרשמת אליהם</a></li>
                        <?php endif; ?>     
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>














