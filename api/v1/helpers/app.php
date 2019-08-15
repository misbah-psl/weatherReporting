<?php 

if( !function_exists('get_api_root')) {
    
    function get_api_root() {
        $root = $_SERVER['DOCUMENT_ROOT'];
        return $root . '/weatherReporting/api/v' . API_VERSION . '/';
    }
}

if( !function_exists('generate_api_key')) {
    
    function generate_api_key($emailId) {
        return base64_encode($emailId . time());
    }
}

if( !function_exists('sendEmail')) {
    
    function sendEmail($emailId, $name, $token) {
        
        $to = $emailId;
		$subject = "Weather reporting Api key";
		$txt = "Hello $name ". "\r\n". "Your Api Key is $token";
		$headers = "From: donotreply@weatherreporting.com";

		mail($to,$subject,$txt,$headers);
    }
}



