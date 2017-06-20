<?php
class MySQLDao {

    var $dbhost = null;
    var $dbuser = null;
    var $dbpass = null;
    var $conn = null;
    var $dbname = null;
    var $result = null;
    function __construct($dbhost, $dbuser, $dbpassword, $dbname) {
        $this->dbhost = $dbhost;
        $this->dbuser = $dbuser;
        $this->dbpass = $dbpassword;
        $this->dbname = $dbname;
    }


    public function openConnection() {
        $this->conn = new mysqli($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
        if (mysqli_connect_errno())
            throw new Exception("Could not establish connection with database");
        $this->conn->set_charset("utf8");
    }

    public function closeConnection() {
        if ($this->conn != null)
            $this->conn->close();
    }



	public function searchStore($name){
		$returnValue =  array();
		$sql  = "SELECT * FROM stores s WHERE s.name LIKE ? ";
		$result = $this->conn->query($sql);
        if(!$result)
            throw new Exception($result->error);
        $name = '%'.$name.'%';
        $result->bind_param("ssi", $name);
        $result->execute();
        $result1 = $result->get_result();

        while($myrow = $result->fetch_assoc())
        {
            $returnValue[] = $myrow;
        }

		return $returnValue;
	}

}
?>