<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}

 	$image = $_POST['image'];
    $name = $_POST['name'];
    $post_id = $_POST['post_id'];
    $post_description = $_POST['post_description'];
    $username = $_POST['username'];

    
    $img = base64_decode($image);
    // $img = $image
    $image = $name;
    file_put_contents($image, $img);

    $sql = "INSERT INTO post_data (user_id,post_id,post_description, post_content, validity) values('$username','$post_id' ,'$post_description' , '".$image."' , '1')";

    $result = mysqli_query($db , $sql);
    
    



?>