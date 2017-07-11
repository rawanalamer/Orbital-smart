<?php

	$connection = mysqli_connect("localhost", "SMART", "smart123", "smart");
	if(mysqli_connect_errno()){
		echo "Failed to connect to MySQL: " . mysqli_connect_error();

	}
	else{

			$name = $_POST['name'];
			$query = 'SELECT s.name FROM stores s' WHERE s.name LIKE '%name%';
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

        mysqli_close($connection);
	}
?>