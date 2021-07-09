import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
	@override
	_ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

	void getData() async {

	//simulatinga network request to get uname
		String uname = await Future.delayed(Duration(seconds: 3), () {
			return 'yoshi';
		});

	//simulatinga network request to get user biodate
		String biodata = await Future.delayed(Duration(seconds: 2), () {
			return 'music, code, football';
		});

		print('$uname\n $biodata');

	}

	@override
  void initState() {
    super.initState();
		getData();
		print(' hey there ');
  }

	@override
	Widget build(BuildContext context) {
		print('build state run');
		return Scaffold(
			backgroundColor: Colors.grey[200],
			appBar: AppBar(
				backgroundColor: Colors.blue[900],
				title: Text('Choose location'),
				centerTitle: true,
				elevation: 0,
			),
		);
	}
}
