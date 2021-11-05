<?php
$this->extend('layout');
$this->section('content');
?>
<div class="container masthead mx-auto">
  <h1 style="text-align: center;">Pregled recenzija</h1>
  <br>
  <div class="form col-md-12" style="text-align: center;">
    <table class="table table-bordered table-striped table-dark">
      <tr>
        <th>ID rezultata</th>
        <th>Naziv rezultata</th>
        <th>Ocena</th>
        <th colspan="2">Oceni</th>
      </tr>
      <?php
      // var_dump($recenzija);
      //  die();
      foreach ($recenzija as $r) {
        echo '<tr>';
        echo '<td><h4>' . $r->id_rezult . '</h4></td>';
        //echo '<td><h4>' . $r->naziv . '</h4></td>';
        echo'<td><h4>'. anchor('recenzenti/prikazRezultata/' . $r->id_rezult, $r->naziv).'</h4></td>';
        echo '<td><h4>' . $r->opis . '</h4></td>';
        echo '<td>';
        if ($r->opis == 'odbijen' || $r->opis == 'razmatra se') {
          echo anchor('recenzenti/prihvati/' . $r->id, 'Prihvati', ['class' => 'btn btn-success']);
        } else {
          echo '';
        }
        echo '</td>';
        echo '<td>';
        if ($r->opis == 'prihvacen' || $r->opis == 'razmatra se') {
          echo anchor('recenzenti/odbij/' . $r->id, 'Odbij', ['class' => 'btn btn-danger']);
        } else {
          echo '';
        }
        echo '</td>';
        echo '</tr>';
      }
      ?>
    </table>
  </div>
</div>
<?php $this->endSection(); ?>