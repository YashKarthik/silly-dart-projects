import 'package:flutter/material.dart';
// TODO: create custom widget for the buttons and text combined

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
							Row(
								children: <Widget>[
									Icon(
										Icons.star,
										color: Colors.orange
									),
									Text(
										'41',
										style: TextStyle(
											color: Colors.grey[950],
										),
									),
								],
							),
						],
					),

					SizedBox(height: 30),

					Column(
						children: <Widget>[
						Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
							TextButton(
								onPressed: () {},
								child: Column(
									children: <Widget>[
										Icon(
											Icons.call,
											color: Colors.lightBlue,
										),
										SizedBox(height: 10,),
										Text(
											'CALL',
											style: TextStyle(
												color: Colors.lightBlue,
											),
										)
									],
								),
							),

							TextButton(
								onPressed: () {},
								child: Column(
									children: <Widget>[
										Icon(
											Icons.near_me,
											color: Colors.lightBlue,
										),
										SizedBox(height: 10,),
										Text(
											'ROUTE',
											style: TextStyle(
												color: Colors.lightBlue,
											),
										)
									],
								),
							),

							TextButton(
								onPressed: () {},
								child: Column(
									children: <Widget>[
										Icon(
											Icons.share,
											color: Colors.lightBlue,
										),
										SizedBox(height: 10,),
										Text(
											'SHARE',
											style: TextStyle(
												color: Colors.lightBlue,
											),
										)
									],
								),
							),
							],
						),
						SizedBox(height: 10),
						Row(),
						],
					),
					SizedBox(height: 10),

					Container(
						child: Text(
							"Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.,"	
						),

						padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
					),
				],
			),
		);
	}
}
