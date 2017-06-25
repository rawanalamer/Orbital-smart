<?php

	$connection = mysqli_connect("localhost", "SMART", "smart123", "smart");
	if(mysqli_connect_errno()){
		echo "Failed to connect to MySQL: " . mysqli_connect_error();

	}
	else{

		$locationId = $_POST['location'];
		$storeId = $_POST['store'];
		$query = 'SELECT * FROM stores';
	}
?>