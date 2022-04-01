part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List properties = const <dynamic>[]]);
}

class GetWeatherForLatLong extends WeatherEvent {
  GetWeatherForLatLong() : super([]);

  @override
  List<Object?> get props => [];
}
