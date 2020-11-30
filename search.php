<?php  
  $db = mysqli_connect('localhost' , 'root' , '' , 'dbite');
  if(!$db){
    echo "Database connection failed";
  }

  $user_id = $_POST['user_id']; 
  // $password = $_POST['password'];

  // $user_id = 'hammad348';


  // $user_id = 'wah';
  // $password = 'hammad123';

  // $sql = "SELECT * FROM user_authentication INNER JOIN  user_data ON 'user_authentication'.'user_id'= 'user_data'.'user_id' WHERE user_id='".$user_id."'";
    // $sql = "SELECT 'user_authentication'.'fullname', 'user_data'.'description' FROM user_authentication INNER JOIN user_data ON 'user_authentication'.'user_id' = 'user_data'.'user_id'";
  $sql = "SELECT * FROM user_authentication  NATURAL JOIN  user_data WHERE user_id='".$user_id."'";
  $result = mysqli_query($db , $sql);
  // echo '".$result."';
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

  // if($data==NULL){
  //   echo json_encode("false");
  // }else{
  //   echo json_encode("true");
  // }
  // $response=array();
  // if($result->num_rows>0){
  //  while ($row = $result->fetch_assoc()) {
  //    array_push($response, $row);
  //  }
  // }
  // $db.close();
  // echo json_encode($response);



?>