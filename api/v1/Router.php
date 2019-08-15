<?php


class Router
{

	public static function start()
	{
		header("Access-Control-Allow-Method:*");
		header("Access-Control-Allow-Origin: *");
		header("Content-Type: application/json; charset=UTF-8");
		
		$url    = explode('?', $_SERVER['REQUEST_URI']);
		$routes = explode('/', $url[0]);
		$method = $_SERVER['REQUEST_METHOD'];

		if(!empty($routes[4])){
			$controllerName = ucfirst($routes[4]) . 'Controller';

			if(class_exists($controllerName)) {
				$controller = new $controllerName();
				$id = isset($routes[5]) ? $routes[5] : false;

				switch($method){
					case 'GET':
						$controller->indexAction($id);
					break;
					case 'PUT':
						$controller->updateAction($id);
						break;
					case 'POST':
						$controller->saveAction($id);
						break;
					case 'DELETE':
						$controller->deleteAction($id);
						break;
					default:
					$this->response("invalid method","401");
						break;		
				}	
				
			}else {
				echo 'page not found';
				die();
			}
			

		}else{
			echo 'Page not found';
			die();
		}
	}
}