import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/map/data/models/map_model.dart';
import 'package:weather/features/map/domain/entities/maps.dart';

void main() {
  final tMapModel = MapModel(uint8list: Uint8List(1));
  test(
    'should be a subclass of Maps entity',
    () async {
      // assert
      expect(tMapModel, isA<Maps>());
    },
  );

  group("fromByteData", () {
    test(
      'should return a valid model from ByteData',
      () async {
        // arrange

        // act
        final result = MapModel.fromByteData(ByteData(1));
        // assert

        expect(result, equals(tMapModel));
      },
    );
  });
}
