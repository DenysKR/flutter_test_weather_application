import 'dart:async';

import 'package:weather/weather.dart';
import 'package:weather_app/blocs/BlocBase.dart';
import 'package:weather_app/model/FormattedWeatherEntity.dart';

class WeatherBloc implements BaseBloc {
  FormattedWeatherEntity _currentWeather;

  StreamController<FormattedWeatherEntity> _currentWeatherController = StreamController<FormattedWeatherEntity>();
  StreamSink<FormattedWeatherEntity> get _currentWeatherSink => _currentWeatherController.sink;
  Stream<FormattedWeatherEntity> get outCurrentWeather => _currentWeatherController.stream;

  StreamController<List<FormattedWeatherEntity>> _fiveDaysForecastController = StreamController<List<FormattedWeatherEntity>>();
  StreamSink<List<FormattedWeatherEntity>> get _fiveDaysForecastSink => _fiveDaysForecastController.sink;
  Stream<List<FormattedWeatherEntity>> get outFiveDaysForecastStream => _fiveDaysForecastController.stream;

  StreamController _actionController = StreamController();
  StreamSink get refreshCurrentWeatherSink => _actionController.sink;

  WeatherBloc() {
    _actionController.stream.listen(refreshCurrentWeather);
  }

  void dispose() {
    _actionController.close();
    _currentWeatherController.close();
  }

   void refreshCurrentWeather(data) async {
    final appId = 'd0ebde681bc5b0725f20d3923f19273f';
    WeatherStation weatherStation = new WeatherStation(appId);
    var weather = await weatherStation.currentWeather();
    _currentWeather = new FormattedWeatherEntity(weather);
    _currentWeatherSink.add(_currentWeather);

    var forecasts = await weatherStation.fiveDayForecast();
    _fiveDaysForecastSink.add(forecasts.map((weather) => FormattedWeatherEntity(weather)).toList());
  }
}
