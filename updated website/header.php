<?php
session_start();
if($_SESSION["user"]!='')
{header('location:LOGIN1.php');}
else
{header('location:logout.php');}?>
<html>
<link rel="stylesheet" type="text/css" href="http://localhost/updated%20website/css/hdft.css">
</html>