import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

	late String location;
	late String time;
	late String flag; // url to asset flag icon
	late String url; // timezone url
	late bool isDaytime; // true: day, false: night

	WorldTime({required this.location, required this.flag, required this.url,});

	Future <void> getTime() async {

		try{

			Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
			Map data = jsonDecode(response.body);

			//get utc_datetime and utc_offset from data
			String datetime = data['utc_datetime'];
			String offset_hrs = data['utc_offset'].substring(0,3);
			String offset_min = data['utc_offset'].substring(4,6);
			//create datetime object
			DateTime now = DateTime.parse(datetime);
			now = now.add(Duration(hours: int.parse(offset_hrs), minutes: int.parse(offset_min)));
	
			//set the time property of class
			isDaytime = now.hour > 6 && now.hour < 20;
			time = DateFormat.jm().format(now);
		}
		catch (e) {
			print('Caught error: $e');
			time = 'could not fetch time data';
		}


	}
}
