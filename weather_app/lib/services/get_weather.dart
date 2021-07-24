import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CityWeather {
	late String city;
	late String main;
	late String temp;
	late String tempMin;
	late String tempMax;
	late String url;

	CityWeather({required this.city});

	Future <void> getWeather() async {

			
		try {

			String apiKey = dotenv.env['API_KEY']!;
			Response response = await
				get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiKey'));

			Map data = jsonDecode(response.body);
			String weather = data['weather'][0]['main'];
			String temp = (data['main']['temp'] - 273).toString() + '℃';
			String tempMin = (data['main']['temp_min'] - 273).toString() + '℃';
			String tempMax = (data['main']['temp_max'] - 273).toString() + '℃';

			print('$weather $temp $tempMax $tempMin');

		}

		catch (e) {
			print('couldn\'t get data');
			print(e);
		}
	}
}
