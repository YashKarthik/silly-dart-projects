import 'dart:async';
import 'package:my_app/bloc/counter_event.dart'; // use the states defined in that file

class CounterBloc {
	int _counter = 0;

	late final _countStateController = StreamController<int>(); // initialize a stream controller to manage state
	StreamSink <int> get _inCounter => _countStateController.sink;
	Stream <int> get counter => _countStateController.stream; // exspose only the final output state to the UI

	late final _countEventController = StreamController<CounterEvent>();
	StreamSink <CounterEvent> get counterEventSink => _countEventController.sink; // exspose the event handler stream to UI

	CounterBloc()
	{
		_countEventController.stream.listen(_eventToState);
	}

	void _eventToState(CounterEvent event) {

		if (event is IncrementEvent) {
			_counter++;
		} else _counter--;
		
		_inCounter.add(_counter);
	}

	void dispose() {
		_countStateController.close();
		_countEventController.close();
	}
}
