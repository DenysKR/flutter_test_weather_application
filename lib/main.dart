import 'package:flutter/material.dart';

import 'package:weather/weather.dart';
import 'package:weather_app/model/FormattedWeatherEntity.dart';
import 'package:weather_app/widgets/CurrentWeather.dart';
import 'package:weather_app/widgets/ForecastWeatherListItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  FormattedWeatherEntity weatherData;

  List<FormattedWeatherEntity> forecastData;

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
                  ? CurrentWeather(weather: weatherData)
                  : Container(),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  child: forecastData != null
                      ? ListView.builder(
                          itemCount: forecastData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ForecastWeatherListItem(
                                  weather: forecastData.elementAt(index)))
                      : Container(),
                ),
              ))
            ]))),
      );

  loadWeather() async {
    WeatherStation weatherStation =
        new WeatherStation("d0ebde681bc5b0725f20d3923f19273f");
    var weather = await weatherStation.currentWeather();
    var forecasts = await weatherStation
        .fiveDayForecast();

    forecasts.map((weather) =>
        FormattedWeatherEntity(weather));

    setState(() {
      weatherData = new FormattedWeatherEntity(weather);
      forecastData = forecasts.map((weather) =>
          FormattedWeatherEntity(weather)).toList();
    });
  }
}
