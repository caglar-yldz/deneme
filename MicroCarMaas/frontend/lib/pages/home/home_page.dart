import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/constants/text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor carIcon; // Yeni ikonu tanımlayın
  late Position _currentPosition;
  late Position _previousPosition;
  late StreamSubscription<Position> _positionStream;
  double _totalDistance = 0;
  List<Position> locations = <Position>[];

  List<LatLng> polygon2 = const [
    LatLng(40.843185, 30.225253),
    LatLng(40.828119, 30.222506),
    LatLng(40.827340, 30.215983),
    LatLng(40.814349, 30.215983),
    LatLng(40.808373, 30.221133),
    LatLng(40.802136, 30.226969),
    LatLng(40.800057, 30.231776),
    LatLng(40.794079, 30.232806),
    LatLng(40.792000, 30.224909),
    LatLng(40.789400, 30.227312),
    LatLng(40.781342, 30.226283),
    LatLng(40.777962, 30.229716),
    LatLng(40.777442, 30.242075),
    LatLng(40.769382, 30.244822),
    LatLng(40.762622, 30.241732),
    LatLng(40.760021, 30.244479),
    LatLng(40.756380, 30.242419),
    LatLng(40.754820, 30.246195),
    LatLng(40.735832, 30.253405),
    LatLng(40.732970, 30.333399),
    LatLng(40.728808, 30.333743),
    LatLng(40.726726, 30.347475),
    LatLng(40.730889, 30.348849),
    LatLng(40.732710, 30.370135),
    LatLng(40.735312, 30.369105),
    LatLng(40.735312, 30.374598),
    LatLng(40.743636, 30.373911),
    LatLng(40.747798, 30.377001),
    LatLng(40.753780, 30.375971),
    LatLng(40.756120, 30.367388),
    LatLng(40.758201, 30.368418),
    LatLng(40.757681, 30.375628),
    LatLng(40.766782, 30.379061),
    LatLng(40.768862, 30.383868),
    LatLng(40.774322, 30.382838),
    LatLng(40.780042, 30.376315),
    LatLng(40.835393, 30.343012),
    LatLng(40.834191, 30.338195),
    LatLng(40.830742, 30.336224),
    LatLng(40.831288, 30.335141),
    LatLng(40.830523, 30.334131),
    LatLng(40.830469, 30.332615),
    LatLng(40.827465, 30.329800),
    LatLng(40.822003, 30.329295),
    LatLng(40.822003, 30.325325),
    LatLng(40.819545, 30.318397),
    LatLng(40.819327, 30.311757),
    LatLng(40.814848, 30.302230),
    LatLng(40.817142, 30.302230),
    LatLng(40.817688, 30.297683),
    LatLng(40.817033, 30.295734),
    LatLng(40.817361, 30.294290),
    LatLng(40.816596, 30.290826),
    LatLng(40.827192, 30.329223),
    LatLng(40.814684, 30.283681),
    LatLng(40.815449, 30.281515),
    LatLng(40.802880, 30.276731),
    LatLng(40.803653, 30.274537),
    LatLng(40.811919, 30.274492),
    LatLng(40.811919, 30.275410),
    LatLng(40.813541, 30.273675),
    LatLng(40.812768, 30.271429),
    LatLng(40.818408, 30.265816),
    LatLng(40.816708, 30.266224),
    LatLng(40.816090, 30.264999),
    LatLng(40.814082, 30.265713),
    LatLng(40.812150, 30.265101),
    LatLng(40.810992, 30.267142),
    LatLng(40.806665, 30.252138),
    LatLng(40.810374, 30.245912),
    LatLng(40.819875, 30.252444),
    LatLng(40.842813, 30.249484),
    LatLng(40.843185, 30.225253),
  ];
  // Bu metot, kullanıcının mevcut konumunu alır.
  Future<Position> getUserCurrentLocation() async {
    // Kullanıcı iznini isteyin ve mevcut konumu alın.
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return pos;
  }

  Future _calculateDistance() async {
    _positionStream = Geolocator.getPositionStream(
            locationSettings: AndroidSettings(
                distanceFilter: 10, accuracy: LocationAccuracy.high))
        .listen((Position position) async {
      if ((await Geolocator.isLocationServiceEnabled())) {
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .then((Position position) {
          setState(() {
            _currentPosition = position;
            locations.add(_currentPosition);

            if (locations.length > 1) {
              _previousPosition = locations.elementAt(locations.length - 2);

              var _distanceBetweenLastTwoLocations = Geolocator.distanceBetween(
                _previousPosition.latitude,
                _previousPosition.longitude,
                _currentPosition.latitude,
                _currentPosition.longitude,
              );
              _totalDistance += _distanceBetweenLastTwoLocations;
              print('Total Distance: $_totalDistance');
            }
          });
        }).catchError((err) {
          print(err);
        });
      } else {
        print("Error");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Yeni ikonu yükleyin
    setCustomMarker();
    _calculateDistance();
  }

  void setCustomMarker() async {
    carIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(24, 24)),
      'assets/icnCar2.png', // Kullanmak istediğiniz ikonun dosya yolu
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getUserCurrentLocation(),
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.hasData) {
              // Mevcut konumu kullanarak kamerayı ayarla.
              return GoogleMap(
                padding: EdgeInsets.only(top: 50),
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                  zoom: 14.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("1"),
                    icon: carIcon,
                    position: LatLng(40.7501, 30.3525),
                    infoWindow: InfoWindow(
                      title: 'Car 1',
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        barrierColor: Colors.grey.withOpacity(0.5),
                        backgroundColor: Color.fromRGBO(53, 149, 143, 1),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            child: bottomScreen(),
                          );
                        },
                      );
                    },
                  ),
                },
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: true,
                polygons: {
                  Polygon(
                      polygonId: PolygonId("1"),
                      points: polygon2,
                      fillColor:
                          Color.fromRGBO(53, 158, 152, 1).withOpacity(0.3),
                      strokeWidth: 2,
                      strokeColor:
                          Color.fromRGBO(53, 158, 152, 1).withOpacity(0.6))
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            } else {
              return Center(
                child: Container(
                  child: Text("Yükleniyor"),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Stack bottomScreen() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/Base.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, top: 15),
          child: Text(
            "Citroen Ami",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/chargeIcon.png"),
                          Text(battery, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("₺${price}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(" dakika",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black38)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        height: 55,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 11,
                                backgroundColor:
                                    Color.fromRGBO(53, 149, 143, 1)),
                            onPressed: () async {},
                            child: const Text(
                              "Sürüşe Başla",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: Image.asset(
            "assets/turuncu.png",
          ),
        ),
      ],
    );
  }
}
