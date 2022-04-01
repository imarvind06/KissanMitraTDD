import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';

class CurrentWeatherData extends Equatable {
  final CurrentWeather currentWeatherData;

  const CurrentWeatherData({required this.currentWeatherData});

  @override
  List<Object?> get props => [currentWeatherData];
}
