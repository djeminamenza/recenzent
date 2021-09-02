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
                <h2 class="card-header"><?=lang('Auth.register')?></h2>
                <div class="card-body">

                    <?= view('Myth\Auth\Views\_message_block') ?>

                    <form action="<?= route_to('register') ?>" method="post">
                        <?= csrf_field() ?>
   <!-- <?php //var_dump($podaci)?> -->
                        <div class="form-row">
                            <div class="form-group col-md-6">
                            <label for="ime">Ime</label>
                            <input type="text" class="form-control" id="ime" name="ime">
                            </div>
                            <div class="form-group col-md-6">
                            <label for="prezime">Prezime</label>
                            <input type="text" class="form-control" id="prezime"  name="prezime">
                            </div>                            
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                            <label for="nacionalnost">Nacionalnost</label>
                            <select name="nacija" class="form-control">
                                <?php
                                    foreach($podaci['nacionalnosti'] as $n):
                                        echo '<option value='.$n->id.' <selected>'.  $n->naziv .'</option>';
                                    endforeach;
                                ?>
                            </select>
                            </div>
                            <div class="form-group col-md-6">
                            <label for="zemlje">Zemlja zaposlenja</label>
                            <select name="zemlje" class="form-control">
                                <?php
                                    foreach($podaci['zemlje'] as $p):
                                        echo "<option value=".$p->id." <selected>".  $p->naziv ."</option>";
                                    endforeach;
                                ?>
                            </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                            <label for="nio">NIO</label>
                            <input type="text" class="form-control" id="nio">
                            </div>
                            <div class="form-group col-md-4">
                            <label for="zvanje">Naucno zvanje</label>
                            <select name="zvanje" class="form-control">
                                <?php
                                    foreach($podaci['zvanje'] as $p):
                                        echo "<option value=".$p->id." <selected>".  $p->naziv ."</option>";
                                    endforeach;
                                ?>
                            </select>
                            </div>
                            <div class="form-group col-md-4">
                            <label for="angazovanje">Organizacija</label>
                            <input type="text" class="form-control" id="organizacija"  name="organizacija">
                            </div>
                        </div>
                        <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
                        <legend style="width: 40%; margin-left: 7px;">Kontakt:</legend>
                        <div class="form-group">
                            <label for="telefon">Telefon</label>
                            <input type="text" class="form-control" id="telefon"  name="telefon" placeholder="0123">
                        </div>
                        <div class="form-group">
                            <label for="adresa">Adresa</label>
                            <input type="text" class="form-control" id="adresa"  name="adresa" placeholder="Mikina 1">
                        </div>
                        </fieldset>

                        <div class="form-group">
                            <label for="web">Licna Web stranica</label>
                            <input type="text" class="form-control" id="web"  name="web_str" placeholder="www.page.com">
                        </div>
                        <div class="form-group">
                            <label for="biografija1">Biografija</label>
                            <input type="file" class="form-control-file" name="biografija">
                        </div>
                        <div class="form-group">
                            <label for="najznacajniji">10 najznacajnijih radova</label>
                            <textarea class="form-control" placeholder="" name="radovi" style="height: 100px"></textarea>
                        </div>


                        <div class="form-group">
                            <label for="email"><?=lang('Auth.email')?></label>
                            <input type="email" class="form-control <?php if(session('errors.email')) : ?>is-invalid<?php endif ?>"
                                   name="email" aria-describedby="emailHelp" placeholder="<?=lang('Auth.email')?>" value="<?= old('email') ?>">
                            <small id="emailHelp" class="form-text text-muted"><?=lang('Auth.weNeverShare')?></small>
                        </div>

                        <div class="form-group">
                            <label for="username"><?=lang('Auth.username')?></label>
                            <input type="text" class="form-control <?php if(session('errors.username')) : ?>is-invalid<?php endif ?>" name="username" placeholder="<?=lang('Auth.username')?>" value="<?= old('username') ?>">
                        </div>

                        <div class="form-group">
                            <label for="password"><?=lang('Auth.password')?></label>
                            <input type="password" name="password" class="form-control <?php if(session('errors.password')) : ?>is-invalid<?php endif ?>" placeholder="<?=lang('Auth.password')?>" autocomplete="off">
                        </div>

                        <div class="form-group">
                            <label for="pass_confirm"><?=lang('Auth.repeatPassword')?></label>
                            <input type="password" name="pass_confirm" class="form-control <?php if(session('errors.pass_confirm')) : ?>is-invalid<?php endif ?>" placeholder="<?=lang('Auth.repeatPassword')?>" autocomplete="off">
                        </div>

                        <br>

                        <button type="submit" class="btn btn-primary btn-block"><?=lang('Auth.register')?></button>
                    </form>


                    <hr>

                    <p><?=lang('Auth.alreadyRegistered')?> <a href="<?= route_to('login') ?>"><?=lang('Auth.signIn')?></a></p>
                </div>
            </div>

        </div>
    </div>
</div>

<?= $this->endSection() ?>
