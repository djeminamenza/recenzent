<?php

namespace App\Models;

use CodeIgniter\Model;

class Broj_rezultata extends Model{
    protected $table = 'recenzent_rezultat';
    protected $allowedFields = [ 'id_user', 'id_status', 'id_rezult'];
    protected $returnType = 'object';

    public function Broj_rezultata(){
        return $this->builder()
        ->select("concat(users.ime,' ', users.prezime) as recen, rezultat.naziv, count(*) as zbir, status_rezultata.opis")
        ->where('users.id = recenzent_rezultat.id_user')
        ->where('rezultat.id = recenzent_rezultat.id_rezult')
        ->where('status_rezultata.id = recenzent_rezultat.id_status')
        ->from('users')
        ->from('rezultat')
        ->from('status_rezultata')
        ->groupBy('users.id')
        ->get()->getResult();
    }
}

 /*select users.ime, rezultat.naziv, count(*) from recenzent_rezultat join users on users.id = recenzent_rezultat.id_user
  join rezultat on rezultat.id = recenzent_rezultat.id_rezult join status_rezultata on status_rezultata.id = recenzent_rezultat.id_status
   where status_rezultata.opis = "razmatra se" group by users.ime */
?>