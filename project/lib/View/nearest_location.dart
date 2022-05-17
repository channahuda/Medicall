import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicall/Providers/hospital_location_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/exit_bottom_sheet.dart';
import '../Widgets/logout.dart';

class NearestLocation extends StatefulWidget {
  NearestLocation({Key? key}) : super(key: key);

  @override
  State<NearestLocation> createState() => _NearestLocationState();
}

class _NearestLocationState extends State<NearestLocation> {
  late HospitalLocationProvider hospitalProvider;

  @override
  void initState() {
    context.read<HospitalLocationProvider>().initPosition();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hospitalProvider = Provider.of<HospitalLocationProvider>(context);
    hospitalProvider.setContext(context);
    return WillPopScope(
      onWillPop: () => ExitBottomSheet.onWillPop(context),
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (BuildContext context) => Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
          body: hospitalProvider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: hospitalProvider.onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          hospitalProvider.position.latitude,
                          hospitalProvider.position.longitude,
                        ),
                        zoom: 16,
                      ),
                      markers: hospitalProvider.markers.values.toSet(),
                    ),
                    Positioned(
                      top: 30.h,
                      right: 10.w,
                      child: CircleAvatar(
                        child: const Logout(),
                        backgroundColor: const Color(0xff353559),
                        radius: 20.r,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
