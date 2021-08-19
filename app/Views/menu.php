<?php
    $links = [
      'Home' => 'home/index',
        'Movies' => 'movies/index',
        'About' => 'home/index#about',
        'Contact' => 'home/index#contact',
        'Login' => 'login',
        'Prijava' =>'prijava',
    ];

/*     if(logged_in()){
        $links[lang('Home.logout', [user()->username])] = 'logout'; */


    foreach($links as $text => $url):?>
        <li class="nav-item mx-0 mx-lg-1">
            <?= anchor($url, $text, ['class'=>'nav-link py-3 px-0 px-lg-3 rounded']) ?>
        </li>
    <?php endforeach; ?>