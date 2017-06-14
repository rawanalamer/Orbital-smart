<?php
	require("Conn.php");
	require("MySQLDao.php");

	$name =htmlentities($_POST['name'];
	$returnValue = array();

	if(empty($name){

		$returnValue["message"]= "Missing required field";
		echo json_encode($returnValue);
		return;
	}
	$dao = new MySQLDao();
	$dao->openConnection();
	$storeNames = $dao->searchStore($name);

	if($storeNames.isEmpty){
		$returnValue["message"] = "Store does not exist";
		echo json_encode($returnValue);
		return;
	}

	$returnValue = $storeNames
	$returnValue["message"] = "Success"
	echo json_encode($returnValue);

    $dao->closeConnection();
?>