import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/services/get_weather.dart';


class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	late Map? data = {};

	@override
	Widget build(BuildContext context) {

		data = data!.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
		
		return Scaffold(
			backgroundColor: Color.fromRGBO(0,2,46,1),
			appBar: AppBar(

				backgroundColor: Color.fromRGBO(92,117,181,40),
				centerTitle: true,
				toolbarHeight: 40,
				elevation: 0,

				title: Padding(
					padding: EdgeInsets.only(top:10, bottom:20),
					child: Text(
						'Weather',
						style: TextStyle(
							color: Colors.grey[350]
						),
					)
				),

			),

			body: SafeArea(
				child: Container(
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage('assets/blue.webp'),
							fit: BoxFit.cover,
							)
						),
					child: BackdropFilter(
						filter: ImageFilter.blur(
							sigmaX: 15,
							sigmaY: 3,
						),

						child: Column(
							children: <Widget>[

								SizedBox(height: 30),

								Center(
									child: TextButton(
										onPressed: () async {
										  
											dynamic result = await Navigator.of(context).push(_createRoute());
											setState(() {
												data = {
													'city'    : result['city'],
													'weather' : result['weather'],
													'temp'    : result['temp'],
													'tempMax' : result['tempMax'],
													'tempMin' : result['tempMin'],
													'imgUrl' : result['imgUrl'],
												};
											});
										},


										child:Text(
											data?['city'],
											style: TextStyle(
												fontSize: 40,
												fontWeight: FontWeight.w500,
												color: Color.fromRGBO(205,205,211,10)
											),
										),
									),
								),

								SizedBox(height: 30),

								Container(
									height: 120,
									child: Row(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[

											Padding(
												padding: EdgeInsets.symmetric(horizontal:10, vertical:00),
												child: Row(
													children: [
														Text(
															data?['temp'],
															style: TextStyle(
																fontSize: 55,
																color: Color.fromRGBO(205,205,211,50)
															),
														),

														SizedBox(width: 10,),

														Text(
															'℃',
															style: TextStyle(
																fontSize: 30,
																color: Color.fromRGBO(205,205,211,50)
															),
														)
													],
												),
											),

											VerticalDivider(
												color: Colors.grey,
												thickness: 1,
												width: 20,
												indent: 1,
												endIndent: 10,
											),

											Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: <Widget>[

													Image.network(data?['imgUrl']),

													Text(
														'Min: ${data?['tempMin']}°',
														style: TextStyle(
															fontSize: 20,
															color: Color.fromRGBO(205,205,211,50),
															fontFamily: 'Verdana',
															fontWeight: FontWeight.w100,
														),
													),

													Text(
														'Max: ${data?['tempMax']}°',
														style: TextStyle(
															color: Color.fromRGBO(205,205,211,50),
															fontSize: 20,
															fontFamily: 'Verdana',
															fontWeight: FontWeight.w100,
														),
													),
												],
											),
										],
									),
								),

								SizedBox(height: 80),
								WeekBuilder(
									city: data?['city'],
									index: 1,
								),

								SizedBox(height: 6),
								WeekBuilder(
									city: data?['city'],
									index: 2,
								),

								SizedBox(height: 6),
								WeekBuilder(
									city: data?['city'],
									index: 3,
								),

								SizedBox(height: 6),
								WeekBuilder(
									city: data?['city'],
									index: 4,
								),

								SizedBox(height: 6),
								WeekBuilder(
									city: data?['city'],
									index: 5,
								),
							],
						),
					),
				),
			),
		);
	}
}

late _WeekBuilderState listState;

class WeekBuilder extends StatefulWidget {

	late final String city;
	late final int index;

   WeekBuilder ({required this.city, required this.index});

	@override
	_WeekBuilderState createState() {
		listState = _WeekBuilderState(city: city, index: index);
		return listState;
	}
}

class _WeekBuilderState extends State<WeekBuilder> {

	late String temp;
	late String imgUrl;
	late String date;
	late String city;
	late String todayWeekday;
	late int index;

	_WeekBuilderState ({required this.city, required this.index});

	final Map <int, String> weekDays = {
		1: 'Monday',    2: 'Tuesday',
		3: 'Wednesday', 4: 'Thursday',
		5: 'Friday',    6: 'Saturday',
		7: 'Sunday',
	};

	void setupWeek() async {

		CityWeather instance = CityWeather(city: city, index: index);
		await instance.getWeather();

		print('$index: $city');

		todayWeekday = weekDays[
			DateTime.now()
							.add(Duration(days: index))
							.weekday
		]!;

		temp    = instance.temp;
		imgUrl  = instance.imgUrl;
	}

	@override
	Widget build(BuildContext context) {

		setupWeek();

		return Padding(
				padding: EdgeInsets.only(left: 20, right:10),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					
					Text(
						todayWeekday,
						style: TextStyle(
							color: Color.fromRGBO(194, 194, 198, 40),
							fontSize: 23
						),
					),
					Row(
						children: <Widget>[
							Text(
								'$temp°',
								style: TextStyle(
								color: Color.fromRGBO(194, 194, 198, 40),
									fontSize: 23
								),
							),
							Image.network(imgUrl),
						],
					),
				],
			),
		);
	}
}

Route _createRoute() {

  return PageRouteBuilder(

    pageBuilder: (context, animation, secondaryAnimation) => ChooseLocation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      const begin = Offset(0.0, 1.0);
      const end = Offset(0,0.0);
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
