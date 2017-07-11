<?php
	$host = 'localhost';
	$user = 'SMART';
	$password = 'smart123';

	$connection = mysql_connect($host, $user, $password);
	if(!$connection){
		die('Connection Failed');

	}
	else{
			$dbconnection = mysql_select_db("smart")
			if(!$dbconnection){
				die("unable to connect to database")
			}
			else{
				$query = 'SELECT s.name FROM stores s';
				$result = mysql_query($query, $connection))

						// If so, then create a results array and a temporary one
						// to hold the data
						$resultArray = array();

						// Loop through each row in the result set
						while($row = mysql_fetch_assoc($result))
						{
							// Add each row into our results array
							$resultArray[] = $row
						}

						// Finally, encode the array to JSON and output the results
						echo json_encode($resultArray);

			}
		}
	}