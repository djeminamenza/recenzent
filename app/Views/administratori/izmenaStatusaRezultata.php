<?php
    $this->extend('layout');
    $this->section('content');
?>



         <div class="container masthead mx-auto">

        <div class="col-sm-6 offset-sm-3">
        <div class="row">
        <div class="card">
        </br>
    <div class="form col-md-12" style="text-align: center;">
    <h1 style="text-align: center;">Konačna odluka o rezultatu</h1>

    </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">ID rezultata</th>
                <th scope="col">Status </th>
                <th scope="col">Izmena statusa u bazi</th>
            </tr>
            </thead>
            <tbody>
            <?php
            //var_dump($rec);
            foreach($sta as $c){

                echo '<tr>';
                 echo '<td scope="row">'.$c->id_rezult.'</td>';
                 echo '<td scope="row">'.$c->status.'</td>';
              // echo '<td scope="row">'.$c->opis.'</td>';
              // echo '<td scope="row">'.$c->recen.'</td>';
              // echo '<td scope="row">'.$c->opis.'</td>';
               echo '<td><button type = submit>Promeni u bazi</button></td>';
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

    
