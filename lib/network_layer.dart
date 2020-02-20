import 'package:weather/weather.dart';

//TODO Move API ID to the config file
class WeatherService {
  WeatherService._privateConstructor();

  static final WeatherService _instance = WeatherService._privateConstructor();
  final WeatherStation _weatherStation =
      new WeatherStation('d0ebde681bc5b0725f20d3923f19273f');

  factory WeatherService() {
    return _instance;
  }

  Future<Weather> getCurrentWeatherForecast() async =>
      await _weatherStation.currentWeather();

  Future<List<Weather>> getNextFiveDaysWeatherForecast() async =>
      await _weatherStation.fiveDayForecast();
}
