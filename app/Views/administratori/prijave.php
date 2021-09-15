<?php
    $this->extend('layout');
    $this->section('content');
?>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


  <h1 style="text-align: center;">Pregled recenzenata</h1>
  <div class="container masthead">
  <!-- korisnici dohvaceni iz baze -->
    <div class="form-group" style="text-align: center;">
      <table class="table table-bordered">
          <tr>
          <th>id korisnika</th>
          <th>Ime i prezime</th>
          <th>uloga</th>
          <th>opis</th>
          <th>prebaci u recenzente</th>
          <th>obrisi korisnika</th>
          </tr>
          <?php
              foreach($korisnici as $k){
                  echo '<tr>';
                  echo '<td>'.$k->kid.'</td>';  
                  echo '<td>'.$k->korisnik.'</td>';
                  echo '<td>'.$k->uloga.'</td>';
                  echo '<td>'.$k->opis.'</td>';
                  if($k->gid==3 && $k->id_status <> 4){
                    echo "<td><button value=".$k->kid. "type='button' class='rolechange btn btn-primary'>Premesti</button></td>";
                  }else{
                    echo '<td></td>';
                  }
                  //echo '<td>'.$k->name.'</td>';
                  //echo '<td><button value='.$k->id.' type="button" class="rolechange btn btn-primary">Premesti</button></td>';
                  echo '<td><button value='.$k->kid.' type="button" class="deleteUser btn btn-primary">Obrisi Korisnika</button></td>';
                  echo '</tr>';
              }
          ?>
      </table>
    </div>
  </div>
  

            <!-- echo anchor('movies/delete/' .$movie->id,'Delete movie', ['class' => 'btn btn-danger']); -->
<!-- Script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript'>
    $(document).ready(function() {
        $('.rolechange').click(function(e) {
            e.preventDefault();
            var uid = $(this).attr("value");
            $.ajax({
                url:'<?=base_url()?>/Administratori/changeRole',
                method: 'post',
                data: {uid: uid},
                dataType: 'json',
                success: function(response){
                   if(response.affectedRows == '1'){
                        location.reload();
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert('Doslo je do greske pokusajte kasnije ponovo');
                }
            });
        });
        $('.deleteUser').click(function(e) {
            var uid = $(this).attr("value");
            $.ajax({
                url:'<?=base_url()?>/Administratori/deleteUser',
                method: 'post',
                data: {uid: uid},
                dataType: 'json',
                success: function(response){
                   if(response.affectedRows == '1'){
                        location.reload();
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest);
                    alert('Doslo je do greske pokusajte kasnije ponovo');
                }
            });
        });
    });
</script>

<?php $this->endSection(); ?>   