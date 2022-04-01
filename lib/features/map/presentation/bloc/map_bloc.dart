import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => Temperature();
  MapBloc() : super(Temperature()) {
    on<MapEvent>((event, emit) {});
    on<GetTempAndPrepForMap>((event, emit) {
      if (event.mapType == "temp_new") {
        emit(Temperature());
      } else {
        emit(Precipitation());
      }
    });
  }
}
