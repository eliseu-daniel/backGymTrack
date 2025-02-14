<?php

namespace Src\Model;

use PDO;

use Config\Connection\Connection;

class UserModel {

    private $conn;

    public function __construct( Connection $Connection){
        $this->conn = $Connection->connection();
    }

    public function getUserModel(){

        $sql = 'SELECT * FROM usuarios';

        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);        
    }
}