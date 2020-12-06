<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}
	$user_id = $_POST['loggedUser'];
	$searched_user = $_POST['searchedUser']; 
	// $user_id = 'hjfbvbf';
	// $searched_user = 'fuihgirb';

 	// $sql = "SELECT * FROM post_data WHERE user_id='$user_id'";
 	$sql = "INSERT INTO `followers_data` (`user_id`, `linked_user_id`, `validity`) VALUES ('$user_id', '$searched_user', '1')";

	$result = mysqli_query($db , $sql);


?>