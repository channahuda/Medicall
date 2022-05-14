import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicall/Widgets/vital_stats.dart';
import 'package:medicall/Widgets/headings.dart';

import '../Model/patient_model.dart';

// class PatientDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//
//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//
//
//       },
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: hospitalform(),
//       ),
//     );
//   }
// }
class  PatientDetails extends StatefulWidget {
  final PatientModel patientModel;
   PatientDetails({Key? key,required this.patientModel}) : super(key: key);

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  //FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360,800),
    builder: (BuildContext context) => GestureDetector(

    onTap: () => FocusScope.of(context).unfocus(),
    child:Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF8F8F8),
        appBar: AppBar(
          /*leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: (){Navigator.pop(context);}
          ),*/
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title: Text('Patient Name', style: TextStyle(fontSize: 22.sp,  color: Colors.white ),),
        ),
        body: SingleChildScrollView(
      child: Column(
      children: <Widget>[
        Padding(
            padding: REdgeInsets.fromLTRB(0, 20, 250, 10),
            child: headings(text: 'Patient Name')

        ),
        Padding(
          padding: REdgeInsets.fromLTRB(10, 0, 10, 5),
          child: SizedBox(
              height: 45.h,
              width: 400.w,
              child:TxtField(1,400, widget.patientModel.name)
            // child: dropdown(),
          ),
        ),
      Padding(
      padding:  REdgeInsets.fromLTRB(2, 10, 10, 10),
      child: Row(
           children:  <Widget>[
             const Spacer(flex: 1,),
             headings(text: 'Gender'),
             const Spacer( flex: 11,),
             headings(text:'Age'),
             const Spacer(flex: 10,    ),
             ],
           )
        ),
        Row(
            children: <Widget>[
        //FOR NAME
         Padding( padding:  REdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TxtField(1, 175, widget.patientModel.gender),
         ),

        // FOR AGE
         Padding( padding:  REdgeInsets.fromLTRB(4, 0, 5, 10),
                  child:TxtField(1,150, widget.patientModel.age.toString()),
         ),
        ],
    ),
        Padding(
            padding: REdgeInsets.fromLTRB(2, 10, 235, 10),
            child: headings(text: 'Emergency Type')

        ),
        Padding(
          padding: REdgeInsets.fromLTRB(10, 0, 10, 15),
          child: SizedBox(
            height: 45.h,
            width: 400.w,
              child:TxtField(1,400, widget.patientModel.emergencyType)
           // child: dropdown(),
          ),
        ),
        Padding(
          padding: REdgeInsets.fromLTRB(0, 10, 255, 10),
          child:
          headings(text: 'Vital Statistics'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
           //CHANGE THIS AFTER ADDING PROVIDER
           VitalStat('Assets/blood.png',  'Blood Pressure',widget.patientModel.bloodPressure.toString()  ),

            const Spacer(),
            VitalStat('Assets/oxygen.png', 'Oxygen Level', widget.patientModel.oxygenLevel.toString()),

            const Spacer(),
            VitalStat('Assets/heart.png', 'Heart Rate', widget.patientModel.heartRate.toString()),
            const Spacer(),
          ],
        ),
        //PATIENT SYMPTOMS
        Padding(
          padding: REdgeInsets.fromLTRB(0, 10, 200, 10),
          child: headings(text: "Patient's Symptoms"),

        ),
        Padding(
          padding: REdgeInsets.fromLTRB(10, 0, 10, 10),
          child: TxtField(1, 400,widget.patientModel.patientSymptoms),
          //EMERGENCY TREATMENT
        ),
        Padding(
            padding: REdgeInsets.fromLTRB(0, 10, 137, 10),
            child: headings(text: "Emergency Treatment Given")
        ),
        Padding(
          padding:  REdgeInsets.fromLTRB(10, 0, 10, 25),

          child: TxtField(4, 400,widget.patientModel.emergencyTreatmentGiven),

          ),
          ]
         )
        )
      ),
    )
    );


  }


  Widget TxtField( int lines, int width, String? detail) => SizedBox(
   // height: 40.h,
    width: width.w,
    child:
    (detail != null) ?
     TextFormField(
      readOnly: true,
      maxLines: lines,
      style:  TextStyle(fontSize: 16.sp),
      //controller: c,

      initialValue: detail,
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

    ) :
    TextFormField(
    readOnly: true,
    maxLines: lines,
    style:  TextStyle(fontSize: 16.sp),
    //controller: c,

    initialValue: " ",
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

  )

  );

  Widget VitalStat(String image, String heading,String detail) => Container(
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
              readOnly: true,
              style:  TextStyle(fontSize: 13.sp),
              //controller: c,
              initialValue: detail ,
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
            ),
          ),
        ),
      ],
    ),
  );
}