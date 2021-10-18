<?php
$this->extend('layout');
$this->section('content');
?>

<div class="container masthead mx-auto">
  <?= view('Myth\Auth\Views\_message_block') ?>
  <div class="col-sm-12">
    <div class="row">
      <div class="form col-md-12" style="text-align: center; margin-top: 3%;">
        <h1 style="text-align: center;">Lista naučnih rezultata</h1>
        </br>
        </br>
        <table class="table table-bordered">
          <tr>
            <th>ID</th>
            <th>NAZIV</th>
            <th>POZIV</th>
            <th>KATEGORIJA</th>
            <th>OBLAST</th>
            <th>DATUM PRIJAVE</th>
            <th>STATUS</th>
            <th colspan="3">REZULTAT:</th>
          </tr>
          <?php
          foreach ($rezultati as $r) {
            echo '<tr>';
            echo '<td>' . $r->id . '</td>';
            echo '<td>' . $r->ime . '</td>';
            echo '<td>' . $r->rezpoziv . '</td>';
            echo '<td>' . $r->rezkateg . '</td>';
            echo '<td>' . $r->rezoblast . '</td>';
            echo '<td>' . $r->datum_prijave . '</td>';
            echo '<td>' . $r->rezstatus . '</td>';
            echo '<td>';
            echo anchor('Administratori/izmenaRezultata/' . $r->id, 'Izmeni', ['class' => 'btn btn-success', 'width' => 'auto']);
            echo '</td>';
            echo '<td>';
            echo anchor('Administratori/deleteRezultat/' . $r->id, 'Obriši', ['class' => 'btn btn-danger']);
            echo '</td>';
            echo '<td>';
            if ($r->id_status == 3) {
              echo anchor('Administratori/dodelaRezultata/' . $r->id, 'Dodeli', ['class' => 'btn btn-info']);
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
  </div>
</div>
<?php $this->endSection(); ?>