import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicall/footer.dart';
import 'package:maps_launcher/maps_launcher.dart';

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

  //HospitalInfo({required this.hospital});

  @override
  State<HospitalInfo> createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State<HospitalInfo> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = List.generate(2, (index) => false);
    return ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) =>   Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        // bottomSheet: const footer(),
        //right now hardcoding but widget.hospital will be used
        appBar: AppBar(
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title: Text(
            widget.hospital_name,
            style:  TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[

            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xffC4C4C4)),
                ),
              ),
              child: ListTile(
                contentPadding:  REdgeInsets.fromLTRB(40, 60, 0, 15),
                tileColor: const Color(0xffF8F8F8),
                leading: Image.asset(
                  'Assets/phone-68-64.png',
                  height: 20.h,
                ),
                title: Text(
                  widget.hospital_phoneno,
                  style:  TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xffC4C4C4)),
                ),
              ),
              child: ListTile(
                contentPadding:  REdgeInsets.fromLTRB(40, 10, 0, 15),
                tileColor: const Color(0xffF8F8F8),
                leading: Image.asset(
                  'Assets/icons8-sleeping-in-bed-64.png',
                  height: 20.h,
                ),
                title: Text(
                  widget.hospital_beds,
                  style:  TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xffC4C4C4)),
                ),
              ),
              child: ListTile(
                contentPadding:  REdgeInsets.fromLTRB(40, 10, 0, 15),
                tileColor: const Color(0xffF8F8F8),
                leading: Image.asset(
                  'Assets/icons8-map-pin-64.png',
                  height: 20.h,
                ),
                title: Text(
                  widget.hospital_address,
                  style:  TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
             Padding(padding: REdgeInsets.fromLTRB(0, 0, 0, 50)),
            ElevatedButton(
              onPressed: () {
                launchmap(widget.lat, widget.lng);
              },
              child: const Text('Direction'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff353559),
                padding:  REdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle:
                     TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  launchmap(lat, lng) {
    MapsLauncher.launchCoordinates(lat, lng);
  }
}
