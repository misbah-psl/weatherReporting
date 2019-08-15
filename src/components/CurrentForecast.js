import React from 'react';
import { Grid } from '@material-ui/core';
import { ListItem, Toolbar, Tabs } from '@material-ui/core';

const  weekday = {
	0 : "Sun",
	1 : "Mon",
	2 : "Tues",
	3 : "Wed",
	4 : "Thus",
	5 : "Fri",
	6 : "Sat"
}
const statusToIconMappy = {
	'sunny': 'wi-day-sunny',
	'clear': 'wi-day-sunny',
	'partly_cloudy': 'wi-day-cloudy',
	'snow': 'wi-day-snow',
	'thunderstorm': 'wi-day-thunderstorm',
	'raining': 'wi-day-rain',
	"none": ''
}

export default class CurrentForecast extends React.Component {

	constructor(props){
		super(props)
		this.state = {
			currentHourTemp : false,
			currentHourStatus: "none"
		}
	}



	render() {

		var today = new Date();
		var hour  = today.getHours();
		var day   = weekday[today.getDay()];
		var keys  = Object.keys(this.props.data.hourly_weather);
		var main_icon  = statusToIconMappy[this.props.data.hourly_weather[1].status];
		return (

			<div>
		        <Grid item xl={6} alignContent="center" justify="center" className="main-content">

							<div className="big-data">
								<i  className={`wi ${main_icon} main-icon`}/> 
								<h2>
									{this.props.data.hourly_weather[1].temp}
									&deg;
								</h2>
							</div>
						<h2 className="main-description">{this.props.data.min_temp}&deg; / {this.props.data.max_temp}&deg;</h2>
						<h1 className="main-city">{this.props.data.city}</h1>
					</Grid>
					<hr/>
					<h2>Hourly </h2>
					<div className="forecast">
							<div className="horiz-menu">
								<Toolbar>
									<Tabs scrollable scrollButtons="true" className="forecast-area">
										{
											keys.map((we,i) => {

												
												return (	
													<ListItem key={i} className="forecast-cell">
														

														<h5>{day}, {we} { hour <= 24 || hour >= 12 ? 'PM' : 'AM' }</h5>
														<i className={`wi ${statusToIconMappy[this.props.data.hourly_weather[we].status]}`} />
														<p>
															<strong className="temp-text">{this.props.data.hourly_weather[we].temp}&deg;</strong>
														</p>
													</ListItem>
												)
	
											})
										}

									</Tabs>
								</Toolbar>
							</div>
					</div>

			</div>
		)
	}


}