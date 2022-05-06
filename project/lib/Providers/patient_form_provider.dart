


import 'package:flutter/material.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Model/patient_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class PatientFormProvider extends ChangeNotifier {
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
 // bool isLoading=false;

  addPatientsList(PatientModel patient,HospitalModel hospital) async {
   // isLoading=true;
    _hospitalServices.addPatient(patient,hospital);
    //listOfHospitals = (await _hospitalServices.getHospitals());
   // isLoading=false;
    notifyListeners();
  }
}