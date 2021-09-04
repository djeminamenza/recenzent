<?php

namespace App\Controllers;

use App\Models\Kategorija;
use App\Models\Korisnici;
use App\Models\Oblast;
use App\Models\Rezultat;
use Myth\Auth\Models;
use CodeIgniter\Model;
use Myth\Auth\Authorization\GroupModel;
use Myth\Auth\Entities\User;

class Administratori extends BaseController
{
// *********************************************************
// dodato za probu uploadovanja biografije
	protected $model;
	public function __construct()
	{
		$this->model = new Rezultat();
	}
// kraj dodatka
// *********************************************************


	public function index()
	{
		return view('administratori/index');
	}

	public function rezultati()
	{
		return view('administratori/rezultati');
	}

	public function upload(){
		if($this->validate([
			'naziv' => 'required',
			'opis' => [
				'uploaded[opis]',
				'mime_in[opis,application/pdf]'
			]
			])){

				$rezultat = [
					'naziv' =>$this->request->getPost('naziv'),					
				];

				$biografijaID = $this->model->insert($rezultat, true);

				$biografijaName = $biografijaID . ".pdf";
				$biografija = $this->request->getFile('opis');
				$biografija->move('../public/biografije', $biografijaName, true);


				$rezultat['id'] = $biografijaID;
				$rezultat['opis'] = $biografijaName;
				$this->model->update($biografijaID, $rezultat);

				return redirect()->to('administratori/rezultati')->with('message','Success');

			}else{
				return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
			}
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
