<?php
    $this->extend('layout');
    $this->section('content');
?>



<div class="container masthead mx-auto">
        <div class="col">
        <h1 style="text-align: center;">Шта су ове ленштине рецензенти оценили а шта нису</h1>
        </br>
        </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Recenzenti</th>
                <th scope="col">Naziv rezultata</th>
                <th scope="col">Status ocene</th>
            </tr>
            </thead>
            <tbody>
            <?php
            
            foreach($rez as $z){
                echo '<tr>';
                echo '<td scope="row">'.$z->recen.'</td>';
                echo '<td scope="row">'.$z->naziv.'</td>';
                if($z->opis=='razmatra se'){
                    echo '<td scope="row">neocenjena</td>';
                }else{
                    echo '<td scope="row">ocenjena</td>';
                }
            echo '</tr>';  
            }
            ?> 
        </tbody>
        </table>

       
<h1 style="text-align: center;">Broj rezultat na recenziji</h1>
        </br>
        </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Recenzenti</th>
                <th scope="col">Broj rezultata na recenziji</th>
            </tr>
            </thead>
            <tbody>
            <?php
            //var_dump($br);
           foreach($br as $b){
                echo '<tr>';
                echo '<td scope="row">'.$b->recen.'</td>';
                if($b->opis=='razmatra se'){
            
                    echo '<td scope="row">'.$b->zbir.'</td>';
                
                }else{
                    echo '<td scope="row">0</td>';
                }
            echo '</tr>';  
            }
            ?> 
        </tbody>
        </table>
        </div>
        </div>
<?php $this->endSection(); ?>     