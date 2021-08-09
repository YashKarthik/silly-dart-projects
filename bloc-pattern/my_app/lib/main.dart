import 'package:flutter/material.dart';
import 'package:my_app/bloc/counter_bloc.dart';
import 'package:my_app/bloc/counter_event.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
				child: StreamBuilder(
					stream: _bloc.counter,
					initialData: 0,
					builder: (BuildContext context, AsyncSnapshot <int> snapshot){

						return Row(
        			mainAxisAlignment: MainAxisAlignment.center,
        			children: <Widget>[
								Padding(
									padding: EdgeInsets.all(10),
									child: Text(
        			  	  'Sum:',
										style: TextStyle(
											fontSize: 28,
										),
        			  	),
								),
        			  Text(
									'${snapshot.data}',
        			    style: Theme.of(context).textTheme.headline4,
        			  ),
        			],
						);
					}
				),
      ),

			floatingActionButton: Row(
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[

					FloatingActionButton(
						onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
      			  tooltip: 'Increment',
      			  child: Icon(Icons.add),
      		), // This trailing comma makes auto-formatting nicer for build methods.

					SizedBox(width: 10),

					FloatingActionButton(
							onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
      			  tooltip: 'Decrement',
      			  child: Icon(Icons.remove),
      		), // This trailing comma makes auto-formatting nicer for build methods.

				],
			),
    );
  }

	@override
	void dispose() {
		super.dispose();
		_bloc.dispose();
	}
}
