<?php 
require('config.php');
if($_SESSION['user']=="")
{
	header('location:profile.php');
}
$a=$_SESSION['user'];
$q = "SELECT * FROM myusers WHERE name='$a'";
$cq = mysqli_query($con,$q);
$row=$cq->fetch_assoc();
$ret = mysqli_num_rows($cq);
?>
<html>
<body>
<h1>Aim to get breakup from preeti</h1>
<h1><center>Welcome <?php echo $_SESSION['user']; ?></center></h1><br>
	<p><center style="color:red"> By clicking on home and about tab the user will automatically logout</center></p><br>
	<table class="tu"><tr><td>email:</td><td>  <?php echo $row["email"];?></td></tr>
	     <tr><td>mob no:</td><td>  <?php echo $row["mob"];?></td></tr>
		 <tr><td>address:</td><td>  <?php echo $row["address"];?></td></tr>
		 <tr><td>gender:</td><td>  <?php echo $row["gender"];?></td></tr></table>
</body>
</html>