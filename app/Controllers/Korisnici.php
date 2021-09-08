<?php

namespace App\Controllers;

use App\Models\Status;

class Korisnici extends BaseController
{

/* 	protected $model;
	public function __construct()
	{
		$this->model = new Korisnici();
	} */

	
	public function index()
	{
		$statusi = new Status();
		$data['status_prijave']=$statusi->findAll();
		//$data['id'] = $this->model->id;
		return view('korisnici/index', $data);
	}

}
