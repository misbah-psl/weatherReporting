<?php

/**
 * Model class for weather
 *
 */

class WeatherModel extends Model
{
	

	public function __construct()
	{
		parent::__construct();
	}


	/**
	 * Get weather details by date
	 *
	 */
	public function getWeatherByDate($locationId, $fromDate, $toDate)
	{
		$fromDate   = date("Y-m-d", strtotime($fromDate));
		$toDate     = date("Y-m-d", strtotime($toDate));
		$locationId = (int) $locationId;

		$sql = "SELECT 
				w.date,
				w.min_temp,
				w.max_temp,
				w.min_status,
				w.max_status,
				w.weather,
				l.city,
				l.country
				FROM weather as w 
				INNER JOIN locations as l ON l.id = w.location_id
				WHERE 
					w.date >= '$fromDate' AND w.date <= '$toDate'
				AND
					w.location_id = $locationId";
		$result = $this->query($sql);
		return $this->fetchToAssoc($result);
	}

	/**
	 *
	 * save weather
	 */
	public function saveWeatherByDate($locationId, $data)
	{
		
		$date       = date('Y-m-d', strtotime($data->date));
		$weather    = json_encode($data->weather);
		$min_temp   = (int) $data->min_temp;
		$max_temp   = (int) $data->max_temp;
		$min_status = (string) $data->min_status;
		$max_status   = (string) $data->max_status;

		$sql = "INSERT INTO weather(location_id,
				date,
				min_temp,
				max_temp,
				min_status,
			    max_status,
			    weather,
			    updated_by
			    ) VALUES($locationId,
			    '$date',
			    $min_temp,
			    $max_temp,
			    '$min_status',
			    '$max_status',
			    '$weather',
			    1
			    )";
	
	    $response = $this->query($sql);
	    return $response->rowCount();
	    
	}

}