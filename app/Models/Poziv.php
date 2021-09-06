<?php

namespace App\Models;

use CodeIgniter\Model;

class Poziv extends Model{
    protected $table = 'poziv';
    protected $allowedFields = ['naziv'];
    protected $returnType = 'object';
}

?>