<?php

namespace App\Controllers;

use App\Models\Status;

class Korisnici extends BaseController
{
	public function index()
	{
		$statusi= New Status();
		$data['status_prijave']=$statusi->findAll();
		return view('korisnici/index', $data);
	}

    public function prijava()
	{
		return view('korisnici/prijava');
	}
}
