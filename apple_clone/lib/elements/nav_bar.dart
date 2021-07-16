import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements ObstructingPreferredSizeWidget{

	@override
	Size get preferredSize => Size.fromHeight(30);

	@override
	bool shouldFullyObstruct(BuildContext context) {
		late final Color backgroundColor = Color(0x00FFFFFF);
		return backgroundColor.alpha == 0x00;
	}

	@override
	Widget build(BuildContext context) {
		return CupertinoNavigationBar(

			backgroundColor: CupertinoColors.black.withOpacity(0.93), 
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
					color: CupertinoColors.systemGrey2,
					fontSize: 13,
					letterSpacing: 0.4,
					fontWeight: FontWeight.w100,
				)
			),
		);
	}
}
