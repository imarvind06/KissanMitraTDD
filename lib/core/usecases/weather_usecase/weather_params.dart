import 'package:equatable/equatable.dart';
import 'package:weather/core/utils/lat_long.dart';

class WeatherParams extends Equatable {
  final LatLong latLong;

  WeatherParams({required this.latLong});

  @override
  List<Object?> get props => [latLong];
}
