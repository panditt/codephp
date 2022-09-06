<?php
error_reporting(1);

session_destroy();
$_session["user"]="";
header('location:homepage.php');
?>