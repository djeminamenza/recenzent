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

        <h1 style="text-align: center;">Izmene naučnog rezultata</h1>
        </br>
        </br>

        <form action="<?=route_to('administratori/attemptIzmena') ?>" method="POST" enctype="multipart/form-data">
    <?=csrf_field() ?>

        
          <?= view('Myth\Auth\Views\_message_block') ?>

   
       
  
  <h4><label for="poziv">Trenutni programski poziv</label></h4>
  <p ><?=$rezultat->rezpoziv?></p>
    </br>
    <h4><label for="poziv">Izaberite novi programski poziv</label></h4>
    <select name='id_poziv' class="form-control">
    <?php
          foreach($pozivi as $p):
            echo '<option value='. $p->id.'>'.  $p->naziv .'</option>';
            //echo '<option value='.$n->id.' <selected>'.  $n->naziv .'</option>';
          endforeach;
          
           
      ?>
</select>

        </br>
        </br>
        <h4><label for="poziv">Trenutni naziv rezultata</label></h4>
        <p ><?=$rezultat->ime?></p>
        </br>
    <h4><label for="nazivRezultata">Novi naziv rezultata</label></h4>
    <input type="text" class="form-control" name='naziv'>

      
    </br>
    </br>
  <!-- kategorije povucene iz baze -->

<h4><label for="poziv">Trenutna kategorija</label></h4>
<p ><?=$rezultat->rezkateg?></p>

 <h4> <label for="kategorija">Nova kategorija</label></h4>
    <select name='id_kateg' class="form-control">
      <?php
          foreach($kategorije as $k):
            echo '<option value='. $k->id. 'selected>'.  $k->opis .'</option>';
          endforeach;
      ?>
    </select>

</br>
    </br>
        
          <h4>  <label for="opisRezultata">Trenutni opis rezultata</label></h4>
            <p ><?=$rezultat->opis?></p>
            <h4><label for="opisRezultata">Novi opis rezultata</label></h4>

            <input type="text" class="form-control" name='opis' placeholder="Opišite svoj rezultat u kratkim crtama.">
            </br>
    </br>
             <h4> <label for="godinaRezultata">Trenutna godina rezultata</label></h4>
              <p ><?=$rezultat->god_rez?></p>
              <h4><label for="godinaRezultata">Nova godina rezultata</label></h4>

              <input type="text" class="form-control" name='god_rez' placeholder="Koje godine ste kreirali ovaj rezultat?">
              </br>
    </br>
         <h4> <label for="clanovi">Prijavljena imena članova tima</label></h4>
          <p ><?=$rezultat->clanovi?></p>
         <h4> <label for="clanovi">Nova imena članova tima</label></h4>

          <input type="text" class="form-control" name='clanovi'>
          </br>
    </br>

        <h4>  <label for="biografije">Prethodne biografije članova&nbsp; &nbsp; &nbsp;  &nbsp;</label></h4>
          <p ><?=$rezultat->biografije?></p>
        <h4>  <label for="biografije">Zelite li da ubacite nove biografije;</label></h4>

           <input type="file" class="form-control-file" name='biografije'>
    
           </br>
    </br>
      


  <h4><label for="oblasti">Prethodna oblast rada</label></h4>
  <p ><?=$rezultat->rezoblast?></p>
  <h4><label for="oblasti">Izmena oblasti rada</label></h4>

    <select name='id_oblast' class="form-control">
      <?php
          foreach($oblasti as $o):
            echo '<option value='. $o->id. 'selected>'.  $o->naziv .'</option>';
          endforeach;
      ?>
    </select>
    </br>
    </br>
       <h4> <label for="datum prijave">Prethodni datum prijave</label></h4>
        <p ><?=$rezultat->datum_prijave?></p>
       <h4> <label for="datum prijave">Novi datum prijave</label></h4>

        <input type="date" class="form-control" name='datum_prijave'>
    
 
</br>
<button type="submit" class="btn btn-primary btn-block">Predajte nove podatke</button>

</form>
</div>
</div>
</div>
</div>    
         
  </div> 
  
  <?php $this->endSection(); ?>     