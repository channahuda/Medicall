

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class form extends StatefulWidget {
  final validkey;
  const form({Key? key,required this.validkey}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  TextEditingController hospitalname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController cpw = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController beds = TextEditingController();
  //TextEditingController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) =>
          Form(
            key: widget.validkey,
            child: Column(children: <Widget>[
              SizedBox(height: 15.h),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  inputFile(label: "Hospital Name",obscureText:false, TextEditingController: hospitalname),
                  inputFile(label: "Email",obscureText:false,TextEditingController: email),
                  inputFile(label: "Password",obscureText : true, TextEditingController:pw),
                  inputFileCPassword(label: "Confirm Password", TextEditingController:cpw),
                  inputFile(label: "Address",obscureText:false,TextEditingController:address),
                  inputFile(label: "City",obscureText:false,TextEditingController:city),
                  inputFileNumber(label: "Contact Number",TextEditingController:number,),
                  inputFileNumber(label: "Number of Beds in Hospital",TextEditingController:beds),
                  Text('Mark Location on Map',
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.black),

                  ),
                ]),
        )
      ]),
          ),
    );
  }

  Widget inputFileCPassword({label,TextEditingController}) {
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
          controller: TextEditingController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            if(pw.text != value){
              return 'The specified passwords do not match';
            }
            return null;
          },
          obscureText: true,
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



  Widget inputFileNumber({label, TextEditingController}) {
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
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          controller: TextEditingController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            if(TextEditingController==number && number.text.length != 11) {
              print(number.text);
              return "Invalid Contact Number";
            }

            return null;
          },
          obscureText: false,
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

  Widget inputFile({label,obscureText,TextEditingController}) {
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
        controller: TextEditingController,
        validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
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
