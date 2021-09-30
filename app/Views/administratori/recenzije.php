<?php
    $this->extend('layout');
    $this->section('content');
?>



<div class="container masthead">
    
<div class="col-sm-6 offset-sm-3 mx-auto">
   
        <div class="row mx-auto">
        <div class="card mx-auto">
        </br>
    <div class="form col-md-12 mx-auto" style="text-align: center;">
        <h1 style="text-align: center;">Pregled ocenjenih rezultata</h1>
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
        </div>
        </div>
        </div>
        </div>
        </br>
        </br>
        <div class="col-sm-6 offset-sm-3 mx-auto">
        <div class="row">
        <div class="card">
        </br>
    <div class="form col-md-12" style="text-align: center;">      
<h1 style="text-align: center;">Broj rezultata na recenziji po recenzentu</h1>
        </br>
        </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Recenzenti</th>
                <th scope="col">Broj neocenjenih rezultata na recenziji</th>
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
        </div>
        </div>
<?php $this->endSection(); ?>     