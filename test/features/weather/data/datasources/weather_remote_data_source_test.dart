import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/core/constant/api_key.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/core/utils/lat_long.dart';
import 'package:weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:weather/features/weather/data/models/weather_model.dart';
import '../../../../fixture/fixure_reader.dart';
import 'weather_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late WeatherRemoteDataSourceImpl dataSourceImpl;
  late MockClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockClient();
    dataSourceImpl = WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("getWeather", () {
    final tLatlng = LatLong(lat: 0, long: 0);

    final tWeatherModel =
        WeatherModel.fromJson(json.decode(fixture("weather.json")));

    test(
      '''should perform a GET request on a URL with lat 
         long being the endpoint and with application/json header''',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture("weather.json"), 200));

        // act
        dataSourceImpl.getWeather(tLatlng);

        // assert
        verify(
          mockHttpClient.get(
            Uri.parse(
                "https://api.openweathermap.org/data/2.5/onecall?lat=${tLatlng.lat}&lon=${tLatlng.long}&units=metric&appid=$API_KEY"),
            headers: {'content-Type': 'application/json'},
          ),
        );
      },
    );

    test(
      'should return Weather when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response(fixture("weather.json"), 200));

        // act
        final result = await dataSourceImpl.getWeather(tLatlng);

        // assert

        expect(result, tWeatherModel);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
            (_) async => http.Response("something went wrong", 404));

        // act
        final call = dataSourceImpl.getWeather;

        // assert
        expect(() => call(tLatlng), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
