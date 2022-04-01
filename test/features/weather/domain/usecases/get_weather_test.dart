import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/core/usecases/weather_usecase/weather_params.dart';
import 'package:weather/core/utils/lat_long.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather/features/weather/domain/usecases/get_weather.dart';
import '../../../../helper_test/models.dart';
import 'get_weather_test.mocks.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late GetWeather usecase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetWeather(mockWeatherRepository);
  });

  test(
    'should get currentWeatherData  for the LatLong from repository',
    () async {
      // arrange
      when(mockWeatherRepository.getWeather(any))
          .thenAnswer((_) async => Right(tWeather));

      // act
      final result = await usecase(WeatherParams(latLong: tLatLng));
      // assert
      expect(result, Right(tWeather));
      verify(mockWeatherRepository.getWeather(tLatLng));
      verifyNoMoreInteractions(mockWeatherRepository);
    },
  );
}
