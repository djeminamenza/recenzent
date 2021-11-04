<?php
$this->extend('layout');
$this->section('content');
?>

<div class="container masthead mx-auto">
    <?= view('Myth\Auth\Views\_message_block') ?>
    <div class="col-sm-6 offset-sm-3 mx-auto">
        <div class="row">
            <div class="card">
                </br>
                <div class="form col-md-12" style="text-align: center;">
                    <h1 style="text-align: center;">Broj neocenjenih rezultata</h1>
                    </br>
                    </br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Recenzent</th>
                                <th scope="col">Broj neocenjenih rezultata</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($br as $b) {
                                echo '<tr>';
                                echo '<td scope="row">' . $b->recen . '</td>';
                                if ($b->opis == 'razmatra se') {

                                    echo '<td scope="row">' . $b->zbir . '</td>';
                                } else {
                                    echo '<td scope="row">0</td>';
                                }
                                echo '</tr>';
                            }
                            ?>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
<?php $this->endSection(); ?>
