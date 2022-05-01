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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<HospitalProvider>().getNearestLocation();
  }

  @override
  Widget build(BuildContext context) {
    HospitalProvider hospitalProvider = context.read<HospitalProvider>();
    //Provider.of<HospitalProvider>(context);
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
        body: context.read<HospitalProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                onMapCreated: context.read<HospitalProvider>().onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      context.read<HospitalProvider>().position.latitude,
                      context.read<HospitalProvider>().position.longitude),
                  zoom: 16,
                ),
                markers:
                    context.read<HospitalProvider>().markers.values.toSet(),
              ),
        bottomSheet: Visibility(
          visible: context.read<HospitalProvider>().markerClicked,
          child: SizedBox(
            height: 300.h,

            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Color(0xffC4C4C4),
            //   ),
            // borderRadius: BorderRadius.circular(15.0),
            //   borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            // ),
            child: HospitalInfo(
                hospital_name: hospitalProvider
                    .listOfHospitals[hospitalProvider.index].name,
                hospital_phoneno: hospitalProvider
                    .listOfHospitals[hospitalProvider.index].phoneNumber,
                hospital_address: hospitalProvider
                    .listOfHospitals[hospitalProvider.index].address,
                hospital_beds: hospitalProvider
                    .listOfHospitals[hospitalProvider.index].beds
                    .toString(),
                lat: hospitalProvider
                    .listOfHospitals[hospitalProvider.index].lat,
                lng:
                    hospitalProvider.listOfHospitals[hospitalProvider.index].lng
                //  hospitalProvider.listOfHospitals[0].name,
                // hospital_name:
                //     context.read<HospitalProvider>().hospitalSelected.name,
                // hospital_phoneno:
                //     context.read<HospitalProvider>().hospitalSelected.phoneNumber,
                // hospital_address:
                //     context.read<HospitalProvider>().hospitalSelected.address,
                // hospital_beds: context
                //     .read<HospitalProvider>()
                //     .hospitalSelected
                //     .beds
                //     .toString(),
                // lat: context.read<HospitalProvider>().hospitalSelected.lat,
                // lng: context.read<HospitalProvider>().hospitalSelected.lng,
                ),
          ),
        ),
      ),
    );
  }
}
