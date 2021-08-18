import 'dart:async'
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:todo_app/src/reminder_state.dart';

class ReminderBloc {

	String _name = 'Reminder';

	String _time = DateFormat('h:mm a')
		.format(
			DateTime.fromMicrosecondsSinceEpoch(
				DateTime.now()
					.microsecondsSinceEpoch
			)
		);

	String _date = DateFormat('EEE, MMM d')
		.format(
			DateTime.fromMicrosecondsSinceEpoch(
				DateTime.now()
					.microsecondsSinceEpoch
			)
		) ;

	late final _timeController = StreamController<String>();
	StreamSink <String> get _inputTime => _timeController.sink;
	Stream <String> get time => _timeController.stream;

	void _inputToTime(String inputime) {
		_inputTime.add(inputime);
	}

	void dispose() {
		_timeController.close();
	}

}
