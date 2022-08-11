import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';

const LatLng SOURCE_LOCATION = LatLng(37.33500926, -122.03272188);
const LatLng DEST_LOCATION = LatLng(37.33429383, -122.0660055);
const double CAMERA_ZOOM = 13.5;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  //SubCategory? subCategory;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polyCord = [];

  void getPoly() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyA3pej_1H8SiaxJzrxEEbi3ISRWYfzFTjg',
        PointLatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude),
        PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polyCord.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    }
  }

  @override
  void initState() {
    getPoly();
    super.initState();
  }
  // sourceIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

  @override
  Widget build(BuildContext context) {
    //CategorySelectionService catSelection =
    //  Provider.of<CategorySelectionService>(context, listen: false);
    //widget.subCategory = catSelection.selectedSubCategory;

    CameraPosition initialCameraPosition = const CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);

    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        compassEnabled: false,
        tiltGesturesEnabled: false,
        markers: {
          Marker(
            markerId: const MarkerId('Origem'),
            infoWindow: const InfoWindow(title: 'Origem'),
            position: SOURCE_LOCATION,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            position: DEST_LOCATION,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          )
        },
        initialCameraPosition: initialCameraPosition,
        polylines: {
          Polyline(polylineId: PolylineId("route"), points: polyCord)
        },
      ),
    );
  }
}
