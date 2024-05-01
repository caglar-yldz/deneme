import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/constants/appColors.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.744421, -71.1698939);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 50;
const double PIN_INVISIBLE_POSITION = -420;
const Color main_color = Color.fromRGBO(53, 149, 143, 1);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  late LatLng currentLocation;
  late LatLng destinationLocation;
  double pinPillPosition = PIN_VISIBLE_POSITION;

  @override
  void initState() {
    super.initState();
    this.setInitialLocation();
    this.setSourceAndDestinationMarkerIcons();
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.defaultMarker;

    destinationIcon = await BitmapDescriptor.defaultMarker;
  }

  void showCarsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
          onTap: () {
            setState(() {
              this.pinPillPosition = PIN_INVISIBLE_POSITION;
              print("Kamil");
            });
          }));
      _markers.add(Marker(
        markerId: MarkerId('destinationPin'),
        position: destinationLocation,
        icon: destinationIcon,
        onTap: () {
          setState(() {
            this.pinPillPosition = PIN_VISIBLE_POSITION;
            print("Kamil");
          });
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM, bearing: CAMERA_BEARING, target: SOURCE_LOCATION);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        child: Text("data"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            myLocationButtonEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            markers: _markers,
            mapType: MapType.normal,
            onTap: (LatLng loc) {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share'),
                      ),
                      ListTile(
                        leading: Icon(Icons.copy),
                        title: Text('Copy Link'),
                      ),
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                      ),
                    ],
                  );
                },
              );
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              showCarsOnMap();
            },
          )),
          Positioned(
              top: 75,
              left: 250,
              right: 0,
              child: userConfig(main_color: main_color)),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: this.pinPillPosition,
            child: IconButton(
              icon: Icon(Icons.arrow_drop_up),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share'),
                        ),
                        ListTile(
                          leading: Icon(Icons.copy),
                          title: Text('Copy Link'),
                        ),
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Edit'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class carDetailsCard extends StatelessWidget {
  const carDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;
    return SingleChildScrollView(
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Container(
            width: deviceWidth,
            height: deviceHeight * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: AppColors.renk),
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Image.asset("assets/carr.png"),
                    Image.asset("assets/carr.png"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class userConfig extends StatelessWidget {
  const userConfig({
    super.key,
    required this.main_color,
  });

  final Color main_color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset.zero)
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/icnMap.png'), fit: BoxFit.none),
                  border:
                      Border(bottom: BorderSide(width: 1, color: main_color))),
            ),
          ),
          GestureDetector(
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/icnCompas.png'),
                    fit: BoxFit.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
