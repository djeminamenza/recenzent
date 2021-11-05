<?php
$this->extend('layout');
$this->section('content');
?>
<div class="container masthead mx-auto">
  <div class="col-sm-6 offset-sm-3">
    <div class="row ">
      <div class="card mx-auto">
        </br>
        <div class="form col-md-12" >
          <h1 style="text-align: center;">Prikaz rezultata</h1>
          </br>
          </br>
          <?= view('Myth\Auth\Views\_message_block') ?>
            <?= csrf_field() ?>
            <table class="table table-bordered">
                        
         <tr>
                                
         <td><h4>Naziv rezultata: </h4></td> <td><h5><?=$ovajRezultat->naziv?></h5></td>
          </tr>
          <tr>
          <td><h4>Opis: </h4></td> <td><h5><?=$ovajRezultat->opis?></h5></td>
              </tr>
              <tr>
              <td><h4>Članovi tima: </h4></td><td><h5><?=$ovajRezultat->clanovi?></h5></td>
              </tr>
              <tr>
              <td><h4>Biografija: </h4></td><td><h5>
              <?php
              $atts = [
                  'width'       => 800,
                  'height'      => 600,
                  'scrollbars'  => 'yes',
                  'status'      => 'yes',
                  'resizable'   => 'yes',
                  'screenx'     => 0,
                  'screeny'     => 0,
                  'window_name' => '_blank',
              ];
              echo anchor_popup('biografije/rezultati/'.$ovajRezultat->biografije, $ovajRezultat->biografije, $atts);
              ?>
              </h5></td>
              </tr>
              <tr>
              <td><h4>Godina rezultata: </h4></td><td><h5><?=$ovajRezultat->god_rez?></h5></td>
              </tr>
              <tr>
              <td><h4>Datum prijave: </h4></td><td><h5><?=$ovajRezultat->datum_prijave?></h5></td>
              </tr>
              <tr>

              <td colspan="2"><h4><?php echo anchor('recenzenti/recenzije/', 'Vrati se na ocenjivanje', ['class' => 'btn btn-success']);
              ?>
              </h4></td>
              </tr>
</table>
              </br>

      </div>
    </div>
  </div>
</div>
</div>
<?php $this->endSection(); ?>