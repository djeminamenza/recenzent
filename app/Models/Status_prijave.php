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
        ->select('status_prijave.id, opis, users.id, users.id_status_prijave')
        ->where('users.id', user_id())
        ->where('users.id_status_prijave = status_prijave.id')
        ->from('users')
        ->get();
    }
}