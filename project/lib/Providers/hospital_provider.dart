import 'package:flutter/material.dart';
import 'package:medicall/Entities/Hospital.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/network_call.dart';

import '../Network_Layer/network_call.dart';

class HospitalProvider extends ChangeNotifier {
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  List<Hospital> listOfHospitals = [];
  Hospital? hospitalSelected;

  // HospitalProvider.initialize() {
  //   loadHospitals();
  // }

  loadHospitalsList() async {
    listOfHospitals = await _hospitalServices.getHospitals();
    notifyListeners();
  }

}
