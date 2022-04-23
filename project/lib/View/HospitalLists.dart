import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../Entities/Hospital.dart';
import 'HospitalInfo.dart';
import '../Widgets/footer.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) => Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF353559),
          centerTitle: true,
          title: Text(
            'Hospitals',
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (hospitalList.isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'There are no hospitals listed',
                      style: TextStyle(
                          fontSize: 20.0.sp,
                          height: 4.h,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            else
              Expanded(
                child: ListTileTheme(
                  contentPadding: REdgeInsets.all(15),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  tileColor: Color(0xffF18793).withOpacity(0.15),
                  style: ListTileStyle.list,
                  dense: true,
                  child: ListView.builder(
                    itemCount: hospitalList.length,
                    padding: EdgeInsets.only(top: 10, left: 8, right: 8).r,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: REdgeInsets.all(12),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.fromLTRB(12, 2, 12, 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(hospitalList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                      ),
                                      textAlign: TextAlign.left),
                                  IconButton(
                                      icon: Icon(Icons.location_on),
                                      onPressed: () {
                                        launchmap(hospitalList[index].lat,
                                            hospitalList[index].lng);
                                      })
                                ]),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Divider(
                                    color: Colors.black54,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'Assets/phone-68-64.png',
                                        height: 15.h,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        hospitalList[index].phoneNumber,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 14.sp),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(children: [
                                    Image.asset(
                                      'Assets/icons8-sleeping-in-bed-64.png',
                                      height: 15.h,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(hospitalList[index].beds.toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ]),
                                  SizedBox(height: 10.h),
                                  Row(children: [
                                    Image.asset(
                                      'Assets/icons8-map-pin-64.png',
                                      height: 15.h,
                                    ),
                                    SizedBox(width: 10.w),
                                    Flexible(
                                        child: Text(
                                      hospitalList[index].address,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 14.sp),
                                      maxLines: 3,
                                    )),
                                  ]),
                                ]),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HospitalInfo(
                                    hospital_name: 'Ziauddin Hospital',
                                    hospital_phoneno: '0300-1234567',
                                    hospital_beds: '4',
                                    hospital_address:
                                        'University Road, Karachi',
                                    lat: 0.55,
                                    lng: 0.6533,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomSheet: footer(),
      ),
    );
  }
  launchmap(lat, lng) {
    MapsLauncher.launchCoordinates(lat, lng);
  }
}
