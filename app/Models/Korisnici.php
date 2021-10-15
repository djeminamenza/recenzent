<?php

namespace App\Models;

use CodeIgniter\Model;

class Korisnici extends Model{
    protected $table = 'users';
    protected $allowedFields = ['id'];
    protected $returnType = 'object';


public function dohvatiKorisnike(){
    return $this->builder()
    ->select("users.id as kid, concat(ime,' ',prezime) as korisnik")
    ->select("name as uloga")
    ->select("auth_groups.id as gid ")
    ->select("opis, id_status_prijave")
// **********************************************************
    ->where('users.id_status_prijave = status_prijave.id')
    ->where('users.id = auth_groups_users.user_id')
    ->where('auth_groups_users.group_id = auth_groups.id')
    ->where("auth_groups.id != 1")
// **********************************************************
    ->from('auth_groups')
    ->from('auth_groups_users')
    ->from('status_prijave')
// **********************************************************
    ->get()->getResult();
}        
    /*  SELECT * FROM users
        inner join auth_groups_users 
        on id = auth_groups_users.user_id
        inner join auth_groups 
        where auth_groups_users.group_id = auth_groups.id 
        and auth_groups.name=3
    */
    public function dohvatiRecenzente(){
        return $this->builder()
        ->select("users.id as kid, concat(ime,' ',prezime) as recenzent")
        //->select("auth_groups.id as gid ")
    // **********************************************************
        ->where('users.id = auth_groups_users.user_id')
        ->where('auth_groups_users.group_id = 2')
    // **********************************************************
        ->from('auth_groups_users')
    // **********************************************************
        ->get()->getResult();
    } 

    public function trebaMiEmail($id){
        $korisnik = new Korisnici;
        return $korisnik->builder()
        ->select('id, ime, prezime, email')
        ->where('id',$id)
        ->get()->getResult();
    
       }
          

    /**
     * Ucitavamo sve podatke o korisniku
     * metoda se poziva u "Recenzenti" kontroleru, "profil()" metoda
     * saljemo array data natrag metodi
     */
    public function loadUser($id){
        $query = "
            SELECT users.ime, users.prezime, users.organizacija, users.id_zemlje as zemlja, users.id_nac as nacionalnost, users.id_oblast as oblast, users.id_zvanja as zvanje,
            users.adresa, users.telefon, users.web_str, users.radovi, users.biografija, users.email
            FROM users 
            WHERE users.id = ".$id;
        
        $query=$this->db->query($query);
            
        return $query->getResultArray();
    }

    /**
     * Snimamo izmenjene podatke o korisniku natrag u bazu
     *  metoda se poziva u "Recenzenti" kontroleru, "sacuvajIzmene()" metoda
     */
    public function saveUserData($userData){

        //UPDATE query
        $query="
        UPDATE users 
        SET 
        email = '".$userData['email']."',
        ime = '".$userData['ime']."',
        prezime = '".$userData['prezime']."',
        id_nac = '".$userData['id_nac']."',
        id_zemlje = '".$userData['id_zemlje']."',
        id_oblast = '".$userData['id_oblast']."',
        id_zvanja = '".$userData['id_zvanja']."',
        organizacija = '".$userData['organizacija']."',
        telefon = '".$userData['telefon']."',
        adresa = '".$userData['adresa']."',
        web_str = '".$userData['web_str']."',
        radovi =  '".$userData['radovi']."'
        WHERE id =".$userData['sessid'];
        
        //vracamo true ili false response u metodu kako bi formirali response message
        try{
            $query=$this->db->query($query);
            return true;
        }catch(\Exception $e){
            return false;
        }
    }
}

?>