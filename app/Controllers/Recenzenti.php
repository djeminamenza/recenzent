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

	public function __construct()
	{
		// Most services in this controller require
		// the session to be started - so fire it up!
		$this->session = service('session');

		$this->config = config('Auth');
	
	}

	public function index()
	{
		return view('recenzenti/index');
	}

    public function profil()
	{

		$userid = $this->session->get('logged_in');
		$user = new Korisnici();
		$user = $user->loadUser($userid);

		$nacionalnost = new Nacionalnost();
		$zemlja = new Zemlja();
		$oblasti = new Oblast();
		$zvanje = new Zvanje();

		$podaci['zemlje'] = $zemlja->findAll();
		$podaci['oblasti'] = $oblasti->findAll();
		$podaci['nacionalnosti'] = $nacionalnost->findAll();
		$podaci['zvanje'] = $zvanje->findAll();

		return $this->_render('recenzenti/profil', ['user'=>$user, 'podaci'=>$podaci]);
	}

	public function sacuvajIzmene(){
		return true;
		return $this->_render('recenzenti/profil', ['user'=>$user, 'podaci'=>$podaci]);
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

	protected function _render(string $view, array $data = [])
	{
		return view($view, $data);
	}
}
