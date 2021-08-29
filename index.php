<?php
  require_once "./models/Producto.php";
  require_once "./models/Categoria.php";

  $p = isset($_GET["p"]) ? $_GET["p"]: 1 ;

  if(isset($_POST["create"])){
    for($i=0;$i<count($_POST["cantidad"]); $i++){
      $producto = new Producto(0,$_POST["nombre"][$i],new Categoria($_POST["categoria"][$i],""),$_POST["talla"][$i],$_POST["precio"][$i]);
      $producto->insert();
    }

  }

  
  $producto = new Producto();
  $productos = $producto->index();

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
  <link rel="stylesheet" href="assets/css/styles.css">
  <title>Decathlon</title>
</head>
<body>
  <?php if (isset($_POST["create"])) { ?>
  <div class="alert-create alert alert-success alert-dismissible fade show position-absolute"
    role="alert">
    <strong><?php echo count($_POST["cantidad"]);?> nuevo<?=count($_POST["cantidad"]) > 1 ? "s" : "" ?> registro<?=count($_POST["cantidad"]) > 1 ? "s" : "" ?></strong> se ha<?=count($_POST["cantidad"]) > 1 ? "n" : "" ?> almacenado.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  </div>
  <?php } ?>
  <main id="main-p">
    <nav class="navbar navbar-expand-lg navbar-light shadow bg-principal w-100">
      <a class="navbar-brand" href="#"><img class="img-fluid" src="assets/img/logo.png" alt=""></a>
    </nav>
    <div class="mt-4 mb-2">
      <h1 class="text-center">Stock de Productos</h1>
    </div>
    
    <div class="container-fluid">
      <div class="row">
        <div id="table-container" class="col-md-8 mt-4">
          
          <table id="principal-table" class="table table-responsive table-striped">
            <thead class="bg-light">
              <tr>
                <th>Id</th>
                <th width="50%">Nombre</th>
                <th>Categoria</th>
                <th width="13%">Talla</th>
                <th width="15%">Precio</th>
              </tr>
            </thead>
            <tbody>
              <?php $count=1; foreach($productos["body"] as $k => $row){
                if($p && ($p - 1) * 5 <= $k){
                  if($count > 5){
                    break;
                  }    
                  $count++;
              ?>

                <tr>
                  <th><?php echo $row->getId();?></th>
                  <td><?php echo $row->getNombre();?></td>
                  <td><?php echo $row->getCategoria()->getNombre();?></td>
                  <td><?php echo $row->getTalla();?></td>
                  <td>$ <?php echo $row->getPrecio();?></td>
                </tr>
              <?php  }}?>
            </tbody>
          </table>
        </div>
        <div class="col-md-4 d-flex flex-column justify-content-center align-items-center">
          <img class="img-fluid pri-img" src="assets/img/training.svg" alt="">
          <button id="btn-create" class="mt-3 btn btn-success" data-toggle="modal" data-target="#form">Crear Producto</button>
        </div>
      </div>
    </div>
   
    <nav aria-label="Page navigation example" class="my-1">

      <ul class="pagination justify-content-center">

        <li class="page-item <?=$p-1 <= 0 ? "disabled" : ""?>">
          <a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p-1;?>" tabindex="-1" aria-disabled="true">Previous</a>
        </li>

        <?php if(ceil($productos["itemCount"]/5) < 9){
          for($i=0; $i<ceil($productos["itemCount"]/5); $i++){ ?>
            <li class="page-item <?=$i+1 == $p ? "active": ""?>"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$i+1?>"><?= $i+1?></a></li>
        <?php }} ?>

        <?php if(ceil($productos["itemCount"]/5) >= 9){?>
          <?php if($p-3 >= 0){ ?>
            <li class="page-item"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=1?>"><?=1?></a></li>
          <?php } ?> 
        
          <?php if($p-3 > 0){ ?>  
            <li class="page-item"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p-2?>">...</a></li>
          <?php } ?>

          <?php if($p-1 > 0){ ?>
            <li class="page-item"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p-1?>"><?= $p-1?></a></li>
          <?php } ?>

          <li class="page-item active"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p?>"><?= $p?></a></li>
          
          <?php if($p+1 < ceil($productos["itemCount"]/5)){ ?>
            <li class="page-item"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p+1?>"><?= $p+1?></a></li>
          <?php } ?>

          <?php if($p+3 <= ceil($productos["itemCount"]/5)){ ?>
            <li class="page-item"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p+2?>">...</a></li>
          <?php } ?>

          <?php if($p+1 <= ceil($productos["itemCount"]/5)){ ?>
            <li class="page-item"><a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=ceil($productos["itemCount"]/5)?>"><?= ceil($productos["itemCount"]/5)?></a></li>
          <?php } ?>
        <?php } ?>
                  
        <li class="page-item <?= $p >= ceil($productos["itemCount"]/5) ? "disabled" : ""?>">
          <a class="page-link" href="http://localhost/Decathlon/index.php?p=<?=$p+1;?>">Next</a>
        </li>
      </ul>
    </nav>
    <footer id="footer-index" class="w-100 bg-principal">
      <p class="text-white font-weight-bold">© Copyright Decathlon 2021</p>
    </footer>
  </main>
  
  <div class="modal fade" id="form" tabindex="-1" aria-labelledby="form" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title font-weight-bold" id="form">Crear Producto</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="index.php?pid=<?php echo base64_encode("presentacion/producto/crearProducto.php") ?>" method="post">
          <div class="modal-body">
            <div class="input-group d-flex align-items-center">
              <label class="mr-3 mt-1 text-muted" for="">Cantidad</label>
              <select class="form-control input-cantidad mr-3" name="cantidad" id="in-cantidad">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              <button type="button" id="btn-cantidad" class="btn btn-sm btn-success">Continuar</button>
            </div>
            <hr>
            <div id="form-content">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button id="btn-confirm" type="submit" name="create" class="btn btn-primary btn-disabled" disabled>Crear Productos</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script src="assets/js/app.js"></script>
</body>
</html>