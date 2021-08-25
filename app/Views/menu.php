<?php
    $links = [
        'Home' => 'home',
    ];


    //lang('Home.hello',['Jimmy'])

    /*
    in_groups()
    Function: Ensures that the current user is in at least one of the passed in groups.
    Parameters: Group IDs or names, as either a single item or an array of items.
    Returns: true or false
    */


        if(logged_in()){
            $links[user()->username.', Logout'] = 'logout';
            if(in_groups(1)){
                $links['Rezultati'] = 'administratori/rezultati';
                $links['Prijave'] = 'administratori/prijave';
                $links['Recenzije'] = 'administratori/recenzije';
                $links['Definicija'] = 'administratori/definicija';
                $links['Ankete'] = 'administratori/ankete';
                $links['Obavestenja'] = 'administratori/obavestenja';  
                $links['Spisak'] = 'administratori/spisak';              
            }
            if(in_groups(2)){
                $links['Profil'] = 'recenzenti/profil';
                $links['Rezultati'] = 'recenzenti/rezultati';
                $links['Recenzije'] = 'recenzenti/recenzije';
                $links['Ankete'] = 'recenzenti/ankete';
                $links['Obavestenja'] = 'recenzenti/obavestenja';                
            }
            if(in_groups(3)){
                $links['Index'] = 'korisnici/index';
                $links['Prijava'] = 'korisnici/prijava';              
            }
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