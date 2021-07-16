import 'package:flutter/cupertino.dart';
import 'package:apple_clone/elements/nav_bar.dart';

class Home extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
			navigationBar: NavBar(),
			child: Text('hello world'),
			backgroundColor: CupertinoColors.white,
		);
	}
}
