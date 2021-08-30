<?php

namespace App\Models;

use CodeIgniter\Model;

class Korisnici extends Model{
    protected $table = 'users';
    protected $allowedFields = ['email'];
    protected $returnType = 'object';
}

?>