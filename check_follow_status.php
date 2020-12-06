<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}
	$user_id = $_POST['loggedUser'];
	$searched_user = $_POST['searchedUser']; 
	// $user_id = 'hammad348';
	// $searched_user = 'ali34';

 	// $sql = "SELECT * FROM post_data WHERE user_id='$user_id'";
 	$sql = "SELECT * FROM followers_data WHERE user_id='$user_id' AND linked_user_id='$searched_user' ";

	$result = mysqli_query($db , $sql);
	$data = array();
	while($row=mysqli_fetch_assoc($result))
	{
		$data[] = $row;
	}
	$ans = $data;

	if($ans!=NULL){
		echo json_encode("true");
	}else{
		echo json_encode("false");
	}







?>