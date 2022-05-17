import 'package:flutter/cupertino.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class ParamedicLoginProvider extends ChangeNotifier {

  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  bool isLoading=false;

  void loginHospital(String email, String password, BuildContext context) async {
    isLoading=true;
    notifyListeners();
    _hospitalServices.signInParamedic(email, password, context);
    isLoading=false;
    notifyListeners();

  }
}