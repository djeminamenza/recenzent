<?php

namespace App\Models;

use CodeIgniter\Model;

class Rezultat extends Model{
    protected $table = 'rezultat';
    protected $allowedFields = ['naziv','opis'];
    protected $returnType = 'object';
}

?>