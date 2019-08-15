<?php

class LocationModel extends Model
{
	
	public function __construct()
	{
		parent::__construct();
	}

	public function getLocationByCityAndCountry($city, $country)
	{
		$city    = (string) $city;
		$country = (string) $country;
		$sql = "SELECT 
				id
				FROM locations 
				WHERE city = '$city' 
				AND
				country = '$country'";
		$result = $this->query($sql);
		$row    = $this->fetchToAssoc($result);
		return $row[0]['id'];
	}

	public function saveLocation($id, $data)
	{
		$city    = (string) $data['city'];
		$country = (string) $data['country'];
		if($id) {
			 $sql   = "UPDATE locations SET city = $city AND country = $country WHERE id = $id";
		} else {
			$sql    = "INSERT INTO locations('city', 'country') VALUES('$city', $country)";
		}
		$result = $this->query($sql);
		return $result; // check num of rows affected and result true or false;
	}

}