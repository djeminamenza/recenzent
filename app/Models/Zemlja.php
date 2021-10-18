<?php

namespace App\Models;

use CodeIgniter\Model;

class Zemlja extends Model{
    protected $table = 'zemlja';
    protected $allowedFields = ['naziv'];
    protected $returnType = 'object';
}
?>