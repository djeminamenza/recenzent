<?php

namespace App\Models;

use CodeIgniter\Model;

class Oblast extends Model{
    protected $table = 'oblast';
    protected $allowedFields = ['naziv'];
    protected $returnType = 'object';
}
?>