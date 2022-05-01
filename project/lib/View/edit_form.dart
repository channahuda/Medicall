import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController beds = TextEditingController();

  @override
  void initState() {
    super.initState();
    username = TextEditingController(text: "Munawar Hospital");
    password = TextEditingController(text: 'Initial value');
    email = TextEditingController(text: "mun@gmail.com");
    address = TextEditingController(text:  "karachi");
    city = TextEditingController(text:  "karachi");
    contact = TextEditingController(text: "I12345");
    beds = TextEditingController(text: "6");


  }
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
                inputFile(label: "Username", cont: username),
                inputFile(label: "Email", cont: email),
                inputFile(label: "Password", obscureText: true, cont: password),
                inputFile(label: "Confirm Password", obscureText: true, cont: password),
                inputFile(label: "Address", cont: address),
                inputFile(label: "City", cont: city),
                inputFile(label: "Contact Number", cont: contact),
                inputFile(label: "Number of Beds in Hospital", cont: beds),
                Text('Mark Location on Map',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.black),

                ),
              ]),
        )
      ]),
    );
  }
  Widget inputFile({label, obscureText = false, cont}) {
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
          //initialValue: initval,
          controller: cont,
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