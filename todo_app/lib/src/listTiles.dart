import 'package:flutter/material.dart';

class TodoListTile extends StatefulWidget {

	late final String listName;
	late final int listCount;
	late final IconData listIcon;
	late final int colorHex;

	TodoListTile(
	{
		required this.listName,
		required this.listCount,
		required this.listIcon,
		required this.colorHex,
	});

	@override
	_TodoListTileState createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {

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
