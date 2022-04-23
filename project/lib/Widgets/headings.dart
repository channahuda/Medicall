


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class headings extends StatefulWidget {
  String text;
   headings({Key? key, required this.text}) : super(key: key);

  @override
  State<headings> createState() => _headingsState();
}

class _headingsState extends State<headings> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) =>  Text(
        widget.text,
        style: TextStyle(
          fontSize: 16.sp,
          color: Color(0xff353559),
          fontWeight: FontWeight.w600,
        ),
    ),
      );
  }
}
