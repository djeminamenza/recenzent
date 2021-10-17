<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\Session\Session;
use Myth\Auth\Config\Auth as AuthConfig;
use App\Models\Nacionalnost;
use App\Models\Oblast;
use App\Models\Zemlja;
use App\Models\Zvanje;
use App\Models\Korisnici;
use App\Models\Status_recenzije;

class Recenzenti extends BaseController
{
		/**
	 * @var AuthConfig
	 */
	protected $config;

	/**
	 * @var Session
	 */
	protected $session;
	protected $modelStatus_recenzije;

	public function __construct()
	{
		// Most services in this controller require
		// the session to be started - so fire it up!
		$this->session = service('session');

		$this->config = config('Auth');
		$this->modelStatus_recenzije = new Status_recenzije();
	
	}

	public function index()
	{
		return view('recenzenti/index');
	}

	/**
	 * Ucitaj podatke korisnika u formu za izmenu
	 */
    public function profil()
	{
		//izvlacimo user id iz sessije, kako bi izmenili podatke za odgovarajucek korisnika
		$userid = $this->session->get('logged_in');

		//ucitavamo sve podatke o tom korisniku kako bi popunili elemente forme
		$user = new Korisnici();
		$user = $user->loadUser($userid);

		/**kupimo ponovo podatke da popunimo dropodwns na formi */
		$nacionalnost = new Nacionalnost();
		$zemlja = new Zemlja();
		$oblasti = new Oblast();
		$zvanje = new Zvanje();

		$podaci['zemlje'] = $zemlja->findAll();
		$podaci['oblasti'] = $oblasti->findAll();
		$podaci['nacionalnosti'] = $nacionalnost->findAll();
		$podaci['zvanje'] = $zvanje->findAll();

		//empty message koji se koristi u SAcuvaj metodi
		$message = '';

		//saljemo sve podatke u VIEW profil template
		return $this->_render('recenzenti/profil', ['user'=>$user, 'podaci'=>$podaci, 'userid'=>$userid, 'message'=>$message]);
	}

	/**
	 * Sacuvaj izmene o korisniku iz forme sa profil strane, nakon klika na dugme sacuvaj izmene
	 * Po sacuvanim izmenama redirektujemo se natrag sa session porukom
	 */
	public function sacuvajIzmene(){
		
		//podatke iz forme dovlacimo iz POST-a
		$userData = $this->request->getPost();

		//snimamo nove podatke za datag korisnika
		$user = new Korisnici();
		$response = $user->saveUserData($userData);
		
		/**SQL query response odgovoran za kreiranje response poruke iznad forme */
    	if($response == true){
			$message = ['class'=>'alert-success','message'=>'Uspesno ste sacuvali svoje izmene.'];
		}else{
			$message = ['class'=>'alert-danger','message'=>'Nismo uspeli u ovom trenutku da sacuvamo Vase izmene, molimo pokusajte ponovo.'];
		}

		/**kupimo ponovo podatke o korisniku da popunimo input polja na formi */
		//ovog puta uzimam ID korisnika iz hidden polja iz forme umesto iz sesije
		$user = $user->loadUser($userData['sessid']);

		/**kupimo ponovo podatke da popunimo dropodwns na formi */
		$nacionalnost = new Nacionalnost();
		$zemlja = new Zemlja();
		$oblasti = new Oblast();
		$zvanje = new Zvanje();

		$podaci['zemlje'] = $zemlja->findAll();
		$podaci['oblasti'] = $oblasti->findAll();
		$podaci['nacionalnosti'] = $nacionalnost->findAll();
		$podaci['zvanje'] = $zvanje->findAll();

		/**Vracamo sve podatke natrag u view template */
		return $this->_render('recenzenti/profil', ['user'=>$user, 'podaci'=>$podaci,'userid'=>$userData['sessid'], 'message'=>$message]);
	}

    public function rezultati()
	{
		return view('recenzenti/rezultati');
	}

	public function recenzije()
    {
        $recenzije =  $this->modelStatus_recenzije ->Status_recenzije();
        $podaci['recenzija'] = $recenzije -> getResult();
        return view('recenzenti/recenzije', $podaci);
    }
	public function odbij($id)
	{
		$this->modelStatus_recenzije->promeniStatusRecenzijeUOdbijen($id);
		return redirect()->to('recenzenti/recenzije');
	}
	public function prihvati($id)
	{
		$this->modelStatus_recenzije->promeniStatusRecenzijeUPrihvacen($id);
		return redirect()->to('recenzenti/recenzije');
	}



    public function ankete()
	{
		return view('recenzenti/ankete');
	}

    public function obavestenja()
	{
		return view('recenzenti/obavestenja');
	}

	//render metoda
	protected function _render(string $view, array $data = [])
	{
		return view($view, $data);
	}
}
