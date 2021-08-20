<?php

namespace App\Controllers;

class Recenzenti extends BaseController
{
	public function index()
	{
		return view('recenzenti/index');
	}

    public function profil()
	{
		return view('recenzenti/profil');
	}

    public function rezultati()
	{
		return view('recenzenti/rezultati');
	}

    public function recenzije()
	{
		return view('recenzenti/recenzije');
	}

    public function ankete()
	{
		return view('recenzenti/ankete');
	}

    public function obavestenja()
	{
		return view('recenzenti/obavestenja');
	}
}
