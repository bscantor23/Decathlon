<?php
  require_once "./models/Categoria.php";

  $categoria = new Categoria();
  $categorias = $categoria->index();

?>


  <input type="hidden" name="cantidad[]" >
  <div class="input-group my-3">
    <label class="mr-3 mt-1 text-muted" for="">Nombre: </label>
    <input class="form-control" name="nombre[]" placeholder="Digita el nombre" type="text" required>
  </div>
  <div class="input-group my-3">
  <label class="mr-3 mt-1 text-muted" for="">Categoría: </label>
  <select class="form-control input-categoria" name="categoria[]" id="in-cantidad" required>
    <option class="text-muted" value="">Seleccionar Categoría</option>
  <?php foreach($categorias["body"] as $row){?>
    <option value="<?= $row->getId()?>"><?=$row->getNombre()?></option>
  <?php }?>
  </select>
  </div>
  <div class="input-group my-3">
    <label class="mr-3 mt-1 text-muted" for="">Talla: </label>
    <input class="form-control mr-3" name="talla[]" placeholder="Digita la talla" type="text" required>
    <label class="mr-3 mt-1 text-muted" for="">Precio: </label>
    <input class="form-control" name="precio[]" placeholder="Digita el precio" type="number" required>
  </div>
  <hr>
</div>