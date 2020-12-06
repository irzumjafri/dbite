<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}
	// $user_id = $_POST['user_id']; 
	// $user_id = 'hammad';

 	// $sql = "SELECT * FROM post_data WHERE user_id='$user_id'";
 	$sql = "SELECT * FROM post_data ";

	$result = mysqli_query($db , $sql);
	$data = array();
	while($row=mysqli_fetch_assoc($result))
	{
		$data[] = $row;
	}
	$ans = $data;

	echo json_encode($ans);







?>