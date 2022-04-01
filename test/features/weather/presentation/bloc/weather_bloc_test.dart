import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/location/get_lat_long.dart';
import 'package:weather/core/usecases/weather_usecase/weather_params.dart';
import 'package:weather/core/utils/lat_long.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/domain/usecases/get_weather.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

import '../../../../helper_test/models.dart';
import 'weather_bloc_test.mocks.dart';

@GenerateMocks([GetWeather])
@GenerateMocks([GetLatLongImpl])
void main() {
  late WeatherBloc weatherBloc;
  late MockGetWeather mockGetWeather;
  late MockGetLatLongImpl mockGetLatLongImpl;
  setUp(() {
    mockGetWeather = MockGetWeather();
    mockGetLatLongImpl = MockGetLatLongImpl();
    weatherBloc = WeatherBloc(
      getLatLong: mockGetLatLongImpl,
      getWeather: mockGetWeather,
    );
  });
  test("initialState should be Empty", () {
    expect(weatherBloc.initialState, equals(Empty()));
  });

  group(
    "GetWeatherForLatLong",
    () {
      test(
        'should call the GetLatLong to validate and get the lat and long',
        () async* {
          // arrange
          when(mockGetLatLongImpl.getLatLong())
              .thenAnswer((_) async => Right(tLatLng));
          // act
          weatherBloc.add(GetWeatherForLatLong());
          await untilCalled(mockGetLatLongImpl.getLatLong());

          // assert
          verify(mockGetLatLongImpl.getLatLong());
        },
      );

      test(
        'should emit [Error] when Unable to get Location or permission denied by useer',
        () async* {
          // arrange
          when(mockGetLatLongImpl.getLatLong())
              .thenAnswer((_) async => Left(LocationFailure()));
          // assert later
          final expected = [
            Empty(),
            Error(message: LOCATION_FAILURE_MESSAGE),
          ];
          expectLater(weatherBloc.state, emitsInOrder(expected));

          // act
          weatherBloc.add(GetWeatherForLatLong());
        },
      );

      test(
        'should get data from weather use case',
        () async* {
          // arrange
          when(mockGetLatLongImpl.getLatLong())
              .thenAnswer((_) async => Right(tLatLng));
          when(mockGetWeather(any)).thenAnswer((_) async => Right(tWeather));
          // act
          weatherBloc.add(GetWeatherForLatLong());
          await untilCalled(mockGetWeather(any));
          // assert
          verify(mockGetWeather(WeatherParams(latLong: tLatLng)));
        },
      );
      test(
        'should emit [Loading, Loaded] when data is gotten successfully',
        () async* {
          // arrange
          when(mockGetLatLongImpl.getLatLong())
              .thenAnswer((_) async => Right(tLatLng));
          when(mockGetWeather(any)).thenAnswer((_) async => Right(tWeather));

          // assert later
          final expected = [
            Empty(),
            Loading(),
            Loaded(weather: tWeather),
          ];

          expectLater(weatherBloc.state, emitsInOrder(expected));
          // act
          weatherBloc.add(GetWeatherForLatLong());
        },
      );
      test(
        'should emit [Loading, Error] when data is getting failed',
        () async* {
          // arrange
          when(mockGetLatLongImpl.getLatLong())
              .thenAnswer((_) async => Right(tLatLng));
          when(mockGetWeather(any))
              .thenAnswer((_) async => Left(ServerFailure()));

          // assert later
          final expected = [
            Empty(),
            Loading(),
            Error(message: SERVER_FAILURE_MESSAGE),
          ];

          expectLater(weatherBloc.state, emitsInOrder(expected));
          // act
          weatherBloc.add(GetWeatherForLatLong());
        },
      );
    },
  );
}
