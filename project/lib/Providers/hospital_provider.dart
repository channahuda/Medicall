import 'package:flutter/material.dart';
import 'package:medicall/Entities/hospital.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/network_call.dart';

import '../Network_Layer/network_call.dart';

//This provider is for nearest hospital map through paramedic login

class HospitalProvider extends ChangeNotifier {
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  List<Hospital> listOfHospitals = [];

  HospitalModel? hospitalSelected;

  // HospitalProvider.initialize() {
  //   loadHospitals();
  // }

  loadHospitalsList() async {
    listOfHospitals = (await _hospitalServices.getHospitals()).map(
      (jsonObject) => Hospital(
        name: jsonObject.name,
        lat: jsonObject.lat,
        lng: jsonObject.lng,
        city: jsonObject.city,
        email: jsonObject.email,
        address: jsonObject.address,
        beds: jsonObject.beds,
        phoneNumber: jsonObject.phoneNumber,
      ),
    ).toList();
    notifyListeners();
  }
}

class HospitalEntity {
  final String name;

  HospitalEntity({required this.name});
}
