import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CityWeather {
	late String location;
	late String main;
	late String temp;
	late String tempMin;
	late String tempMax;

	CityWeather(
	{
		required this.location, required this.main,
		required this.temp, required this.tempMin,
		required this.tempMax
	});

	Future <void> getWeather() async {

		await dotenv.load(fileName: ".env");
		String apiKey = (DotEnv().env['API_KEY']!);

		try {

			Response response = await
				get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=$apiKey'));

			print(Response);

		}

		catch (e) {
			print('couldn\'t get data');
		}


	}



}
