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

			body: Column(

				children: <Widget>[

					SizedBox(height: 30),

					Center(
						child: TextButton(
							onPressed: () {
								setState(() {
									Navigator.pushNamed(context, '/location');
								});
							},
							child: Text(
								'City',
								style: TextStyle(
									fontSize: 70,
									fontWeight: FontWeight.w500,
									color: Colors.black,
								),
							),
						),
						),

					SizedBox(height: 20),

					Text(
						'temp',
						style: TextStyle( fontSize: 65),
					),

					SizedBox(height: 90),

					Row(
						mainAxisAlignment: MainAxisAlignment.spaceAround,
						children: <Widget>[
							Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									Text(
										'Min: 25',
										style: TextStyle(
											fontSize: 23
										),
									),

									Text(
										'Max: 23',
										style: TextStyle(
											fontSize: 23
										),
									),

									Text(
										'Pressure: 23',
										style: TextStyle(
											fontSize: 23
										),
									),

									Text(
										'Humidity: 23',
										style: TextStyle(
											fontSize: 23
										),
									),

								],
							),

							Text('Cloudy'),
						],
					),

				],
			),
		);
	}
}
