<?php

/**
 * Config class to get env variables
 */
class Config
{
    /**
     * static instance
     * @object
     */
	public static $instance = null;
	
	/**
	 * env data
	 * @var
	 */
	private $configData = [];

	public function __construct()
	{
        $path             = get_api_root() . 'configs/env_parameters.php';
        $data             = include_once($path);
        $this->configData = $data[ENV];
	}

	/**
	 * return config class instance
	 */
	public function getInstance()
	{
		if(!isset(self::$instance)) {
		    self::$instance = new Config;
		}
		return self::$instance;
	}
	
	/**
	 * get env var from config
	 */
	public function getConfig($key = false, $field = false) {
	    $res = false;
	    if($key) {
	        $res = isset($this->configData[$key]) ? $this->configData[$key] : false;
	        if($field) {
	            $res = isset($res[$field]) ? $res[$field] : false;
	        }
	    }
	    return $res; 
	}
}