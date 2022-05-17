import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class EditHospitalProvider extends ChangeNotifier {
  HospitalModel? hospitalmodel;
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  bool ischanged=false;

  bool isLoading=true;

  void editHospital() async {
    hospitalmodel= await _hospitalServices.fetchHospital();

    isLoading=false;
    notifyListeners();
  }

  void updateHospital(String hospitalName,String email, String address, String city, String contact, int beds)  {

    isLoading=true;
    _hospitalServices.updateHospital(hospitalName,email,address,  city,  contact,  beds);
     isLoading=false;
    notifyListeners();
  }

}