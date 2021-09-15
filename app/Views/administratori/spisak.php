<?php
    $this->extend('layout');
    $this->section('content');
?>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<?php




  /* $sql = "SELECT imeRec, datumDod FROM rezultati  WHERE nazivRez='$nazivRezultata'";
    $sql1 = "SELECT konOdl FROM rezultati "." JOIN odluke on(id_lokacije=lokacija.id)  WHERE nazivRez='$nazivRezultata'";
*/
?>
    <div class="container masthead">
        <div class="col">
        </br>
        </br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Naziv rezultata</th>
                <th scope="col">Recenzent/i</th>
                <th scope="col">Datum dodeljivanja</th>
                <th scope="col">Konačna odluka</th>
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
            echo '</tr>';  
            }
            ?> 
        </tbody>
        </table>
        </div>
        </div>
       
<?php $this->endSection(); ?>  

    
