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
  FormattedWeatherEntity currentWeatherData;

  List<FormattedWeatherEntity> forecastsData;

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
              currentWeatherData != null
                  ? CurrentWeather(weather: currentWeatherData)
                  : Container(),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  child: forecastsData != null
                      ? ListView.builder(
                          itemCount: forecastsData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ForecastWeatherListItem(
                                  weather: forecastsData.elementAt(index)))
                      : Container(),
                ),
              ))
            ]))),
      );

  loadWeather() async {
    final appId = 'd0ebde681bc5b0725f20d3923f19273f';
    WeatherStation weatherStation = new WeatherStation(appId);
    var weather = await weatherStation.currentWeather();
    var forecasts = await weatherStation.fiveDayForecast();

    forecasts.map((weather) => FormattedWeatherEntity(weather));

    setState(() {
      currentWeatherData = new FormattedWeatherEntity(weather);
      forecastsData =
          forecasts.map((weather) => FormattedWeatherEntity(weather)).toList();
    });
  }
}
