<?php

namespace App\Models;

use CodeIgniter\Model;

class AuthGroupsUsers extends Model{
    protected $table = 'auth_groups_users';
    protected $allowedFields = ['group_id','user_id'];
    protected $returnType = 'object';


    public function prebaciURecenzente($id){
        return $this->builder()
        ->set('group_id', 2)
        ->where('group_id',3)
        ->where('user_id',$id)
        ->update();
    }

}

?>