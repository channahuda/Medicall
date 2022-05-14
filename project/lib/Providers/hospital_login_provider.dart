

import 'package:flutter/material.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class HospitalLoginProvider extends ChangeNotifier {

  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
   bool isLoading=false;

void loginHospital(String email, String password, BuildContext context) async {
  isLoading=true;
  notifyListeners();
  _hospitalServices.signIn(email, password, context);
  isLoading=false;
  notifyListeners();

}
}