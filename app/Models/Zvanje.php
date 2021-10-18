<?php

namespace App\Models;

use CodeIgniter\Model;

class Zvanje extends Model{
    protected $table = 'zvanje';
    protected $allowedFields = ['naziv'];
    protected $returnType = 'object';
}
?>