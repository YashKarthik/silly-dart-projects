import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';


main() {

	runApp(MaterialApp(
		initialRoute: '/home',
		routes: {
			'/home': (context) => Home(),
		},
	));//...runapp
}
