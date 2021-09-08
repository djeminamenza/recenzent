<?php

namespace App\Models;

use CodeIgniter\Model;

class Rezultat extends Model{
    protected $table = 'rezultat';
    protected $allowedFields = ['naziv', 'id_poziv', 'id_kateg','id_status',
                                'datum', 'opis','clanovi','biografije', 
                                'id_oblast','god_rez', 'datum_prijave'];
    protected $returnType = 'object';

    
		/*
        select * from rezultat
        inner JOIN poziv p on p.id = rezultat.id_poziv
        inner JOIN kategorija k on k.id = rezultat.id_kateg
        inner join oblast o on o.id = rezultat.id_oblast
        inner JOIN status_rezultata as s on s.id = rezultat.id_status
        */
/*
    public function dohvatiRezultate(){
        return $this->builder()
        ->select("id, naziv, opis, clanovi, god_rez, datum_prijave")
        ->select("(select poziv where poziv.id = rezultat.id_poziv)
                left JOIN kategorija k on k.id = rezultat.id_kateg
                left join oblast o on o.id = rezultat.id_oblast
                left JOIN status_rezultata as s on s.id = rezultat.id_status")
        ->get();
    }
*/    
}

?>