import React from 'react';
import CurrentForecast from './CurrentForecast';
import Forecast from './Forecast';
import { Grid } from '@material-ui/core';



const config = {
	apiUrl : "http://localhost/weatherReporting/api/v1/weather?",
	ipUrl: "https://geoip-db.com/json/"
}

export default class Weather extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			forecast: [],
			error: null,
			currentForecast: [],
			data: [],
			isLoaded: false
		};

	}

	getDates(days, operator) {
		var d    = new Date();
		var day  = d.getDate()
		if(days) {
			if(operator === 'next') {
				day = day + days;
			} else {
				day = day - days;
			}
		}
		var dateStr =   day + "-" + (d.getMonth()+1) + "-" + d.getFullYear();
		return dateStr;
	}

	componentDidMount()
	{
		
		fetch(config.ipUrl)
		.then(res => res.json())
		.then(
			(result) => {
				this.apiRequest(result.city, result.country_code);
			}
		);

		
	}

	apiRequest(city, country) {
		var today     = this.getDates();
		var next7days = this.getDates(7, 'next');
		var url       = config.apiUrl + "city=walsall&country=" + country + "&from_date=" + today + "&to_date="+ next7days;
		fetch(url)
				.then(res => res.json())
				.then(
					(result) => {
						this.setState({
							isLoaded: true,
							data: result,
							forecast: result,
							currentForecast: result[0]
						});
						
					},
					(error) => {
						this.setState({
							isLoaded: false,
							error
						});
					}
				)

	}


	render() {
	
		if(this.state.error){
	    	return <div>Error: {this.state.error.message}</div>;
	    } else if( !this.state.isLoaded) {
	    	return <div>Loading...</div>;
	    } else {
	    	return (
			    <div>
			      <Grid container justify="center" alignItems="center" id="main">
			      		<Grid item xs={12} md={8}>
			      			<CurrentForecast data = {this.state.currentForecast} />
			      			<hr/>
			      			<Forecast data = {this.state.forecast} />
			      		</Grid>
				  </Grid>
			    </div>
		  	);
	    }
	}

}


