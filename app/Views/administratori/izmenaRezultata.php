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
          <h1 style="text-align: center;">Izmena naučnog rezultata</h1>
          </br>
          </br>
          <?= view('Myth\Auth\Views\_message_block') ?>
          <form action="<?= route_to('izmenaRezultata') ?>" method='POST' enctype='multipart/form-data'>
            <?= csrf_field() ?>
            <div class="form-row">
              <h4><label for="poziv">Programski poziv</label></h4>
              <select name='id_poziv' class="form-control">
                <!-- prikaz poziva rezultata koji se EDIT-uje -->
                <?php
                foreach ($pozivi as $p) :
                  if ($ovajRezultat->id_poziv == $p->id) {
                    echo '<option value=' . $p->id . ' selected>' .  $p->naziv . '</option>';
                  } else {
                    echo '<option value=' . $p->id . '>' .  $p->naziv . '</option>';
                  }
                endforeach;
                ?>
              </select>
              </br>
              </br>
              <div class="form-group col-md-6">
                <label for="nazivRezultata">Naziv rezultata</label>
                <!-- prikaz naziva rezultata koji se EDIT-uje -->
                <input type="text" class="form-control" name="naziv" value="<?= $ovajRezultat->naziv ?>">
              </div>
              <!-- kategorije povucene iz baze -->
              <div class="form-group col-md-6">
                <label for="kategorija">Kategorija</label>
                <select name='id_kateg' class="form-control">
                  <!-- prikaz kategorije rezultata koji se EDIT-uje -->
                  <?php
                  foreach ($kategorije as $k) :
                    if ($ovajRezultat->id_kateg == $k->id) {
                      echo '<option value=' . $k->id . ' selected>' .  $k->opis . '</option>';
                    } else {
                      echo '<option value=' . $k->id . '>' .  $k->opis . '</option>';
                    }
                  endforeach;
                  ?>
                </select>
              </div>
            </div>
            <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
              <legend>
                <h3 style="text-align: center;">Prijava</h3>
              </legend>
              <div class="form-group">
                <label for="opisRezultata">Opis rezultata</label>
                <input type="text" class="form-control" name='opis' placeholder="Opišite svoj rezultat u kratkim crtama." value="<?= $ovajRezultat->opis ?>">
              </div>
              <div class="form-group">
                <label for="godinaRezultata">Godina rezultata</label>
                <input type="text" class="form-control" name='god_rez' placeholder="Koje godine ste kreirali ovaj rezultat?" value="<?= $ovajRezultat->god_rez ?>">
              </div>
              <div class="form-row">
                <div class="form-group">
                  <label for="clanovi">Imena članova tima</label>
                  <input type="text" class="form-control" name='clanovi' value="<?= $ovajRezultat->clanovi ?>">
                </div>
                <div class="form-group col-md-6">
                  <label for="biografije">Biografije članova</label>
                  <?= anchor(['public/biografije/rezultati/' . $ovajRezultat->biografije], $ovajRezultat->biografije) ?>
                </div>
                <div class="form-group">
                  <label for="id_status">Status rezultata</label>
                  <select name="id_status" class="form-control">
                    <?php
                    switch ($ovajRezultat->id_status) {
                      case "1":
                        echo '<option value=1 selected>prihvacen</option>';
                        break;
                      case "2":
                        echo '<option value=2 selected>odbijen</option>';
                        break;
                      case "3":
                        echo '<option value=3 selected>razmatra se</option>';
                        break;
                      default:
                        echo '<option value=3 selected>razmatra se</option>';
                    }
                    ?>
                  </select>
                  <label for="id">ID</label>
                  <input type="text" class="form-control" name='id' value="<?= $ovajRezultat->id ?>">
                </div>
              </div>
              <div class="form-row">
                <!-- oblasti povucene iz baze -->
                <div class="form-group col-md-6">
                  <label for="oblasti">Oblast rada</label>
                  <select name='id_oblast' class="form-control">
                    <?php
                    foreach ($oblasti as $o) :
                      if ($ovajRezultat->id_oblast == $o->id) {
                        echo '<option value=' . $o->id . ' selected>' .  $o->naziv . '</option>';
                      } else {
                        echo '<option value=' . $o->id . '>' .  $o->naziv . '</option>';
                      }
                    endforeach;
                    ?>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="datum prijave">Datum prijave</label>
                  <input type="date" class="form-control" name='datum_prijave' value="<?= $ovajRezultat->datum_prijave ?>">
                </div>
              </div>
              <button type="submit" class="btn btn-primary btn-block">Izmeni naučni rezultat</button>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<?php $this->endSection(); ?>