import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDelivary extends StatefulWidget {
  @override
  _MapDelivaryState createState() => _MapDelivaryState();
}

class _MapDelivaryState extends State<MapDelivary> {
  static const double CAMERA_ZOOM = 15;
  static const double CAMERA_TILT = 80;
  static const double CAMERA_BEARING = 30;
  static const LatLng SOURCE_LOCATION = LatLng(24.747932, -110.167889);
  static const LatLng DEST_LOCATION = LatLng(37.335685, -122.0605916);

  final Location location = new Location();

  PermissionStatus _permissionGranted;

  GoogleMapController mapController;

  Set<Marker> _markers = {};
  BitmapDescriptor pinLocationIcon;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    getper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: BackgroundColor,
            appBar: AppBar(
              backgroundColor: AppbarColor,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Text(
                'نەخشە',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              centerTitle: false,
            ),
            drawer: NavegationDrawer(),
            body: Container(
              color: Colors.black12,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  zoom: CAMERA_ZOOM,
                  tilt: CAMERA_TILT,
                  bearing: CAMERA_BEARING,
                  target: SOURCE_LOCATION,),
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                markers: _markers,
                mapType: MapType.hybrid,
              ),
            )),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _markers.add(
          Marker(
              markerId: MarkerId('<12>'),
              position: SOURCE_LOCATION,
              icon: pinLocationIcon
          )
      );
    });
  }

  getper() async {
    if (_permissionGranted != PermissionStatus.GRANTED) {
      PermissionStatus permissionRequestedResult =
      await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
      if (permissionRequestedResult != PermissionStatus.GRANTED) {
        return;
      }
    }
  }

}
