import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/map/presentation/bloc/map_bloc.dart';

void main() {
  late MapBloc mapBloc;

  setUp(() {
    mapBloc = MapBloc();
  });
  test("initialState should be Temp", () {
    expect(mapBloc.initialState, equals(Temperature()));
  });

  group("GetWeatherForLatLong", () {
    test(
      'should emit [Temperature, Temperature] when maptype is temp_new',
      () async* {
        // arrange
        // assert later
        final expected = [
          Temperature(),
          Temperature(),
        ];

        expectLater(mapBloc.state, emitsInOrder(expected));
        // act
        mapBloc.add(GetTempAndPrepForMap("temp_new"));
      },
    );
    test(
      'should emit [Temperature, Precipitation] when mapType is precipitation_new',
      () async* {
        // arrange
        final expected = [
          Temperature(),
          Precipitation(),
        ];

        expectLater(mapBloc.state, emitsInOrder(expected));
        // act
        mapBloc.add(GetTempAndPrepForMap("precipitation_new"));
      },
    );
  });
}
