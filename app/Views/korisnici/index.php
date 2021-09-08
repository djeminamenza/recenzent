<?php
    $this->extend('layout');
    $this->section('content');
?>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

  
    <div class="container">
    <div class="row">
		<div class="col-sm-6 offset-sm-3">
    <div class="card">
		<h2 class="card-header">Status Vase prijave je:</h2>
				<div class="card-body">
      <select name= "status" class="form-control">
      <?php 
        foreach($status_prijave as $s){
          echo'<option value='. $s->id. 'selected>'. $s->opis.'</option>';
        }
      ?>

      </select>
        </div>

        <?php 
        //$status = $status_prijave->$this->model->opis ;
        //var_dump($status_prijave);
        ?>

    </div>
        </div>
      </div>
  </div>

<?php $this->endSection(); ?>     