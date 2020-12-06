<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}
	$user_id = $_POST['loggedUser'];
	$post_id = $_POST['post_id'];
	$report_reason = $_POST['report_reason'];
	$report_id = $_POST['report_id'];

	// $user_id = '1222112';
	// $post_id = 'sdffdfdsfs';
	// $report_reason = '12345678';
	// $report_id = 'dhuyguyegfuhdsgfuhdsfbhusdfhudsbhudsvhusd';

	// $user_id = 'hjfbvbf';
	// $searched_user = 'fuihgirb';

 	// $sql = "SELECT * FROM post_data WHERE user_id='$user_id'";
 	$sql = "INSERT INTO report_data(user_id, reported_post_id, report_id, report_reason) VALUES ('$user_id','$post_id','$report_id','$report_reason')";

	$result = mysqli_query($db , $sql);


?>