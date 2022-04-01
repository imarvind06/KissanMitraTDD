import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:weather/core/constant/api_key.dart';
import 'package:weather/core/error/exceptions.dart';
import 'package:weather/features/map/data/models/map_model.dart';

abstract class MapRemoteDataSource {
  Future<MapModel> getMaps(String mapType, int x, int y, int zoom);
}

class MapRemoteDataSourceImpl extends MapRemoteDataSource {
  @override
  Future<MapModel> getMaps(String mapType, int x, int y, int zoom) async {
    try {
      final uri = Uri.parse(
          "https://tile.openweathermap.org/map/$mapType/$zoom/$x/$y.png?appid=$API_KEY");

      final ByteData imageData = await NetworkAssetBundle(uri).load("");
      return MapModel.fromByteData(imageData);
    } catch (e) {
      throw ServerException();
    }
  }
}
