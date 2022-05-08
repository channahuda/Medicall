import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicall/Entities/hospital.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Providers/hospital_register_provider.dart';
import 'package:medicall/View/login.dart';
import 'package:medicall/View/hospital_login.dart';
import 'package:medicall/Widgets/w_register_form.dart';
import 'package:provider/provider.dart';

import '../Widgets/footer.dart';

class RegisterHospital extends StatefulWidget {
  const RegisterHospital({Key? key}) : super(key: key);

  @override
  _RegisterHospitalState createState() => _RegisterHospitalState();
}

class _RegisterHospitalState extends State<RegisterHospital> {
  final _formkey = GlobalKey<FormState>();
  List<Marker> mark=[];
  TextEditingController hospitalname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController cpw = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController beds = TextEditingController();


  @override
    Widget build(BuildContext context)  {

    HospitalRegisterProvider hospitalProvider = Provider.of<HospitalRegisterProvider>(context);
    return
    ScreenUtilInit(
    designSize: const Size(360,800),
    builder: (BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
        resizeToAvoidBottomInset: false,
        //because overflow occurs when keyboard pops up
        backgroundColor: Color(0xffF8F8F8),
        appBar: AppBar(
            leading:  IconButton(
                icon:  Icon(Icons.arrow_back),
                onPressed: (){Navigator.pop(context);
                }
            ),
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title: Text(
            'Register Hospital',
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
        ),
        body: hospitalProvider.isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        ):

        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                 child: Form(
                     key: _formkey,
                   child: Column(
                   children: <Widget>[
                     SizedBox(height: 15.h),
                    Padding(
                       padding: REdgeInsets.symmetric(horizontal: 40.w),
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             inputFile(label: "Hospital Name",obscureText:false, TextEditingController:hospitalname),
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
                           ]
                       ),
                  ),

                  // form(validkey: _formkey,),  //this form is inside w_register_form
                   Stack(
                     children: <Widget>[
                       Container(
                         height: 320.h,
                         width: 300.w,
                         margin:  REdgeInsets.all(20.0),
                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.black26),
                           borderRadius:  BorderRadius.circular(10.r),
                         ),
                         child:  GoogleMap(

                           initialCameraPosition:  CameraPosition(
                             target: LatLng(
                               hospitalProvider.position.latitude,
                               hospitalProvider.position.longitude,),
                             zoom: 16,
                          ),
                           mapType: MapType.normal,

                           onTap: (LatLng latLng){
                             Marker newmark = Marker(
                               markerId: MarkerId('Places Name'),
                               infoWindow: const InfoWindow(title: 'Hospital Name'),
                               icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                               position: LatLng(latLng.latitude,latLng.longitude),
                             );
                             mark.add(newmark);
                             setState(() { });

                           },
                         markers: mark.map((e) => e).toSet(),

                         ),
                       ),
                     ]
                 ),
                  ElevatedButton(
                   onPressed: () {
                   if (_formkey.currentState!.validate()) {
                     //NEED TO CHANGE THIS OFCOURSE
                   final hospital= HospitalModel(
                     name:hospitalname.text,
                     address: address.text,
                     email: email.text,
                     lng: 4324,
                     lat: 2334,
                     beds: 1,
                     city: city.text,
                     phoneNumber: number.text,
                   );
                   print("................................INSIDE REGISTER HOSPITAL..........................................");
                   print("\n");
                   print("\n");
                   print(hospital.name);
                   Provider.of<HospitalRegisterProvider>(context, listen: false).addHospitalsList(hospital);




                     Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => HospitalLogin(),
                                        ),
                                );
                         }
                   else {
                     print("............................ELSE................................................");
                     print("\n");
                     print("could not be added");
                   }
                   },
                   child: Text('Register'),
                   style: ElevatedButton.styleFrom(
                       primary: const Color(0xff353559),
                       padding:  REdgeInsets.symmetric(
                           horizontal: 120.w, vertical: 15.h),
                       textStyle:  TextStyle(
                           fontSize: 20.sp, fontWeight: FontWeight.w500),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0.r),
                       )
                   ),
                   ),
                   SizedBox(height: 15.h),
                       ]
                    ),
                 )
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)
              )
             ]
              )
        ),
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
              return 'Passwords do not match';
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
