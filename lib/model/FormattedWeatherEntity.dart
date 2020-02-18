import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class FormattedWeatherEntity {
  final Weather _weather;

  final String temperature;
  final String weatherDescription;
  final String weatherIconURL;
  final String date;
  final String time;
  final String city;

  FormattedWeatherEntity(this._weather)
      : date = new DateFormat.yMMMd().format(_weather.date),
        time = new DateFormat.Hm().format(_weather.date),
        weatherIconURL =
            'https://openweathermap.org/img/w/${_weather.weatherIcon}.png',
        temperature = _weather.temperature.celsius.floor().toString(),
        weatherDescription = _weather.weatherMain,
        city = _weather.areaName;
}
