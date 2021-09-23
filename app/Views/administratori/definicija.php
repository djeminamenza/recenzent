<?php
    $this->extend('layout');
    $this->section('content');
?>



    <div class="container masthead">
        <h1 style="text-align: center;">Definisanje naucnog rezultata</h1>
        <br>
        <br>
    
        <?= view('Myth\Auth\Views\_message_block') ?>

    <form action="<?=route_to('administratori/attemptDefinicija') ?>" method="POST" enctype="multipart/form-data">
    <?=csrf_field() ?>

    <div class="row">
          
         <div class="card align-items-center">
          <h3><label for="poziv">Odaberite programski poziv</label></h3>
            <select name='id_poziv' class="form-control">
            <?php
                  foreach($pozivi as $p):
                    echo '<option value='. $p->id.'>'.  $p->naziv .'</option>';
                    //echo '<option value='.$n->id.' <selected>'.  $n->naziv .'</option>';
                  endforeach;
                  
              ?>
            </select>
        </div> 

    </div>
  
        <br>
        <br>
        <div class="form-row">
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
              <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
                  <legend style="width: 14%;margin-left: 7px;">Prijava:</legend>
                  <div class="form-group">
                    <label for="opisRezultata">Opis rezultata</label>
                    <input type="text" class="form-control" name='opis' placeholder="Opisi svoj rezultat, sta god to bilo?">
                  </div>
                  <div class="form-group">
                      <label for="godinaRezultata">Godina rezultata</label>
                      <input type="text" class="form-control" name='god_rez' placeholder="Kad ste izmerili?">
                    </div>
                    <div class = "form-row">
                    <div class="form-group">
                  <label for="clanovi">Imena clanova tima</label>
                  <input type="text" class="form-control" name='clanovi'>
              </div>
                  <div class="form-group">
                  <label for="biografije">Biografije clanova</label>
                  <input type="file" class="form-control-file" name='biografije'>
              </div>

              <div class="form-group">
              <label for="id_status">Status rezultata (ovo bi trebalo da je hidden)</label>
                <select name= "id_status" class="form-control">
                  <option value="3"selected>razmatra se</option>
                </select>
              <div>

            </div>
              </fieldset>
              
        <div class="form-row">

         <!-- oblasti povucene iz baze -->
        <div class="form-group col-md-6">
          <label for="oblasti">Oblast</label>
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
        <button type="submit" class="btn btn-primary btn-block">Definisi naucni rezultat</button>
      </form>
    </div>
  </div>
      

  <?php $this->endSection(); ?>     