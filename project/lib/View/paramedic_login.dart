import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicall/View/home_page.dart';
import 'package:medicall/View/nearest_location.dart';

class Paralogin extends StatefulWidget {
  const Paralogin({Key? key}) : super(key: key);

  @override
  _ParaloginState createState() => _ParaloginState();
}

class _ParaloginState extends State<Paralogin> {
  final formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
  designSize: const Size(360,800),
  builder: (BuildContext context) => GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: const Color(0xFF353559),
        centerTitle: true,
        title:  Text(
          'Paramedic Login',
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
      child: Form(
      key: formkey,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'Assets/Medicall (8).png',
                width: 400.w,
                height: 400.h,
              ),
            ),
            Padding(
              padding:  REdgeInsets.fromLTRB(40, 0, 40, 10),
              child: TextFormField(
                controller: name,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: REdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: ("User ID"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:  REdgeInsets.fromLTRB(40, 0, 40, 10),
              child: TextFormField(
                controller : pass,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: ("Password"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
         onPressed: (){
              if (formkey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NearestLocation(),
                  ),
                ); } else {
                return null;
              }
         },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff353559),
                  padding:  REdgeInsets.symmetric(
                      horizontal: 120.w, vertical: 15.h),
                  textStyle:  TextStyle(
                      fontSize: 20.sp, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                )
              ],
            ),
        ),
      ),
      ),
  )
    );
  //);
}