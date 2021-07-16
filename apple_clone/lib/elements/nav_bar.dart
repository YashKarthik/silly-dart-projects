import 'package:flutter/cupertino.dart';

class NavBar extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(

				middle: Padding(
					padding: EdgeInsets.fromLTRB(200,0,200,0),
					child:Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							_TitleBuilder(''),
							_TitleBuilder('Mac'),
							_TitleBuilder('iPad'),
							_TitleBuilder('iPhone'),
							_TitleBuilder('Watch'),
							_TitleBuilder('TV'),
							_TitleBuilder('Music'),
							_TitleBuilder('Support'),
							Icon(
								CupertinoIcons.search,
								color: CupertinoColors.systemGrey3,
								size: 20,
							),
							Icon(
								CupertinoIcons.bag,
								color: CupertinoColors.systemGrey3,
								size: 20,
							),
						],
					)
				),

			),
			child: Text('hello')
		);
	}
}

class _TitleBuilder extends StatelessWidget {

	late final String product;
	_TitleBuilder(this.product);

	@override
	Widget build(BuildContext context) {

		return CupertinoButton(
			onPressed: () {},
			padding: EdgeInsets.all(5),

			child:Text(
				product,
				style: TextStyle(
					color: CupertinoColors.systemGrey3,
					fontSize: 13,
					letterSpacing: 0.4,
					fontWeight: FontWeight.w100,
				)
			),
		);
	}
}
