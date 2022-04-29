import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:nearest/FindDirection.dart';
import 'dart:math';

import 'package:medicall/View/hospital_info.dart';
import 'package:medicall/Widgets/hospital_info.dart';

import '../Widgets/logout.dart';

class NearestLocation extends StatefulWidget {
  NearestLocation({Key? key}) : super(key: key);

  @override
  State<NearestLocation> createState() => _NearestLocationState();
}

class _NearestLocationState extends State<NearestLocation> {
  late Position position;
  final List<Map<String, dynamic>> clityList = [
    {
      "address": "Address",
      "id": "1",
      "beds": '7',
      "lat": 24.938767035031557,
      "lng": 67.10441528330101,
      "name": "Ziauddin Hospital",
      "phone": "7014333352",
      "city": "Karachi",
      "email": "Zia@gmail.com"
    },
    {
      "address": "Address",
      "id": "2",
      "beds": '15',
      "lat": 24.932243675062974,
      "lng": 67.05164906380271,
      "name": "Munawwar Hospital",
      "phone": "7014333352",
      "city": "Karachi",
      "email": "Zia@gmail.com"
    },
    {
      "address": "Address",
      "id": "3",
      "beds": '16',
      "lat": 28.644800,
      "lng": 77.216721,
      "name": "Hospital 3",
      "phone": "7014333352",
      "city": "Karachi",
      "email": "Zia@gmail.com"
    },
    {
      "address": "Address",
      "id": "4",
      "beds": '16',
      "lat": 24.932615608174558,
      "lng": 67.11474968682948,
      "name": "Hospital 4",
      "phone": "7014333352",
      "city": "Karachi",
      "email": "Zia@gmail.com"
    },
    {
      "address": "Address",
      "id": "5",
      "beds": '10',
      "lat": 24.93451932622263,
      "lng": 67.10215336661044,
      "name": "Hospital 4",
      "phone": "7014333352",
      "city": "Karachi",
      "email": "Zia@gmail.com"
    },
    {
      "address": "Address",
      "id": "6",
      "beds": '17',
      "lat": 24.867062948062657,
      "lng": 67.02368465935285,
      "name": "AnkleSeria Hospital",
      "phone": "7014333352",
      "city": "Karachi",
      "email": "Zia@gmail.com"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNearestLocation();
  }

  final Map<String, Marker> _markers = {};

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();

    setState(() {
      for (int i = 0; i < clityList.length; i++) {
        double distance = calculateDistance(position.latitude,
            position.longitude, clityList[i]['lat'], clityList[i]['lng']);
        if (distance <= 3) {
          print("For Loop");
          final marker = Marker(
            markerId: MarkerId(clityList[i]['name']),
            position: LatLng(clityList[i]['lat'], clityList[i]['lng']),
            infoWindow: InfoWindow(
                title: clityList[i]['name'],
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => HospitalInfo(
                  //               hospital_name: clityList[i]['name'],
                  //               hospital_phoneno: clityList[i]['phone'],
                  //               hospital_address: clityList[i]['address'],
                  //               hospital_beds: clityList[i]['beds'],
                  //               lat: clityList[i]['lat'],
                  //               lng: clityList[i]['lng'],
                  //             )));
                  //
                  // print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
                }),
            onTap: () {
              print("Clicked on marker");
            },
          );

          print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
          _markers[clityList[i]['name']] = marker;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) => Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title: Text(
            'Nearest Hospital',
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
          actions: const [Logout()],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            //LatLng(clityList[0]['lat'], clityList[0]['lng']),
            zoom: 16,
          ),
          markers: _markers.values.toSet(),
        ),
        bottomSheet: SizedBox(
          height: 300.h,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Color(0xffC4C4C4),
          //   ),
          //borderRadius: BorderRadius.circular(15.0),
          //   borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          // ),
          child: HospitalInfo(
            hospital_name: clityList[0]['name'],
            hospital_phoneno: clityList[0]['phone'],
            hospital_address: clityList[0]['address'],
            hospital_beds: clityList[0]['beds'],
            lat: clityList[0]['lat'],
            lng: clityList[0]['lng'],
          ),
        ),
      ),
    );
  }

  void getNearestLocation() async {
    position = await _determinePosition();
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
