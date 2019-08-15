<?php 

/*
 * Logger class
 * 
 *
 */

class Logger
{
    
    public $path;
    
    public static $logger;
    
    public function __construct()
    {
        $this->path = $this->getLogPath();    
    }
    
    public static function getInstance() 
    {
        if (!isset(self::$logger)) {
            self::$logger = new Logger();
        }
        return self::$logger;
    }
    
    public function getLogPath()
    {
        $date       = date('Y-m-d');
        $this->path = get_api_root() . 'logs/'. $date;
        if( !is_dir($this->path) ) {
            mkdir($this->path);
        }
        return $this->path;
    }


    public function log($type = 'info', $logData)
    {
        switch ($type) {
            case 'error':
                $logFile = $this->path . '/error.log';
                break;
            case 'warning':
                $logFile = $this->path . '/info.log';
                break;
            case 'info':
            default:
                $logFile = $this->path . '/info.log';
        }

        $log  = "\n\n" . date("Y-m-d H:i:s") . ', ' . "\nDATA: " . var_export($logData, true);
        file_put_contents($logFile, $log, FILE_APPEND);
    }
}