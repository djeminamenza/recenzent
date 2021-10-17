<?php
namespace App\Models;
use CodeIgniter\Model;
use Myth\Auth\Models\LoginModel;
use Myth\Auth\Models\UserModel;
class Status_recenzije extends Model{
    protected $table = 'recenzent_rezultat';
    protected $allowedFields = ['id, id_user, id_rezult, id_status'];
    protected $returnType = 'object';
   
// public function Status_recenzije(){
//     return $this->builder()
//         ->select('recenzent_rezultat.id, id_rezult, rezultat.naziv,recenzent_rezultat.id_status, status_rezultata.opis')
//         ->where('users.id', user_id())
//        // ->where('users.id_status_prijave = status_prijave.id')
//         ->from('rezultat')
//         ->from('users')
//         ->from('status_rezultata')
//         ->get();
//     }

    public function Status_recenzije(){
        return $this->builder()
        ->select('recenzent_rezultat.id, id_rezult, rezultat.naziv, recenzent_rezultat.id_status, status_rezultata.opis')
        ->where('users.id', user_id())
        ->where('users.id = recenzent_rezultat.id_user')
        ->where('rezultat.id = recenzent_rezultat.id_rezult')
        ->where('status_rezultata.id = recenzent_rezultat.id_status ')
        ->from('rezultat')
        ->from('users')
        ->from('status_rezultata')
        ->get();
    }

    public function promeniStatusRecenzijeUOdbijen($id){
        return $this->builder()
        ->set('id_status',2)
        ->where('id',$id)
        ->update();
    }

    public function promeniStatusRecenzijeUPrihvacen($id){
        return $this->builder()
        ->set('id_status',1)
        ->where('id',$id)
        ->update();
    }

}