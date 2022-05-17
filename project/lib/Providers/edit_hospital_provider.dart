
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';
import 'package:medicall/Providers/hospital_location_provider.dart';

class EditHospitalProvider extends ChangeNotifier {
  HospitalModel? hospitalmodel;
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  bool ischanged=false;

  bool isLoading=true;

  // EditHospitalProvider(){
  //   editHospital();
  // }


  void editHospital() async {
    //isLoading=true;
    //notifyListeners();
    //something wrong
    hospitalmodel= await _hospitalServices.fetchHospital();

    isLoading=false;
    notifyListeners();
   // return hospitalmodel;
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