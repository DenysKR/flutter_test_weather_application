
import 'package:flutter/material.dart';
import 'package:weather_app/model/Forecast.dart';
import 'package:weather_app/model/Weather.dart';
import 'package:weather_app/widgets/CurrentWeather.dart';
import 'package:weather_app/widgets/ForecastWeatherListItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  Weather weatherData;

  Forecast forecastData;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
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
              weatherData != null
                  ? CurrentWeather(weatherData: weatherData)
                  : Container(),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  child: forecastData != null
                      ? ListView.builder(
                          itemCount: forecastData.list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ForecastWeatherListItem(
                                  weatherData:
                                      forecastData.list.elementAt(index)))
                      : Container(),
                ),
              ))
            ]))),
      );

  loadWeather() async {
    final appId = 'd0ebde681bc5b0725f20d3923f19273f';

    setState(() {
      isLoading = true;
    });

    final lat = 40.730610;
    final lon = -73.935242;

    final weatherResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?APPID=$appId&lat=${lat.toString()}&lon=${lon.toString()}');
    final forecastResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/forecast?APPID=$appId&lat=${lat.toString()}&lon=${lon.toString()}');

    if (weatherResponse.statusCode == 200 &&
        forecastResponse.statusCode == 200) {
      return setState(() {
        weatherData = new Weather.fromJson(jsonDecode(weatherResponse.body));
        forecastData = new Forecast.fromJson(jsonDecode(forecastResponse.body));
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}

