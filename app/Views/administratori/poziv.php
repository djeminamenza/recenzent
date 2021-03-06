<?php
$this->extend('layout');
$this->section('content');
?>

<div class="container masthead mx-auto">
  <?= view('Myth\Auth\Views\_message_block') ?>
  <div class="col-sm-8 offset-sm-4 mx-auto">
    <div class="row">
      <div class="card">
        </br>
        <div class="form col-md-12" style="text-align: center;">
          <h1 style="text-align: center;">Programski Pozivi</h1>
          </br>
          <table class="table table-bordered">
            <tr>
              <th>
                <h3>NAZIV</h3>
              </th>
              <th>
                <h3>ID</h3>
              </th>
            </tr>
            <?php
            foreach ($pozivi as $k) {
              //echo '<option value='. $k->id. 'selected>'.  $k->email .'</option>';
              echo '<tr>';
              echo '<td><h5>' . $k->naziv . '</h5></td>';
              echo '<td><h4>' . $k->id . '</h4></td>';
            ?>
              <td><?php
                  echo anchor('administratori/deletePoziv/' . $k->id, 'Obrisi poziv', ['class' => 'btn btn-danger']);
                }
                  ?>
              </td>
              <?php
              echo '</tr>';
              ?>
          </table>
          <br>
          <form action="<?= route_to('administratori/attemptPoziv') ?>" method="post">
            <table class="table table-bordered table-striped table-dark">
              <tr>
                <th>
                  <h3>Ubacivanje novog poziva</h3>
                </th>
              </tr>
              <tr>
                <td><input type="text" class="form-control" <?php if (session('errors.naziv')) : ?>is-invalid<?php endif ?> name="naziv" aria_describedby="nazivHelp" placeholder="Unesi naziv novog poziva" value="<?= old('naziv') ?>"></td>
              </tr>
              <tr>
                <td><button type="submit" class="btn btn-primary btn-block">Ubaci</button>
                </td>
              </tr>
            </table>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<?php $this->endSection(); ?>