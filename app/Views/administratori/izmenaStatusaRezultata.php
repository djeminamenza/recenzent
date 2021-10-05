<?php
    $this->extend('layout');
    $this->section('content');
?>



         <div class="container masthead mx-auto">

        <div class="col-sm-8 offset-sm-3">
        <div class="row">
        <div class="card">
        </br>
    <div class="form col-md-12" style="text-align: center;">
    <h1 style="text-align: center;">Konačna odluka o rezultatu</h1>

    </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">NAZIV REZULTATA</th>
                <th scope="col">STATUS NA OSNOVU 2 PREGLEDA </th>
                <th scope="col">IZMENA STATUSA U BAZI</th>
            </tr>
            </thead>
            <tbody>
            <?php
            //var_dump($rec);
            foreach($sta as $c){
                echo '<tr>';
                 echo '<td scope="row">'.$c->naziv.'</td>';
                 echo '<td scope="row">'.$c->status.'</td>';
                if($c->status == 'Razmatra se'){
                    echo '<td scope="row"></td>';
                }
                elseif($c->status == 'Odbijen'){
                    echo '<td>';
                    echo anchor('Administratori/promeniStatusRezultataUOdbijen/' .$c->id_rezult,'Promeni u bazi', ['class' => 'btn btn-primary']);
                    echo '</td>';
                }
                else
                {
                    echo '<td>';
                    echo anchor('Administratori/promeniStatusRezultataUPrihvacen/' .$c->id_rezult,'Promeni u bazi', ['class' => 'btn btn-primary']);
                    echo '</td>';
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

    
