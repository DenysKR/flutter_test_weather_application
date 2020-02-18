import 'package:flutter/material.dart';

class ForecastWeatherListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Fabruary 18, 2020'),
              Text('11:30'),
              Image.network('https://openweathermap.org/img/w/04d.png'),
              Text('2°C'),
            ],
          ),
        ),
      );
}
