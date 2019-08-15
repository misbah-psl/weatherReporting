<?php 

/**
 *
 *
 */

class Controller
{   
    /**
     *
     */
    public $config;

    /**
     *
     */
    public $logger;

    public $statusMsg = [
            200=>'OK',
            400=>'Bad Request',
            201=>'Created',
            401=>'UnAuthorized',
            500=>'server error'
        ];
    
    public function __construct() {
        
        $this->config = Config::getInstance();
        $this->logger = Logger::getInstance();
        $this->auth   = new Auth();
    }
    
    public function setResponse($options)
    {
        $statusCode = $options['status_code'];
        http_response_code($statusCode);
        echo json_encode($options['data']);
    }
    
    public function setHeaders($options) 
    {
        
    }

    

}