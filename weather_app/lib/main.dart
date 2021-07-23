import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/choose_location.dart';


main() {

	runApp(MaterialApp(
		initialRoute: '/home',
		routes: {
			'/home': (context) => Home(),
			'/location': (context) => ChooseLocation(),
		},
	));//...runapp
}
