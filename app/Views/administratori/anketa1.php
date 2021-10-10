<?php
    $this->extend('layout');
    $this->section('content');
?>
    <div class="container masthead mx-auto">

        <h1 style="text-align: center;">Pregled anketa</h1>
        <table class="table table-bordered">
            <tr>
                <th>Ime</th>
                <th>Prezime</th>
                <th>Email</th>
            </tr>
            <?php
                //echo var_dump($darko);
                echo '<td>'.$darko[0]->ime.'</td>';
                echo '<td>'. $darko[0]->prezime. '</td>';
                echo '<td>'. $darko[0]->email. '</td>';
                echo '</tr>';
            ?>  
        </table>
    </div>

<?php $this->endSection(); ?>     