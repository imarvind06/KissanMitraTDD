import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather/core/location/get_lat_long.dart';
import 'package:weather/core/network/network_info.dart';
import 'package:weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather/features/weather/domain/usecases/get_weather.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // features - Weather
  sl.registerFactory(() => WeatherBloc(
        getLatLong: sl(),
        getWeather: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetWeather(sl()));
  // Repository

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      weatherRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));

  // Core-
  sl.registerLazySingleton<GetLatLong>(() => GetLatLongImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
