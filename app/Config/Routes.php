<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*------------ proba rute Za upload ------------------------------*/
$routes->post('administratori/rezultati', 'Administratori::upload');
$routes->get('administratori/definicija', 'Administratori::definicija');
$routes->post('administratori/definicija', 'Administratori::attemptDefinicija');
$routes->post('administratori/poziv', 'Administratori::attemptPoziv');
/*------------ kraj probe rute Za upload ------------------------------*/

$routes->get('korisnici/status_prijave', 'Korisnici::status_prijave');
//$routes->post('korisnici/status_prijave', 'Korisnici::attemptStatus');

/*
$routes->add('administratori/index', 'Administratori::index', ['filter' => 'role:admin']);
$routes->add('korisnici/index', 'Korisnici::index', ['filter' => 'role:korisnik']);
$routes->add('recenzenti/index', 'Recenzenti::index', ['filter' => 'role:recenzent']);
$routes->add('administratori/index', 'Administratori::attemptCreate', ['filter' => 'perm:admin_perm']);
*/

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
