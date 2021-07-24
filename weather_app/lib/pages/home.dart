import 'package:flutter/material.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	late Map? data;

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
							onPressed: () async {
								dynamic result = await Navigator.pushNamed(context, '/location');
								setState(() {
									data = {
										'city'    : result['city'],
										'weather' : result['weather'],
										'temp'    : result['temp'],
										'tempMax' : result['tempMax'],
										'tempMin' : result['tempMin'],
									};
								});
							},
							child: Row(
								mainAxisAlignment: MainAxisAlignment.end,
								children: [
									Text(
										data?['city'],
										style: TextStyle(
											fontSize: 40,
											fontWeight: FontWeight.w500,
											color: Colors.black,
										),
									),

									SizedBox(width: 20),

									Padding(
										padding: EdgeInsets.only(right:30),
										child: Text(data?['weather']),
										),
								],
							),
						),
					),

					SizedBox(height: 20),

					Text(
						data?['temp'],
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
										'Min: ${data?['tempMin']}',
										style: TextStyle(
											fontSize: 23
										),
									),

									Text(
										'Max: ${data?['tempMax']}',
										style: TextStyle(
											fontSize: 23
										),
									),
								],
							),
						],
					),
				],
			),
		);
	}
}
