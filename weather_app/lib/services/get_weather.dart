import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CityWeather {
	late String city;
	late String weather;
	late String temp;
	late String tempMin;
	late String tempMax;
	late String imgUrl;
	late int index;

	CityWeather({required this.city, required this.index});

	Future <void> getWeather() async {

			
		try {

			String apiKey = dotenv.env['API_KEY']!;
			Response response = await
				get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey'));

			Map data = jsonDecode(response.body);
			weather = data['list'][index]['weather'][0]['description'];
			imgUrl = 'http://openweathermap.org/img/wn/' + data['list'][index]['weather'][0]['icon'] + '.png';
			temp = (data['list'][index]['main']['temp'] - 273).toStringAsFixed(1);
			tempMin = (data['list'][index]['main']['temp_min'] - 273).toStringAsFixed(1);
			tempMax = (data['list'][index]['main']['temp_max'] - 273).toStringAsFixed(1);

			print('$city $weather $temp $tempMax $tempMin $imgUrl');

		}

		catch (e) {
			print('couldn\'t get data');
			print(e);
		}
	}
}
