<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

	$thread_id = $_POST['thread_id'];
	$chat = $_POST['thisChat'];
	$sender_info = $_POST['senderinfo'];

	// $thread_id = 'ali34|||hammad348';
	// $chat='';
	// $sender_info='';

	$sql = "UPDATE `message_thread_data` SET  `message_sender_info` = '$sender_info', `message_content` = '$chat' WHERE `message_thread_data`.`message_thread_id` = '$thread_id'";

	$result = mysqli_query($db,$sql);
		if($result){
			echo json_encode("true");
		}else{
			echo json_encode("false");
		}


?>