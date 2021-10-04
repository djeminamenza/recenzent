<?php

namespace App\Models;

use CodeIgniter\Model;

class Rezultat extends Model{
    protected $table = 'rezultat';
    protected $allowedFields = ['naziv', 'id_poziv', 'id_kateg','id_status',
                                'datum', 'opis','clanovi','biografije', 
                                'id_oblast','god_rez', 'datum_prijave'];
    protected $returnType = 'object';


    public function dohvatiRezultate(){
        return $this->builder()
        ->select('rezultat.naziv as ime, datum_prijave')
        ->select("(select naziv from poziv
                where id_poziv = poziv.id) as rezpoziv")
        ->select("(select opis from kategorija
                where id_kateg = kategorija.id) as rezkateg")
        ->select("(select naziv from oblast
                where id_oblast = oblast.id) as rezoblast")
        ->select("(select opis from status_rezultata
                where id_status = status_rezultata.id) as rezstatus")
        ->get()->getResult();
    }

    
    public function promeniStatusRezultataUOdbijen($id){
        return $this->builder()
        ->set('id_status',2)
        ->where('id',$id)
        ->update();
    }

    public function promeniStatusRezultataUPrihvacen($id){
        return $this->builder()
        ->set('id_status',1)
        ->where('id',$id)
        ->update();
    }
    
}
/*
        ->join('kategorija k', 'id_kateg = k.id', 'inner')
        ->join('oblast o', 'id_oblast = o.id', 'inner')
        ->join('status_rezultata s', 'id_status = s.id', 'inner')
*/
?>
