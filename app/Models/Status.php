<?php

namespace App\Models;

use CodeIgniter\Model;

class Status extends Model{
    protected $table = 'status_prijave';
    protected $allowedFields = ['opis'];
    protected $returnType = 'object';
}

?>