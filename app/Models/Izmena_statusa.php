<?php

namespace App\Models;

use CodeIgniter\Model;

class Izmena_statusa extends Model{
    protected $table = 'izmena ';
    protected $allowedFields = ['id_rezult', 'status'];
    protected $returnType = 'object';


       
    public function Izmena_statusa(){
        return $this->builder()
        ->select("id_rezult, status" )
        ->get()->getResult();
    }
}

?>
 
 