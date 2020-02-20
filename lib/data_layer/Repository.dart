import 'package:weather_app/model/FormattedWeatherEntity.dart';
import 'package:weather_app/network_layer.dart';

//TODO Add data caching logic
class Repository {
  WeatherService _weatherService;

  Repository(WeatherService weatherService) {
    this._weatherService = weatherService;
  }

  getCurrentWeatherForecast() async {
    var weather = await _weatherService.getCurrentWeatherForecast();
    return new FormattedWeatherEntity(weather);
  }

  getNextFiveDaysWeatherForecast() async {
    var forecasts = await _weatherService.getNextFiveDaysWeatherForecast();
    return forecasts != null ? forecasts.map((weather) =>
        FormattedWeatherEntity(weather)).toList() : new List<
        FormattedWeatherEntity>();
  }
}
