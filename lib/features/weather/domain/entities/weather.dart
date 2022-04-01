import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';

class Weather extends Equatable {
  final CurrentWeatherData currentWeatherData;
  final SevenDayWeatherData sevenDayWeatherData;
  final TodayWeatherData todayWeatherData;

  Weather(
      {required this.currentWeatherData,
      required this.sevenDayWeatherData,
      required this.todayWeatherData});

  @override
  List<Object?> get props => [
        currentWeatherData,
        sevenDayWeatherData,
        todayWeatherData,
      ];
}
