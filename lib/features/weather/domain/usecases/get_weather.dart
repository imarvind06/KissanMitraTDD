import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/usecases/weather_usecase/weather_params.dart';
import 'package:weather/core/usecases/weather_usecase/weather_usecase.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';

class GetWeather implements WeatherUseCase<Weather, WeatherParams> {
  final WeatherRepository repository;

  GetWeather(this.repository);
  @override
  Future<Either<Failure, Weather>> call(WeatherParams params) async {
    return await repository.getWeather(params.latLong);
  }
}
