import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  final int current;
  final String name;
  final String day;
  final int wind;
  final int humidity;
  final int chanceRain;
  final String image;

  const CurrentWeather({
    required this.current,
    required this.name,
    required this.day,
    required this.wind,
    required this.humidity,
    required this.chanceRain,
    required this.image,
  });

  @override
  List<Object?> get props =>
      [current, name, day, wind, humidity, chanceRain, image];
}
