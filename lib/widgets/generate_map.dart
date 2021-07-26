import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class GenerateMapWidget extends StatefulWidget {
  @override
  _GenerateMapWidgetState createState() => _GenerateMapWidgetState();
}

class _GenerateMapWidgetState extends State<GenerateMapWidget>
    with AutomaticKeepAliveClientMixin {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  Set<Marker> _marker = Set<Marker>();
  late Location location;
  int i = 0;
  late LocationData currentLocationData;
  late LocationData locationDataForViewer;
  final navigatorKey = GlobalKey<NavigatorState>();
  late String _mapStyle;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    log("h1");
    rootBundle.loadString('assets/map/map_style.txt').then((string) {
      _mapStyle = string;
    });
    location = new Location();
    location.isBackgroundModeEnabled();

    log("h2");
    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocationData = cLoc;
      //data save
      log("I am changing!!-> " + currentLocationData.toString());
      // SchedulerBinding.instance
      //     .addPostFrameCallback((_) =>
      // submitUserData(cLoc);
      //  );

      if (_controller.isCompleted) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(cLoc.latitude ?? 0, cLoc.longitude ?? 0),
              zoom: 16.4746,
            ),
          ),
        );
      }
    });
    // } else {
    //   // readData();
    //   log("in else part");
    //   var map;

    //   //   databaseReference.child("locData").child(cryptoResult).onValue.listen(
    //   // (event) {
    //   //   map = event.snapshot.value;
    //   //   log("________" + map.toString());
    //   //   print("_______________" + map.toString());
    //   LocationData results = LocationData.fromMap(
    //     {
    //       "latitude": double.parse(map["lat"].toString()),
    //       "longitude": double.parse(map["lon"].toString()),
    //     },
    //   );
    //   log(isTimeout.toString());
    //   setState(() {
    //     currentLocationData = results;
    //   });
    //   if (i != 0) {
    //     mapController.animateCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(
    //           target: LatLng(currentLocationData.latitude ?? 0,
    //               currentLocationData.longitude ?? 0),
    //           zoom: 16.4746,
    //         ),
    //       ),
    //     );
    //   }

    //   i = 1;
    //   log("i<--->" + i.toString());
    //   log(currentLocationData.toString());

    //   log("h3");
    //   // if (isSharee) {
    //   log("h4.1");
    //   setInitialLocation();
    //   log("4.2");
    //   // }
    //   log("h5");
    //   if (currentLocationData != null)
    //     _marker.add(Marker(
    //       markerId: MarkerId('sourcePin'),
    //       position: LatLng(currentLocationData.latitude ?? 0,
    //           currentLocationData.longitude ?? 0),
    //     ));
    //   log("h6");
    // }
  }

  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  int k = 0;
  // Future<void> submitUserData(LocationData cLoc) async {
  //   log(cLoc.toString());
  //   log(cryptoResult);
  //   try {
  //     var result = await http.put(
  //       // "https://cf-pursuit-default-rtdb.firebaseio.com/users/$userName.json",
  //       Uri.parse(
  //           "https://track-me-beacon-default-rtdb.firebaseio.com/locData/$cryptoResult.json"),
  //       body: json.encode(
  //         {
  //           "lat": cLoc.latitude,
  //           "lon": cLoc.longitude,
  //           "passkeyExpiryUTC": expiryTime,
  //         },
  //       ),
  //     );
  //     if (result.statusCode == 200 && k == 0) {
  //       Map<String, dynamic> mapData =
  //           json.decode(result.body.toString()) as Map<String, dynamic>;
  //       log(mapData.toString());
  //       log(mapData["passkeyExpiryUTC"].toString() +
  //           "      " +
  //           DateTime.now().toUtc().toIso8601String());
  //       log(isTimeout.toString());
  //       if (mapData["passkeyExpiryUTC"]
  //               .toString()
  //               .compareTo(DateTime.now().toUtc().toIso8601String()) <=
  //           0) {
  //         k = 1;
  //         log(isTimeout.toString());
  //         log("Timeout!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  //         isTimeout = true;
  //         log(isTimeout.toString());
  //         setState(() {
  //           isTimeout = true;
  //         });
  //       }
  //       log("hurray!User details added successfully!!");
  //       log(isTimeout.toString());
  //     } else {
  //       log(result.body);
  //       log("nope,error in adding user to database");
  //       log(isTimeout.toString());
  //     }
  //   } catch (e) {
  //     log(e.message);
  //   }
  // }

  void setInitialLocation() async {
    currentLocationData = await location.getLocation();
    log("currentLocation Data " + currentLocationData.toString());
  }

  @override
  void didChangeDependencies() {
    // if (isTimeout)
    //   SchedulerBinding.instance
    //       ?.addPostFrameCallback((_) => handleTimeout(context));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(30.3398, 76.3869),
      zoom: 16.4746,
      // bearing: 20,
      // tilt: 50,
    );
    log("inside build");

    // return Dialog(
    //   // context: context,
    //   // builder: (BuildContext context) =>
    //   child: Center(
    //     child: Container(
    //       height: 120,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(16),
    //         ),
    //         color: Colors.white30,
    //       ),
    //       width: MediaQuery.of(context).size.width * 0.9,
    //       padding: EdgeInsets.symmetric(horizontal: 16),
    //       child: Column(
    //         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Container(
    //             height: 70,
    //             alignment: Alignment.center,
    //             decoration: BoxDecoration(
    //               border: Border(
    //                 bottom: BorderSide(
    //                   width: 1,
    //                   color: Colors.grey[300],
    //                 ),
    //               ),
    //             ),
    //             child: Text(
    //               'The passkey expired! Try reaching out to host for new passkey!',
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               // Navigator.of(context).push;
    //               // Navigator.of(context).pop();
    //               Navigator.of(context).pop();
    //             },
    //             child: Text(
    //               "OK",
    //               style: TextStyle(fontSize: 18),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width*0.6,
      child: FutureBuilder<LocationData>(
        future: location.getLocation(),
        builder: (context, futureData) {
          log("hb1");
          if (futureData != null && futureData.hasData) {
            LocationData curr;
            curr = futureData.data!;
            _kGooglePlex = CameraPosition(
              target: currentLocationData != null
                  ? LatLng(currentLocationData.latitude!,
                      currentLocationData.longitude!)
                  : LatLng(curr.latitude!, curr.longitude!),
              zoom: 16.4746,
              // bearing: 20,
              // tilt: 50,
            );

            return GoogleMap(
              markers: {
                Marker(
                  markerId: MarkerId("Host"),
                  position: currentLocationData != null
                      ? LatLng(currentLocationData.latitude!,
                          currentLocationData.longitude!)
                      : LatLng(curr.latitude!, curr.longitude!),
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
              trafficEnabled: true,
              buildingsEnabled: true,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
