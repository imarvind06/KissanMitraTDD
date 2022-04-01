import 'package:equatable/equatable.dart';

class SevenDayWeather extends Equatable {
  final int max;
  final int min;
  final String name;
  final String day;
  final String image;

  const SevenDayWeather({
    required this.max,
    required this.min,
    required this.name,
    required this.day,
    required this.image,
  });

  @override
  List<Object?> get props => [max, min, name, day, image];
}
