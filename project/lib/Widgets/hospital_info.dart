import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'widget_info_hospital.dart';

class HospitalInfo extends StatefulWidget {
  final String hospital_name;
  final String hospital_phoneno;
  final String hospital_beds;
  final String hospital_address;
  final double lat;
  final double lng;

  const HospitalInfo(
      {Key? key,
      required this.hospital_name,
      required this.hospital_phoneno,
      required this.hospital_beds,
      required this.hospital_address,
      required this.lat,
      required this.lng})
      : super(key: key);

  @override
  State<HospitalInfo> createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State<HospitalInfo> {
  @override
  Widget build(BuildContext context) {
    //List<bool> isSelected = List.generate(2, (index) => false);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) =>
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(30.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(5.0),
          //       child: Container(
          //         height: 100.0,
          //         margin: const EdgeInsets.only(top: 6.0),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey,
          //               offset: Offset(0.0, 1.0), //(x,y)
          //               blurRadius: 5.0,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
        height: 30.h,
        //  color: const Color(0xffF8F8F8),
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     offset: Offset(0.0, 0.0), //(x,y)
          //     blurRadius: 5.0,
          //   ),
          // ],
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0xff000000).withOpacity(0.25),
          //     offset: Offset(
          //       4.0,
          //       4.0,
          //     ),
          //     blurRadius: 20.0,
          //     spreadRadius: 0.0,
          //   ),
          // ],
          border: Border(
            top: BorderSide(
              color: Color(0xffC4C4C4),
              width: 2.w,
            ),
          ),
          // Border.all(
          //   color: Color(0xffC4C4C4),
        ),
        //borderRadius: BorderRadius.circular(15.0),
        // borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),

        child: Column(
          children: <Widget>[
            Padding(
              padding: REdgeInsets.fromLTRB(0, 10, 0, 8),
              child: Text(
                widget.hospital_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff353559),
                    fontSize: 22.sp),
              ),
            ),
            WHospitalInfo(
                image: 'Assets/phone-68-64.png',
                detail: widget.hospital_phoneno),
            WHospitalInfo(
                image: 'Assets/icons8-sleeping-in-bed-64.png',
                detail: widget.hospital_beds),
            WHospitalInfo(
                image: 'Assets/icons8-map-pin-64.png',
                detail: widget.hospital_address),
            Padding(
              padding: REdgeInsets.fromLTRB(0, 0, 0, 25),
            ),
            Row(

            ),
            // ElevatedButton(
            //   onPressed: () {
            //     launchmap(widget.lat, widget.lng);
            //   },
            //   child: const Text('Direction'),
            //   style: ElevatedButton.styleFrom(
            //     primary: const Color(0xff353559),
            //     padding: REdgeInsets.symmetric(horizontal: 80.w, vertical: 9.h),
            //     textStyle:
            //         TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0.r),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  launchmap(lat, lng) {
    MapsLauncher.launchCoordinates(lat, lng);
  }
}
