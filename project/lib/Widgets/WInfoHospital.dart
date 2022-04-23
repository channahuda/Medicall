

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WHospitalInfo extends StatefulWidget {
  String image;
  String detail;
   WHospitalInfo({Key? key,required this.image, required this.detail}) : super(key: key);

  @override
  State<WHospitalInfo> createState() => _WHospitalInfoState();
}

class _WHospitalInfoState extends State<WHospitalInfo> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) =>  ListTile(
        contentPadding:  REdgeInsets.fromLTRB(40, 10, 0, 15),
        tileColor: const Color(0xffF8F8F8),
        leading: Image.asset(widget.image,
          height: 20.h,
        ),
        title: Text(widget.detail,
          style:  TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}
