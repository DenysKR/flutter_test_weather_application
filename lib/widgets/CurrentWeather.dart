import 'package:flutter/material.dart';
import 'package:weather_app/model/Weather.dart';

class CurrentWeather extends StatelessWidget {

  final _paddingValue = 30.0;
  final Weather weatherData;

  const CurrentWeather({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text('Kharkiv', style: new TextStyle(fontSize: 32.0)),
              Padding(padding: EdgeInsets.only(top: _paddingValue)),
              Text('Sunny'),
              Padding(padding: EdgeInsets.only(top: _paddingValue)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network('https://openweathermap.org/img/w/${weatherData.icon}.png'),
                  Text(weatherData.temperature.toString(),
                      style: new TextStyle(
                          fontSize: 52.0, fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: _paddingValue)),
            ],
          ),
        ),
      );
}
