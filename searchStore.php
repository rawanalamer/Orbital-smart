<?php
	require("Conn.php");
	require("MySQLDao.php");

    $returnValue = array();

    if(empty($_POST["name"])){
        $returnValue["message"]= "Missing required field";
		echo json_encode($returnValue);
		return;
    }

    $searchWord =htmlentities($_POST["name"]);

    $dao = new MySQLDao(Conn::$dbhost, Conn::$dbuser, Conn::$dbpass, Conn::$dbname);
	$dao->openConnection();

    $storeNames = $dao->searchStore($name);
    $dao->closeConnection();

    $returnValue["stores"]=$storeNames;
    echo json_encode($returnValue);




?>

]