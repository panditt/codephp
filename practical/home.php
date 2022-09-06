<?php session_start();?>
<html>
<body>
<h1>
welcome <?php echo $_SESSION["login_user"]; ?></h1>
<a href="logout.php">logout</a>
</body>
</html>