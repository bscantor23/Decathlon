<?php

  include_once 'database/Connection.php';

  class CategoriaDAO extends Connection {
    private $id;
    private $nombre;

    function __construct($id = 0, $nombre = ""){
      $this->id = $id;
      $this->nombre = $nombre;
    }

    public function getAll(){
      $query = "SELECT * FROM categorias ORDER BY id ASC;";
      $conn = $this->getConnection();
      $results = $conn->prepare($query);
      $results->execute();
      return $results;
    }

  }
?>