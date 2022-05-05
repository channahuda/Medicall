//import 'dart:js';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:medicall/Entities/hospital.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Widgets/hospital_info_modal_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Network_Layer/firebase_network_call.dart';
import '../Network_Layer/network_call.dart';

//This provider is for nearest hospital map through paramedic login

class HospitalLocationProvider extends ChangeNotifier {
  //GoogleMapController? mapController;
  Map<String, Marker> markers = {};
  late Position position;
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  late List<HospitalModel> listOfHospitals;
  late BuildContext context;

  HospitalModel? hospitalSelected;
  bool markerClicked = false;
  bool isLoading = true;
  int index = 0;

  void setContext(BuildContext context) {
    this.context = context;
  }

  HospitalLocationProvider() {
    loadHospitalsList();
    //isLoading = true;
    _determinePosition();
    //isLoading = false;
    notifyListeners();
  }

  //
  // Future<void> hospitalClicked(int index) async {
  //   while (listOfHospitals.isEmpty) {
  //     //hospitalSelected = HospitalModel(name: 'No hospital selected', lat: 0, lng: 0, city: 'none', email: 'none', address: 'none', beds: 0, phoneNumber: 'dfsd')
  //   }
  //   Future.delayed(Duration(seconds: 3));
  //   hospitalSelected = await listOfHospitals[index];
  // }

  // Future<void> setMarkerClick() async {
  //   Future.delayed(Duration(seconds: 3));
  //   markerClicked = true;
  //   notifyListeners();
  // }

  // HospitalModel getHospitalSelected() {
  //   while (hospitalSelected == null) {}
  //   ;
  //   return hospitalSelected!;
  // }

  launchmap(lat, lng) {
    MapsLauncher.launchCoordinates(lat, lng);
  }

  Future<void> loadHospitalsList() async {
    //isLoading = true;
    listOfHospitals = await _hospitalServices.getHospitals();
    Future.delayed(const Duration(seconds: 5));
    notifyListeners();
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    markers.clear();
    for (int i = 0; i < listOfHospitals.length; i++) {
      double distance = calculateDistance(position.latitude, position.longitude,
          listOfHospitals[i].lat, listOfHospitals[i].lng);
      if (distance <= 3 && listOfHospitals[i].beds > 0) {
        final marker = Marker(
          markerId: MarkerId(listOfHospitals[i].name),
          position: LatLng(listOfHospitals[i].lat, listOfHospitals[i].lng),
          infoWindow: InfoWindow(
            title: listOfHospitals[i].name,
            onTap: () {
              index = i;
              // Window will pop up
              //setMarkerClick();
              markerClicked = true;
              notifyListeners();
              showMaterialModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                context: context,
                builder: (context) {
                  return DisplayHospitalInfo(
                    hospitalSelected: listOfHospitals[i],
                  );
                },
              );
              //hospitalClicked(index);
              hospitalSelected = listOfHospitals[i];
              notifyListeners();
            },
          ),
        );
        markers[listOfHospitals[i].name] = marker;
      }
      // else if (markers.length == 0) {
      //   for (int i = 1; i < listOfHospitals.length; i++) {
      //     if (distance <= 3 + i && listOfHospitals[i].beds > 0) {
      //       if (markers.length > 0) {
      //         break;
      //       } else {
      //         final marker = Marker(
      //           markerId: MarkerId(listOfHospitals[i].name),
      //           position:
      //               LatLng(listOfHospitals[i].lat, listOfHospitals[i].lng),
      //           infoWindow: InfoWindow(
      //               title: listOfHospitals[i].name,
      //               onTap: () {
      //               //  index = i;
      //
      //                 markerClicked = true;
      //                 notifyListeners();
      //               }),
      //         );
      //         markers[listOfHospitals[i].name] = marker;
      //       }
      //     }
      //   }
      // }
    }
    notifyListeners();
  }

  void getNearestLocation() async {
    //position = await
    _determinePosition();
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
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
    isLoading = true;
    position = await Geolocator.getCurrentPosition();
    notifyListeners();
    isLoading = false;
    notifyListeners();
    return position;
    //return await Geolocator.getCurrentPosition();
  }
}
