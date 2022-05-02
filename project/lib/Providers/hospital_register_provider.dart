import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class HospitalRegisterProvider extends ChangeNotifier {
  late Position position;
  bool isLoading=false;
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();


 HospitalRegisterProvider(){
   _determinePosition();

 }

  addHospitalsList(HospitalModel hospital) async {
    isLoading=true;
    _hospitalServices.addHospital(hospital);
    //listOfHospitals = (await _hospitalServices.getHospitals());
    isLoading=false;
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
    isLoading=true;
    notifyListeners();
    position = await Geolocator.getCurrentPosition();

    isLoading=false;
    notifyListeners();
    return position;
    //return await Geolocator.getCurrentPosition();
  }
}