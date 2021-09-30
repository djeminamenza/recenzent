<?php
    $this->extend('layout');
    $this->section('content');
?>



    <div class="container masthead mx-auto">
    <div class="row">
        <div class="col-sm-6 offset-sm-3">
        <div class="card">

    <div class="form col-md-12" style="text-align: center;">
    </br>
        <h1 style="text-align: center;">Dodeljivanje recenzenta rezultatu</h1>
        </br>
        </br>


          <div class="row">
          <?= view('Myth\Auth\Views\_message_block') ?>

          <h4><label for="rec">Odaberite rezultat</label></h4>
          <form action="<?=route_to('administratori/attemptIzbor_recenzenta') ?>" method="POST" enctype="multipart/form-data">
          <?=csrf_field() ?>

            <select name='id_rezult' class="form-control">
            <?php
                  foreach($rec as $p):
                    echo '<option value='. $p->id_rezult.'>'.  $p->izbonaziv .'</option>';
                  endforeach;
              ?>
            </select>
                <h4><label for="rec">Odaberite recenzenta</label></h4>
                <select name='id_user' class="form-control">
                  
                <?php
                      foreach($rec as $p):
                      echo '<option value='. $p->id_user.'>'.  $p->recen .'</option>';
                      endforeach;
                  ?>
                </select>
                <div class="form-group">
                <h4><label for="datum_dodele">Datum dodele</label></h4>
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
  </div>   
  </div>
  <?php $this->endSection(); ?>     