import 'package:flutter/cupertino.dart';
import 'package:apple_clone/elements/product_widget1.dart';
import 'package:apple_clone/elements/nav_bar.dart';

class Home extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
			navigationBar: NavBar(),
			backgroundColor: CupertinoColors.systemGrey.withOpacity(0.02),
			child: ListView(
				children: <Widget>[
					SizedBox(height: 50),

					ProductWidget1(
						productName: 'iPhone 12',
						tagLine: 'Blast past fast.',
						offerText: 'Buy directly from Apple with special carrier offers',
						productPath: 'iPhone12.png',
						textColor: 0xff000000,
						backColor: 0xffffffff,
					),

					ProductWidget1(
						productName: 'iPhone 12 Pro',
						tagLine: 'It\'s a leap year.',
						offerText: 'Buy directly from Apple with special carrier offers',
						productPath: 'iPhone12Pro.png',
						textColor: 0xffffffff,
						backColor: 0xff000000,
					),

					ProductWidget1(
						productName: 'iPad Pro',
						tagLine: 'Supercharged by the Apple M1 chip.',
						offerText: 'Buy directly from Apple with special carrier offers',
						productPath: 'iPadPro.png',
						textColor: 0xffffffff,
						backColor: 0xff000000,
					),

					GridView.count(
						crossAxisCount: 2,
						crossAxisSpacing: 10,
						mainAxisSpacing: 10,
						scrollDirection: Axis.vertical,
						shrinkWrap: true,
						children: <Widget>[
							
							ProductWidget1(
								productName: 'iMac',
								tagLine: 'Say hello.',
								offerText: 'Buy directly from Apple with special carrier offers',
								productPath: 'iMac.png',
								textColor: 0xff000000,
								backColor: 0xffffffff,
							),

							ProductWidget1(
								productName: 'Watch',
								tagLine: 'The future of health is on your wrist.',
								offerText: 'Buy directly from Apple with special carrier offers',
								productPath: 'Watch.png',
								textColor: 0xffffffff,
								backColor: 0xff000000,
							),
						],
					),

					Container(
						padding: EdgeInsets.only(top: 100, bottom: 20),
						alignment: Alignment.center,
						child: Text(
						'I am in no way affiliated in any way with the company "Apple Inc.", nor any of its affiliates in any way. Just using their website as a reference because it looks good.',
							style: TextStyle(
								fontWeight: FontWeight.w200,
								fontSize: 15,
								color: CupertinoColors.systemGrey,
								
							),
						),
					),
				],
			),
		);
	}
}
