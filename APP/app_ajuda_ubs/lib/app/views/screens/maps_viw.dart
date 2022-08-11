import 'package:ajuda_ubs/app/utils/directions_model.dart';
import 'package:ajuda_ubs/app/utils/directions_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-22.8622019, -47.0368772),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;

  late Marker? _origin = Marker(
    markerId: const MarkerId('Origin'),
    infoWindow: const InfoWindow(title: 'Origin'),
    position: const LatLng(-22.8547906, -47.0355426),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  );

  late Marker? _destination = Marker(
    markerId: const MarkerId('Destination'),
    infoWindow: const InfoWindow(title: 'Destination'),
    position: const LatLng(-22.8622019, -47.0368772),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );

  late Directions? _info;

  var response;

  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  //https://maps.googleapis.com/maps/api/directions/json?origin=-22.8547906,-47.0355426&destination=-22.8622019,-47.0368772&key=AIzaSyA3pej_1H8SiaxJzrxEEbi3ISRWYfzFTjg
  late String url;
  Future<Directions> getDirection(
    LatLng origin,
    LatLng destination,
  ) async {
    try {
      url = _baseUrl +
          'origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=AIzaSyA3pej_1H8SiaxJzrxEEbi3ISRWYfzFTjg';

      response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return Directions.fromJson(response.body);
      }
    } catch (e) {
      print(e);
      print(response);
    }

    throw ArgumentError('Erro JSON return DIRECTIONS ' + url);
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Google Maps'),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {_origin!, _destination!},
            /*polylines: {
              Polyline(
                polylineId: const PolylineId('overview_polyline'),
                color: Colors.red,
                width: 5,
                points: _info!.polylinePoints
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList(),
              ),
            },*/
            onLongPress: _addMarker,
          ),
          Positioned(
            top: 20.0,
            child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 179, 255),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: const Text(
                  'B',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () {
          _googleMapController.animateCamera(
              /*_info! != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : */
              CameraUpdate.newCameraPosition(_initialCameraPosition));
          _addMarker(LatLng(-22.8547906, -47.0355426));
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    // Origin is not set OR Origin/Destination are both set
    // Set origin
    setState(() {
      _origin = Marker(
        markerId: MarkerId('Origin'),
        infoWindow: const InfoWindow(title: 'Origin'),
        position: pos,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      );
    });
    // Reset destination
    // Reset i
    // Origin is already set
    // Set destination
    //

    setState(() {
      _destination = Marker(
        markerId: MarkerId('Destination'),
        infoWindow: const InfoWindow(title: 'Destination'),
        position: pos,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
    });

    // Get directions
    final directions = await getDirection(
        _destination!.position, const LatLng(-23.5981, -46.7201));
    setState(() => _info = directions);
  }
}
