import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/HomePage.dart';
import 'package:medicall/HospitalLists.dart';
import 'package:medicall/LogoutDialog.dart';
import 'package:medicall/NearestLocation.dart';
import 'package:medicall/myFlutterIcons.dart';
import 'package:medicall/paramediclogin.dart';
import 'package:medicall/patientform.dart';
import 'tabItem.dart';
import 'bottomNavigation.dart';
import 'package:medicall/NearestLocation.dart';
import 'LogoutDialog.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {

  static int currentTab = 0;
  static late var p;
  static late Position position;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  //this is static property so other widget throughout the app
  //can access it simply by AppState.currentTab

  @override
  void initState() {

    // TODO: implement initState
    p=setposition();
    super.initState();
  }
  Future<Position> setposition() async {
    position = await _determinePosition();
    return position;
  }
  // list tabs here
  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home,
      page: const HomePage(),
    ),
    TabItem(
      tabName: "Hospitals",
      icon: MyFlutterApp.hospital_alt,
      page: const Hospitals(),
    ),
    TabItem(
      tabName: "Patient Form",
      icon: Icons.format_list_bulleted_outlined,
      page: const paraform(),
    ),
    TabItem(

      tabName: "Nearest Hospital",
      icon: Icons.location_on,
      page:  MapMultiMarker(position: p),
    ),
  ];

  // position = await _determinePosition();
  // Navigator.push(
  // context,
  // MaterialPageRoute(
  // builder: (context) =>
  // MapMultiMarker(position: position)),
  // );
  AppState() {
    // indexing is necessary for proper funcationality
    // of determining which tab is active
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  // sets current tab index
  // and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState?.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(

      onWillPop: () async {
       // position = await _determinePosition();
        final isFirstRouteInCurrentTab =
        await tabs[currentTab].key.currentState?.maybePop();
        if (isFirstRouteInCurrentTab!) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      // this is the base scaffold
      // don't put appbar in here otherwise you might end up
      // with multiple appbars on one screen
      // eventually breaking the app
      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        // Bottom navigation
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}