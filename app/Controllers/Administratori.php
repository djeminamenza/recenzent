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


class Administratori extends BaseController
{
	protected $modelRezultat;
	protected $request;
	protected $modelPoziv;
	protected $modelAuthGroupsUsers;
	protected $modelPrijave;
	protected $modelIzmenaStatusaRezultata;
	protected $modelUserStatus;
	protected $modelUser;
	protected $modelKorisnici;
	protected $modelRecenzent_rezultat;
	protected $session;

	public function __construct()
	{
		$this->modelRezultat = new Rezultat();
		$this->modelPoziv = new Poziv();
		$this->modelAuthGroupsUsers = new AuthGroupsUsers();
		$this->modelPrijava = new Prijave();
		$this->modelIzmenaStatusaRezultata = new IzmenaStatusaRezultata();
		$this->modelUserStatus = new UserStatus();
		$this->modelUser = new User();
		$this->modelKorisnici = new Korisnici();
		$this->modelRecenzent_rezultat = new Recenzent_rezultat();
	}

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
		return view('administratori/prijave', $data);
	}

	public function poziv()
	{
		$podaci['pozivi'] = $this->modelPoziv->findAll();
		return view('administratori/poziv', $podaci);
	}

	public function attemptPoziv()
	{
		if ($this->validate([
			'naziv' => 'required'
		])) {
			$poziv = [
				'naziv' => $this->request->getPost('naziv'),
			];
			$pozivID = $this->modelPoziv->insert($poziv, true);
			return redirect()->to('administratori/poziv')->with('message', 'Success');
		} else {
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

	public function attemptDefinicija()
	{
		if ($this->validate([
			'naziv' => 'required',
			'biografije' => [
				'uploaded[biografije]',
				'mime_in[biografije,application/pdf]'
			]
		])) {
			$rezultat = [
				'id_poziv' => $this->request->getPost('id_poziv'),
				'id_kateg' => $this->request->getPost('id_kateg'),
				'id_status' => $this->request->getPost('id_status'),
				'naziv' => $this->request->getPost('naziv'),
				'opis' => $this->request->getPost('opis'),
				'clanovi' => $this->request->getPost('clanovi'),
				'god_rez' => $this->request->getPost('god_rez'),
				'datum_prijave' => $this->request->getPost('datum_prijave'),
				'id_oblast' => $this->request->getPost('id_oblast'),
			];

			$biografijaID = $this->modelRezultat->insert($rezultat, true);
			$biografijaName = $biografijaID . ".pdf";
			$biografija = $this->request->getFile('biografije');
			$biografija->move('../public/biografije/rezultati', $biografijaName, true);

			$rezultat['biografije'] = $biografijaName;
			$this->modelRezultat->update($biografijaID, $rezultat);
			$this->modelRezultat->update($biografijaID, $rezultat);

			return redirect()->to('administratori/rezultati')->with('message', 'Success');
		} else {
			return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
		}
	}

	public function recenzije()
	{
		$Recenzent_rezultatModel = new Recenzent_rezultat();
		$data['rez'] = $Recenzent_rezultatModel->Recenzent_rezultat();
		$Broj_rezultataModel = new Broj_rezultata();
		$data['br'] = $Broj_rezultataModel->Broj_rezultata();
		return view('administratori/recenzije', $data);
	}

	public function anketa1()
	{
		return view('administratori/anketa1');
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

	public function promeniStatusRezultataUOdbijen($id)
	{
		$this->modelRezultat->promeniStatusRezultataUOdbijen($id);
		return $this->izmenaStatusaRezultata();
	}

	public function promeniStatusRezultataUPrihvacen($id)
	{
		$this->modelRezultat->promeniStatusRezultataUPrihvacen($id);
		return $this->izmenaStatusaRezultata();
	}

	public function premesti($id)
	{
		$this->modelAuthGroupsUsers->prebaciURecenzente($id);
		$this->modelUserStatus->promeniMiStatus($id);
		return redirect()->to('administratori/send/' . $id);
	}

	public function odbij($id)
	{
		$this->modelUserStatus->odbijMe($id);
		return $this->prijave();
	}

	public function deleteUser($id)
	{
		$userModel = new UserModel();
		$userModel->delete($id, 'true');
		return $this->prijave();
	}

	public function deletePoziv($id)
	{
		$pozivModel = new Poziv();
		$pozivModel->delete($id, 'true');
		return $this->poziv();
	}

	public function deleteRezultat($id)
	{
		$rezultatModel = new Rezultat();
		$rezultatModel->delete($id, 'true');
		return $this->rezultati();
	}

	public function deleteIzbor_recenzenta($id)
	{
		$Izbor_recenzentaModel = new Izbor_recenzenta();
		$Izbor_recenzentaModel->delete($id, 'true');
		return $this->recenzije();
	}

	public function send($id)
	{
		//$id = $this->request->getPost('id');
		$email = service('email');
		$config = new Email;
		$user = $this->modelKorisnici->trebaMiEmail($id);
		echo ($user[0]->email);
		$sent = $email->setFrom($config->fromEmail, $config->fromName)
			->setTo($user[0]->email)
			->setSubject('Odobrena prijava')
			->setMessage('??estitamo, ' . $user[0]->ime . ' ' . $user[0]->prezime . 'postali ste recenzent!
						Na portal se logujete sa postoje??im pristupnim podacima.
						Dobrodo??li!')
			->setMailType('html')
			->send();

		if (!$sent) {
			return redirect()->to('administratori/prijave')->with('message', "Nije poslat imejl na " . $user[0]->email);
		}
		return redirect()->to('administratori/prijave')->with('message', 'Korisnik prihvacen za recenzenta i obavesten imejlom!');
	}

	public function izmenaRezultata($id)
	{
		$kategorijaModel = new Kategorija();
		$data['kategorije'] = $kategorijaModel->findAll();
		$oblastiModel = new Oblast();
		$data['oblasti'] = $oblastiModel->findAll();
		$pozivModel = new Poziv();
		$data['pozivi'] = $pozivModel->findAll();
		$data['ovajRezultat'] = $this->modelRezultat->find($id);
		return view('administratori/izmenaRezultata', $data);
	}

	public function attemptIzmenaRezultata()
	{
		if ($this->validate([
			'naziv' => 'required',
		])) {
			$jedanRezultat = new Rezultat();
			$data = [
				'naziv' => $this->request->getPost('naziv'),
				'id_poziv' => $this->request->getPost('id_poziv'),
				'id_kateg' => $this->request->getPost('id_kateg'),
				'id_status' => $this->request->getPost('id_status'),
				'god_rez' => $this->request->getPost('god_rez'),
				'opis' => $this->request->getPost('opis'),
				'clanovi' => $this->request->getPost('clanovi'),
				'datum_prijave' => $this->request->getPost('datum_prijave'),
				'id_oblast' => $this->request->getPost('id_oblast'),
			];
			$id = $this->request->getPost('id');
			$data['biografije'] = $id . '.pdf';
			$uspelo = $jedanRezultat->update($id, $data);
			return redirect()->to('administratori/rezultati')->with('message', $uspelo);
		} else {
			return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
		}
	}

	public function dodelaRezultata($id)
	{
		$data['rezultat'] = $this->modelRezultat->dohvatiRezultat($id);
		$data['recenzenti'] = $this->modelKorisnici->dohvatiRecenzente();
		return view('administratori/dodelaRezultata', $data);
	}

	public function dodeliRezultat()
	{
		$data = [
			'id' => $this->request->getPost('dodeljeni'),
			'rez' => $this->request->getPost('rezultat')
		];
		for ($i = 0; $i < sizeof($data['id']); $i++) {
			$podaci = [
				'id_user' => $data['id'][$i],
				'id_rezult' => $data['rez'],
				'id_status' => 3,	// 3=razmatra se
				'datum_dodele' => date("Y-m-d"),
			];
			$this->modelRecenzent_rezultat->insert($podaci);
			var_dump($podaci);
			echo '<br>';
		}
		return redirect()->to('administratori/recenzije')->with('message', 'Success');
	}
}
