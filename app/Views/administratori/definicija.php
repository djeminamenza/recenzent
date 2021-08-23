<?php
    $this->extend('layout');
    $this->section('content');
?>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


        <h1 style="text-align: center;">Definisanje naucnog rezultata</h1>


    <div class="container">
        <div class="col">
    <form>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="nazivRezultata">Naziv rezultata</label>
            <input type="text" class="form-control" id="nazivRezultata">
          </div>
          <div class="form-group col-md-6">
            <label for="kategorija">Kategorija</label>
            <select id="kategorija" class="form-control">
              <option selected>Izaberi...</option>
              <option>...</option>
            </select>
          </div>
        </div>
    <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
        <legend style="width: 14%;margin-left: 7px;">Prijava:</legend>
        <div class="form-group">
          <label for="opisRezultata">Opis rezultata</label>
          <input type="text" class="form-control" id="opisRezultata" placeholder="Opisi svoj rezultat, sta god to bilo?">
        </div>
        <div class="form-group">
            <label for="godinaRezultata">Godina rezultata</label>
            <input type="text" class="form-control" id="godinaRezultata" placeholder="Kad ste izmerili?">
          </div>
        <div class="form-group">
          <label for="spisakClanova">Spisak clanova</label>
        <textarea class="form-control" placeholder="1. Clan, 2. Clan" id="spisakClanova" style="height: 100px"></textarea>
        </div>
        <div class="form-group">
        <label for="biografija1">Biografija 1. Clana</label>
        <input type="file" class="form-control-file" id="biografija1">
        <label for="biografija2">Biografija 2. Clana</label>
        <input type="file" class="form-control-file" id="biografija2">
        <label for="biografija3">Biografija 3. Clana</label>
        <input type="file" class="form-control-file" id="biografija3">
        <label for="biografija4">Biografija 4. Clana</label>
        <input type="file" class="form-control-file" id="biografija4">
    </div>
    </fieldset>

        <div class="form-row">
                <div class="form-group col-md-6">
                <label for="oblast">Oblast</label>
                <select id="oblast" class="form-control">
                <option selected>Izaberi...</option>
                <option>...</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="datumPrijave">Datum prijave</label>
                <input type="date" class="form-control" id="datumPrijave">
            </div>

        </div>      
        <div class="form-row">

        </div>
        <div class="form-group">
          <p>Ovde ce doci spisak recenzenata, kad tad!</p>
        </div>
        <button type="submit" class="btn btn-primary">Posalji</button>
      </form>
    </div>
  </div>

<?php $this->endSection(); ?>     