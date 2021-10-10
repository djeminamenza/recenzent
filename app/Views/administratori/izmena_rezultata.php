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

        <h1 style="text-align: center;">Menjanje elemenata naučnog rezultata</h1>
        </br>
        </br>

      
       

  <h4><label for="rezultat">Izaberite naucni rezultat</label></h4>
    <select name='id_rezultat' class="form-control">
    <?php
          foreach($rezultati as $r):
            echo '<option value='. $r->id.'>'.  $r->ime.'</option>';
            //echo '<option value='.$n->id.' <selected>'.  $n->naziv .'</option>';
          endforeach;
          
      ?>
</select>
</br>
  
        
<?php
           
            echo anchor('administratori/izmenica/'.$r->id, 'Potvrdi izbor', ['class' => 'btn btn-primary ml-2']);

           
        ?>


       
         
      
    </div>
  </div>
  </div>
  </div>     
  </div> 
  
  <?php $this->endSection(); ?>     