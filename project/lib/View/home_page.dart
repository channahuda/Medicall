import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/Entities/wave_clipper.dart';
import 'package:medicall/View/nearest_location.dart';
import 'package:medicall/View/patient_form.dart';
import 'hospital_lists.dart';
import '../Entities/logout_dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Position position;

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
            'Medicall',
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
          actions: <Widget>[
            Stack(
              children: [
                IconButton(
                  icon: Image.asset(
                    'Assets/logout.png',
                    height: 30.h,
                  ),
                  onPressed: () {
                    LogoutDialog.showLogoutDialog(context);
                  },
                ),
                Positioned(
                  bottom: 5.h,
                  child: InkWell(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                    onTap: () {
                      LogoutDialog.showLogoutDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: //const Color(0xffFEF3F4),
                        Color(0xffF18793),
                    height: 200.h,
                  ),
                ),
                Positioned(
                  //bottom: 60.0,
                  top: 30.h,
                  left: 40.w,
                  child: Image.asset(
                    'Assets/ambulance.png',
                    height: 230.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
              overflow: Overflow.visible,
            ),
            Padding(
              padding: REdgeInsets.fromLTRB(25, 100, 25, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0.r),
                  color: const Color(0xffFEF3F4),
                  //Color(0xffF18793).withOpacity(0.20),
                  border: Border.all(
                      color: const Color(0xffF18793).withOpacity(0.5)),
                ),
                child: ListTile(
                  title: Text(
                    'Hospital List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,

                      fontWeight: FontWeight.w600,
                      color: Color(0xff353559),
                      //color: Colors.black,
                    ),
                  ),
                  leading: Image.asset(
                    'Assets/icons8-hospital-3-64.png',
                    color: const Color(0xff353559),
                    height: 35.h,
                  ),
                  contentPadding: REdgeInsets.fromLTRB(20, 7.5, 0, 7.5),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Hospitals(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0.r),
                  color: const Color(0xffFEF3F4),
                  border: Border.all(
                    color: const Color(0xffF18793).withOpacity(0.5),
                  ),
                ),
                child: ListTile(
                  onTap: () async {
                    position = await _determinePosition();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearestLocation(),
                      ),
                    );
                  },
                  title: Text(
                    'Nearest Hospitals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff353559),
                    ),
                  ),
                  leading: Image.asset(
                    'Assets/icons8-address-64.png',
                    height: 35.h,
                    color: const Color(0xff353559),
                  ),
                  contentPadding: REdgeInsets.fromLTRB(20, 7.5, 0, 7.5),
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0.r),
                  color: const Color(0xffFEF3F4),
                  border: Border.all(
                    color: const Color(0xffF18793).withOpacity(0.5),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Patient Form',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff353559),
                    ),
                  ),
                  leading: Image.asset(
                    'Assets/icons8-form-64.png',
                    color: const Color(0xff353559),
                    height: 35.h,
                  ),
                  contentPadding: REdgeInsets.fromLTRB(20, 7.5, 0, 7.5),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const paraform(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


