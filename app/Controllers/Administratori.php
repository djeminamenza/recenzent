<?php

namespace App\Controllers;

use App\Models\Kategorija;
use App\Models\Korisnici;
use App\Models\Oblast;
use App\Models\Poziv;
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
		$rezultatModel = new Rezultat();
		$podaci['rezultati'] = $rezultatModel->findAll();
		return view('administratori/rezultati', $podaci);
	}

	public function prijave()
	{
		$korisnici = new Korisnici();
		$data['korisnici'] = $korisnici->findAll();
		return view('administratori/prijave',$data);
	}
	public function poziv()
	{
		$pozivModel = new Poziv();
		$podaci['pozivi'] = $pozivModel->findAll();
		return view('administratori/poziv', $podaci);
	}

	public function definicija()
	{	
		$kategorijaModel = new Kategorija();
		$def['kategorije'] = $kategorijaModel->findAll();
		$oblastiModel = new Oblast();
		$def['oblasti'] = $oblastiModel->findAll();
		$pozivModel = new Poziv();
		$def['pozivi'] = $pozivModel->findAll();
		return view('administratori/definicija', $def);
		
	}

	public function attemptDefinicija(){
		if($this->validate([
			'naziv' => 'required',
			'biografije' => [
				'uploaded[biografije]',
				'mime_in[biografije,application/pdf]'
			]
			])){

				$rezultat = [			
					'id_poziv' =>$this->request->getPost('id_poziv'),	
					'id_kateg' =>$this->request->getPost('id_kateg'),
					'id_status' =>$this->request->getPost('id_status'),
					'naziv' =>$this->request->getPost('naziv'),		
					'datum' =>$this->request->getPost('datum'),		
					'opis' =>$this->request->getPost('opis'),		
					'clanovi' =>$this->request->getPost('clanovi'),		
					'god_rez' =>$this->request->getPost('god_rez'),		
					'datum_prijave' =>$this->request->getPost('naziv'),		
				];

				$biografijaID = $this->model->insert($rezultat, true);

				$biografijaName = $biografijaID . ".pdf";
				$biografija = $this->request->getFile('biografije');
				$biografija->move('../public/biografije/rezultati', $biografijaName, true);


				//$rezultat['id'] = $biografijaID;
				$rezultat['biografije'] = $biografijaName;
				$this->model->update($biografijaID, $rezultat);

				return redirect()->to('administratori/definicija')->with('message','Success');

			}else{
				return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
			}
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
