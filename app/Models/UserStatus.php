<?php

namespace App\Models;

use CodeIgniter\Model;

class UserStatus extends Model{
    protected $table = 'users';
    protected $allowedFields = ['id_status_prijave'];
    protected $returnType = 'object';


    public function promeniMiStatus($id){
        return $this->builder()
        ->set('id_status_prijave', 3)
        ->where('id_status_prijave',1)
        ->where('id',$id)
        ->update();
    }

    public function odbijMe($id){
        return $this->builder()
        ->set('id_status_prijave', 4)
        ->where('id_status_prijave',1)
        ->where('id',$id)
        ->update();
    }
}
?>