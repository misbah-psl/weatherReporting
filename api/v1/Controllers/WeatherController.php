<?php


class WeatherController extends Controller
{
	
	public $weatherModel;
	/**
	 * location obj
	 * @obj
	 */
	public $locationModel;

	public $temp_status = ['partly_cloudy', 'cloudy', 'sunny', 'raining', 'snow', 'thunderstorm'];


	public function __construct()
	{
		parent::__construct();
		$this->weatherModel  = new WeatherModel();
		$this->locationModel = new locationModel();
	}

	/**
	 * Get weather
	 *
	 */
	public function indexAction()
	{

		$response = [
			'status_code' => 400
		];

		if (!isset($_GET['city'])) {
			$response['data'] = "city name is required";
			return $this->setResponse($response);;
		}

		if (!isset($_GET['country'])) {
			$response['data'] = "country name is required";
			return $this->setResponse($response);;
		}
		
		$city    = $_GET['city'];
		$country = $_GET['country'];
		
		$fromDate = isset($_GET['from_date']) ? $_GET['from_date'] : date('d-m-Y');
		$toDate   = isset($_GET['from_date']) ? $_GET['to_date'] : date('d-m-Y');
		
		$locationId = $this->locationModel->getLocationByCityAndCountry($city, $country);

		if ($locationId) {

			$weather = $this->getWeatherByDate($locationId, $fromDate, $toDate);
			if($weather) {
					$response['status_code']  = 200;
					$response['data']    = $weather;
			} else {
				$response['status_code']  = 400;
				$response['data'] = "invalid date supplied";
			}
		} else {
			$response['status_code'] = 400;
			$response['data'] = "No Data available";

		}


		$this->setResponse($response);;
	}

	/**
	 * Get weather by date
	 *
	 */
	private function getWeatherByDate($locationId, $fromDate, $toDate)
	{
		$response = [];
		$result   = $this->weatherModel->getWeatherByDate($locationId, $fromDate, $toDate);
		foreach ($result as $key => $weather) {
			$output = [];
			$output['date']       = date('d-m-Y', strtotime($weather['date']));
			$output['day']		  = date('l', strtotime($weather['date']));
			$output['min_temp']   = $weather['min_temp'];
			$output['max_temp']   = $weather['max_temp'];
			$output['min_status'] = $weather['min_status'];
			$output['max_status'] = $weather['max_status'];
			$output['hourly_weather'] = json_decode($weather['weather'], true);
			$output['city'] = $weather['city'];
			$output['country'] = $weather['country'];
			array_push($response, $output);
		}
		return $response;
	}

	public function saveAction()
	{
		$data         = json_decode(file_get_contents("php://input"));
		$isValidInput = $this->validateInput($data);
		$response = [
			'message' => 'success',
			'data'    => []
		];

		if($isValidInput['success']) {

			$locationId = $this->locationModel->getLocationByCityAndCountry($data->city, $data->country);
			if ($locationId) {
				$id = $this->weatherModel->saveWeatherByDate($locationId, $data);
				$response['status_code'] = 200;
				$response['data'] = [
					'id' => $id
				];
			} else {
				$response['status_code'] = 400;
				$response['data'] = "invalid country";
			}

			
		} else {

			$response['data']     = $isValidInput['errMsg'];
			$response['status_code'] = 400;
			
		}

		$this->setResponse($response);

	}

	private function validateInput($data)
	{
		$response = [
			'success' => true,
			'errMsg'  => []
		];

		if(!isset($data->city) || empty($data->city)) {
			$response['success']  = false;
			$response['errMsg'][] = 'Name of city is required';
		}

		if(!isset($data->country) || empty($data->country)) {
			$response['success']  = false;
			$response['errMsg'][] = 'Name of country is required';
		}

		if(!isset($data->min_status) || !in_array($data->min_status, $this->temp_status)) {
			$response['success']  = false;
			$response['errMsg'][] = 'min status is required or you have provided invalid status';
		}

		if(!isset($data->max_status) || !in_array($data->max_status, $this->temp_status)) {
			$response['success']  = false;
			$response['errMsg'][] = 'max status is required or you have provided invalid status';
		}

		return $response;

	}
}