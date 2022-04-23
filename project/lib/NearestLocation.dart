import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:nearest/FindDirection.dart';
import 'dart:math';

import 'package:medicall/HospitalInfo.dart';

class MapMultiMarker extends StatefulWidget {
  Position position;

  MapMultiMarker({Key? key, required this.position}) : super(key: key);

  @override
  State<MapMultiMarker> createState() => _MapMultiMarkerState();
}

class _MapMultiMarkerState extends State<MapMultiMarker> {
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
        double distance = calculateDistance(
            widget.position.latitude,
            widget.position.longitude,
            clityList[i]['lat'],
            clityList[i]['lng']);
        if (distance <= 3) {
          print("For Loop");
          final marker = Marker(
            markerId: MarkerId(clityList[i]['name']),
            position: LatLng(clityList[i]['lat'], clityList[i]['lng']),
            infoWindow: InfoWindow(
                title: clityList[i]['name'],
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalInfo(
                                hospital_name: clityList[i]['name'],
                                hospital_phoneno: clityList[i]['phone'],
                                hospital_address: clityList[i]['address'],
                                hospital_beds: clityList[i]['beds'],
                                lat: clityList[i]['lat'],
                                lng: clityList[i]['lng'],
                              )));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>  FindDirection(
                  //   origin: LatLng(widget.position.latitude,widget.position.longitude),
                  //   //originlng: widget.position.longitude as LatLng,
                  //   dest:  LatLng(clityList[i]['lat'],clityList[i]['lng']),
                  //   //  marker_dest: clityList[i] as Marker
                  //
                  // ),
                  // )
                  // );
                  print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
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
      designSize: const Size(360,800),
      builder: (BuildContext context) =>   Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title:  Text(
            'Nearest Hospital',
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.position.latitude, widget.position.longitude),
            //LatLng(clityList[0]['lat'], clityList[0]['lng']),
            zoom: 16,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
