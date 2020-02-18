import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/model/FormattedWeatherEntity.dart';

class CurrentWeather extends StatelessWidget {

  final _paddingValue = 30.0;

  final FormattedWeatherEntity weather;

  const CurrentWeather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text(weather.city, style: new TextStyle(fontSize: 32.0)),
              Padding(padding: EdgeInsets.only(top: _paddingValue)),
              Text(weather.weatherDescription),
              Padding(padding: EdgeInsets.only(top: _paddingValue)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(weather.weatherIconURL),
                  Text(weather.temperature,
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
