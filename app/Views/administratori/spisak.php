<?php
$this->extend('layout');
$this->section('content');
?>
<div class="container masthead mx-auto" style="text-align: center;margin-top: 3%;">
    <?= view('Myth\Auth\Views\_message_block') ?>
    <div class="col">
        <h1 style="text-align: center;">Uporedni pregled ocena: recenzent/konačni rezultat</h1>
        </br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Naziv rezultata</th>
                    <th scope="col">Recenzent/i</th>
                    <th scope="col">Datum dodeljivanja</th>
                    <th scope="col">Odluka recenzenta</th>
                    <th scope="col">Konačna odluka</th>
                </tr>
            </thead>
            <tbody>
                <?php
                //var_dump($rec);
                foreach ($rec as $c) {
                    echo '<tr>';
                    echo '<td scope="row">' . $c->naziv . '</td>';
                    echo '<td scope="row">' . $c->recen . '</td>';
                    echo '<td scope="row">' . $c->datum_dodele . '</td>';
                    echo '<td scope="row">' . $c->opis . '</td>';
                    echo '<td scope="row">' . $c->status . '</td>';
                    echo '</tr>';
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
<?php $this->endSection(); ?>