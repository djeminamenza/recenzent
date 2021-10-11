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
                <th scope="col">Naziv rezultata</th>
                <th scope="col">Recenzent/i</th>
                <th scope="col">Datum dodeljivanja</th>
                <th scope="col">Odluka recenzenta</th>
                <th scope="col">Konacna odluka</th>

            </tr>
            </thead>
            <tbody>
            <?php
            //var_dump($rec);
            foreach($rec as $c){
                echo '<tr>';
               echo '<td scope="row">'.$c->naziv.'</td>';
               echo '<td scope="row">'.$c->recen.'</td>';
               echo '<td scope="row">'.$c->datum_dodele.'</td>';
               echo '<td scope="row">'.$c->opis.'</td>';
               echo '<td scope="row">'.$c->status.'</td>';

            echo '</tr>';  
            }
            ?> 
        </tbody>
        </table>
        </div>
        </div>
       
<?php $this->endSection(); ?>  

    
