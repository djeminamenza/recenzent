<?php

namespace App\Models;

use CodeIgniter\Model;

class Status extends Model{
    protected $table = 'status_rezultata';
    protected $allowedFields = ['opis'];
    protected $returnType = 'object';
}

?>