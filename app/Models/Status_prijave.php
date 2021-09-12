<?php

namespace App\Models;

use CodeIgniter\Model;
use Myth\Auth\Models\LoginModel;
use Myth\Auth\Models\UserModel;

class Status_prijave extends Model{
    protected $table = 'status_prijave';
    protected $allowedFields = ['opis'];
    protected $returnType = 'object';

    

public function getStatus_prijave(){
    return $this->builder()
        ->select('status_prijave.id, opis, id_user, id_status')
        ->where('prijava.id_user', user_id())
        ->where('prijava.id_status = status_prijave.id')
        ->from('prijava')
        ->get();
    }
}