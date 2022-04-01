import 'package:equatable/equatable.dart';

class LatLong extends Equatable {
  final double lat;
  final double long;

  LatLong({required this.lat, required this.long});

  @override
  List<Object?> get props => [lat, long];
}
