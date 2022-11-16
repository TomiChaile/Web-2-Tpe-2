<?php
    require_once('libs/Router.php');
    require_once('app/apicontrollers/api.controller.php');
    
    // CONSTANTES PARA RUTEO
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

    $router = new Router();

    // rutas
    $router->addRoute('pasaje', 'GET', 'PasajeApiController', 'getPasajes');
    $router->addRoute('pasaje/:ID', 'GET', 'PasajeApiController', 'getPasaje');
    $router->addRoute('/pasaje/:ID', 'DELETE', 'PasajeApiController', 'deletePasaje');
    $router->addRoute('/pasaje', 'POST', 'PasajeApiController', 'addPasaje');
    $router->addRoute('/pasaje/:ID', 'PUT', 'PasajeApiController', 'updatePasaje');

    //run
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 
