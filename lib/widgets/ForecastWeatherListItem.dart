import 'package:flutter/material.dart';
import 'package:weather_app/model/FormattedWeatherEntity.dart';

class ForecastWeatherListItem extends StatelessWidget {
  final FormattedWeatherEntity weather;

  const ForecastWeatherListItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(weather.date),
              Text(weather.time),
              Image.network(weather.weatherIconURL),
              Text(weather.temperature),
            ],
          ),
        ),
      );
}
