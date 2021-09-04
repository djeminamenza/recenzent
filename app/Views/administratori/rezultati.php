<?php
    $this->extend('layout');
    $this->section('content');
?>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <div class="container masthead">
        <h1 style="text-align: center;">Lista naucnih rezultata</h1>
        <?= view('Myth\Auth\Views\_message_block') ?>
        <div class="row">
            <div class="col-sm-6 offset-sm-3">
                <form action="<?= route_to('administratori/upload') ?>" method="post" enctype="multipart/form-data">
                    <p>Ovde ce doci spisak recenzenata, kad tad!</p>
                    <div class="form-group col-md-6">
                        <label for="naziv">Naziv</label>
                        <input type="text" class="form-control" name="naziv">
                    </div>  
                    <div class="form-group col-md-6">
                    <label for="opis">Biografija</label>
                    <input type="file" class="form-control-file" name="opis">
                    </div>
                    <button type="submit" class="btn btn-success">Posalji</button>
                </form>
            </div>
        </div>
    </div>


<?php $this->endSection(); ?>     