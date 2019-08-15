<?php 

/*
 *
 *
 *
 */

class Model
{
    /*
     * connection object
     * @obj
     */
    public $db;

    /*
     * Logger object
     * @obj
     */
    public $logger;
    
    public function __construct() 
    {

        $this->logger = Logger::getInstance();
        $config = Config::getInstance();
        $dbhost = $config->getConfig('db_host');
        $dbname = $config->getConfig('db_name');
        $dbuser = $config->getConfig('db_user');
        $dbpass = $config->getConfig('db_password');

        try {
            $this->db = new PDO("mysql:host=$dbhost;dbname=$dbname", "$dbuser", "$dbpass"); 
            $this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            
        } catch (Exception $e) {
            $this->logger->log('error', 'DB coonection failure');
        }
        
    }
    
    
    public function query($sql)
    {
        $result = false;
        try {
            $result = $this->db->prepare($sql); 
            $result->execute();

        } catch (Exception $e) {
            $this->logger->log('error', $e->getMessage());
            $result = $e->getMessage();
        }
        return $result;
    }
    
    
    public function fetchToAssoc($result)
    {
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}