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


        if(logged_in()){ ?>
          <button class="btn dropdown-item" type="button" id="logbtn"><?= anchor('logout', user()->username.', LOGOUT'); ?></button>
 
          
         <?php   if(in_groups(1)){ ?>
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
                      <button class="btn dropdown-item mr-1" type="button" id="nlogbtn"><?= anchor('recenzenti/profil', 'Profil'); ?></button>
                      <button class="btn dropdown-item mr-1" type="button" id="nlogbtn"><?= anchor('recenzenti/rezultati', 'Rezultati'); ?></button>
                      <button class="btn dropdown-item mr-1" type="button" id="nlogbtn"><?= anchor('recenzenti/recenzije', 'Recenzije'); ?></button>
                      <button class="btn dropdown-item mr-1" type="button" id="nlogbtn"><?= anchor('recenzenti/ankete', 'Ankete'); ?></button>
                      <button class="btn dropdown-item mr-1" type="button" id="nlogbtn"><?= anchor('recenzenti/obavestenja', 'Obavestenja'); ?></button>

           
            
           <?php }
            elseif
            (in_groups(3)){?>
              <button class="btn dropdown-item mr-1" type="button" id="nlogbtn"><?= anchor('korisnici/status_prijave', 'Status'); ?></button>

                
           <?php }

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
        
    