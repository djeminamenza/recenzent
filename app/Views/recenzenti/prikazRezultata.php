<?php
$this->extend('layout');
$this->section('content');
?>
<div class="container masthead mx-auto">
  <div class="col-sm-6 offset-sm-3">
    <div class="row ">
      <div class="card mx-auto">
        </br>
        <div class="form col-md-12" style="text-align: center;">
          <h1 style="text-align: center;">Prikaz rezultata</h1>
          </br>
          </br>
          <?= view('Myth\Auth\Views\_message_block') ?>
            <?= csrf_field() ?>

        
            <p><h4>Naziv rezultata: <?=$ovajRezultat->naziv?></h4></p>
              <p><h4>Opis: <?=$ovajRezultat->opis?></h4></p>
              <p><h4>Clanovi tima: <?=$ovajRezultat->clanovi?></h4></p>
              <p><h4>Biografija: </h4></p>
              <p><h4>Godina rezultata: <?=$ovajRezultat->god_rez?></h4></p>
              <p><h4>Datum prijave: <?=$ovajRezultat->datum_prijave?></h4></p>


              </br>

      </div>
    </div>
  </div>
</div>
</div>
<?php $this->endSection(); ?>