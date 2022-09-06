 <?php
 require ('config.php');
 session_start();
 if($a==true)
	 {
	header('location:profile.php');
}
$a=$_SESSION['user'];
$g = "SELECT * FROM myusers WHERE name='$a'";
$cg = mysqli_query($con,$g);
$row=$cg->fetch_assoc();
$ret = mysqli_num_rows($cg);
include "logout.php";
include "hfooter.php";
?>
<html>
<link rel="stylesheet" type="text/css" href="http://localhost/updated%20website/css/mainpage.css">
<style>table.tu{
font-size: 50px;
align: center;	
}</style>
<body>
<br>
<h1><center>Welcome <?php echo $_SESSION['user']; ?></center></h1><br>
<table class="tu" align="center">
<tr><td>mob no:</td><td>  <?php echo $row["mobileno"];?></td></tr>
		 <tr><td>address:</td><td>  <?php echo $row["address"];?></td></tr>
		 <tr><td>gender:</td><td>  <?php echo $row["gender"];?></td></tr></table>
		 </body>
</html>