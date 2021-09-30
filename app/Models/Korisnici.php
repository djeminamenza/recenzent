<?php

namespace App\Models;

use CodeIgniter\Model;
use Exception;

class Korisnici extends Model{
    protected $table = 'users';
    protected $allowedFields = ['id'];
    protected $returnType = 'object';
    protected $db;

    public function __construct()
    {
        parent::__construct();
        $this->db = \Config\Database::connect();
        // OR $this->db = db_connect();
    }


    public function dohvatiKorisnike(){
        return $this->builder()
        ->select("users.id as kid, concat(ime,' ',prezime) as korisnik")
        ->select("name as uloga")
        ->select("auth_groups.id as gid ")

    // **********************************************************
        ->select("opis, id_user, id_status,status_prijave.id as sid")
        ->where('prijava.id_user = users.id')
        ->where('prijava.id_status = status_prijave.id')
    // **********************************************************    


        ->where('users.id = auth_groups_users.user_id')
        ->where('auth_groups_users.group_id = auth_groups.id')
        ->where("auth_groups.id != 1")
        ->from('auth_groups')
        ->from('auth_groups_users')
    // **********************************************************
        ->from('prijava')
        ->from('status_prijave')
    // **********************************************************
        ->get()->getResult();
    }   

    /*For now just update user created at */
    public function updateUser($id)
    {
        try{
            $data= array("updated_at" => date("Y-m-d H:i:s"));
            $this->db->table($this->table)->update($data, array(
                "id" => $id,
            ));
        }catch(Exception $e){
            throw new \RuntimeException($e->getMessage(), $e->getCode(), $e);
        }
    }

    public function getUserEmail($id){
        try{
           return $this->db->table($this->table)->select('email')->where('id',$id)->get();
        }catch(Exception $e){
            throw new \RuntimeException($e->getMessage(), $e->getCode(), $e);
        }
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