import 'package:flutter/material.dart';

class Home extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(

			appBar: AppBar(
				centerTitle: true,
				toolbarHeight: 40,
				title: Text('Reminders'),
			),

			body: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget> [

					SizedBox(height: 10),

					Padding(
						padding: EdgeInsets.only(left:10, top:10, bottom:10),
						child: Text(
							'Upcoming',
							style: TextStyle(
								fontSize: 22,
								fontWeight: FontWeight.w600,
							),
						),
					),

					Padding(
						padding: EdgeInsets.only(left: 10, right: 10),
						child: Card(
							child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,

								children: <Widget>[

									Row(
										children: <Widget>[

											Expanded(
												flex: 0,
												child: Checkbox(
													onChanged: null,
													value: false,
												)
											),

											Expanded(
												flex: 1,
												child:Text(
													'Reminder',
													style: TextStyle(
														fontSize: 17,
													),
												) 
											),

											Expanded(
												flex: 0,
												child: IconButton(
													icon: Icon(Icons.edit),
													onPressed: () {},
													splashRadius: 20,
													color: Colors.grey,
												),
											),


										],
									),
									
									Padding(
										padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
										child: Text(
											'12 Jul at 9 AM',
											style: TextStyle(
												color: Colors.blue[500]
											)
										),
									),


								],
							),
						)
					),

					Padding(
						padding: EdgeInsets.only(left:10, top:30),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							crossAxisAlignment: CrossAxisAlignment.baseline,
							textBaseline: TextBaseline.ideographic,
							children: <Widget>[

								Text(
									'Lists',
									style: TextStyle(
										fontSize: 22,
										fontWeight: FontWeight.w600,
									),
								),

								TextButton(
									onPressed: null,
									child: Text(
										'Edit',

									)
								),
							],
						),
					),

					GridView(

						shrinkWrap: true,
						gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
							crossAxisCount: 3,
							childAspectRatio: 1.3,
						),

						children: <Widget>[
							
							ListTile(
								listCount: 11,
								listName: 'All',
								listIcon: Icons.archive,
								colorHex: 0xffffffff,
							),

							ListTile(
								listCount: 4,
								listName: 'Home',
								listIcon: Icons.home,
								colorHex: 0xff2d88ef,
							),

							ListTile(
								listCount: 7,
								listName: 'Work',
								listIcon: Icons.work,
								colorHex: 0xffef442d,
							),

						],
					),

				],
			),

			floatingActionButton: FloatingActionButton(
				onPressed: null,
				child: Icon(Icons.add),
				backgroundColor: Colors.black54,
				foregroundColor: Colors.grey[200],
			),	

		);
	}
}


class ListTile extends StatefulWidget {

	late final String listName;
	late final int listCount;
	late final IconData listIcon;
	late final int colorHex;

	ListTile(
	{
		required this.listName,
		required this.listCount,
		required this.listIcon,
		required this.colorHex,
	});

	@override
	_ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {

	@override
	Widget build(BuildContext context) {
		
		return Padding(
			padding: EdgeInsets.all(7),
			child: Card(
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,

					children: <Widget>[

						Padding(
							padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[

									Icon(
										widget.listIcon,
										color: Color(widget.colorHex),
									),
									Text(
										'${widget.listName}',
										style: TextStyle(
											color: Colors.grey[400],
										),
									)
								],
							)
						),

						Column(
							children: <Widget>[

								Padding(
									padding: EdgeInsets.all(13),
									child: Text('${widget.listCount}'),
								)
							]
						)
					]
				),
			)
		);
	}
}
