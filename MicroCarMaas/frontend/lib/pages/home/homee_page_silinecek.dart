import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeePagee extends StatefulWidget {
  const HomeePagee({super.key});

  @override
  State<HomeePagee> createState() => _HomeePageeState();
}

class _HomeePageeState extends State<HomeePagee> {
  Location _locationController = new Location();
  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        child: Text("data"),
      ),
      body: _currentP == null
          ? Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pGooglePlex,
                zoom: 10,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("aaa"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP!,
                  onTap: () {},
                ),
                Marker(
                  markerId: MarkerId("_destinationLocation"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta),
                  position: _pApplePark,
                  onTap: () {},
                ),
                Marker(
                  markerId: MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: _currentP!,
                  onTap: () {},
                ),
              },
            ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print("_currentP");
          print(_currentP);
        });
      }
    });
  }
}
