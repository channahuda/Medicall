import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicall/View/RegisterHospital.dart';
import 'PatientList.dart';

class hosplogin extends StatefulWidget {
  const hosplogin({Key? key}) : super(key: key);

  @override
  _hosploginState createState() => _hosploginState();
}

class _hosploginState extends State<hosplogin> {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(360,800),
    builder: (BuildContext context) => GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading:  IconButton(
              icon:  Icon(Icons.close),
              onPressed: (){Navigator.pop(context);}
          ),
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title: Text(
            'Hospital Login',
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
          children: <Widget>[

            SizedBox(
              height: 400.h,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('Assets/Medicall (8).png',
                    width: 400.w, height: 400.h, fit: BoxFit.fill),
              ),
            ),

              SizedBox(
                width: 300.w,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:  EdgeInsets.only(left: 10.0).r,
                    hintText: ("  User ID"),
                  ),
                ),
              ),

            SizedBox(
              height: 10.h,
            ),

              SizedBox(
                width: 300.w,
                height: 50.h,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:  EdgeInsets.only(left: 10.0).r,
                    hintText: ("  Password"),
                  ),
                ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => PatientList()));
            },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff353559),
                  padding: REdgeInsets.symmetric(horizontal: 128.w, vertical: 15.h),
                  textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(10.0.r),
                  )),
            ),
            SizedBox(height: 20.h),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                text: "Don't have your hospital registered?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                  text: ' Sign Up',
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterHospital()));
                    }),
            ]
          )
        ),
            Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
        ),
      ),
    ),
  );
}
