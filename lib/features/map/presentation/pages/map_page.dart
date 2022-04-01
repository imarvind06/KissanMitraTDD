import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/features/map/data/datasources/map_remote_data_source.dart';
import 'package:weather/features/map/domain/usecases/get_map.dart';
import 'package:weather/features/map/presentation/bloc/map_bloc.dart';

class MapPage extends StatelessWidget {
  late GoogleMapController mapController;

  final LatLng latLng = const LatLng(0.0, 0.0);

  bool _isTempMap = false;

  MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapBloc>(
      create: (context) => MapBloc(),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is Temperature) {
            _isTempMap = true;
          } else {
            _isTempMap = false;
          }
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (state is Temperature) {
                  context
                      .read<MapBloc>()
                      .add(GetTempAndPrepForMap("precipitation_new"));
                } else {
                  context.read<MapBloc>().add(GetTempAndPrepForMap("temp_new"));
                }
              },
              isExtended: true,
              child: Icon(
                !_isTempMap ? Icons.local_fire_department : Icons.cloud,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            body: GoogleMap(
              tileOverlays: {
                _isTempMap
                    ? TileOverlay(
                        tileOverlayId:
                            const TileOverlayId('precipitation_new_id'),
                        tileProvider: tileProvider("precipitation_new"),
                      )
                    : TileOverlay(
                        tileOverlayId: const TileOverlayId('temp_new_id'),
                        tileProvider: tileProvider("temp_new"),
                      )
              },
              onMapCreated: setControler,
              initialCameraPosition: CameraPosition(
                target: latLng,
                zoom: 1,
              ),
            ),
          );
        },
      ),
    );
  }

  TileProvider tileProvider(String mapType) {
    print("counttileProvider");
    return GetMap(
      mapType: mapType,
      mapRemoteDataSource: MapRemoteDataSourceImpl(),
    );
  }

  void setControler(GoogleMapController controller) {
    mapController = controller;
  }
}
