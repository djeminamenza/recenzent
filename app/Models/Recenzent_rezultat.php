<?php

namespace App\Models;

use CodeIgniter\Model;

class Recenzent_rezultat extends Model{
    protected $table = 'recenzent_rezultat';
    protected $allowedFields = ['datum_dodele','id', 'id_user', 'id_status', 'id_rezult'];
    protected $returnType = 'object';

    public function Recenzent_rezultat(){
        return $this->builder()
        // ->select ("(select rezultat.naziv, users.ime, users.prezime, recenzent_rezultat.datum_dodele,status_rezultata.opis from recenzent_rezultat left join users on recenzent_rezultat.id_user = users.id
        // join rezultat on recenzent_rezultat.id_rezult = rezultat.id join status_rezultata on recenzent_rezultat.id_status = status_rezultata.id) as rez")
        ->select("recenzent_rezultat.id, id_user, datum_dodele, rezultat.naziv, concat(users.ime,' ', users.prezime) as recen, status_rezultata.opis, izmena.status")
        ->where('rezultat.id = recenzent_rezultat.id_rezult')
        ->where('users.id = recenzent_rezultat.id_user')
        ->where('status_rezultata.id= recenzent_rezultat.id_status')
        ->where('izmena.id_rezult = recenzent_rezultat.id_rezult')
        ->from('rezultat')
        ->from('users')
        ->from('status_rezultata')
        ->from('izmena')
        ->orderBy('rezultat.naziv')
        ->get()->getResult();
    }
}
/* select rezultat.naziv, users.ime, users.prezime, recenzent_rezultat.datum_dodele,status_rezultata.opis from recenzent_rezultat left join users on recenzent_rezultat.id_user = users.id 
join rezultat on recenzent_rezultat.id_rezult = rezultat.id join status_rezultata on recenzent_rezultat.id_status = status_rezultata.id */
?>