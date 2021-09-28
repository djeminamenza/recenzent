<?php
    $this->extend('layout');
    $this->section('content');
?>
  
  <div class="container masthead mx-auto">
      <br>
    <h1 style="text-align: center;">Programski Pozivi</h1>
    <br>
    <br>
      <div class="form col-md-12" style="text-align: center;">
              <!-- <label for="korisnici">Korisnici</label> -->
                <!-- <select name="korisnici" class="form-control"> -->
                <table class="table table-bordered table-striped table-dark">
                    <tr>
                    <th><h3>NAZIV</h3></th>
                    <th><h3>ID</h3></th>
                    </tr>
                  <?php
                      foreach($pozivi as $k){
                        //echo '<option value='. $k->id. 'selected>'.  $k->email .'</option>';
                          echo '<tr>';
                            echo '<td><h4>'.$k->naziv.'</h4></td>';
                            echo '<td><h4>'. $k->id. '</h4></td>';
                    ?>    
                     <td><?php 
                     echo anchor ('administratori/delete/'.$k->id, 'Obrisi poziv' , ['class' => 'btn btn-danger']); }
                     ?>
                     </td>
                          
                      <?php    
                      echo '</tr>';
                      
                  ?>
            </table>
            <br>
         <form action="<?= route_to('administratori/attemptPoziv') ?>" method="post">   
           <table class="table table-bordered table-striped table-dark">
                    <tr>
                    <th><h3>Ubacivanje novog poziva</h3></th>
                    </tr>
                    <tr>
                    <td><input type="text" class="form-control" <?php if (session('errors.naziv')) : ?>is-invalid<?php endif ?> name="naziv" aria_describedby="nazivHelp" 
                      placeholder="Unesi naziv novog poziva" value="<?=old('naziv') ?>"></td>
                    </tr>
                    <tr>
                    <td><button type="submit" class="btn btn-primary btn-block">Ubaci</button>
                    </td>
                    </tr>
             </table></form>
                <!-- </select> -->
      </div>
    </div>

   <!-- Script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript'>
    $(document).ready(function() {

        $('.deletePoziv').click(function(e) {
            var uid = $(this).attr("value");
            $.ajax({
                url:'<?=base_url()?>/Administratori/deletePoziv',
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

            <!-- echo anchor('movies/delete/' .$movie->id,'Delete movie', ['class' => 'btn btn-danger']); -->
