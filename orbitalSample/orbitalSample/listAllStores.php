<?php
	$host = 'localhost';
	$user = 'SMART';
	$password = 'smart123';

	$connection = mysql_connect($host, $user, $password, "smart");
	if(!$connection){
		die('Connection Failed');

	}
	else{

			$query = 'SELECT s.name FROM stores s';
			if ($result = mysqli_query($connection, $query))
			{
				// If so, then create a results array and a temporary one
				// to hold the data
				$resultArray = array();
				$tempArray = array();

				// Loop through each row in the result set
				while($row = $result->fetch_object())
				{
					// Add each row into our results array
					$tempArray = $row;
				    array_push($resultArray, $tempArray);
				}

				// Finally, encode the array to JSON and output the results
				echo json_encode($resultArray);
			}
	}
}