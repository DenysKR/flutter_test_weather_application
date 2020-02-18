import 'package:flutter/material.dart';

class ForecastWeatherListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Fabruary 18, 2020',
                  style:
                  new TextStyle(color: Colors.white)),
              Text('11:30',
                  style:
                  new TextStyle(color: Colors.white)),
              Image.network(
                  'https://openweathermap.org/img/w/04d.png'),
              Text('2°C',
                  style:
                  new TextStyle(color: Colors.white)),
            ],
          ),
        ),
      );

}