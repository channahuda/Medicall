import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/patient_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class PatientListProvider extends ChangeNotifier {
late bool isLoading;
FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
late List<PatientModel> listOfPatients;

    PatientListProvider(){
      loadPatientList();

}

  Future<void> signOut(BuildContext context) async {
    isLoading=true;
    await _hospitalServices.signOut(context);
    isLoading=false;
    notifyListeners();
  }

  Future<void> loadPatientList() async {
    isLoading = true;
    notifyListeners();
    listOfPatients = await _hospitalServices.getPatients();
    isLoading = false;
    notifyListeners();
  }

  Future<void> deletePatients(PatientModel patient) async {
    isLoading = true;
    notifyListeners();
     await _hospitalServices.deletePatient(patient);

    isLoading = false;
    loadPatientList();
    notifyListeners();
  }


}