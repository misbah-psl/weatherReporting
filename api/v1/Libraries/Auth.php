<?php 


class Auth
{
    
    public function __construct()
    {

    }

    public function isAuthenticated()
    {
    	$config    = Config::getInstance();
    	$headers   = apache_request_headers();
    	$token     = $headers['Authorization'];
    	$userToken = JWT::decode($token, $config->getConfig('secret_server_key'));
    	$isValid   = $this->userModel->isValidUser($userToken->api_key);
    	return $isValid;
    }

}