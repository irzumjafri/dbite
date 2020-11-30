<?php  
	$db = mysqli_connect('localhost' , 'root' , '' , 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

	$user_id = $_POST['user_id']; 
	$password = $_POST['password'];

	// $user_id = 'wah';
	// $password = 'hammad123';

	$sql = "SELECT * FROM user_authentication WHERE user_id='".$user_id."' AND password='".$password."'";
	$result = mysqli_query($db , $sql);
	$data = mysqli_fetch_array($result);
	if($data==NULL){
		echo json_encode("false");
	}else{
		echo json_encode("true");
	}
	// $response=array();
	// if($result->num_rows>0){
	// 	while ($row = $result->fetch_assoc()) {
	// 		array_push($response, $row);
	// 	}
	// }
	// $db.close();
	// echo json_encode($response);



?>