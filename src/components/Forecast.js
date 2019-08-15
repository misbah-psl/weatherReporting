import React from 'react';
import { ListItem, Toolbar, Tabs } from '@material-ui/core';


export default class Forecast extends React.Component {


	render(){

		return (

				<div className="forecast">
					<h2>Daily</h2>
						<div className="horiz-menu">
							<Toolbar>
								<Tabs scrollable scrollButtons="true" className="forecast-area">

									{
										this.props.data.map((item,i) => {
											 
											return (	
												<ListItem index={i} key={i} className="forecast-cell">
													<h5>{item.day}</h5>
													<div className="inline">
													<i className="wi wi-owm-500 daily-icon" />
													<p>
														<strong className="temp-text">{item.min_temp}&deg;</strong>
													</p>
													/
													<i className="wi wi-owm-500 daily-icon" />
													<p>
														<strong className="temp-text">{item.max_temp}&deg;</strong>
													</p>
													</div>
												</ListItem>

											);

										})
									}

								</Tabs>
							</Toolbar>
						</div>
					</div>
		)
	}
}