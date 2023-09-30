import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? mapController;
  late LatLng _currentPosition = const LatLng(28.6139, 77.2090);
  BitmapDescriptor greyMarkerIcon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
  BitmapDescriptor redMarkerIcon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadLastKnownLocation();
    _getCurrentLocation();
  }

  _loadLastKnownLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? savedLatitude = prefs.getDouble('lastLatitude');
    double? savedLongitude = prefs.getDouble('lastLongitude');

    if (savedLatitude != null && savedLongitude != null) {
      setState(() {
        _currentPosition = LatLng(savedLatitude, savedLongitude);
      });
      _updateMarkerIcon(greyMarkerIcon);
    }
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('lastLatitude', position.latitude);
    prefs.setDouble('lastLongitude', position.longitude);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
    _updateMarkerIcon(redMarkerIcon);

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPosition, zoom: 15.0),
      ),
    );
  }

  void _updateMarkerIcon(BitmapDescriptor icon) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: _currentPosition,
          infoWindow: const InfoWindow(title: 'Your Location'),
          icon: icon,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 15.0,
        ),
        markers: _markers,
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
