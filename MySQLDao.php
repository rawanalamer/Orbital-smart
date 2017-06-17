<?php
class MySQLDao {
	var $dbhost = null;
	var $dbuser = null;
	var $dbpass = null;
	var $conn = null;
	var $dbname = null;
	var $result = null;

	function __construct() {
		$this->dbhost = Conn::$dbhost;
		$this->dbuser = Conn::$dbuser;
		$this->dbpass = Conn::$dbpass;
		$this->dbname = Conn::$dbname;
	}

	public function openConnection() {
		$this->conn = new mysqli($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
		if (mysqli_connect_errno())
		echo new Exception("Could not establish connection with database");
	}

	public function getConnection() {
		return $this->conn;
	}

	public function closeConnection() {
		if ($this->conn != null)
		$this->conn->close();
	}

	public function searchStore($name){
		$returnValue =  array();
		$sql  = "SELECT * FROM stores s WHERE s.name LIKE '%', $name, '%'";
		$result = $this->conn->query($sql);
		if ($result != null && (mysqli_num_rows($result) >= 1)) {
			$row = $result->fetch_array(MYSQLI_ASSOC);
			if (!empty($row)) {
				$returnValue = $row;
			}
		}
		return $returnValue
	}

}
?>