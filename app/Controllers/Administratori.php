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
use Config\Email;
use Exception;
use Myth\Auth\Authorization\GroupModel;
use Myth\Auth\Entities\User;
use Myth\Auth\Models\UserModel;
//use Myth\Auth\Authentication\Activators\BaseActivator::getActivatorSettings;


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
	protected $modelUser;
	protected $modelKorisnici;
	protected $session;



	public function __construct()
	{
		$this->modelRezultat = new Rezultat(); 
		$this->modelPoziv = new Poziv();
		$this->modelAuthGroupsUsers = new AuthGroupsUsers();
		$this->modelPrijava = new Prijave();
		$this->modelIzmenaStatusaRezultata = new IzmenaStatusaRezultata();
		$this->modelIzbor_recenzenta = new Izbor_recenzenta();
		$this->modelUserStatus = new UserStatus();
		$this->modelUser = new User();
		$this->modelKorisnici = new Korisnici();
		$this->session = service('session');

	
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


	public function anketa1()
	{
		$user = new Korisnici;  
		$podaci['darko']=$user->trebaMiEmail(25);
		$this->send(25);
		return view('administratori/anketa1', $podaci);
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
        $recenzenti['sta'] = $modelIzmenaStatusaRezultata->IzmenaStatusaRezultata();
        return view('administratori/izmenaStatusaRezultata', $recenzenti);
    }

	public function promeniStatusRezultataUOdbijen($id){

		$this->modelRezultat->promeniStatusRezultataUOdbijen($id);
		return $this->izmenaStatusaRezultata();
	}
	public function promeniStatusRezultataUPrihvacen($id){

		$this->modelRezultat->promeniStatusRezultataUPrihvacen($id);
		return $this->izmenaStatusaRezultata();
	}


	public function premesti($id)
	{
		$this->modelAuthGroupsUsers->prebaciURecenzente($id);
		$this->modelUserStatus->promeniMiStatus($id);
		$this->modelKorisnici->send($id);
		
		//
		return $this->prijave();
	}

	public function odbij($id)
	{
		$this->modelUserStatus->odbijMe($id);
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

	public function deleteUser($id){
		$userModel = new UserModel();
		$userModel->delete($id, 'true');
		//$userModel->where('id', $id)->delete();
		return $this->prijave();
	}

	public function deletePoziv($id){
		$pozivModel = new Poziv();
		$pozivModel->delete($id, 'true');
		return $this->poziv();
	}

	public function deleteRezultat($id){
		$rezultatModel = new Rezultat();
		$rezultatModel->delete($id, 'true');
		return $this->rezultati();
	}

	public function deleteIzbor_recenzenta($id){
		$Izbor_recenzentaModel = new Izbor_recenzenta();
		$Izbor_recenzentaModel->delete($id, 'true');
		return $this->recenzije();
	}

	public function editRezultat($id){
		$kategorijaModel = new Kategorija();
		$data['kategorije'] = $kategorijaModel->findAll();
		$oblastiModel = new Oblast();
		$data['oblasti'] = $oblastiModel->findAll();
		$pozivModel = new Poziv();
		$data['pozivi'] = $pozivModel->findAll();
		$data['rezultat'] = $this->modelRezultat->find($id);
		return view('administratori/izmenaRezultata', $data);
	}

   public function send($id): bool
   {
	   $email = service('email');
	   $config = new Email;

	   //$settings = $this->getActivatorSettings();
	   $user = new Korisnici;  
	   $user->trebaMiEmail($id);
	   $sent = $email->setFrom($config->fromEmail, $config->fromName)
			 ->setTo($user->email)
			 ->setSubject('Odobrena prijava')
			 ->setMessage('Честитамо,'.$user->ime.' '.$user->prezime.' постали сте мајка! Добродошли на портал рецензентe наш.')
			 ->setMailType('html')
			 ->send();

	   if (! $sent)
	   {
		   $this->error = lang('Auth.errorSendingActivation', [$user->email]);
		   return false;
	   }
	   return true;
   }
   public function izmena_rezultata()
   {
	   $data['rezultati'] = $this->modelRezultat->dohvatiRezultate();
	   return view('administratori/izmena_rezultata', $data);
   }
   public function izmenica($id)
   {
	   $kategorijaModel = new Kategorija();
	   $def['kategorije'] = $kategorijaModel->findAll();
	   $oblastiModel = new Oblast();
	   $def['oblasti'] = $oblastiModel->findAll();
	   $pozivModel = new Poziv();
	   $def['pozivi'] = $pozivModel->findAll();

	   $rezultat = $this->modelRezultat->dohvatiRezultat($id);
	   $def['rezultat'] = $rezultat->getResult()[0];
	   return view('administratori/izmenica', $def);
	   
   }

   public function attemptIzmena(){
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

			   $biografijaID = $this->modelRezultat->update($rezultat, true);

			   $biografijaName = $biografijaID . ".pdf";
			   $biografija = $this->request->getFile('biografije');
			   $biografija->move('../public/biografije/rezultati', $biografijaName, true);


			   //$rezultat['id'] = $biografijaID;
			   $rezultat['biografije'] = $biografijaName;
			   $this->modelRezultat->update($biografijaID, $rezultat);

			   return redirect()->to('administratori/izmenica')->with('message','Success');

		   }else{
			   return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
		   }
   }



}

//return redirect()->to('Administatori/edit');