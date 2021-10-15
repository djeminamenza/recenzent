<?php
    $this->extend('layout');
    $this->section('content');
?>
    <div class="container masthead mx-auto">

        <h1 style="text-align: center;">Pregled anketa</h1>
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Ime</th>
                <th>Prezime</th>
                <th>Email</th>
                <th>Send</th>
            </tr>
            <?php
                //echo var_dump($user);
                echo '<td>'.$user[0]->id.'</td>';
                echo '<td>'.$user[0]->ime.'</td>';
                echo '<td>'. $user[0]->prezime. '</td>';
                echo '<td>'. $user[0]->email. '</td>';
                echo '<td><button class="btn btn-sm btn-secondary" onclick="send()">Send</button></td>';
                echo '</tr>';
            ?>  
        </table>
    </div>
    <form action="<?= site_url('administratori/send') ?>" method="POST" enctype="multipart/form-data">
    <?=csrf_field() ?>

    
    <div class="form-row">
  
    <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" name='id' value="<?=$user[0]->id?>">
                  </div>
        <button type="submit" class="btn btn-primary btn-block">шаљи на перу</button>
        </div>
      </form>


    <script>

        function send(){
            let params = {
                id :<?= $user[0]->id?>,
            };
            console.log(JSON.stringify(params));

            let url = "<?=site_url('Аdministratori/send')?>";
            fetch(url, {
                method: 'post',
                headers: {
                    "Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"
                },
                body: JSON.stringify(params)
            })
            .then(params => {
            console.log('Success:', params);
            });
        }
    </script>

<?php $this->endSection(); ?>     