import 'package:flutter/material.dart';
import 'package:todo_app/src/home.dart';

void main() {
	runApp(MaterialApp(

		home: Home(),
		theme: ThemeData.dark(),
		title: 'Reminders',
	));//...runapp
}
