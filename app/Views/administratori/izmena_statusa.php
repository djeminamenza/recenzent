<?php
    $this->extend('layout');
    $this->section('content');
?>



<?php




  /* $sql = "SELECT imeRec, datumDod FROM rezultati  WHERE nazivRez='$nazivRezultata'";
    $sql1 = "SELECT konOdl FROM rezultati "." JOIN odluke on(id_lokacije=lokacija.id)  WHERE nazivRez='$nazivRezultata'";
*/
?>
    <div class="container masthead mx-auto">
        <div class="col">
        </br>
        </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">ID rezultata</th>
                <th scope="col">Status </th>
                <th scope="col">Izmeni</th>
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
               echo '<td><button type = submit>Izmeni</button></td>';
            echo '</tr>';  
            }
            ?> 
        </tbody>
        </table>
        </div>
        </div>
       
<?php $this->endSection(); ?>  

    
