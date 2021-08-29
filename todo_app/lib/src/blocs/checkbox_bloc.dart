import 'dart:async';

class CheckBox {
	bool _eventDone = false;

	late final _checkboxStateController = StreamController<bool>(); // initialize a controller to control state
	StreamSink <bool> get _checkBoxTrigger => _checkboxStateController.sink;
	Stream <bool> get checkBoxState => _checkboxStateController.stream;

	late final _checkboxEventController = StreamController<bool?>(); // initialize a controller to control state
	StreamSink <bool?> get checkBoxEvent=> _checkboxEventController.sink;

	CheckBox()
	{
		_checkboxEventController.stream.listen(_triggerToTrigger);
	}

	void _triggerToTrigger(bool? event) {
		_eventDone = event ?? true;
		_checkBoxTrigger.add(_eventDone);
	}

	void dispose() {
		_checkboxStateController.close();
	}
}
