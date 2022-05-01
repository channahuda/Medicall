import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/Providers/hospital_provider.dart';

//import 'package:nearest/FindDirection.dart';
import 'dart:math';

import 'package:medicall/View/hospital_info.dart';
import 'package:medicall/Widgets/hospital_info.dart';
import 'package:provider/provider.dart';

import '../Widgets/logout.dart';

class NearestLocation extends StatefulWidget {
  NearestLocation({Key? key}) : super(key: key);

  @override
  State<NearestLocation> createState() => _NearestLocationState();
}

class _NearestLocationState extends State<NearestLocation> {
  //late Position position;
  final List<Map<String, dynamic>> clityList = [
    // {
    //   "address": "Address",
    //   "id": "1",
    //   "beds": '7',
    //   "lat": 24.938767035031557,
    //   "lng": 67.10441528330101,
    //   "name": "Ziauddin Hospital",
    //   "phone": "7014333352",
    //   "city": "Karachi",
    //   "email": "Zia@gmail.com"
    // },
    // {
    //   "address": "Address",
    //   "id": "2",
    //   "beds": '15',
    //   "lat": 24.932243675062974,
    //   "lng": 67.05164906380271,
    //   "name": "Munawwar Hospital",
    //   "phone": "7014333352",
    //   "city": "Karachi",
    //   "email": "Zia@gmail.com"
    // },
    // {
    //   "address": "Address",
    //   "id": "3",
    //   "beds": '16',
    //   "lat": 28.644800,
    //   "lng": 77.216721,
    //   "name": "Hospital 3",
    //   "phone": "7014333352",
    //   "city": "Karachi",
    //   "email": "Zia@gmail.com"
    // },
    // {
    //   "address": "Address",
    //   "id": "4",
    //   "beds": '16',
    //   "lat": 24.932615608174558,
    //   "lng": 67.11474968682948,
    //   "name": "Hospital 4",
    //   "phone": "7014333352",
    //   "city": "Karachi",
    //   "email": "Zia@gmail.com"
    // },
    // {
    //   "address": "Address",
    //   "id": "5",
    //   "beds": '10',
    //   "lat": 24.93451932622263,
    //   "lng": 67.10215336661044,
    //   "name": "Hospital 4",
    //   "phone": "7014333352",
    //   "city": "Karachi",
    //   "email": "Zia@gmail.com"
    // },
    // {
    //   "address": "Address",
    //   "id": "6",
    //   "beds": '17',
    //   "lat": 24.867062948062657,
    //   "lng": 67.02368465935285,
    //   "name": "AnkleSeria Hospital",
    //   "phone": "7014333352",
    //   "city": "Karachi",
    //   "email": "Zia@gmail.com"
    // },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<HospitalProvider>().getNearestLocation();
  }



  @override
  Widget build(BuildContext context) {
    HospitalProvider hospitalProvider = Provider.of<HospitalProvider>(context);
    return

      ScreenUtilInit(
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
        body: context.read<HospitalProvider>().isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : GoogleMap(
            onMapCreated: context.read<HospitalProvider>().onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(

                  context.read<HospitalProvider>().position.latitude,
                  context.read<HospitalProvider>().position.longitude
                  ),
              zoom: 16,
            ),
            markers:
            context.read<HospitalProvider>().markers.values.toSet(),
            ),
        bottomSheet: Visibility(
       visible:   context.read<HospitalProvider>().markerClicked,
          child: SizedBox(
            height: 300.h,

            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Color(0xffC4C4C4),
            //   ),
            // borderRadius: BorderRadius.circular(15.0),
            //   borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            // ),
            // child: HospitalInfo(
            //   hospital_name: context.read<HospitalProvider>().listOfHospitals[0].name,
            // //  hospitalProvider.listOfHospitals[0].name,
            //       //context.read<HospitalProvider>().listOfHospitals[0].name,
            //   hospital_phoneno: context.read<HospitalProvider>().listOfHospitals[0].phoneNumber,
            //   hospital_address: context.read<HospitalProvider>().listOfHospitals[0].address,
            //   hospital_beds: context.read<HospitalProvider>().listOfHospitals[0].beds.toString(),
            //   lat: context.read<HospitalProvider>().listOfHospitals[0].lat,
            //   lng: context.read<HospitalProvider>().listOfHospitals[0].lng,
            // ),
          ),
        ),
      ),
    );
  }
}
