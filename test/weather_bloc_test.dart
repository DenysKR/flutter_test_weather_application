import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather_app/blocs/CurrentWeatherBloc.dart';
import 'package:weather_app/data_layer/Repository.dart';

class MockRepository extends Mock implements Repository {}

main() {

  MockRepository mockRepository;

  setUp(() {
    mockRepository = new MockRepository();
    WeatherBloc(mockRepository).refreshCurrentWeather(null);
  });

  group('fetch current weather/five days forecasts tests', () {
    test('getCurrentWeatherForecast call completes successfully', () {
      verify(mockRepository.getCurrentWeatherForecast());
    });

    test('getNextFiveDaysWeatherForecast call completes successfully', () {
      verify(mockRepository.getNextFiveDaysWeatherForecast());
    });
  });
}
