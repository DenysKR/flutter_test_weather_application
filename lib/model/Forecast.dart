import 'package:weather_app/model/Weather.dart';

class Forecast {
  final List list;

  Forecast({this.list});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      var w = new Weather(
          date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
          location: json['city']['name'],
          temperature: e['main']['temp'].toDouble(),
          weatherDescription: e['weather'][0]['main'],
          icon: e['weather'][0]['icon']);
      list.add(w);
    }

    return Forecast(
      list: list,
    );
  }
}