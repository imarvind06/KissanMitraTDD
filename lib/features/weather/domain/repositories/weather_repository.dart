import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/utils/lat_long.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeather(LatLong latLong);
}
