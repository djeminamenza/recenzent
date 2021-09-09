<?php

namespace App\Models;

use CodeIgniter\Model;

class Rezultat extends Model{
    protected $table = 'rezultat';
    protected $allowedFields = ['naziv', 'id_poziv', 'id_kateg','id_status',
                                'datum', 'opis','clanovi','biografije', 
                                'id_oblast','god_rez', 'datum_prijave'];
    protected $returnType = 'object';


    // public function __construct()
    // {
    //     $this->model = new Rezultat();
    // }
    
		/*
        select * from rezultat
        inner JOIN poziv p on p.id = rezultat.id_poziv
        inner JOIN kategorija k on k.id = rezultat.id_kateg
        inner join oblast o on o.id = rezultat.id_oblast
        inner JOIN status_rezultata as s on s.id = rezultat.id_status
        */
        /*
        select r.naziv, p.naziv, k.opis, o.naziv, r.datum_prijave, s.opis
        from rezultat r, poziv p, kategorija k, oblast o, status_rezultata s
        where r.id_poziv = p.id and r.id_kateg = k.id and r.id_oblast = o.id and r.id_status = s.id
        */

    public function dohvatiRezultate(){
        return $this->builder()
        ->select('rezultat.naziv as ime, datum_prijave')
        ->select("(select naziv from poziv
                where id_poziv = poziv.id) as rezpoziv")
        ->select("(select opis from kategorija
                where id_kateg = kategorija.id) as rezkateg")
        ->select("(select naziv from oblast
                where id_oblast = oblast.id) as rezoblast")
        ->select("(select naziv from status_rezultata
                where id_status = status_rezultata.id) as rezstatus")
        ->get();
    }
    
}
/*
        ->join('kategorija k', 'id_kateg = k.id', 'inner')
        ->join('oblast o', 'id_oblast = o.id', 'inner')
        ->join('status_rezultata s', 'id_status = s.id', 'inner')
*/
?>
