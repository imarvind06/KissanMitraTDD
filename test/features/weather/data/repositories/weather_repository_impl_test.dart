import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/network/network_info.dart';
import 'package:weather/core/utils/lat_long.dart';
import 'package:weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'weather_repository_impl_test.mocks.dart';

@GenerateMocks([WeatherRemoteDataSource])
@GenerateMocks([NetworkInfo])
void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = WeatherRepositoryImpl(
      networkInfo: mockNetworkInfo,
      weatherRemoteDataSource: mockWeatherRemoteDataSource,
    );
  });

  final latLng = LatLong(lat: 0, long: 0);
  final currentWeatherData = CurrentWeatherData(
    currentWeatherData: CurrentWeather(
        current: 0,
        name: "",
        day: "",
        wind: 0,
        humidity: 0,
        chanceRain: 0,
        image: ""),
  );
  final todayWeatherData = TodayWeatherData(
    todayWeatherData: [
      TodayWeather(
        current: 0,
        image: "",
        time: "",
      ),
    ],
  );

  final sevenDayWeatherData = SevenDayWeatherData(
    sevenDayWeatherdata: [
      SevenDayWeather(
        max: 0,
        min: 0,
        name: "",
        day: "",
        image: "",
      ),
    ],
  );

  final tWeatherModel = WeatherModel(
    currentWeatherData: currentWeatherData,
    sevenDayWeatherData: sevenDayWeatherData,
    todayWeatherData: todayWeatherData,
  );

  final Weather tWeather = tWeatherModel;

  group("getWeather", () {
    test(
      'should check if the device is online',
      () async {
        // arrange

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        when(mockWeatherRemoteDataSource.getWeather(any))
            .thenAnswer((_) async => tWeatherModel);

        // act
        repository.getWeather(latLng);

        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );
  });

  group("device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getWeather(any))
            .thenAnswer((_) async => tWeatherModel);
        // act
        final result = await repository.getWeather(latLng);
        // assert
        verify(mockWeatherRemoteDataSource.getWeather(latLng));
        expect(result, equals(Right(tWeather)));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccesful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getWeather(any))
            .thenThrow(ServerException());
        // act
        final result = await repository.getWeather(latLng);
        // assert
        verify(mockWeatherRemoteDataSource.getWeather(latLng));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
      'should return network failure when the device is offline',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getWeather(any))
            .thenThrow(NetWorkException());
        // act
        final result = await repository.getWeather(latLng);

        // assert

        verifyNever(mockWeatherRemoteDataSource.getWeather(latLng));
        expect(result, equals(Left(NetworkFailure())));
      },
    );
  });
}
