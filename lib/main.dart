import 'package:flutter/material.dart';
import 'package:weather_app/widgets/CurrentWeather.dart';
import 'package:weather_app/widgets/ForecastWeatherListItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'Weather application',
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Weather application'),
            ),
            body: Center(
                child: Column(children: <Widget>[
                  CurrentWeather(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150.0,
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ForecastWeatherListItem()),
                      ),
                    ),
                  )
                ]))),
      );
}
