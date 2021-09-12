<?php

namespace App\Models;

use CodeIgniter\Model;

class Korisnici extends Model{
    protected $table = 'users';
    protected $allowedFields = ['id'];
    protected $returnType = 'object';

    // public function __construct()
    // {
    //     $this->model = new Korisnici();
    // }

public function dohvatiKorisnike(){
    return $this->builder()
    ->select("users.id, concat(ime,' ',prezime) as korisnik")
    ->select("description as uloga")
    ->where('users.id = auth_groups_users.user_id')
    ->where('auth_groups_users.group_id = auth_groups.id')
    ->where("auth_groups.name = 'korisnik'")
    ->from('auth_groups')
    ->from('auth_groups_users')
    ->get()->getResult();
    }   
}
/*
SELECT * FROM users 
inner join auth_groups_users a 
on users.id = a.user_id 
inner join auth_groups g 
where a.group_id = g.id 
and g.name='korisnik'

SELECT * FROM users
inner join auth_groups_users 
on id = auth_groups_users.user_id
inner join auth_groups 
where auth_groups_users.group_id = auth_groups.id 
and auth_groups.name=3


*/
?>