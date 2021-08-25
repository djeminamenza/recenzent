<?php

namespace App\Controllers;

class Administratori extends BaseController
{
	public function index()
	{
		return view('administratori/index');
	}

	public function rezultati()
	{
		return view('administratori/rezultati');
	}

	public function prijave()
	{
		return view('administratori/prijave');
	}

	public function definicija()
	{
		return view('administratori/definicija');
	}

	public function recenzije()
	{
		return view('administratori/recenzije');
	}

	public function ankete()
	{
		return view('administratori/ankete');
	}

	public function obavestenja()
	{
		return view('administratori/obavestenja');
	}
	public function spisak()
	{
		return view('administratori/spisak');
	} 

}
