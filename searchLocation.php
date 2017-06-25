<?php
    require("Conn.php");
    require("MySQLDao.php");

    $returnValue = array();



    // if(empty($_POST["location"])){
    //     $returnValue["message"]= "Missing required field";
    //     echo json_encode($returnValue);
    //     return;
    // }

    // $locationId =htmlentities($_POST["location"]);

    $locationId = "1";

    $dao = new MySQLDao(Conn::$dbhost, Conn::$dbuser, Conn::$dbpass, Conn::$dbname);
    $dao->openConnection();

    $location = $dao->searchLocation($locationId);
    $dao->closeConnection();

    $returnValue["location"]=$location;
    echo json_encode($returnValue);

?>
