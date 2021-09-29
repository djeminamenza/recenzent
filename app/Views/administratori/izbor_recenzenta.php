<?php
    $this->extend('layout');
    $this->section('content');
?>



    <div class="container masthead mx-auto">
    <div class="col">
    <div class="form col-md-12" style="text-align: center;">
        <h1 style="text-align: center;">Dodeljivanje recenzenta rezultatu</h1>
          <div class="row">
          <?= view('Myth\Auth\Views\_message_block') ?>

          <h3><label for="rec">Odaberite rezultat</label></h3>
          <form action="<?=route_to('administratori/attemptIzbor_recenzenta') ?>" method="POST" enctype="multipart/form-data">
          <?=csrf_field() ?>

            <select name='id_rezult' class="form-control">
            <?php
                  foreach($rec as $p):
                    echo '<option value='. $p->id_rezult.'>'.  $p->izbonaziv .'</option>';
                  endforeach;
              ?>
            </select>
                <h3><label for="rec">Odaberite recenzenta</label></h3>
                <select name='id_user' class="form-control">
                  
                <?php
                      foreach($rec as $p):
                      echo '<option value='. $p->id_user.'>'.  $p->recen .'</option>';
                      endforeach;
                  ?>
                </select>
                <div class="form-group col-md-6">
                <label for="datum_dodele">Datum dodele</label>
                <input type="date" class="form-control" name='datum_dodele'>
            </div>
        </br>
        <div class="row">
        <button type="submit" class="btn btn-primary btn-block">Potvrdi izbor</button>
      </form>
    </div>
  </div>
  </div>   
  </div>
  <?php $this->endSection(); ?>     