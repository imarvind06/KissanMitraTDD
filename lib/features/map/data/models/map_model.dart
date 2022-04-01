import 'dart:typed_data';

import 'package:weather/features/map/domain/entities/maps.dart';

class MapModel extends Maps {
  MapModel({required Uint8List uint8list}) : super(uint8list: uint8list);

  factory MapModel.fromByteData(ByteData byteData) {
    final Uint8List bytes = byteData.buffer.asUint8List();
    return MapModel(uint8list: bytes);
  }
}
