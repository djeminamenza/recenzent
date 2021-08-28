<?php
    $this->extend('layout');
    $this->section('content');
?>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


<h1 style="text-align: center;">Prijava</h1>
<div class="container">
  <div class="col">
    <form>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="ime">Ime</label>
          <input type="text" class="form-control" id="ime">
        </div>
        <div class="form-group col-md-6">
          <label for="prezime">Prezime</label>
          <input type="text" class="form-control" id="prezime">
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="nacionalnost">Nacionalnost</label>
          <input type="text" class="form-control" id="nacionalnost">
        </div>
        <div class="form-group col-md-6">
          <label for="zemlja">Zemlja zaposlenja</label>
          <input type="text" class="form-control" id="zemlja">
        </div>
      </div>
      <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
      <legend style="width: 14%;margin-left: 7px;">Kontakt:</legend>
      <div class="form-group">
        <label for="telefon">Telefon</label>
        <input type="text" class="form-control" id="telefon" placeholder="0123">
      </div>
      <div class="form-group">
        <label for="email">email</label>
        <input type="text" class="form-control" id="email" placeholder="pera@zika.com?">
      </div>
      <div class="form-group">
        <label for="adresa">Spisak clanova</label>
        <input type="text" class="form-control" id="adresa" placeholder="Mikina 1?">
      </div>
      <button type="submit" class="btn btn-info">Prijavi se</button>
    </form>
  </div>
</div>

<?php $this->endSection(); ?>     