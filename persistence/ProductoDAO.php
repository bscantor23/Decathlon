<?php

  include_once 'database/Connection.php';

  class ProductoDAO extends Connection{
    private $id;
    private $fk_categoria;
    private $nombre;
    private $talla;
    private $precio;

    function __construct($id = 0, $fk_categoria = 0, $nombre = "", $talla = "", $precio = ""){
      $this->id = $id;
      $this->fk_categoria = $fk_categoria;
      $this->nombre = $nombre;
      $this->talla = $talla;
      $this->precio = $precio;
    }

    public function getAll(){
      $query = "SELECT a.id, a.nombre, b.id as id_categoria, b.categoria, a.talla, a.precio 
                FROM productos a 
                INNER JOIN categorias b ON b.id = a.fk_categoria
                ORDER BY a.id ASC;";

      $conn = $this->getConnection();
      $results = $conn->prepare($query);
      $results->execute();
      return $results;
    }

    public function insert(){
      $query = "insert into productos (nombre, fk_categoria, talla, precio)
              values (
              '" . $this -> nombre . "',
              " . $this -> fk_categoria . ",
              '" . $this -> talla . "',
              " . $this -> precio . "
              )";

      $conn = $this->getConnection();
      $results = $conn->prepare($query);
      $results->execute();
      return $results;
    }
  }

?>