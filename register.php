<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

	$fullname = $_POST['fullname'];
	$user_id = $_POST['user_id'];
	$email = $_POST['email']; 
	$password = $_POST['password'];
	$phonenumber = $_POST['phonenumber'];
	$validity = $_POST['validity'];

	// $fullname = 'wahid';
	// $user_id = 'wahid111';
	// $email = 'wahid@gmail.com'; 
	// $password = 'wahid123';
	// $phonenumber = '123456';
	// $validity = 1;


	$sql = "SELECT * FROM user_authentication WHERE user_id='".$user_id."'";


	$result = mysqli_query($db , $sql);
	$data = mysqli_fetch_array($result);

	if($data!=NULL){
		echo json_encode("account already exists");
	}else{
		$insert = "INSERT INTO user_authentication (fullname, user_id, email, password, phone_number, validity) VALUES ('$fullname', '$user_id', '$email', '$password', '$phonenumber', '$validity')";

		// $insert = "INSERT INTO user_authentication ( user_id,  password) VALUES ( '$user_id', '$password')";

		$result = mysqli_query($db,$insert);
		if($result){
			echo json_encode("true");
		}else{
			echo json_encode("false");
		}
	}



?>