import 'package:flutter/material.dart';
import 'package:weather_app/services/get_weather.dart';


class ChooseLocation extends StatefulWidget {
	@override
	_ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

	void updateWeather() async {
		CityWeather instance = CityWeather(city: 'London');
		await instance.getWeather();
		Navigator.pop(context, {
			'city'    : instance.city,
			'weather' : instance.weather,
			'temp'    : instance.temp,
			'tempMax' : instance.tempMax,
			'tempMin' : instance.tempMin,
		});
	}

	@override
	Widget build(BuildContext context) {
		
		return Scaffold(

			appBar: AppBar(
				title: Padding(
					padding: EdgeInsets.only(top:10, bottom:20),
					child: Text('City')
					),
				centerTitle: true,
				toolbarHeight: 40,
			),

			body: ListView(
				children: <Widget>[
					Card(child: Padding(
						padding: EdgeInsets.all(15),
						child: ListTile(
							onTap: () {updateWeather();},
						title: Text('London'),
						leading: Icon(Icons.flag),
						),
					),
					),
				],
			),
		);
	}
}
