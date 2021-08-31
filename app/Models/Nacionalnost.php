<?php

namespace App\Models;

use CodeIgniter\Model;

class Nacionalnost extends Model{
    protected $table = 'nacionalnost';
    protected $allowedFields = ['naziv'];
    protected $returnType = 'object';
}

?>