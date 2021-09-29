<?php

namespace App\Models;

use CodeIgniter\Model;

class Izbor_recenzenta extends Model{
    protected $table = 'recenzent_rezultat';
    protected $allowedFields = ['datum_dodele', 'id_user', 'id_status', 'id_rezult'];
    protected $returnType = 'object';

    public function Izbor_recenzenta(){
        return $this->builder()
        ->select("(select naziv from rezultat
                where rezultat.id = recenzent_rezultat.id_rezult) as izbonaziv")
        ->select("(select concat(users.ime,' ', users.prezime) from users
                where users.id = recenzent_rezultat.id_user)as recen")     
        ->select('id_user, id_rezult')
        ->get()->getResult();
    }
}
?>