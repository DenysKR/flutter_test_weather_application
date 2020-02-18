import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  final _paddingValue = 30.0;

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
                  Image.network('https://openweathermap.org/img/w/04d.png'),
                  Text('2°C',
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
