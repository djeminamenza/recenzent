<?php

namespace App\Controllers;

use App\Models\Status_prijave;

class Korisnici extends BaseController
{
	protected $model;
	public function __construct()
	{
		$this->model = new Status_prijave();
		
	}	

	// public function index()
	// {
	// 	return view('administratori/index');
	// }

	public function status_prijave()
	{
		// $status_prijave = $this->model->getStatus_prijave();
		// //$status_prijaveModel = new Status_prijave();
		// //$podaci['statusi'] = $status_prijaveModel->findAll();
		$status =  $this->model->getStatus_prijave();
		$podaci['statusi'] = $status->getResult();
		return view('korisnici/status_prijave', $podaci);

	}

//public function attemptStatus(){
	
//	if($this->validate([
//		'opis'=> 'required'

//	]))
//	{
	
//		$status_prijave =[
//			'opis'=>$this->request->getPost('opis'),
//		];
	//	$status_prijaveID = $this->model->insert($status_prijave, true);
	//	$status_prijave[['id']] = $status_prijaveID;
	//	$status_prijaveModel = new Status_prijave();
	//	foreach($this->request->getPost('opis') as $o){
	//		$record = [
	//			'status_prijaveID' => $status_prijaveID,
	//			'opis' =>$o,
	//		];
//			$status_prijaveModel->insert($record);
//		}
//		return redirect()->to('korisnici/status_prijave')->with('message', 'Success');
//	}else{
//		return redirect()->back()->withInput->with('errors', $this->validator->getErrors());
//	}
//}
}

