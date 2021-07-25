import 'package:flutter/material.dart';
import 'package:weather_app/services/get_weather.dart';

class Loading extends StatefulWidget {
	@override
	_LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

	void setupWeatherApp() async {
		CityWeather instance = CityWeather(city: 'Svalbard', index: 0);
		await instance.getWeather();
		Navigator.pushReplacementNamed(context, '/home', arguments: {
			'city'    : instance.city,
			'weather' : instance.weather,
			'temp'    : instance.temp,
			'tempMax' : instance.tempMax,
			'tempMin' : instance.tempMin,
			'imgUrl' :  instance.imgUrl,
		});
	}

	@override
	void initState() {
		super.initState();
		setupWeatherApp();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.blue,
			body: Center(child:Text('Loading')),
		);
	}
}
