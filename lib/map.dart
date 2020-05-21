import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'drawer_nav.dart';

class Maps extends StatefulWidget {
  final _user;

  Maps(this._user);

  @override
  _MapsState createState() => _MapsState(_user);
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final _user;

  _MapsState(this._user);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: AppDrawer(_user),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
      ),
    );
  }
}
