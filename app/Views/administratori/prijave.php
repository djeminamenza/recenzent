<?php
$this->extend('layout');
$this->section('content');
?>

<div class="container masthead mx-auto" style="text-align: center;margin-top: 3%;">
  <?= view('Myth\Auth\Views\_message_block') ?>
  <h1 style="text-align: center;">Prijave recenzenata - nove, prihvaćene, odbijene</h1>
  <div class="form-group" style="text-align: center;">
    </br>
    <table class="table table-bordered">
      <tr>
        <th>id</th>
        <th>Ime i prezime</th>
        <th>uloga</th>
        <th>prijava</th>
        <th colspan="3">prebaci u recenzente</th>
      </tr>
      <?php
      foreach ($korisnici as $k) {
        echo '<tr>';
        echo '<td>' . $k->kid . '</td>';
        echo '<td>' . $k->korisnik . '</td>';
        echo '<td>' . $k->uloga . '</td>';
        echo '<td>' . $k->opis . '</td>';
        if ($k->gid == 3 && $k->id_status_prijave <> 4) {
          echo '<td>';
          echo anchor('Administratori/premesti/' . $k->kid, 'Premesti', ['class' => 'btn btn-success']);
          echo '</td>';
          echo '<td>';
          echo anchor('Administratori/odbij/' . $k->kid, 'Odbij', ['class' => 'btn btn-primary']);
          echo '</td>';
        } else {
          echo '<td></td>';
          echo '<td></td>';
        }
        echo '<td>';
        echo anchor('Administratori/deleteUser/' . $k->kid, 'Obrisi', ['class' => 'btn btn-danger']);
        echo '</td>';
        echo '</tr>';
      }
      ?>
    </table>
  </div>
</div>
<?php $this->endSection(); ?>