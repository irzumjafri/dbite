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
 	$sql = "DELETE FROM followers_data WHERE user_id='$user_id' AND linked_user_id='$searched_user'";

	$result = mysqli_query($db , $sql);


?>