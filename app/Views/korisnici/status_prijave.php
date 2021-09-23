<?php
    $this->extend('layout');
    $this->section('content');
?>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

  
    <div class="container masthead mx-auto">
    <br>
      <div class="form col-md-12" style="text-align: center;">      
        <table class="table table-bordered table-striped table-dark">        
          <tr>
            <th><h3>Status prijave</h3></th>
          </tr>
            <?php
            //var_dump($statusi);
              foreach($statusi as $s){
                  echo '<tr>';
                    echo '<td><h4>'.$s->opis.'</h4></td>';                                                  
                  echo '</tr>';
              }
              ?>
        </table>          
      </div>
    </div>

<?php $this->endSection(); ?>     
