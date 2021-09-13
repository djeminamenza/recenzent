<?php
namespace App\Models;
use CodeIgniter\Model;
use Exception;

class RoleChange extends Model
{
    protected $table = 'auth_groups_users';
    protected $user_table = 'users';
    protected $recenzent_anketa = 'recenzent_anketa';
    
    // .. other member variables
    protected $db;

    public function __construct()
    {
        parent::__construct();
        $this->db = \Config\Database::connect();
        // OR $this->db = db_connect();
    }

    public function update_data($id, $data = array())
    {
        try{
            $this->db->table($this->table)->update($data, array(
                "user_id" => $id,
            ));
            return $this->db->affectedRows();
        }catch(Exception $e){
            throw new \RuntimeException($e->getMessage(), $e->getCode(), $e);
        }
    }

    public function delete_data($id)
    {
        try{
            $this->db->table($this->user_table)->delete(array(
                "id" => $id,
            ));
            return $this->db->affectedRows();
        }catch(Exception $e){
            throw new \RuntimeException($e->getMessage(), $e->getCode(), $e);
        }
    }
}