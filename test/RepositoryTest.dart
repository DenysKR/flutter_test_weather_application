import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data_layer/Repository.dart';
import 'package:weather_app/network_layer.dart';

class MockWeatherService extends Mock implements WeatherService {}

class MockWeather extends Mock implements Weather {}

main() {
  MockWeatherService mockWeatherService;
  Repository repository;

  setUp(() {
    mockWeatherService = new MockWeatherService();

    when(mockWeatherService.getCurrentWeatherForecast())
        .thenAnswer((_) => new Future(() => new MockWeather()));

    when(mockWeatherService.getNextFiveDaysWeatherForecast())
        .thenAnswer((_) => null);

    repository = new Repository(mockWeatherService);
  });

  group('fetch current weather/five days forecasts tests', () {
    test('getCurrentWeatherForecast call completes successfully', () {
      repository.getNextFiveDaysWeatherForecast();
      verify(mockWeatherService.getNextFiveDaysWeatherForecast());
    });

    test('getCurrentWeatherForecast call completes successfully', () {
      repository.getCurrentWeatherForecast();
      verify(mockWeatherService.getCurrentWeatherForecast());
    });
  });
}
