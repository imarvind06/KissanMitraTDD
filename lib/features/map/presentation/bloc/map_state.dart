part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class Temperature extends MapState {}

class Precipitation extends MapState {}
