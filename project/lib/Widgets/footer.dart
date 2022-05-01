import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/Widgets/logout_dialog_box.dart';
import 'package:medicall/View/patient_list.dart';
import '../View/Login.dart';
import 'package:medicall/View/edit_hospital.dart';

class footer extends StatefulWidget {
  const footer({Key? key}) : super(key: key);

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  Color iconColor = Colors.black;


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
              // TableCell(
              //   child: SizedBox(
              //     height: 60.h,
              //     //  width: 64,
              //     child: Column(
              //       children: <Widget>[
              //         IconButton(
              //           icon: Image.asset(
              //             'Assets/icons8-hospital-3-64.png',
              //             color: iconColor,
              //             height: 25.h,
              //           ),
              //           onPressed: () {
              //             Navigator.pushReplacement(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => const PatientList(),
              //               ),
              //             );
              //             setState(
              //               () {
              //                 iconColor = Colors.pink;
              //               },
              //             );
              //           },
              //         ),
              //         InkWell(
              //           child: Text(
              //             'Patient List',
              //             style: TextStyle(color: iconColor, fontSize: 10.sp),
              //           ),
              //           onTap: () {
              //             iconColor = Colors.pink;
              //             setState(() {});
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const PatientList()));
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PatientList()));
                        },
                      ),
                      InkWell(
                        child: Text(
                          'Patient History',
                          style:
                          TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PatientList()));
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
                          icon: Image.asset('Assets/icons8-hospital-3-64.png',
                            color: iconColor,
                            height: 25.h,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditHospital())
                            );
                          },
                        ),
                        InkWell(
                          child: Text(
                            'Profile',
                            style:
                            TextStyle(color: Colors.black, fontSize: 10.sp),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditHospital())
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