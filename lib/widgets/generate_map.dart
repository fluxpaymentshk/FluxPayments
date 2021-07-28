import 'dart:async';
import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GenerateMapWidget extends StatefulWidget {
  const GenerateMapWidget({Key? key}) : super(key: key);

  @override
  _GenerateMapWidgetState createState() => _GenerateMapWidgetState();
}

class _GenerateMapWidgetState extends State<GenerateMapWidget> {
  late Location location;
  // late GoogleMapController _controller;
  double zoomScale = 15;
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late String _mapStyle;

  @override
  void initState() {
    super.initState();
    log("h1");
    rootBundle.loadString('assets/map/map_style.txt').then((string) {
      _mapStyle = string;
    });
    location = new Location();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(30.3398, 76.3869),
      zoom: zoomScale,
      // bearing: 20,
      // tilt: 50,
    );
    return Container(
      height: 600,
      width: double.infinity,
      child: GoogleMap(
        markers: {
          Marker(
            markerId: MarkerId("Shop Marker"),
            infoWindow: InfoWindow(title: "Shop"),
            position: LatLng(30.32, 76.4067599),
          ),
        }, //_marker,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          // mapController = controller;

          if (!_controller.isCompleted) {
            _controller.complete(controller);
            mapController = controller;
            mapController.setMapStyle(_mapStyle);
          }
        },
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: false,
        buildingsEnabled: true,
      ),
    );
  }
}
