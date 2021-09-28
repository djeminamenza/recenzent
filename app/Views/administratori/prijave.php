<?php
    $this->extend('layout');
    $this->section('content');
?>


<div class="container masthead mx-auto">
  <h1 style="text-align: center;">Pregled recenzenata</h1>
  <div class="container masthead">
  <!-- korisnici dohvaceni iz baze -->
    <div class="form-group" style="text-align: center;">
      <table class="table table-bordered">
          <tr>
          <th>id korisnika</th>
          <th>Ime i prezime</th>
          <th>uloga</th>
          <th>prijava za recenzenta</th>
          <th>prebaci u recenzente</th>
          <th>obrisi korisnika</th>
          </tr>
          <?php
              foreach($korisnici as $k){
                  echo '<tr>';
                  echo '<td>'.$k->kid.'</td>';  
                  echo '<td>'.$k->korisnik.'</td>';
                  echo '<td>'.$k->uloga.'</td>';
                  echo '<td>'.$k->opis.'</td>';
                  if($k->gid==3 ){//&& $k->id_status <> 4){
                    echo '<td>';
                    echo anchor('Administratori/premesti/' .$k->kid,'Premesti', ['class' => 'btn btn-primary']);
                    echo '</td>';
                  }else{
                    echo '<td></td>';
                  }
                  echo "<td><button value=".$k->kid. "type='button' class='deleteUser btn btn-danger'>Obrisi Korisnika</button></td>";
                  echo '</tr>';
              }
          ?>
      </table>
    </div>
  </div>
</div>
<?php $this->endSection(); ?>   