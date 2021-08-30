<?php

namespace App\Controllers;

use App\Models\Kategorija;
use App\Models\Korisnici;
use App\Models\Oblast;
use Myth\Auth\Models;
use CodeIgniter\Model;
use Myth\Auth\Authorization\GroupModel;
use Myth\Auth\Entities\User;

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
		$korisnici = new Korisnici();
		$data['korisnici'] = $korisnici->findAll();
		return view('administratori/prijave',$data);
	}

	public function definicija()
	{
		$kategorijaModel = new Kategorija();
		$data['kategorije'] = $kategorijaModel->findAll();
		$oblastiModel = new Oblast();
		$data['oblasti'] = $oblastiModel->findAll();
		return view('administratori/definicija',$data);


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
