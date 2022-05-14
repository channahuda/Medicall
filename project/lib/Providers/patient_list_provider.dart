

import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/patient_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class PatientListProvider extends ChangeNotifier {
late bool isLoading;
//late PatientModel _patientModel;
FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
late List<PatientModel> listOfPatients;

    PatientListProvider(){
      loadPatientList();

}

// PatientModel get patientModel => _patientModel;
//
//   Future<void> reloadUserModel()async{
//     //_patientModel = await _userServicse.getUserById(user.uid);
//     notifyListeners();
//   }

  Future<void> loadPatientList() async {
    isLoading = true;
    listOfPatients = await _hospitalServices.getPatients();
    print("\n");
    print("INSIDE LOAD PATIENT LIST IN PATIENT LIST PROVIDER \n");
    print(listOfPatients.length);
    print("\n");
    print("\n");
    //  Future.delayed(const Duration(seconds: 5));
    isLoading = false;
    notifyListeners();
  }
}