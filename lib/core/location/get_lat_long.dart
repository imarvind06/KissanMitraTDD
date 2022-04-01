import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/utils/lat_long.dart';

abstract class GetLatLong {
  Future<Either<Failure, LatLong>> getLatLong();
}

class GetLatLongImpl implements GetLatLong {
  @override
  Future<Either<Failure, LatLong>> getLatLong() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationException();
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw LocationException();
      }
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return Right(LatLong(lat: location.latitude, long: location.longitude));
    } on LocationException {
      return Left(LocationFailure());
    }
  }
}
