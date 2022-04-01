part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class GetTempAndPrepForMap extends MapEvent {
  final String mapType;

  const GetTempAndPrepForMap(this.mapType);
}
