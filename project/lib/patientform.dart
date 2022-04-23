import 'package:flutter/material.dart';
import 'package:medicall/dropdown.dart';
import 'form.dart';
import 'footer.dart';
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

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) => GestureDetector(

           onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
          bottomSheet: const footer(),
         // resizeToAvoidBottomInset: false,
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
                   padding:  REdgeInsets.fromLTRB(2, 20, 10, 10),
                   child: Row(
                     children:  <Widget>[
                       const Spacer(
                         flex: 1,
                       ),
                       headings('Patient Name'),
                       const Spacer(
                         flex: 7,
                       ),
                       headings('Age'),
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
                         padding:  REdgeInsets.fromLTRB(10, 0, 10, 15),
                       child: TxtField(1, 175, name),
                     ),

                // FOR AGE
                     Padding(
                       padding:  REdgeInsets.fromLTRB(4, 0, 5, 15),
                        child:TxtField(1,150, age),

                     ),
                   ],
                 ),

                 Padding(
                   padding: REdgeInsets.fromLTRB(2, 10, 235, 10),
                   child: headings('Emergency Type')

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
                     headings('Vital Statistics'),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     const Spacer(),
                     VitalStat('Assets/blood.png', 'Blood Pressure', bp),

                     const Spacer(),
                     VitalStat('Assets/oxygen.png', 'Oxygen Level', oxygen),

                     const Spacer(),
                     VitalStat('Assets/heart.png', 'Heart Rate', rate),
                     const Spacer(),
                   ],
                 ),
                 //PATIENT SYMPTOMS
                 Padding(
                   padding: REdgeInsets.fromLTRB(0, 10, 200, 10),
                   child: headings("Patient's Symptoms"),

                 ),
                 Padding(
                   padding: REdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TxtField(1, 400,symptom),
                 //EMERGENCY TREATMENT
                 ),
                 Padding(
                   padding: REdgeInsets.fromLTRB(0, 10, 137, 10),
                   child: headings("Emergency Treatment Given")
                 ),
                 Padding(
                   padding:  REdgeInsets.fromLTRB(10, 0, 10, 25),
                   child: TxtField(4, 400,treatment),

                 ),
                 Padding(
                  padding: REdgeInsets.fromLTRB(40, 0, 40, 0),

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

  Widget headings(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      color: Color(0xff353559),
      fontWeight: FontWeight.w600,
    ),
  );

  Widget VitalStat(String image, String heading,TextEditingController c) => Container(
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
            image,
            height: 30.h,
            width: 30.w,
          ),
        ),
        Padding(
          padding: REdgeInsets.fromLTRB(1, 0, 1, 10),
          child: Text(
            heading,
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
              controller: c,
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
  );

  Widget TxtField( int lines, int width, TextEditingController c) => SizedBox(
   // height: 40.h,
    width: width.w,
    child: TextFormField(
        maxLines: lines,
      style:  TextStyle(fontSize: 16.sp),
      controller: c,
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
  );
}
