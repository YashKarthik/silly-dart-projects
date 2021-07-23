import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	void loadEnv() async {
		await dotenv.load(fileName: ".env");
		WeatherFactory wf = WeatherFactory(DotEnv().env['API_KEY']!);
		Weather w = await wf.currentWeatherByCityName('Kolkata');
		print(w);
	}

	@override
	void initState() {
		super.initState();
		loadEnv();
	}



	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			appBar: AppBar(
				title: Padding(
					padding: EdgeInsets.only(top:10, bottom:20),
					child: Text('Weather')
					),
				centerTitle: true,
				toolbarHeight: 40,
			),
		);

	}

}
