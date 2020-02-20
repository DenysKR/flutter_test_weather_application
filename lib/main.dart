import 'package:flutter/material.dart';

import 'package:weather_app/blocs/BlocProvider.dart';
import 'package:weather_app/blocs/CurrentWeatherBloc.dart';
import 'package:weather_app/data_layer/Repository.dart';
import 'package:weather_app/model/FormattedWeatherEntity.dart';
import 'package:weather_app/network_layer.dart';
import 'package:weather_app/widgets/CurrentWeather.dart';
import 'package:weather_app/widgets/ForecastWeatherListItem.dart';

//TODO Add weather data loading error handling mechanism
//TODO Add weather data refreshing logic
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather application',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: BlocProvider<WeatherBloc>(
        bloc: WeatherBloc(new Repository(new WeatherService())),
        child: WeatherHomePage(),
      ),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherBloc bloc = BlocProvider.of<WeatherBloc>(context);
    bloc.refreshCurrentWeatherSink.add(true);
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather application'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          StreamBuilder<FormattedWeatherEntity>(
              stream: bloc.outCurrentWeather,
              builder: (BuildContext context,
                  AsyncSnapshot<FormattedWeatherEntity> snapshot) {
                return snapshot.data != null
                    ? CurrentWeather(weather: snapshot.data)
                    : Container();
              }),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.0,
              child: StreamBuilder<List<FormattedWeatherEntity>>(
                  stream: bloc.outFiveDaysForecastStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<FormattedWeatherEntity>> snapshot) {
                    final forecastsData = snapshot.data;
                    return forecastsData != null && forecastsData.isNotEmpty
                        ? ListView.builder(
                            itemCount: forecastsData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ForecastWeatherListItem(
                                    weather: forecastsData.elementAt(index)))
                        : Container();
                  }),
            ),
          ))
        ])));
  }
}
