import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Network_Layer/firebase_network_call.dart';

class EditHospitalProvider extends ChangeNotifier {
  late HospitalModel? hospitalmodel;
  FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();
  bool ischanged=false;

  bool isLoading=false;

  void editHospital() async {
    isLoading=true;
    notifyListeners();
    //something wrong
    hospitalmodel= await _hospitalServices.fetchHospital();
    print("\n");
    print("\n");
    print("\n");
    print("EDIT HOSPITAL PROVIDER ID CHECKING");
    print(hospitalmodel?.id);
    print(hospitalmodel?.email);
    print(".......id?.............");
    isLoading=false;
    notifyListeners();
    print("I AM OUTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");

  }
  // static Future updateTask(Task task) async {
  //   final docTodo = FirebaseFirestore.instance.collection('task').doc(task.id);
  //   await docTodo.update(task.toJson());
  // }
  void updateHospital(HospitalModel hospital)  {
    isLoading=true;
    _hospitalServices.updateHospital(hospital);
    isLoading=false;
    notifyListeners();

  }

}