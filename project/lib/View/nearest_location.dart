import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/Providers/hospital_location_provider.dart';

//import 'package:nearest/FindDirection.dart';
import 'dart:math';

import 'package:medicall/View/patient_form.dart';
import 'package:medicall/Widgets/hospital_info_modal_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../Model/hospital_model.dart';
import '../Widgets/logout.dart';

class NearestLocation extends StatefulWidget {
  NearestLocation({Key? key}) : super(key: key);

  @override
  State<NearestLocation> createState() => _NearestLocationState();
}

class _NearestLocationState extends State<NearestLocation> {
  late HospitalLocationProvider hospitalProvider;

  // Future<HospitalLocationProvider> hospitalProvider = Provider.of<HospitalLocationProvider>(context) as Future<HospitalLocationProvider>;
  // late Future<List<HospitalModel>> hospitals;

  @override
  void initState() {
    //loadProvider();
    //context.read<HospitalLocationProvider>().loadHospitalsList();
    // TODO: implement initState
    super.initState();
    //loadProvider();
    //context.read<HospitalLocationProvider>().loadHospitalsList();
  }

  void loadProvider() {
    hospitalProvider = Provider.of<HospitalLocationProvider>(context);
    //hospitals = hospitalProvider.listOfHospitals;
  }

  @override
  Widget build(BuildContext context) {
    loadProvider();
    hospitalProvider.setContext(context);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) => Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.transparent,
        //   //centerTitle: true,
        //   // title: Text(
        //   //   'Nearest Hospital',
        //   //   style: TextStyle(fontSize: 22.sp, color: Colors.white),
        //   // ),
        //   actions: const [Logout()],
        //),
        body: hospitalProvider.isLoading || hospitalProvider.isLoadingHospitals
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GoogleMap(
                    onMapCreated: hospitalProvider.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        hospitalProvider.position.latitude,
                        hospitalProvider.position.longitude,
                      ),
                      zoom: 16,
                    ),
                    markers: hospitalProvider.markers.values.toSet(),
                  ),
                  Positioned(
                    top: 30.h,
                    right: 10.w,
                    child: CircleAvatar(
                      child: Logout(),
                      backgroundColor: Color(0xff353559),
                      radius: 20.r,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
