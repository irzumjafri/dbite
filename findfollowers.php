<?php  
	$db = mysqli_connect('localhost' , 'root' , '' , 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

	$user_id = $_POST['user_id']; 

	// $user_id = '';
	// $password = 'hammad123';

	$sql = "SELECT COUNT(*) as count FROM followers_data WHERE linked_user_id='".$user_id."'" ;
	$result = mysqli_query($db , $sql);
	$data = mysqli_fetch_assoc($result);
	echo json_encode($data['count']);
	// if($data==NULL){
	// 	echo json_encode("false");
	// }else{
	// 	echo json_encode("true");
	// }
	// $response=array();
	// if($result->num_rows>0){
	// 	while ($row = $result->fetch_assoc()) {
	// 		array_push($response, $row);
	// 	}
	// }
	// $db.close();
	// echo json_encode($response);



?>