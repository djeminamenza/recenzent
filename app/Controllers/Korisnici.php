<?php

namespace App\Controllers;

use App\Models\Status_prijave;

class Korisnici extends BaseController
{
	protected $model;
	public function __construct()
	{
		$this->model = new Status_prijave();
	}

	public function status_prijave()
	{
		$status =  $this->model->getStatus_prijave();
		$podaci['statusi'] = $status->getResult();
		return view('korisnici/status_prijave', $podaci);
	}
}
