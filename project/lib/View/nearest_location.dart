import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/Providers/hospital_provider.dart';

//import 'package:nearest/FindDirection.dart';
import 'dart:math';

import 'package:medicall/View/hospital_info.dart';
import 'package:medicall/View/patient_form.dart';
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
    HospitalProvider hospitalProvider = Provider.of<HospitalProvider>(context);
    return

      ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (BuildContext context) => Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   backgroundColor: const Color(0xFF353559),
          //   centerTitle: true,
          //   title: Text(
          //     'Nearest Hospital',
          //     style: TextStyle(fontSize: 22.sp, color: Colors.white),
          //   ),
          //   actions: const [Logout()],
          // ),
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
               child:  Column(
                    children:  <Widget>[
   HospitalInfo(
    hospital_name: hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].name,
       // context.read<HospitalProvider>().listOfHospitals[context.read<HospitalProvider>().index].name,
    hospital_phoneno:hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].phoneNumber,
       // context.read<HospitalProvider>().listOfHospitals[context.read<HospitalProvider>().index].phoneNumber,
    hospital_address:hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].address,

        //context.read<HospitalProvider>().listOfHospitals[context.read<HospitalProvider>().index].address,
    hospital_beds: hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].beds.toString(),
    // context
    //     .read<HospitalProvider>()
    //     .listOfHospitals[context.read<HospitalProvider>().index]
    //     .beds
    //     .toString(),
    lat: hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].lat,
  //  context.read<HospitalProvider>().listOfHospitals[context.read<HospitalProvider>().index].lat,
    lng: hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].lng
    //context.read<HospitalProvider>().listOfHospitals[context.read<HospitalProvider>().index].lng,
    ),
                Row( children:  <Widget>[
                  ElevatedButton(
                    child: const Text('Direction'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff353559),
                      padding:  REdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 9.h),
                      textStyle:  TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                    ), onPressed: () {
                    hospitalProvider.launchmap(
                        hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].lat,
                        hospitalProvider.listOfHospitals[context.read<HospitalProvider>().index].lat);
                  },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text('Patient Form'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff353559),
                      padding:  REdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 9.h),
                      textStyle:  TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                    ), onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const paraform(),
                      ),
                    );
                  },
                  ),
                ]
                )
              ]
                )
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
