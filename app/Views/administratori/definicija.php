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

        <h1 style="text-align: center;">Definisanje naučnog rezultata</h1>
        </br>
        </br>


        
          <?= view('Myth\Auth\Views\_message_block') ?>

    <form action="<?=route_to('administratori/attemptDefinicija') ?>" method="POST" enctype="multipart/form-data">
    <?=csrf_field() ?>

    
    <div class="form-row">
  
          <h4><label for="poziv">Odaberite programski poziv</label></h4>
            <select name='id_poziv' class="form-control">
            <?php
                  foreach($pozivi as $p):
                    echo '<option value='. $p->id.'>'.  $p->naziv .'</option>';
                  endforeach;
                  
              ?>
     </select>

    
  
                </br>
                </br>
                <div class="form-group col-md-6">
            <label for="nazivRezultata">Naziv rezultata</label>
            <input type="text" class="form-control" name='naziv'>
          </div> 
              
    

          <!-- kategorije povucene iz baze -->
        <div class="form-group col-md-6">
          <label for="kategorija">Kategorija</label>
            <select name='id_kateg' class="form-control">
              <?php
                  foreach($kategorije as $k):
                    echo '<option value='. $k->id. 'selected>'.  $k->opis .'</option>';
                  endforeach;
              ?>
            </select>
        </div>
        </div>
        </div>
              <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
                 <legend><h3 style="text-align: center;" >Prijava</h3></legend>
                  <div class="form-group">
                    <label for="opisRezultata">Opis rezultata</label>
                    <input type="text" class="form-control" name='opis' placeholder="Opišite svoj rezultat u kratkim crtama.">
                  </div>
                  <div class="form-group">
                      <label for="godinaRezultata">Godina rezultata</label>
                      <input type="text" class="form-control" name='god_rez' placeholder="Koje godine ste kreirali ovaj rezultat?">
                    </div>
                    <div class = "form-row">
                    <div class="form-group">
                  <label for="clanovi">Imena članova tima</label>
                  <input type="text" class="form-control" name='clanovi'>
              </div>

              &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp;<div class="form-group">
                  <label for="biografije">Biografije članova&nbsp; &nbsp; &nbsp;  &nbsp;</label>
                   <input type="file" class="form-control-file" name='biografije'>
              </div>
              <div class="form-group">
              <label for="id_status">Početni status rezultata</label>
                <select name= "id_status" class="form-control">
                  <option value="3"selected>razmatra se</option>
                </select>
                <input type="text" class="form-control" name='id'value="" hidden>
                </div>
              </div>

              
              
              
        <div class="form-row">

         <!-- oblasti povucene iz baze -->
        <div class="form-group col-md-6">
          <label for="oblasti">Oblast rada</label>
            <select name='id_oblast' class="form-control">
              <?php
                  foreach($oblasti as $o):
                    echo '<option value='. $o->id. 'selected>'.  $o->naziv .'</option>';
                  endforeach;
              ?>
            </select>
        </div>
            <div class="form-group col-md-6">
                <label for="datum prijave">Datum prijave</label>
                <input type="date" class="form-control" name='datum_prijave'>
            </div>

        </div>      
        </br>
        <button type="submit" class="btn btn-primary btn-block">Predajte naučni rezultat</button>
        </fieldset>
      </form>
    </div>
  </div>
  </div>
  </div>     
  </div> 
  
  <?php $this->endSection(); ?>     