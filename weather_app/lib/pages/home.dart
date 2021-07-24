import 'package:flutter/material.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
