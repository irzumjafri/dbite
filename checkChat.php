<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

	$user_one = $_POST['loggedUser'];
	$user_two = $_POST['searchedUser'];
	// $user_one = '111';
	// $user_two = '123';
	$thread_id1 = $user_one.'|||'.$user_two;
	$thread_id2 = $user_two.'|||'.$user_one;
	// echo json_encode($thread_id);


	$sql1 = "SELECT * FROM messaging_user_data NATURAL JOIN message_thread_data WHERE message_thread_id='".$thread_id1."' OR message_thread_id='".$thread_id2."'";
	// $sql2 = "SELECT * FROM messaging_user_data WHERE user_id='".$user_two."' AND co_user_id = '".$user_one."'";
	$insert_sql = "INSERT INTO `messaging_user_data` (`user_id`, `co_user_id`, `message_thread_id`, `validity`) VALUES ('".$user_one."', '".$user_two."', '".$thread_id1."', '1')";
	$insert_sql_thread = "INSERT INTO `message_thread_data` (`message_thread_id`, `message_sender_info`, `message_content`, `valid_for_sender`, `valid_for_receiver`) VALUES ('".$thread_id1."', '', '', '1', '1')";
	// $find_data = "SELECT * FROM message_thread_id WHERE message_thread_id='".$thread_id1."' OR message_thread_id='".$thread_id2."'";


	$result1 = mysqli_query($db , $sql1);
	// $result2 = mysqli_query($db , $sql2);
	$data1 = mysqli_fetch_row($result1);
	// $data2 = mysqli_fetch_array($result2);

	// echo $data1;
	


	

	if($data1==NULL){
		$result2 = mysqli_query($db , $insert_sql);
		$result3 = mysqli_query($db , $insert_sql_thread);
		if($result2 && $result3){
			echo json_encode("insterted");
		}
	}




?>