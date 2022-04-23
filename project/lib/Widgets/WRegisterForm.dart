

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) => Column(children: <Widget>[
        SizedBox(height: 15.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                inputFile(label: "Username"),
                inputFile(label: "Email"),
                inputFile(label: "Password", obscureText: true),
                inputFile(label: "Confirm Password", obscureText: true),
                inputFile(label: "Address"),
                inputFile(label: "City"),
                inputFile(label: "Contact Number"),
                inputFile(label: "Number of Beds in Hospital"),
                Text('Mark Location on Map',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.black),

                ),
              ]),
        )
      ]),
    );
  }
  Widget inputFile({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: REdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
            enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.black26)),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.black45)),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
