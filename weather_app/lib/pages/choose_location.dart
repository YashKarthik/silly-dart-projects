import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/services/get_weather.dart';
import 'package:flutter/cupertino.dart';




class ChooseLocation extends StatefulWidget {
	@override
	_ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

	late String city;

	void updateWeather() async {

		//final data =  ModalRoute.of(context)!.settings.arguments as Map;
		//print(data);

		CityWeather instance = CityWeather(city: city, index: 0);
		await instance.getWeather();
		Navigator.of(context).pop(
			{
				'city'    : instance.city,
				'weather' : instance.weather,
				'temp'    : instance.temp,
				'tempMax' : instance.tempMax,
				'tempMin' : instance.tempMin,
				'imgUrl'  : instance.imgUrl,
			}
		);
	}

	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			backgroundColor: Color.fromRGBO(92,117,181,50),
			body: SafeArea(
				child: Container(
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage('assets/blue.webp'),
							fit: BoxFit.cover,
						),
					),
					child: BackdropFilter(
						filter: ImageFilter.blur(
							sigmaX: 30,
							sigmaY: 5,
						),
						child: Center(

							child: Container(
								height: 70,
								width: 375,
								decoration: BoxDecoration(
									//border: Border.all(),
									borderRadius: BorderRadius.only(
										topLeft: Radius.circular(20), topRight: Radius.circular(20)
									),
									color: Color.fromRGBO(92,117,181,50),
								),

									child: Padding(
										padding: EdgeInsets.all(14),
										child: CupertinoTextField(
											autocorrect : true,
											autofocus   : true,
											padding     : EdgeInsets.symmetric(vertical:10, horizontal: 5),
											placeholder : 'Enter city name',

											prefix: Padding(
												padding: EdgeInsets.all(5),
												child: Icon(CupertinoIcons.search),
											),

											keyboardAppearance: Brightness.dark,
											clearButtonMode: OverlayVisibilityMode.always,

											onSubmitted: (String value) {
  										  print('Submitted text: $value');
												city = value;
												updateWeather();
  										},
										),
									),
							),
						),
					),
				),
			),
		);
	}
}
