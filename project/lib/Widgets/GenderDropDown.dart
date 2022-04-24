

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  List<String> gender = ['Male', 'Female',];
  String dropdownValue='Male';
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
     // designSize: const Size(360,800),
      builder: (BuildContext context) =>   Container(
        decoration: BoxDecoration(
          color: const Color(0xfffdab9f).withOpacity(0.02),
          borderRadius: BorderRadius.circular(7.0.r),
          border: Border.all(
            color: Colors.black,
            width: 1.w,
          ),
        ),
        height: 40.h,
        width: 175.w,
        child: Padding(padding: EdgeInsets.only(left: 10).r,
          child: DropdownButton(
            value: dropdownValue,
            hint: SizedBox(width: 135.w,),
            icon: Icon(Icons.arrow_drop_down, color: Color(0xff353559),),
            //elevation: 200,

            style:  TextStyle(color: Color(0xff353559), fontSize: 16.sp),

            items: gender.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }
}
