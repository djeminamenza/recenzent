<?php

namespace App\Controllers;

use App\Models\Status;

class Korisnici extends BaseController
{
	public function index()
	{
		$statusi = new Status();
		$data['status_prijave'] = $statusi->findAll();
		return view('korisnici/index', $data);	
	}

}
