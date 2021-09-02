<?php

namespace App\Controllers;

use App\Models\Status;

class Korisnici extends BaseController
{
	public function index()
	{
<<<<<<< HEAD
		$statusi= New Status();
		$data['status_prijave']=$statusi->findAll();
		return view('korisnici/index', $data);
=======
		$statusi = new Status();
		$data['status_prijave'] = $statusi->findAll();
		return view('korisnici/index', $data);	
>>>>>>> 3cec053ebb52dcf826132355420463ba231ae7ff
	}

}
