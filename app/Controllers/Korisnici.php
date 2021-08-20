<?php

namespace App\Controllers;

class Korisnici extends BaseController
{
	public function index()
	{
		return view('korisnici/index');
	}

    public function prijava()
	{
		return view('korisnici/prijava');
	}
}
