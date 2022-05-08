import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicall/View/register_hospital.dart';
import 'patient_list.dart';

class hosplogin extends StatefulWidget {
  const hosplogin({Key? key}) : super(key: key);

  @override
  _hosploginState createState() => _hosploginState();
}

class _hosploginState extends State<hosplogin> {
  final _formkey = GlobalKey<FormState>();
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
        child: Form(
        key: _formkey,
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
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: REdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: ("User ID"),
                ),
                validator: (value) {
                  if (value == null) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:  REdgeInsets.fromLTRB(40, 0, 40, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: ("Password"),
                ),
                validator: (value) {
                  if (value == null) {
                    return '';
                  }
                  return null;
                },
              ),
            ),

            ElevatedButton(
              onPressed: (){
           if (_formkey.currentState!.validate()) {
             Navigator.of(context).push(
                 MaterialPageRoute(
                     builder: (context) => PatientList()));
           } else {
             return null;
           }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff353559),
                  padding: REdgeInsets.symmetric(horizontal: 120.w, vertical: 15.h),
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
    ),
  );
}
