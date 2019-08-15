<?php


class UserModel extends Model 
{

	
	public function __construct()
	{
		parent::__construct();
	}

	public function getAllUsers($offset, $limit) 
	{
		$sql = "SELECT 
				email_id, 
				company_name, 
				student, 
				api_key, 
				status, 
				created_on 
				FROM users 
				LIMIT $limit OFFSET $offset";
		$result = $this->query($sql);
	
		return $this->fetchToAssoc($result);

	}

	public function getUserById($id)
	{
		$sql = "SELECT 
				email_id, 
				company_name, 
				student, 
				api_key, 
				status, 
				created_on 
				FROM users 
				WHERE id = $id";
		$result = $this->query($sql);
	
		return $this->fetchToAssoc($result);
	}

	public function createUserAccount($data)
	{
		$api_key     = generate_api_key($data->email);
		$companyName = $data->company_name;
		$emailId     = $data->email;
		$student     = property_exists($data, 'student') ? $data->student : 0;

		$sql   = "INSERT INTO users(email_id,
					company_name,
					student,
					api_key,
					status) VALUES(
					'$emailId',
					'$companyName',
					$student,
					'$api_key',
					1)";

		$this->query($sql);
		return $api_key;
	}

	public function getUserAddressById($id)
	{
		# code...
	}


}