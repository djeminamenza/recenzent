<?php

namespace App\Models;

use CodeIgniter\Model;

class IzmenaStatusaRezultata extends Model{
    protected $table = 'izmena ';
    protected $allowedFields = ['id_rezult', 'status', 'Konacan_Status', 'naziv'];
    protected $returnType = 'object';
       
    public function IzmenaStatusaRezultata(){
        return $this->builder()
        ->select("id_rezult, status, Konacan_Status, naziv" )
        ->get()->getResult();
    }
}
?> 