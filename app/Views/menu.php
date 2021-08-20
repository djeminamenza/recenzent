<?php
    $links = [
        'Home' => 'home',
        'Admin' => 'admins/index',
    ];


    //lang('Home.hello',['Jimmy'])


        if(logged_in()){
        $links[user()->username.', Logout'] = 'logout'; 
        }else{
        $links['Login'] = 'login';
        $links['Register'] ='register';
        }


    foreach($links as $text => $url):?>
        <li class="nav-item mx-0 mx-lg-1">
            <?= anchor($url, $text, ['class'=>'nav-link py-3 px-0 px-lg-3 rounded']) ?>
        </li>
    <?php endforeach; ?>
    <li class="nav-item mx-0 mx-lg-1">