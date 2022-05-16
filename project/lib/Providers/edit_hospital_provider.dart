import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class EditHospitalProvider extends ChangeNotifier {
  late HospitalModel hospitalmodel;
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  bool ischanged=false;

  bool isLoading=false;


  void editHospital() async {
    isLoading=true;
    notifyListeners();
    //something wrong
    hospitalmodel= await _hospitalServices.fetchHospital();

    isLoading=false;
    notifyListeners();

  }

  void updateHospital(String hospitalName,String email, String address, String city, String contact, int beds)  {
    isLoading=true;
    _hospitalServices.updateHospital(hospitalName,email,address,  city,  contact,  beds);
    print(" .............................................. \n");
    print("INSIDE UPDATEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    print(" .............................................. \n");
    isLoading=false;
    notifyListeners();

  }

}