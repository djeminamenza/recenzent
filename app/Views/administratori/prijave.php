<?php
    $this->extend('layout');
    $this->section('content');
?>

        <h1 style="text-align: center;">Pregled prijava</h1>

  <!-- kategorije povucene iz baze -->
  <div class="form-group col-md-6" style="text-align: center;">
          <!-- <label for="korisnici">Korisnici</label> -->
            <!-- <select name="korisnici" class="form-control"> -->
            <table class="table table-bordered">
                <tr>
                <th>Email</th>
                <th>id</th>
                <th>prebaci u recenzente</th>
                </tr>'
              <?php
                  foreach($korisnici as $k){
                    //echo '<option value='. $k->id. 'selected>'.  $k->email .'</option>';
                      echo '<tr>';
                        echo '<td>'.$k->email.'</td>';
                        echo '<td>'. $k->id. '</td>';
                        echo '<td><button type="button" class="btn btn-primary">Premesti</button></td>';
                        
                      echo '</tr>';
                  }
              ?>
        </table>
            <!-- </select> -->
</div>

<?php $this->endSection(); ?>     

            <!-- echo anchor('movies/delete/' .$movie->id,'Delete movie', ['class' => 'btn btn-danger']); -->
