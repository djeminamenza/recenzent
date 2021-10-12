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


    <script>

        function send(){
            let params = {
                id_to_send : <?= $user[0]->id?>,
            };
            console.log(JSON.stringify(params));

            let url = "<?=site_url('administratori/send')?>";
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