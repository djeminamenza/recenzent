<?php
    $this->extend('layout');
    $this->section('content');
?>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


  <h1 style="text-align: center;">Pregled prijava</h1>
  <div class="container masthead">
  <!-- korisnici dohvaceni iz baze -->
    <div class="form-group" style="text-align: center;">
      <table class="table table-bordered">
          <tr>
          <th>id korisnika</th>
          <th>Ime i prezime</th>
          <th>uloga</th>
          <th>prebaci u recenzente</th>
          </tr>
          <?php
          //var_dump($korisnici);
              foreach($korisnici as $k){
                  echo '<tr>';
                  echo '<td>'.$k->id.'</td>';  
                  echo '<td>'.$k->korisnik.'</td>';
                  echo '<td>'.$k->uloga.'</td>';
                  echo '<td><button type="button" class="btn btn-primary">Premesti</button></td>';
                  echo '</tr>';
              }
          ?>
      </table>
    </div>
  </div>
<?php $this->endSection(); ?>     

            <!-- echo anchor('movies/delete/' .$movie->id,'Delete movie', ['class' => 'btn btn-danger']); -->
