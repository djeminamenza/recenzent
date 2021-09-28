<?php

namespace App\Models;

use CodeIgniter\Model;
use Myth\Auth\Models\LoginModel;
use Myth\Auth\Models\UserModel;

class Prijava extends Model{
    protected $table = 'prijava';
    protected $allowedFields = ['id_user','id_status'];
    protected $returnType = 'object';



    public function changeStatus_prijave($id){
        return $this->builder()
        ->set('id_status', 3)
        ->where('id_user',$id)
        ->update();
        }
}