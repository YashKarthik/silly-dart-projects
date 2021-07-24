import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/pages/loading.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {

	await dotenv.load(fileName: ".env");
	runApp(MaterialApp(
		initialRoute: '/',
		routes: {
			'/': (context) => Loading(),
			'/home': (context) => Home(),
			'/location': (context) => ChooseLocation(),
		},
	));//...runapp
}
