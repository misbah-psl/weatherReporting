<?php

/** 
 * Register users
 * Generate Api key
 * Reset Api key
 * 
 * php 7
 */

class UsersController extends Controller 
{
	
	private $userModel;

	public function __construct()
	{
		parent::__construct();
		$this->userModel = new UserModel();
	}

	public function indexAction($id = false)
	{

 		$offset = isset($_GET['offset']) ? $_GET['offset'] : 0; 
 		$limit  = isset($_GET['limit']) ? $_GET['limit'] : 100;

 		if($id){
 			$id     = (int) $id;
 			$result = $this->userModel->getUserById($id);
 		} else {
 			$result = $this->userModel->getAllUsers($offset, $limit);
 		}
		
		$response = [
			'status_code' => '200',
			'data'        => $result
		];

		$this->setResponse($response);
	}

	public function saveAction()
	{
		$data         = json_decode(file_get_contents("php://input"));
		$isValidInput = $this->validateInput($data);
		if($isValidInput['success']) {
			$api_key = $this->userModel->createUserAccount($data);

			$token   = JWT::encode($api_key, $this->config->getConfig('secret_server_key'));
			sendEmail($data->email, $data->name, $token);
			
			$response['status_code'] = 200;
			$response['data'] = "success";
		} else {
			$response['status_code'] = 400;
			$response['data'] = $isValidInput['errMsg'];
		}

	}

	private function validateInput($data)
	{

		if ($this->validEmailId($data->email)) {

		}

		if ($this->userModel->userAlreadyExists($data->email)) {

		}

	}


	public function deleteAction($value='')
	{
		# code...
	}

	public function updateAction()
	{
		# code...
	}
}