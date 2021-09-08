<?php

namespace App\Models;

use CodeIgniter\Model;

class Korisnici extends Model{
    protected $table = 'users';
    protected $allowedFields = ['id', 'id_status'];
    protected $returnType = 'object';
}

?>