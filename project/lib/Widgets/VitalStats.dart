

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VitalStats extends StatefulWidget {
   String image;
  String heading;
  TextEditingController c;

   VitalStats({Key? key, required this.image,required this.heading, required this.c }) : super(key: key);

  @override
  State<VitalStats> createState() => _VitalStatsState();
}

class _VitalStatsState extends State<VitalStats> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360,800),
      builder: (BuildContext context) =>  Container(
        width: 115.w,
        height: 115.h,
        decoration: BoxDecoration(
          color: const Color(0xfffdab9f).withOpacity(0.3),
          borderRadius: BorderRadius.circular(7.0.r),
          border: Border.all(
            color: const Color(0xfffdab9f).withOpacity(0.5),
            width: 1.w,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding:  REdgeInsets.fromLTRB(1, 6, 1, 8),
              child: Image.asset(
                widget.image,
                height: 30.h,
                width: 30.w,
              ),
            ),
            Padding(
              padding: REdgeInsets.fromLTRB(1, 0, 1, 10),
              child: Text(
                widget.heading,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Color(0xff353559),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding:  REdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                height: 33.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: TextFormField(
                  style:  TextStyle(fontSize: 13.sp),
                  controller: widget.c,
                  decoration: InputDecoration(
                    contentPadding:
                    REdgeInsets.fromLTRB(10, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                          width: 1.w, color: Colors.black),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                      borderSide:BorderSide(width: 1.w, color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
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
