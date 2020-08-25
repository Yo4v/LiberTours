<?php
session_start();
foreach ($_SESSION as $ky => $vlu) {
    unset($_SESSION[$ky]);
}
header("Location: login.php");
