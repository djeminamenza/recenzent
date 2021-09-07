<?php
    $this->extend('layout');
    $this->section('content');
?>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <div class="container masthead">
      <br>
    <h1 style="text-align: center;">Programski Pozivi</h1>
    <br>
    <br>
      <div class="form col-md-12" style="text-align: center;">
              <!-- <label for="korisnici">Korisnici</label> -->
                <!-- <select name="korisnici" class="form-control"> -->
                <table class="table table-bordered table-striped table-dark">
                    <tr>
                    <th><h3>NAZIV</h3></th>
                    <th><h3>ID</h3></th>
                    </tr>
                  <?php
                      foreach($pozivi as $k){
                        //echo '<option value='. $k->id. 'selected>'.  $k->email .'</option>';
                          echo '<tr>';
                            echo '<td><h4>'.$k->naziv.'</h4></td>';
                            echo '<td><h4>'. $k->id. '</h4></td>';                        
                          echo '</tr>';
                      }
                  ?>
            </table>
            <br>
         <form action="<?= route_to('administratori/poziv') ?>" method="post">   
           <table class="table table-bordered table-striped table-dark">
                    <tr>
                    <th><h3>Ubacivanje novog poziva</h3></th>
                    </tr>
                    <tr>
                    <td><input type="text" class="form-control" <?php if (session('errors.naziv')) : ?>is-invalid<?php endif ?>" name="naziv" aria_describedby="nazivHelp" 
                      placeholder="Unesi naziv novog poziva" value="<?=old('naziv') ?>"></td>
                    </tr>
                    <tr>
                    <td><button type="submit" class="btn btn-primary btn-block">Ubaci</button>
                    </td>
                    </tr>
             </table></form>
                <!-- </select> -->
      </div>
    </div>

<?php $this->endSection(); ?>     

            <!-- echo anchor('movies/delete/' .$movie->id,'Delete movie', ['class' => 'btn btn-danger']); -->
