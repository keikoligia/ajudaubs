import 'package:ajuda_ubs/app/controllers/remedio_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class RemedioMapsView extends StatefulWidget {
  const RemedioMapsView({Key? key}) : super(key: key);

  @override
  State<RemedioMapsView> createState() => _RemedioMapsViewState();
}

class _RemedioMapsViewState extends State<RemedioMapsView> {
  late GoogleMapController mapController;

  final LatLng center = const LatLng(-22.9106045, -47.0689968);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final appKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      body: ChangeNotifierProvider<RemedioController>(
        create: (context) => RemedioController(context: context),
        child: Builder(builder: (context) {
          final local = context.watch<RemedioController>();

          /*String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long} |'
              : local.erro;

          return Center(child: Text(mensagem));*/

          return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 15,
                ),
                zoomControlsEnabled: true,
                mapType: MapType.satellite,
                myLocationEnabled: true,
                onMapCreated: local.onMapCreated,
                markers: local.markers,
              );
        }),
      ),
    );
  }
}     

