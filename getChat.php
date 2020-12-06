<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

	$user_one = $_POST['loggedUser'];
	$user_two = $_POST['searchedUser'];
	// $user_one = 'ali34';
	// $user_two = 'hammad348';
	$thread_id1 = $user_one.'|||'.$user_two;
	$thread_id2 = $user_two.'|||'.$user_one;

	$sql = "SELECT * FROM messaging_user_data NATURAL JOIN message_thread_data WHERE message_thread_id='".$thread_id1."' OR message_thread_id='".$thread_id2."'";

	$result = mysqli_query($db , $sql);
	
	$data = array();
	while($row=mysqli_fetch_assoc($result))
	{
		$data[] = $row;
	}
	if($data==NULL){
		echo json_encode("false");
	}else{
		print(json_encode($data));
	}


?>