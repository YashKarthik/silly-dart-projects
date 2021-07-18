import 'package:calculator/stuff/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

	@override
	Widget build(BuildContext context) {
		
		return Scaffold(

			backgroundColor: Colors.black,
			appBar: PreferredSize(
				preferredSize: Size.fromHeight(50.0), // here the desired height
				child: AppBar(
					title: Text(''),
					backgroundColor: Colors.black,
				),
			),

			body: Column(
			
				mainAxisAlignment: MainAxisAlignment.end,

				children: <Widget>[

					Container(
						alignment: AlignmentDirectional.topEnd,
						padding: EdgeInsets.fromLTRB(10,0, 30, 0),
						child: Text(
							'Hello world',
							style: TextStyle(
								color: Colors.white,
								fontSize: 40 
							),
						),
					),

					Container(
						alignment: AlignmentDirectional.bottomCenter,
						child: DefaultButtons(),
					),

				],
			),
		);
	}
}
