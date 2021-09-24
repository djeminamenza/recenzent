<?php
    $this->extend('layout');
    $this->section('content');
?>



    
        <h1 style="text-align: center;">Lista naucnih rezultata</h1>
        
        <div class="container masthead mx-auto">
        <div class="col">
        </br>
        </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Naziv rezultata</th>
                <th scope="col">Programski poziv</th>
                <th scope="col">Kategorija</th>
                <th scope="col">Oblast</th>
                <th scope="col">Datum prijave</th>
                <th scope="col">Status rezultata</th>
            </tr>
            </thead>
            <tbody>
            <?php
            //var_dump($rezultati);
                  foreach($rezultati as $r){
                    //echo '<option value='. $k->id. 'selected>'.  $k->email .'</option>';
                      echo '<tr>';
                        echo '<td scope="row">'.$r->ime.'</td>';
                        echo '<td scope="row">'. $r->rezpoziv. '</td>';
                        echo '<td scope="row">'. $r->rezkateg. '</td>';
                        echo '<td scope="row">'. $r->rezoblast. '</td>';
                        echo '<td scope="row">'. $r->datum_prijave. '</td>';
                        echo '<td scope="row">'. $r->rezstatus. '</td>';
   
                      echo '</tr>';
                  }
            ?>  
        </tbody>
        </table>
        </div>
        </div>


<?php $this->endSection(); ?>     