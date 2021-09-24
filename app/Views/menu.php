<?php
 $links = [
    //'Home' => 'home/index',
];


    /*
    in_groups()
    Function: Ensures that the current user is in at least one of the passed in groups.
    Parameters: Group IDs or names, as either a single item or an array of items.
    Returns: true or false
    */


        if(logged_in()){
            $links[user()->username.', Logout'] = 'logout';
            if(in_groups(1)){ ?>
         <div class="dropdown">
       <button class="btn btn-dark dropdown-toggle " type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        NAUČNI REZULTAT
        </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
        <button class="dropdown-item" type="button"><?= anchor('administratori/definicija', 'Definicija'); ?></button>
        <button class="dropdown-item" type="button"><?= anchor('administratori/rezultati', 'Rezultati'); ?></button>
       
       </div>
     </div>
     <div class="dropdown">
       <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        RECENZENTI
        </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
        <button class="dropdown-item" type="button"><?= anchor('administratori/prijave', 'Prijave'); ?></button>
        <button class="dropdown-item" type="button"><?= anchor('administratori/spisak', 'Spisak'); ?></button>
        <button class="dropdown-item" type="button"><?= anchor('administratori/recenzije', 'Recenzije'); ?></button>
        <button class="dropdown-item" type="button"><?= anchor('administratori/obavestenja', 'Obavestenja'); ?></button>
        </div>  
            </div>
            <div class="dropdown">
       <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        ANKETE
        </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
        <button class="dropdown-item" type="button"><?= anchor('administratori/anketa1', 'Anketa1'); ?></button>
        <button class="dropdown-item" type="button"><?= anchor('administratori/anketa2', 'Anketa2'); ?></button>
       
       </div>
     </div>
     <div class="dropdown">
       <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        POZIVI
        </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
        <button class="dropdown-item" type="button"><?= anchor('administratori/poziv', 'Pozivi'); ?></button>
        <button class="dropdown-item" type="button"><?= anchor('administratori/pitanja', 'Pitanja'); ?></button>
       
       </div>
     </div>
         

           <?php      
            

            }
            elseif
            (in_groups(2)){?>
         <ul class="nav nav-pills nav-fill">
              <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/recenzenti/profil">Profil</a>
             </li>
             <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/recenzenti/rezultati" >Rezultati</a>
             </li>
             <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/recenzenti/recenzije">Recenzije</a>
             </li>
             <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/recenzenti/ankete">Ankete</a>
             </li>
             <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/recenzenti/obavestenja">Obaveštenja</a>
             </li>
           </ul>
            
           <?php }
            elseif
            (in_groups(3)){
                $links['Status'] = 'korisnici/status_prijave';
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
     