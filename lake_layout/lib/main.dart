import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home:MyApp()));

class MyApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(
					'Layout demo',
					style: TextStyle(
						color: Colors.white,
				  ),
				),
			),

			body: Column(
				children: <Widget>[
					Image.asset('assets/lake.jpg'),

					SizedBox(height: 30),

					Row(
						children: <Widget>[
							SizedBox(width: 20),
							Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									Text(
										'Oeschinen Lake Campground',
										style: TextStyle(
											fontWeight: FontWeight.bold,
										),
									),

									SizedBox(height: 8),

									Text(
										'Kandersteg, Switzerland',
										style: TextStyle(
											fontWeight: FontWeight.w400,
											color: Colors.grey[600], 
										),
									),
								],
							),
							SizedBox(width: 80),
							FavItems(),
						],
					),

					SizedBox(height: 30),

					Column(
						children: <Widget>[
						Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								_ButtonBuilder('CALL', Icons.call),
								_ButtonBuilder('ROUTE', Icons.near_me),
								_ButtonBuilder('SHARE', Icons.share),
							],
						),
						SizedBox(height: 10),
						Row(),
						],
					),
					SizedBox(height: 10),

					Container(
						child: Text(
							'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            	'Alps. Situated 1,578 meters above sea level, it is one of the '
            	'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            	'half-hour walk through pastures and pine forest, leads you to the '
            	'lake, which warms to 20 degrees Celsius in the summer. Activities '
            	'enjoyed here include rowing, and riding the summer toboggan run.',
						softWrap: true,
						),
						padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
					),
				],
			),
		);
	}
}

class _ButtonBuilder extends StatelessWidget {

	late final String text;
	late final IconData icon;

	_ButtonBuilder(this.text, this.icon);

	@override
	Widget build(BuildContext context) {
		return TextButton(
			onPressed: () {},
			child: Column(
				children: <Widget>[
					Icon(
						icon,
						color: Colors.lightBlue,
					),
					SizedBox(height: 10,),
					Text(
						'$text',
						style: TextStyle(
							color: Colors.lightBlue,
						),
					)
				],
			),
		);
	}
}

class FavItems extends StatefulWidget {
	@override
	_FavItems createState() => _FavItems();
}

class _FavItems extends State<FavItems> {

	int numFav = 41;
	IconData icon = Icons.star;

	@override
	Widget build(BuildContext context) {
		return TextButton(
			onPressed: () {

				if (numFav == 41) {
					setState(() {
						numFav = 40;
						icon = Icons.star_border;
					});
				}

				else {
					setState(() {
						numFav = 41;
						icon = Icons.star;
					});
				}
			},

			child: Row(
				children: <Widget>[
					Icon(
						icon,
						color: Colors.orange,
					),
					Text(
						'$numFav',
						style: TextStyle(
							color: Colors.black54,
						),
					),
				],
			),
		);
	}
}
