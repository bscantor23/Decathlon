<?php

  include_once 'persistence/ProductoDAO.php';
  include_once 'Categoria.php';

  class Producto {
    private $id;
    private $categoria;
    private $nombre;
    private $talla;
    private $precio;
    private $DAO;
    
    function __construct($id= 0, $nombre="", $categoria = null, $talla = "", $precio=0){
      $this->id = $id;
      $this->categoria = $categoria;
      $this->nombre = $nombre;
      $this->talla = $talla;
      $this->precio = $precio;
      
      $this->DAO = new ProductoDAO();
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
              $e = new Producto($id, $nombre,new Categoria($id_categoria,$categoria), $talla, $precio);
              array_push($arr["body"], $e);
          }
        }
      return $arr;
    }

    public function insert(){

      $this->DAO = new ProductoDao(
        $this->id,
        $this->categoria->getId(),
        $this->nombre,
        $this->talla,
        $this->precio
      );

      $results = $this->DAO->insert();
      return $results;
    }

    public function getId(){
      return $this->id;
    }

    public function setId($id){
      $this->id = $id;
    }

    public function getCategoria(){
      return $this->categoria;
    }

    public function setCategoria($categoria){
      $this->categoria = $categoria;
    }

    public function getNombre(){
      return $this->nombre;
    }

    public function setNombre($nombre){
      $this->nombre = $nombre;
    }

    public function getTalla(){
      return $this->talla;
    }

    public function setTalla($talla){
      $this->talla = $talla;
    }

    public function getPrecio(){
      return $this->precio;
    }

    public function setPrecio($precio){
      $this->precio = $precio;
    }

    public function getDAO(){
      return $this->DAO;
    }

  }

?>