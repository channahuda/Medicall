import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxtFormField extends StatefulWidget {
  int lines;
  int width;
  TextEditingController c;
   TxtFormField({Key? key, required this.width, required this.c , required this.lines}) : super(key: key);

  @override
  State<TxtFormField> createState() => _TxtFormFieldState();
}

class _TxtFormFieldState extends State<TxtFormField> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) => SizedBox(
        // height: 40.h,
        width: widget.width.w,
        child: TextFormField(
          maxLines:widget.lines,
          style:  TextStyle(fontSize: 16.sp),
          controller: widget.c,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(width: 1.w, color: Colors.black),
              borderRadius: BorderRadius.circular(7.r),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.black),
            ),
            contentPadding:  REdgeInsets.fromLTRB(10, 0, 0, 0),
          ),

        ),
      ),
    );
  }
}
