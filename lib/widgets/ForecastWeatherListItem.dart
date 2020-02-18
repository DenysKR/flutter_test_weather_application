import 'package:flutter/material.dart';
import 'package:weather_app/model/Weather.dart';
import 'package:intl/intl.dart';

class ForecastWeatherListItem extends StatelessWidget {
  final Weather weatherData;

  const ForecastWeatherListItem({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(new DateFormat.yMMMd().format(weatherData.date)),
              Text(new DateFormat.Hm().format(weatherData.date)),
              Image.network('https://openweathermap.org/img/w/${weatherData.icon}.png'),
              Text(weatherData.temperature.toString()),
            ],
          ),
        ),
      );
}
