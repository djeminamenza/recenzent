<?php
    $this->extend('layout');
    $this->section('content');
?>



    
        
        
<div class="container masthead mx-auto">
  <div class="col-sm-12">
        <div class="row">

        </br>
    <div class="form col-md-12" style="text-align: center;">
        <h1 style="text-align: center;">Lista naucnih rezultata</h1>
        </br>
        </br>
        <table class="table table-bordered">
            <tr>
            <th>ID</th>

                <th>NAZIV</th>
                <th>POZIV</th>
                <th>KATEGORIJA</th>
                <th>OBLAST</th>
                <th>DATUM PRIJAVE</th>
                <th>STATUS</th>
                <th colspan="2">REZULTAT:</th>

            </tr>
            <?php
            //var_dump($rezultati);
                  foreach($rezultati as $r){
                    //echo '<option value='. $k->id. 'selected>'.  $k->email .'</option>';
                      echo '<tr>';
                      echo '<td>'.$r->id.'</td>';

                        echo '<td>'.$r->ime.'</td>';
                        echo '<td>'. $r->rezpoziv. '</td>';
                        echo '<td>'. $r->rezkateg. '</td>';
                        echo '<td>'. $r->rezoblast. '</td>';
                        echo '<td>'. $r->datum_prijave. '</td>';
                        echo '<td>'. $r->rezstatus. '</td>';
                        echo '<td>';
                        echo anchor('Administratori/izmenaRezultata/' .$r->id,'Izmeni', ['class' => 'btn btn-success', 'width' =>'auto']);
                        echo '</td>';
                        echo '<td>';
                        echo anchor('Administratori/deleteRezultat/' .$r->id,'Obrisi', ['class' => 'btn btn-danger']);
                        echo '</td>';
      
                      echo '</tr>';
                  }
            ?>  
        </table>
        </div>

    </div>
      </div>
  </div>


<?php $this->endSection(); ?>     