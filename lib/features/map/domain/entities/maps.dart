import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class Maps extends Equatable {
  final Uint8List uint8list;

  const Maps({required this.uint8list});

  @override
  List<Object?> get props => [uint8list];
}
