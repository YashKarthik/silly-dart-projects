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
					child: Text('Weather')
					),
				centerTitle: true,
				toolbarHeight: 40,
			),
		);

	}

}
