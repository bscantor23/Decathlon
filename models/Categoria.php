<?php

  include_once 'persistence/CategoriaDAO.php';

  class Categoria {
    private $id;
    private $nombre;
    private $DAO;

    function __construct($id = 0, $nombre = ""){
      $this->id = $id;
      $this->nombre = $nombre;
      $this->DAO = new CategoriaDAO();
    }

    public function index(){
      $results = $this->DAO->getAll();

      $count = $results->rowCount();

      if($count > 0){
          $arr;
          $arr["body"] = [];
          $arr["itemCount"] = $count;
  
          while ($row = $results->fetch(PDO::FETCH_ASSOC)){
              extract($row);
              $e = new Categoria($id, $categoria);
              array_push($arr["body"], $e);
          }
      }
      return $arr;
    }

    public function getId(){
      return $this->id;
    }

    public function setId($id){
      $this->id = $id;
    }

    public function getNombre(){
      return $this->nombre;
    }

    public function setNombre($nombre){
      $this->nombre = $nombre;
    }

    public function getDAO(){
      return $this->DAO;
    }

  }

?>