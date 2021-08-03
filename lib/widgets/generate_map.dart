import 'dart:async';
import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GenerateMapWidget extends StatefulWidget {
  final double? longitude;
  final double? latitude;
  final String? title;
  const GenerateMapWidget(
      {Key? key,
      @required this.longitude,
      @required this.latitude,
      @required this.title})
      : super(key: key);

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
      target: LatLng(
        widget.latitude!,
        widget.longitude!,
      ),
      zoom: zoomScale,
      // bearing: 20,
      // tilt: 50,
    );
    return Container(
      height: 600,
      width: 600,
      child: GoogleMap(
        markers: {
          Marker(
            markerId: MarkerId(widget.title! + "Marker"),
            infoWindow: InfoWindow(title: "FLUX: " + widget.title!),
            position: LatLng(widget.latitude!, widget.longitude!),
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
        trafficEnabled: false,
        indoorViewEnabled: true,
        buildingsEnabled: true,
      ),
    );
  }
}
