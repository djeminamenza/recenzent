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

// **********************************************************
    ->select("opis, id_status_prijave")
    //->where('prijava.id_user = users.id')
    ->where('users.id_status_prijave = status_prijave.id')
// **********************************************************    


    ->where('users.id = auth_groups_users.user_id')
    ->where('auth_groups_users.group_id = auth_groups.id')
    ->where("auth_groups.id != 1")
    ->from('auth_groups')
    ->from('auth_groups_users')
// **********************************************************
    //->from('prijava')
    ->from('status_prijave')
// **********************************************************
    ->get()->getResult();
    }   
}
/*

SELECT * FROM users
inner join auth_groups_users 
on id = auth_groups_users.user_id
inner join auth_groups 
where auth_groups_users.group_id = auth_groups.id 
and auth_groups.name=3


*/
?>