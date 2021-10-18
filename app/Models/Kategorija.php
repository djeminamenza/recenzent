<?php

namespace App\Models;

use CodeIgniter\Model;

class Kategorija extends Model{
    protected $table = 'kategorija';
    protected $allowedFields = ['name'];
    protected $returnType = 'object';
}
?>