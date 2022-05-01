import 'package:flutter/material.dart';
import 'package:medicall/Widgets/gender_drop_down.dart';
import 'package:medicall/Widgets/text_form_field.dart';
import 'package:medicall/Widgets/vital_stats.dart';
import 'package:medicall/Widgets/drop_down.dart';
import 'package:medicall/Widgets/headings.dart';

import '../Widgets/footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class paraform extends StatefulWidget {
  const paraform({Key? key}) : super(key: key);

  @override
  _paraformState createState() => _paraformState();
}

class _paraformState extends State<paraform> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController bp = TextEditingController();
  TextEditingController oxygen = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController symptom = TextEditingController();
  TextEditingController treatment = TextEditingController();
  TextEditingController gender = TextEditingController();

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) => GestureDetector(

           onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
        //  bottomSheet: const footer(),
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xffF8F8F8),
          appBar: AppBar(
            backgroundColor: const Color(0xFF353559),
            centerTitle: true,
            title:  Text(
              'Patient Form',
              style: TextStyle(fontSize: 22.sp, color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
              key: _formkey,
              
              //reverse: true,
             child: Column(
               children: <Widget>[
                 Padding(
                   padding: REdgeInsets.fromLTRB(0, 20, 250, 10),
                   child: headings(text:"Patient Name"),

                 ),
                 Padding(
                   padding: REdgeInsets.fromLTRB(10, 0, 10, 5),
                   child: TxtFormField(lines: 1,width: 400,c: name),
                   //EMERGENCY TREATMENT
                 ),
                 Padding(
                   padding:  REdgeInsets.fromLTRB(2, 10, 10, 10),
                   child: Row(
                     children:  <Widget>[
                       const Spacer(
                         flex: 1,
                       ),
                       headings(text:'Gender'),
                       const Spacer(
                         flex: 11,
                       ),
                       headings(text:'Age'),
                       const Spacer(
                         flex: 10,
                       ),
                     ],
                   ),
                 ),
                 Row(
                   children: <Widget>[
                  //FOR NAME
                     Padding(
                         padding:  REdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Gender()
                       //TxtFormField(lines:1, width:175,c: gender),
                     ),

                // FOR AGE
                     Padding(
                       padding:  REdgeInsets.fromLTRB(4, 0, 5, 10),
                        child:TxtFormField(lines:1,width:150,c: age),

                     ),
                   ],
                 ),

                 Padding(
                   padding: REdgeInsets.fromLTRB(2, 10, 235, 10),
                   child: headings(text:'Emergency Type')

                 ),
                 Padding(
                   padding:  REdgeInsets.fromLTRB(10, 0, 10, 15),
                   child: SizedBox(
                     height: 45.h,
                     width: 400.w,
                     child: dropdown(),
                   ),
                 ),
                 //VITAL STATS
                 Padding(
                    padding: REdgeInsets.fromLTRB(0, 10, 255, 10),
                     child:
                     headings(text:'Vital Statistics'),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     const Spacer(),
                     VitalStats(image: 'Assets/blood.png',heading:  'Blood Pressure',c: bp),

                     const Spacer(),
                     VitalStats(image: 'Assets/oxygen.png',heading:  'Oxygen Level',c: oxygen),

                     const Spacer(),
                     VitalStats(image: 'Assets/heart.png',heading:  'Heart Rate',c: rate),
                     const Spacer(),
                   ],
                 ),
                 //PATIENT SYMPTOMS
                 Padding(
                   padding: REdgeInsets.fromLTRB(0, 10, 200, 10),
                   child: headings(text:"Patient's Symptoms"),

                 ),
                 Padding(
                   padding: REdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TxtFormField(lines: 1,width: 400,c: symptom),
                 //EMERGENCY TREATMENT
                 ),
                 Padding(
                   padding: REdgeInsets.fromLTRB(0, 10, 137, 10),
                   child: headings(text: "Emergency Treatment Given")
                 ),
                 Padding(
                   padding:  REdgeInsets.fromLTRB(10, 0, 10, 25),
                   child: TxtFormField(lines:4, width:400,c: treatment),

                 ),
                 Padding(
                  padding: REdgeInsets.fromLTRB(40, 0, 40, 85),

                   child: ElevatedButton(
                     onPressed: () {
                       if (_formkey.currentState!.validate()) {
                         showDialog<String>(
                           context: context,
                           builder: (BuildContext context) =>  AlertDialog(
                             contentPadding: REdgeInsets.fromLTRB(50, 30, 50, 30),
                             content: Text(
                               'Form Has Been Submitted',
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 fontWeight: FontWeight.w600,
                               ),
                             ),
                           ),
                         );
                         name.clear();
                         age.clear();
                         type.clear();
                         bp.clear();
                         oxygen.clear();
                         rate.clear();
                         symptom.clear();
                         treatment.clear();
                         //Navigator.pop(context);
                       } else {
                         return null;
                       }
                     },
                     child: const Text('Submit'),
                     style: ElevatedButton.styleFrom(
                       primary: const Color(0xff353559),
                       padding:  REdgeInsets.symmetric(
                           horizontal: 80.w, vertical: 9.h),
                       textStyle:  TextStyle(
                           fontSize: 20.sp, fontWeight: FontWeight.w500),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0.r),
                       ),
                     ),
                   ),
                 ),
                ],
             ),
            ),

        ),
      )
      );

 }
