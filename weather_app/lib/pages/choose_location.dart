import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
	@override
	_ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

	@override
	Widget build(BuildContext context) {
		
		return Scaffold(

			appBar: AppBar(
				title: Padding(
					padding: EdgeInsets.only(top:10, bottom:20),
					child: Text('City')
					),
				centerTitle: true,
				toolbarHeight: 40,
			),

			body: ListView(
				children: <Widget>[
					Card(child: Padding(
						padding: EdgeInsets.all(15),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.start,
							children: <Widget>[
								Icon(Icons.flag),
								Text(
									'City',
									style: TextStyle(
										fontSize: 25
									),
								)
							],
						),),
					),
				],
			),
		);
	}
}
