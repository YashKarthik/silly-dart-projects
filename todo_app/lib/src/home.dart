import 'package:flutter/material.dart';
import 'package:todo_app/src/blocs/checkbox_bloc.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	final _bloc = CheckBox();

	@override
	Widget build(BuildContext context) {
		
		return Scaffold(

			backgroundColor: Colors.grey[900],

			appBar: AppBar(
				centerTitle: true,
				toolbarHeight: 40,
				title: Text('Reminders'),
				backgroundColor: Colors.black26,
			),

			body: Container(
				child: StreamBuilder(
					stream: _bloc.checkBoxState,
					initialData: false,
					builder: (BuildContext context, AsyncSnapshot <bool> snapshot){

						return ListTile(

							tileColor: Colors.black12,

							leading: Checkbox(
								onChanged: (bool? currentValue) {
									_bloc.checkBoxEvent.add(currentValue);
								},
								value: snapshot.data,
								activeColor: Colors.grey[800],
							),

							title: Text('Reminders'),
							trailing: IconButton(
								icon: Icon(Icons.edit),
								onPressed: null,
							),
						);
					},
				),
				margin: EdgeInsets.all(5),
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
