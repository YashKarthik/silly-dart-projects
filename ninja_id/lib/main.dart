import 'package:flutter/material.dart';

void main() {
	runApp(MaterialApp(
		home: NinjaCard()));
}

class NinjaCard extends StatelessWidget {
	@override
	Widget build(BuildContext context){
		return Scaffold(
			backgroundColor: Colors.grey[900],
			appBar: AppBar(
				title: Text('Ninja ID Card'),
				centerTitle: true,
				backgroundColor: Colors.grey[850],
				elevation: 0,
			),

			body: Padding(
				padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
				child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[

					Center(
						child: CircleAvatar(
							radius: 60,
							backgroundImage: NetworkImage('https://wallpapercave.com/wp/wp5701998.jpg'),
						)
					),

					Divider(
						height: 90,
						color: Colors.grey[800],
						),

					Text(
						'NAME',
						style: TextStyle(
							letterSpacing: 2,
							color: Colors.grey,
							),
						),

					SizedBox(height: 10,),

					Text(
						'Yash',
						style: TextStyle(
							color: Colors.amberAccent,
							fontSize: 36,
							fontWeight: FontWeight.bold,
							letterSpacing: 2.0,
						),
					),

					SizedBox(height: 20,),

					Text(
						'CURRENT NINJA LEVEL',
						style: TextStyle(
							letterSpacing: 2,
							color: Colors.grey,
							),
						),

					SizedBox(height: 10,),

					Text(
						'8',
						style: TextStyle(
							color: Colors.amberAccent,
							fontSize: 26,
							fontWeight: FontWeight.bold,
						),
					),

					SizedBox(height: 30),

					Row(
						children: <Widget>[
						Icon(
							Icons.email,
							color: Colors.grey,
							),

						Text(
							' yash@email.com',
							style: TextStyle(
								color: Colors.grey,
								letterSpacing: 1,
								fontSize: 18,
							),
						),
					],
				),
				],
				),
			),
		);
	}
}
