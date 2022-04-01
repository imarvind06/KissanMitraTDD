import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/features/map/data/datasources/map_remote_data_source.dart';

class GetMap extends Equatable implements TileProvider {
  final MapRemoteDataSource mapRemoteDataSource;
  Tile transTile = Tile(0, 0, Uint8List.fromList([1]));
  Tile actualTile = Tile(0, 0, Uint8List.fromList([1]));
  final String mapType;
  int tileSize = 256;
  GetMap({required this.mapRemoteDataSource, required this.mapType});

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    zoom = zoom ?? 1;

    if (zoom >= 1 && zoom <= 20) {
      try {
        final response = await mapRemoteDataSource.getMaps(mapType, x, y, zoom);
        actualTile = Tile(tileSize, tileSize, response.uint8list);
        return actualTile;
      } catch (e) {
        return transTile;
      }
    }
    return transTile;
  }

  @override
  List<Object?> get props => [actualTile];
}
