<?php
	$db = mysqli_connect('localhost' , 'root' , '', 'dbite');
	if(!$db){
		echo "Database connection failed";
	}


 	$sql = "SELECT * FROM report_data";
 	
	$result = mysqli_query($db , $sql);
	$data = array();
	while($row=mysqli_fetch_assoc($result))
	{
		$data[] = $row;
	}
	$ans = $data;

	echo json_encode($ans);


?>