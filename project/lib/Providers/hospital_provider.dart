import 'package:flutter/material.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/network_call.dart';

import '../Network_Layer/network_call.dart';

class HospitalProvider with ChangeNotifier {
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  List<HospitalModel> hospitals = [];

  HospitalProvider.initialize() {
    loadHospitals();
  }

  loadHospitals() async {
    hospitals = await _hospitalServices.getHospital();
    notifyListeners();
  }
}
