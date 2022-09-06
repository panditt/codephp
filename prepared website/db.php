<?php
require ('config.php');

$sql="INSERT INTO MYusers(first,last,email,mobileno,age,classtime,purpose,gender) VALUES('$nme','$sname','$mal','$mob','$pswrd','$clst','$pur','$gen');";
mysqli_query($conn,$sql);
?>