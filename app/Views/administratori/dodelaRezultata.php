<?php
    $this->extend('layout');
    $this->section('content');
?>


<div class="container masthead mx-auto">
  <h1 style="text-align: center;">Dodela rezultata recenzenatima</h1>
  <!-- recenzenti iz baze -->
    <div class="form-group" style="text-align: center;">
    <form action="<?=route_to('dodelaRezultata')?>" method='POST' enctype='multipart/form-data'>
      <table class="table table-bordered">
          <tr>
            <th>Naziv rezultata</th>
            <th>Recenzenti na raspolaganju</th>
          </tr>
          <tr rowspan=<?=count($recenzenti)?>>
            <td>
              <div class="form-group">
                <label for='nazivRezultata' style="vertical-align: middle" name='nazivRezultata' ><?=$rezultat[0]->ime?></label>
                <input type="text" hidden class="form-control" name="rezultat" value=<?=$rezultat[0]->id?>>
              </div> 
            </td>
            <td>
              <div class="form-group">
              <?php foreach($recenzenti as $r):?>
              <div class="form-check">
                  <input class='form-check-input' type='checkbox' value='<?= $r->kid ?>' name='dodeljeni[]' id='<?= $r->recenzent ?>'/>
                  <label class='form-check-label' for='<?= $r->recenzent ?>'><?= $r->recenzent ?></label>
              </div>
              <?php endforeach; 
              echo '</td>';
              echo '</tr>';
              ?>
            </td>
          </tr>
      </table>
      <button type="submit" class="btn btn-success">Dodeli</button>
  </form>
    </div>
</div>
<?php $this->endSection(); ?>   