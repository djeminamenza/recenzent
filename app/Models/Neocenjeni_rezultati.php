<?php

namespace App\Models;

use CodeIgniter\Model;

class Neocenjeni_rezultati extends Model{
    protected $table = 'recenzent_rezultat';
    protected $allowedFields = [ 'id_user', 'id_status', 'id_rezult'];
    protected $returnType = 'object';

    public function Neocenjeni_rezultati($id){
        return $this->builder()
        ->select("concat(users.ime,' ', users.prezime) as recen, status_rezultata.opis")
        ->select("count(status_rezultata.opis) as zbir")
        ->where('users.id', $id)
        ->where('recenzent_rezultat.id_user',$id)
        ->where('status_rezultata.opis','razmatra se')
        ->where('status_rezultata.id = recenzent_rezultat.id_status')
        ->from('users')
        ->from('status_rezultata')
        ->get()->getResult();
    }
}
?>