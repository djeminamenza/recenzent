<?php

namespace App\Models;

use CodeIgniter\Model;

class Poziv extends Model{
    protected $table = 'poziv';
    protected $allowedFields = ['naziv','id'];
    protected $returnType = 'object';

    public function umetniPoziv($name){
        $object = new Poziv();
        return $this->builder()
        ->insert($name);
    }
}