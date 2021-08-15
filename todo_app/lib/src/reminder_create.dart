import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

createReminders(BuildContext context) {

	OverlayState overlayState = Overlay.of(context)!;
	OverlayEntry overlayEntry = OverlayEntry(
		
		opaque: false,
		builder: (context) => Center(
			child: ReminderOverlay(),
		)
	);
	overlayState.insert(overlayEntry);
}

class ReminderOverlay extends StatefulWidget {
	@override
	_ReminderOverlayState createState() => _ReminderOverlayState();
}

class _ReminderOverlayState extends State<ReminderOverlay> {

	String formatDate(int milliseconds) {
	  final template = DateFormat('EEE, MMM d' );
	  return template.format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
	}
	String formatTime(int milliseconds) {

	  final template = DateFormat('h:mm a');
	  return template.format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
	}
	bool _buttonState = true;

	@override
	Widget build(BuildContext context) {
		
		return Container(
			height: 415,
			width: 300,

			child: Card(
				shape: RoundedRectangleBorder(
      		borderRadius: BorderRadius.all(Radius.circular(8)),
				),
				color: Colors.black,
				child: Column(

					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.center,

					children: <Widget>[

						Container(

							color: Colors.grey[900],

							padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
							margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
							height: 100,
							width: 300,

							child: TextField(
								autofocus: true,
								decoration: InputDecoration(
  							  labelText: 'Reminder',
									labelStyle: TextStyle(
										fontSize: 14,
									)
  							),
							),

						),

						Card(
							color: Colors.grey[900],
							child: Padding(
								padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
								child: Column(
									children: <Widget>[

										Container(
											padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
											margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
											child: Row(

												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												
												children: <Widget>[

													Text(
														'Date',
														style: TextStyle(
															fontSize: 18,
														),
													),

													Container(

														height: 35,
														width: 104,
														margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),

														decoration: ShapeDecoration(
      											  shape: RoundedRectangleBorder(
      											    side: BorderSide(
																	width: 1.0,
																	style: BorderStyle.solid,
																	color: Colors.blue,
																),
      											    borderRadius: BorderRadius.all(Radius.circular(10)),
      											  ),
      											),

														child: TextButton(
															onPressed: () {},

															child: Text(

																'${formatDate(
																		DateTime.now()
																			.millisecondsSinceEpoch
																		)
																	}',

																style: TextStyle(
																	fontSize: 15,
																),

															),
														)
													),
												],
											),
										),

										Divider(
											indent: 10,
											endIndent: 10,
											thickness: 1,
										),

										Container(
											padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
											margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
											child: Row(

												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												
												children: <Widget>[

													Text(
														'Time',
														style: TextStyle(
															fontSize: 18,
														),
													),

													Container(

														height: 35,
														width: 104,
														margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),

														decoration: ShapeDecoration(
      											  shape: RoundedRectangleBorder(
      											    side: BorderSide(
																	width: 1.0,
																	style: BorderStyle.solid,
																	color: Colors.blue,
																),
      											    borderRadius: BorderRadius.all(Radius.circular(10)),
      											  ),
      											),

														child: TextButton(
															onPressed: () {},

															child: Text(

																'${formatTime(
																		DateTime.now()
																			.millisecondsSinceEpoch
																		)
																	}',

																style: TextStyle(
																	fontSize: 16,
																),

															),
														)
													),
												],
											),
										),


									],
								),
									
							),
						),

						Card(
							color: Colors.grey[900],
							child: Container(
								padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
								margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
								child: Row(

									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									
									children: <Widget>[

										Text(
											'Remind',
											style: TextStyle(
												fontSize: 18,
											),
										),

										Switch(

											value: _buttonState,
											onChanged: (bool) {
												setState(() {
													_buttonState = !_buttonState;
												});
											},

											activeColor: Colors.blue,
											inactiveThumbColor: Colors.grey,
										),
									],
								),
							)
						),

						Card(
							color: Colors.grey[900],
							child: Container(
								padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
								margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
								child: Row(

									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									
									children: <Widget>[

										Text(
											'Flag',
											style: TextStyle(
												fontSize: 18,
											),
										),

										DropdownButton(
											items: <DropdownMenuItem<String>>[
												DropdownMenuItem(
													child: Text('Work'),
												),
											],
										),
									],
								),
							)
						),

						Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[

								TextButton(
									onPressed: () {},
									child: Text('Cancel'),
									style: ButtonStyle(
									),
								),

								TextButton(
									onPressed: () {},
									child: Text('Done'),
									style: ButtonStyle(
									),
								),
							],
						)


					],
				) ,
			),
		);
	}
}
