import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

createReminders(BuildContext context) {

	OverlayState _overlayState = Overlay.of(context)!;
	OverlayEntry _overlayEntry = OverlayEntry(
		
		opaque: false,
		builder: (context) => Center(
			child: ReminderOverlay(),
		)
	);
	_overlayState.insert(_overlayEntry);
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
			height: 344,
			width: 300,

			child: Card(
				shape: RoundedRectangleBorder(
      		borderRadius: BorderRadius.all(Radius.circular(8)),
				),
				color: Colors.black,
				child: Column(

					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,

					children: <Widget>[

						Container(

							child: TextField(
								//autofocus: true,
								decoration: InputDecoration(
  							  labelText: 'Reminder',
									labelStyle: TextStyle(
										fontSize: 14,
									)
  							),
							),

							padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
							margin: EdgeInsets.fromLTRB(3, 3, 3, 0),
							height: 60,
							width: 300,
							decoration: ShapeDecoration(
								color: Colors.grey[900],
      				  shape: RoundedRectangleBorder(
      				    side: BorderSide(
										width: 1.0,
										style: BorderStyle.solid,
									),
      				    borderRadius: BorderRadius.all(Radius.circular(5)),
      				  ),
      				),
						),

						Card(
							color: Colors.grey[900],
							child: Container(
								child: Column(
									children: <Widget>[

										Container(
											padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
											margin: EdgeInsets.fromLTRB(5, 3, 5, 0),
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
														width: 109,
														margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),

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
											padding: EdgeInsets.fromLTRB(10, 1, 10, 7),
											margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
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

														child: TextField(

															keyboardType: TextInputType.numberWithOptions(
																decimal: true,
																signed: false,
															),

															decoration: InputDecoration(
																hintText: 'Reminder',
																labelStyle: TextStyle(
																	color: Colors.blue,
																	fontSize: 14,
																)
							  							),
														),
							
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
								padding: EdgeInsets.symmetric(horizontal:10),
								margin: EdgeInsets.symmetric(horizontal:5),
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
								padding: EdgeInsets.symmetric(horizontal:10),
								margin: EdgeInsets.symmetric(horizontal:5),
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

								Padding(
									padding: EdgeInsets.only(left:10),
									child: TextButton(
										onPressed: () {
										},
										child: Text('CANCEL'),
									)
								),

								Padding(
									padding: EdgeInsets.only(right:10),
									child: TextButton(
										onPressed: () {},
										child: Text('DONE'),
									)
								),
							],
						)
					],
				) ,
			),
		);
	}
}
