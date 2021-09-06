<?php
    $this->extend('layout');
    $this->section('content');
?>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

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
                    echo '<option value='. $p->id.' selected>'.  $p->naziv .'</option>';
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