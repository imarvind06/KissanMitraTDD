import 'package:weather/core/utils/lat_long.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

final tLatLng = LatLong(lat: 0, long: 0);

final tCurrentWeatherDara = CurrentWeatherData(
  currentWeatherData: CurrentWeather(
    chanceRain: 0,
    current: 0,
    day: '',
    humidity: 0,
    image: '',
    name: '',
    wind: 0,
  ),
);

final tTodayWeatherData = TodayWeatherData(todayWeatherData: [
  TodayWeather(
    current: 0,
    image: '',
    time: '',
  )
]);

final tSevenDayWeatherData = SevenDayWeatherData(sevenDayWeatherdata: [
  SevenDayWeather(
    max: 0,
    min: 0,
    name: "",
    day: "",
    image: "",
  )
]);

final tWeather = Weather(
    currentWeatherData: tCurrentWeatherDara,
    sevenDayWeatherData: tSevenDayWeatherData,
    todayWeatherData: tTodayWeatherData);
