import 'package:equatable/equatable.dart';

class TodayWeather extends Equatable {
  final int current;
  final String time;
  final String image;

  const TodayWeather({
    required this.current,
    required this.time,
    required this.image,
  });

  @override
  List<Object?> get props => [current, time, image];
}
