import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      _markers.add(Marker(
          markerId: MarkerId("shop1"),
          position: LatLng(19.22681499580088, 72.85616231269978),
          infoWindow: InfoWindow(title: "Nike")));

      _markers.add(Marker(
          markerId: MarkerId("shop2"),
          position: LatLng(19.230521811626627, 72.85674926296497),
          infoWindow: InfoWindow(title: "Adidas")));

      _markers.add(Marker(
          markerId: MarkerId("shop3"),
          position: LatLng(19.22984950319211, 72.85451692751946),
          infoWindow: InfoWindow(title: "Puma")));

      _markers.add(Marker(
          markerId: MarkerId("shop4"),
          position: LatLng(19.224224781514636, 72.85338272601315),
          infoWindow: InfoWindow(title: "Reebok")));
    });
    print(_markers);
    _markers.forEach((element) {
      print(element.markerId.toString());
    });
  }

  Set<Marker> _markers = {
    //   Marker m1 = Marker(
    //     markerId:  MarkerId("shop1"),
    //     position: LatLng(19.22681499580088, 72.85616231269978),
    //     infoWindow: InfoWindow(title: "Shop 1")
    //   );
    //   Marker m2 = Marker(
    //     markerId:  MarkerId("shop2"),
    //     position: LatLng(19.230521811626627, 72.85674926296497),
    //     infoWindow: InfoWindow(title: "Shop 2")
    //   );
    //  Marker  m3 = Marker(
    //     markerId:  MarkerId("shop3"),
    //     position: LatLng(19.22984950319211, 72.85451692751946),
    //     infoWindow: InfoWindow(title: "Shop 3")
    //   );
    //   Marker m4 = Marker(
    //     markerId:  MarkerId("shop4"),
    //     position: LatLng(19.224224781514636, 72.85338272601315),
    //     infoWindow: InfoWindow(title: "Shop 4")
    //   );
  };

  void onTapMarker(GoogleMapController _controller1, int i) {
    Marker temp = _markers.elementAt(i);
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(temp.position.latitude, temp.position.longitude),
      zoom: 17,
      tilt: 10,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            width: double.infinity,
            child: GoogleMap(
              //markers: {m1, m2, m3, m4},
              markers: _markers,
              onMapCreated: _onMapCreated,
              //rotateGesturesEnabled: true,
              //scrollGesturesEnabled: false,
              //zoomGesturesEnabled: false,
              //zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(19.22904374218873, 72.85721606935078),
                zoom: 15,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: _markers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onTapMarker(_controller, index);
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(
                        _markers.elementAt(index).infoWindow.title.toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
