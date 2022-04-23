import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/NearestLocation.dart';
import 'package:medicall/PatientList.dart';
import 'package:medicall/myFlutterIcons.dart';
import 'package:medicall/patientform.dart';
import 'HospitalLists.dart';
import 'Login.dart';
import 'LogoutDialog.dart';

class footer extends StatefulWidget {
  const footer({Key? key}) : super(key: key);

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  Color iconColor = Colors.black;

  late Position position;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
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
      // designSize: const Size(360,800),
      builder: (BuildContext context) => Table(
        border: const TableBorder(top: BorderSide(color: Colors.black)),
        children: <TableRow>[
          TableRow(
            decoration: const BoxDecoration(
              color: Color(0xffF8F8F8),
            ),
            children: <Widget>[
              TableCell(
                child: SizedBox(
                  height: 60.h,
                  //  width: 64,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'Assets/icons8-hospital-3-64.png',
                          //   Icon(
                          // Icons.delete,
                          color: iconColor,
                          height: 25.h,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Hospitals(),
                            ),
                          );
                          setState(
                            () {
                              iconColor = Colors.pink;
                            },
                          );
                        },
                      ),
                      InkWell(
                        child: Text(
                          'Hospital List',
                          style: TextStyle(color: iconColor, fontSize: 10.sp),
                        ),
                        onTap: () {
                          iconColor = Colors.pink;
                          setState(() {});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Hospitals()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: SizedBox(
                  height: 60.h,
                  // width: 64,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'Assets/icons8-form-64.png',
                          height: 25.h,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const paraform()));
                        },
                      ),
                      InkWell(
                        child: Text(
                          'Patient Form',
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const paraform()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: SizedBox(
                    height: 60.h,
                    //  width: 64,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('Assets/icons8-address-64.png',
                              height: 25.h),
                          onPressed: () async {
                            position = await _determinePosition();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MapMultiMarker(position: position)),
                            );
                          },
                        ),
                        InkWell(
                          child: Text(
                            'Nearest Hospital',
                            style:
                                TextStyle(color: Colors.black, fontSize: 10.sp),
                          ),
                          onTap: () async {
                            position = await _determinePosition();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MapMultiMarker(position: position)),
                            );
                          },
                        )
                      ],
                    )),
              ),
              TableCell(
                child: SizedBox(
                  height: 60.h,
                  //width: 64,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'Assets/logout.png',
                          color: Colors.black,
                          height: 25.h,
                        ),
                        onPressed: () {
                          LogoutDialog.showLogoutDialog(context);
                        },
                      ),
                      InkWell(
                        child: Text(
                          'Logout',
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        onTap: () {
                          LogoutDialog.showLogoutDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
