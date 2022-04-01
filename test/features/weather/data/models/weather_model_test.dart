import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

import '../../../../fixture/fixure_reader.dart';

void main() {
  DateTime date = DateTime.now();

  final tCurrentWeatherDara = CurrentWeatherData(
    currentWeatherData: CurrentWeather(
      chanceRain: 0,
      current: 0,
      day: DateFormat("EEEE dd MMMM").format(date),
      humidity: 0,
      image: 'assets/sunny.png',
      name: '',
      wind: 0,
    ),
  );

  int hour = int.parse(DateFormat("hh").format(date));

  final tTodayWeatherData = TodayWeatherData(todayWeatherData: [
    TodayWeather(
      current: 0,
      image: 'assets/sunny_2d.png',
      time: Duration(hours: hour + 0 + 1).toString().split(":")[0] + ":00",
    ),
    TodayWeather(
      current: 0,
      image: 'assets/sunny_2d.png',
      time: Duration(hours: hour + 1 + 1).toString().split(":")[0] + ":00",
    ),
    TodayWeather(
      current: 0,
      image: 'assets/sunny_2d.png',
      time: Duration(hours: hour + 2 + 1).toString().split(":")[0] + ":00",
    ),
    TodayWeather(
      current: 0,
      image: 'assets/sunny_2d.png',
      time: Duration(hours: hour + 3 + 1).toString().split(":")[0] + ":00",
    )
  ]);

  final tSevenDayWeatherData = SevenDayWeatherData(sevenDayWeatherdata: [
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 0 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    ),
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 1 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    ),
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 2 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    ),
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 3 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    ),
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 4 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    ),
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 5 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    ),
    SevenDayWeather(
      max: 0,
      min: 0,
      name: "",
      day: DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + 6 + 1))
          .substring(0, 3),
      image: "assets/sunny_2d.png",
    )
  ]);

  final tWeatherModel = WeatherModel(
    currentWeatherData: tCurrentWeatherDara,
    sevenDayWeatherData: tSevenDayWeatherData,
    todayWeatherData: tTodayWeatherData,
  );

  test(
    'should be a subclass of Weather entity',
    () async {
      // assert
      expect(tWeatherModel, isA<Weather>());
    },
  );

  group("fromJson", () {
    test(
      'should return a valid model from JSON',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('weather.json'));
        // act
        final result = WeatherModel.fromJson(jsonMap);
        // assert

        expect(result, equals(tWeatherModel));
      },
    );
  });
}
