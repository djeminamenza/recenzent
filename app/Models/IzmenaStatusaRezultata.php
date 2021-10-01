<?php

namespace App\Models;

use CodeIgniter\Model;

class IzmenaStatusaRezultata extends Model{
    protected $table = 'izmena ';
    protected $allowedFields = ['id_rezult', 'status_rezultata'];
    protected $returnType = 'object';


       
    public function IzmenaStatusaRezultata(){
        return $this->builder()
        ->select("id_rezult, status_rezultata" )
        ->get()->getResult();
    }
}

?>
 
 