<?php

namespace App\Controllers;

use App\Models\AuthGroupsUsers;
use App\Models\Kategorija;
use App\Models\Korisnici;
use App\Models\Oblast;
use App\Models\Poziv;
use App\Models\IzmenaStatusaRezultata;
use App\Models\Rezultat;
use App\Models\Recenzent_rezultat;
use App\Models\Broj_rezultata;
use App\Models\Prijave;
use App\Models\UserStatus;
use App\Models\Izbor_recenzenta;
use Myth\Auth\Models;
use CodeIgniter\Model;
use Exception;
use Myth\Auth\Authorization\GroupModel;
use Myth\Auth\Entities\User;
use Myth\Auth\Models\UserModel;


class Administratori extends BaseController
{
// *********************************************************
// dodato za probu uploadovanja biografije
	protected $modelRezultat; 
	protected $request;
	protected $modelPoziv;
	protected $modelAuthGroupsUsers;
	protected $modelPrijave;
	protected $modelIzmenaStatusaRezultata;
	protected $modelIzbor_recenzenta;
	protected $modelUserStatus;



	public function __construct()
	{
		$this->modelRezultat = new Rezultat(); 
		$this->modelPoziv = new Poziv();
		$this->modelAuthGroupsUsers = new AuthGroupsUsers();
		$this->modelPrijava = new Prijave();
		$this->modelIzmena_Statusa = new IzmenaStatusaRezultata();
		$this->modelIzbor_recenzenta = new Izbor_recenzenta();
		$this->modelUserStatus = new UserStatus();

	
	}
// kraj dodatka
// *********************************************************


	public function index()
	{
		return view('administratori/index');
	}

	public function rezultati()
	{
		$data['rezultati'] = $this->modelRezultat->dohvatiRezultate();
		return view('administratori/rezultati', $data);
	}

	public function prijave()
	{
		$korisnici = new Korisnici();
		$data['korisnici'] = $korisnici->dohvatiKorisnike();
		return view('administratori/prijave',$data);
	}


	public function poziv()
	{
		$podaci['pozivi'] = $this->modelPoziv->findAll();
		return view('administratori/poziv', $podaci);
	}


	public function attemptPoziv(){
	
		if($this->validate([
			'naziv'=> 'required'

		])){
			$poziv =[
				'naziv'=>$this->request->getPost('naziv'),
			];
			$pozivID = $this->modelPoziv->insert($poziv, true);
			return redirect()->to('administratori/poziv')->with('message', 'Success');
		}else{
			return redirect()->back()->withInput->with('errors', $this->validator->getErrors());
		}
	}


	public function deletePoziv(){    // pogledaj 48. termin

	$post = $this->request->getPost();
			try {
				//$response = delete_data($post['uid']);
				//return $this->response->setJson(['affectedRows'=>$response]);
			}catch (Exception $e) {
				throw new \RuntimeException($e->getMessage(), $e->getCode(), $e);
			}


/* 	
		if($this->validate([
			'id'=> 'required'

		])){
			$poziv =[
				'id'=>$this->request->getPost('id'),
			];
			$pozivID = $this->model->delete($poziv, true);
			return redirect()->to('administratori/poziv')->with('message', 'Success');
		}else{
			return redirect()->back()->withInput->with('errors', $this->validator->getErrors());
		} */
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
					'opis' =>$this->request->getPost('opis'),		
					'clanovi' =>$this->request->getPost('clanovi'),		
					'god_rez' =>$this->request->getPost('god_rez'),		
					'datum_prijave' =>$this->request->getPost('datum_prijave'),
					'id_oblast' =>$this->request->getPost('id_oblast'),		
				];

				$biografijaID = $this->modelRezultat->insert($rezultat, true);

				$biografijaName = $biografijaID . ".pdf";
				$biografija = $this->request->getFile('biografije');
				$biografija->move('../public/biografije/rezultati', $biografijaName, true);


				//$rezultat['id'] = $biografijaID;
				$rezultat['biografije'] = $biografijaName;
				$this->modelRezultat->update($biografijaID, $rezultat);

				return redirect()->to('administratori/definicija')->with('message','Success');

			}else{
				return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
			}
	}


	public function recenzije()
	{
		$Recenzent_rezultatModel = new Recenzent_rezultat();
        $data['rez'] = $Recenzent_rezultatModel->Recenzent_rezultat();        //return view('administratori/recenzije', $data);
		
		$Broj_rezultataModel = new Broj_rezultata();
		$data['br'] = $Broj_rezultataModel->Broj_rezultata();
        return view('administratori/recenzije', $data);

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
        $Recenzent_rezultatModel = new Recenzent_rezultat();
        $recenzenti['rec'] = $Recenzent_rezultatModel->Recenzent_rezultat();
        return view('administratori/spisak', $recenzenti);
	} 

	public function izmenaStatusaRezultata()
    {
        $modelIzmenaStatusaRezultata = new IzmenaStatusaRezultata();
        $recenzenti['sta'] = $modelIzmenaStatusaRezultata->izmenaStatusaRezultata();
        return view('administratori/izmena_statusa', $recenzenti);
    }

	


	public function premesti($id){

		$this->modelAuthGroupsUsers->prebaciURecenzente($id);
		$this->modelUserStatus->promeniMiStatus($id);
		return $this->prijave();
	

	}
	public function izbor_recenzenta()
	{	
		$modelIzbor_recenzenta = new Izbor_recenzenta();
		$def['rec'] = $modelIzbor_recenzenta->Izbor_recenzenta();
		return view('administratori/izbor_recenzenta', $def);


	}
	public function attemptIzbor_recenzenta(){
	
		if($this->validate([
			'id_rezult'=> 'required',
			'id_user'=> 'required',
			'datum_dodele'=> 'required'


		])){
			$izbor =[
				'id_rezult'=>$this->request->getPost('id_rezult'),
				'id_user'=>$this->request->getPost('id_user'),
				'datum_dodele'=>$this->request->getPost('datum_dodele'),
				'id_status'=>3,
				
			];
			$izborID = $this->modelIzbor_recenzenta->insert($izbor, true);
			return redirect()->to('administratori/izbor_recenzenta')->with('message', 'Success');
		}else{
			return redirect()->back()->withInput->with('errors', $this->validator->getErrors());
		}
	}

	

	public function deleteUser(){
		$userModel = new UserModel();
		$post = $this->request->getPost();
		$id = $post['uid'];
		$userModel->delete($id);

	}

}
