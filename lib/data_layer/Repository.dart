import 'package:weather_app/model/FormattedWeatherEntity.dart';
import 'package:weather_app/network_layer.dart';

//TODO Add data caching logic
class Repository {
  Repository._privateConstructor();

  static final Repository _instance = Repository._privateConstructor();

  factory Repository() {
    return _instance;
  }

  getCurrentWeatherForecast() async {
    var weather = await new WeatherService().getCurrentWeatherForecast();
    return new FormattedWeatherEntity(weather);
  }

  getNextFiveDaysWeatherForecast() async {
    var forecasts = await new WeatherService().getNextFiveDaysWeatherForecast();
    return forecasts.map((weather) => FormattedWeatherEntity(weather)).toList();
  }
}
