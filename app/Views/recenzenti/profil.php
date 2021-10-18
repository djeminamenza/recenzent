<?php
$this->extend('layout');
$this->section('content');
?>
<div class="container masthead mx-auto">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <div class="container masthead">
        <div class="row">
            <div class="col-sm-6 offset-sm-3">
                <div class="card">
                    <h2 class="card-header"><?= lang('Izmeni licne podatke') ?></h2>
                    <div class="card-body">

                        <?php if ($message) : ?>
                            <div class="alert <?php echo $message['class'] ?>"><?php echo $message['message'] ?></div>
                        <?php endif; ?>

                        <form action="sacuvajIzmene" method="post" enctype="multipart/form-data">
                            <?= csrf_field() ?>
                            <input type="hidden" name="sessid" value="<?php echo $userid ?>" />

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="ime">Ime</label>
                                    <input type="text" class="form-control" placeholder="Ime Korisnika" id="ime" name="ime" value="<?php echo $user[0]['ime'] ?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="prezime">Prezime</label>
                                    <input type="text" class="form-control" placeholder="Prezime Korisnika" id="prezime" name="prezime" value="<?php echo $user[0]['prezime'] ?>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nacionalnost">Nacionalnost</label>
                                    <select name="id_nac" class="form-control">
                                        <?php foreach ($podaci['nacionalnosti'] as $n) : ?>
                                            <option value='<?php echo $n->id ?>' <?php echo ($n->id == $user[0]['nacionalnost']) ? "selected" : ""  ?>><?php echo $n->naziv ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="zemlje">Zemlja zaposlenja</label>
                                    <select name="id_zemlje" class="form-control">
                                        <?php foreach ($podaci['zemlje'] as $p) : ?>
                                            <option value='<?php echo $p->id ?>' <?php echo ($p->id == $user[0]['zemlja']) ? "selected" : ""  ?>><?php echo $p->naziv ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="oblasti">Oblast</label>
                                    <select name="id_oblast" class="form-control">
                                        <?php foreach ($podaci['oblasti'] as $o) : ?>
                                            <option value='<?php echo $o->id ?>' <?php echo ($o->id == $user[0]['oblast']) ? "selected" : ""  ?>><?php echo $o->naziv ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="zvanje">Naucno zvanje</label>
                                    <select name="id_zvanja" class="form-control">
                                        <?php foreach ($podaci['zvanje'] as $z) : ?>
                                            <option value='<?php echo $z->id ?>' <?php echo ($z->id == $user[0]['zvanje']) ? "selected" : ""  ?>><?php echo $z->naziv ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="angazovanje">Organizacija</label>
                                    <input type="text" class="form-control" placeholder="Organizacija" id="organizacija" name="organizacija" value="<?php echo $user[0]['organizacija'] ?>">
                                </div>
                            </div>
                            <fieldset style="border-style: solid; border-color: lightgray; border-width: 1px; padding: 15px; border-radius: 5px;">
                                <legend style="width: 40%; margin-left: 7px;">Kontakt:</legend>
                                <div class="form-group">
                                    <label for="telefon">Telefon</label>
                                    <input type="text" class="form-control" id="telefon" name="telefon" placeholder="Telefon Korisnika" value="<?php echo $user[0]['telefon'] ?>">
                                </div>
                                <div class="form-group">
                                    <label for="adresa">Adresa</label>
                                    <input type="text" class="form-control" id="adresa" name="adresa" placeholder="Adresa Stanovanja" value="<?php echo $user[0]['adresa'] ?>">
                                </div>
                                <div class="form-group">
                                    <label for="email"><?= lang('Auth.email') ?></label>
                                    <input type="email" class="form-control <?php if (session('errors.email')) : ?>is-invalid<?php endif ?>" name="email" aria-describedby="emailHelp" placeholder="<?= lang('Auth.email') ?>" value="<?php echo $user[0]['email'] ?>">
                                    <small id="emailHelp" class="form-text text-muted"><?= lang('Auth.weNeverShare') ?></small>
                                </div>
                            </fieldset>

                            <div class="form-group">
                                <label for="web">Licna Web stranica</label>
                                <input type="text" class="form-control" id="web" name="web_str" placeholder="www.page.com" value="<?php echo $user[0]['web_str'] ?>">
                            </div>

                            <div class="form-group">
                                <label for="najznacajniji">10 najznacajnijih radova</label>
                                <textarea class="form-control" placeholder="" name="radovi" style="height: 100px"><?php echo $user[0]['radovi'] ?></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block"><?= lang('Sacuvaj Izmene') ?></button>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<?php $this->endSection(); ?>