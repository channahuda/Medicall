import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicall/Entities/logout_dialog_box.dart';
import 'package:medicall/View/patient_details.dart';


class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800),
      builder: (BuildContext context) =>    Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF353559),
      centerTitle: true,
      title:  Text('Emergency Patients', style: TextStyle(fontSize: 22.sp,  color: Colors.white ),),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: Image.asset(
                  'Assets/logout.png',
                  height: 30.h,
                ),
                onPressed: () {
                  LogoutDialog.showLogoutDialog(context);
                },
              ),
              Positioned(
                bottom: 5.h,
                child: InkWell(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                  onTap: () {
                    LogoutDialog.showLogoutDialog(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if(patientList.isEmpty)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Center(
                        child: Text('You have no emergency patients',
                          style: TextStyle(fontSize: 20.0.sp, height: 4.h, fontWeight: FontWeight.bold, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )

                else
                  Expanded(child:
                  ListTileTheme(
                    contentPadding: REdgeInsets.all(15),
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    tileColor: Color(0xffF18793).withOpacity(0.15),
                    style: ListTileStyle.list,
                    dense: true,
                    child: ListView.builder(
                        itemCount: patientList.length,
                        padding: EdgeInsets.only(top: 10, left: 8, right: 8).r,
                        itemBuilder: (context, index)
                    {
                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10).r,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ListTile(
                              contentPadding: REdgeInsets.fromLTRB(12, 8, 12, 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),

                                title: Container(
                                  height: 24.h,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                      children: <Widget>[
                                        Text(patientList[index].name,
                                            style:  TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp,
                                            ), textAlign: TextAlign.left),
                                        IconButton(icon: Icon(Icons.delete),padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          onPressed: (){
                                          patientList.remove(patientList[index]);
                                          setState(() {
                                          });
                                          }
                                          )
                                      ]
                    ),
                                ),
                                  subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Divider(
                                          color: Colors.black54,
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                            'Age: ${patientList[index].age.toString()}',
                                            textAlign: TextAlign.left,
                                            style:  TextStyle(fontSize: 14.sp)),
                                        SizedBox(height: 10),
                                        Text(
                                            'Emergency type: ${patientList[index].emergencyType}',
                                            textAlign: TextAlign.left,
                                            style:  TextStyle(fontSize: 14.sp)),
                                      ]
                                  ),
                              onTap:(){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => hospitalform(),
                                  ),
                                );
                              } ,
                                ),
                          ),
                        );
                    }
                    ),
                  )
                  )
                  ]
      ),
      ),
    );
  }
}


//REMOVE ALL OF THIS AFTER PROVIDER
class Patient{
  String name;
  int age;
  String emergencyType;

  Patient(this.name, this.age, this.emergencyType);
}

List<Patient> patientList = [
  Patient('Sarah Ali', 25, 'Burn Victim'),

];