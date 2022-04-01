import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/features/map/data/datasources/map_remote_data_source.dart';
import 'package:weather/features/map/data/models/map_model.dart';
import 'package:weather/features/map/domain/usecases/get_map.dart';

import 'get_map_test.mocks.dart';

@GenerateMocks([MapRemoteDataSource])
void main() {
  late GetMap usecase;
  late MockMapRemoteDataSource mockMapRemoteDataSource;
  final tMapModel = MapModel(uint8list: Uint8List.fromList([1]));
  setUp(() {
    mockMapRemoteDataSource = MockMapRemoteDataSource();
    usecase = GetMap(mapRemoteDataSource: mockMapRemoteDataSource, mapType: '');
  });

  test(
    'should get Tile from Remote Data Source',
    () async {
      // arrange
      when(mockMapRemoteDataSource.getMaps(any, any, any, any))
          .thenAnswer((_) async => tMapModel);

      // act
      final result = await usecase.getTile(0, 0, 1);
      await untilCalled(mockMapRemoteDataSource.getMaps(any, any, any, any));

      // assert
      // expect(actual 1, matcher0)
      expect(result.data, Tile(256, 256, tMapModel.uint8list).data);
      verify(mockMapRemoteDataSource.getMaps("", 0, 0, 1));
      verifyNoMoreInteractions(mockMapRemoteDataSource);
    },
  );
}
