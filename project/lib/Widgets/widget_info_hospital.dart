import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WHospitalInfo extends StatefulWidget {
  String image;
  String detail;

  WHospitalInfo({Key? key, required this.image, required this.detail})
      : super(key: key);

  @override
  State<WHospitalInfo> createState() => _WHospitalInfoState();
}

class _WHospitalInfoState extends State<WHospitalInfo> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffC4C4C4)),
          ),
        ),
        child:

          ListTile(
            contentPadding: REdgeInsets.fromLTRB(30, 1, 0, 1),
            tileColor: const Color(0xffF8F8F8),
            leading: Image.asset(
              widget.image,
              height: 20.h,
            ),
            title: Text(
              widget.detail,
              style: TextStyle(fontSize: 16.sp),
            ),

        ),


      ),
    );
  }
}
