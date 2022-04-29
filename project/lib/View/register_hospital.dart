import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicall/View/login.dart';
import 'package:medicall/View/hospital_login.dart';
import 'package:medicall/Widgets/w_register_form.dart';

import '../Widgets/footer.dart';

class RegisterHospital extends StatefulWidget {
  const RegisterHospital({Key? key}) : super(key: key);

  @override
  _RegisterHospitalState createState() => _RegisterHospitalState();
}

class _RegisterHospitalState extends State<RegisterHospital> {
  List<Marker> mark=[];
  @override
    Widget build(BuildContext context)  => ScreenUtilInit(
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                 child: Column(
                   children: <Widget>[
                   form(),
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
                           initialCameraPosition: const CameraPosition(
                             target: LatLng( 24.93204434172861, 67.0517612033904,),
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
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder: (context) => hosplogin(),
                       ),
                     );
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
