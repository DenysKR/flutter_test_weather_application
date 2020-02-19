import 'dart:async';

import 'package:weather_app/blocs/BlocBase.dart';
import 'package:weather_app/data_layer/Repository.dart';
import 'package:weather_app/model/FormattedWeatherEntity.dart';

class WeatherBloc implements BaseBloc {

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
    final repository = new Repository();

    var nextFiveDaysWeatherForecast = await repository.getNextFiveDaysWeatherForecast();
    var currentWeatherForecast = await repository.getCurrentWeatherForecast();

    _currentWeatherSink.add(currentWeatherForecast);
    _fiveDaysForecastSink.add(nextFiveDaysWeatherForecast);
  }
}
