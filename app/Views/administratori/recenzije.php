<?php
    $this->extend('layout');
    $this->section('content');
?>


 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <div class="container masthead">
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
                if($z->opis==3){
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


<?php $this->endSection(); ?>     