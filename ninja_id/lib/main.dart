import 'package:flutter/material.dart';

void main() {
	runApp(MaterialApp(
		home: NinjaCard()));
}

/* This is the widget itself which creates a state object(_TestState).
	 This state object has some data associated with it and return the widget itself.
*/
class NinjaCard extends StatefulWidget {
	@override
	_NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

	int ninjaLevel = 0;

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

			floatingActionButton: FloatingActionButton(
				onPressed: () => {
				setState(() {
					ninjaLevel += 1;
					/*
					when updating value inside a statful widget, use setState(() {}) function.
					Just using ninjaLevel += 1 without the setState function is not gonna 
					rebuild the widget to account for the changed state
					*/
						})
				},
				child: Icon(Icons.add),
				backgroundColor: Colors.grey[800],
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
						'$ninjaLevel',
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
