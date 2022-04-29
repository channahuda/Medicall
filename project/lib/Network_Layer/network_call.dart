import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicall/Entities/hospital.dart';
import 'package:medicall/Model/hospital_model.dart';

import '../Model/hospital_model.dart';

abstract class NetworkCall {
  Future<List<HospitalModel>> getHospitals();
//Future<List<PatientModel>> getPatient();
}

class FirebaseNetworkCall implements NetworkCall {
  String hospital_collection = "Hospitals";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  // Future<List<HospitalModel>> getHospital() async =>
  //     _firestore.collection(hospital_collection).get().then((result) {
  //       List<HospitalModel> hospitals = [];
  //       for (DocumentSnapshot hospital in result.docs) {
  //         hospitals.add(HospitalModel.fromSnapshot(hospital));
  //         print(hospital.id);
  //       }
  //       return hospitals;
  //     });

  Future<List<HospitalModel>> getHospitals() async {
    List<HospitalModel> hospitalList = [];
    FirebaseFirestore.instance
        .collection(hospital_collection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        HospitalModel hospital =
            HospitalModel.fromJson(doc.data() as Map<String, dynamic>);
        hospitalList.add(hospital);
      }
    });
    return hospitalList;
  }

  void addHospital(HospitalModel hospital) {
    CollectionReference HospitalList =
        FirebaseFirestore.instance.collection(hospital_collection);
    HospitalList.add(hospital.toJson())
        .then((value) => (hospital.id = value.id))
        .catchError(
          (error) => print("Failed to add task: $error"),
        );
  }

// static Future<String?> createTask(Task task) async {
//   final doctask = FirebaseFirestore.instance.collection('task').doc();
//
//   task.id = doctask.id;
//   await doctask.set(task.toJson());
//
//   return doctask.id;
// }

// tasksList.add(task);
// CollectionReference tasklist =
// FirebaseFirestore.instance.collection('tasks');
// tasklist
//     .add(task.toJson())
//     .then((value) => (task.id = value.id))
//     .catchError(
// (error) => print("Failed to add task: $error"),
// );
// Sorting();
// notifyListeners();

// void addToCart({String userId, CartItemModel cartItem}){
//   print("THE USER ID IS: $userId");
//   print("cart items are: ${cartItem.toString()}");
//   _firestore.collection(collection).document(userId).updateData({
//     "cart": FieldValue.arrayUnion([cartItem.toMap()])
//   });
// }

}

// Future<List<PatientModel>> getPatient() async =>
//     _firestore.collection(hospital_collection).get().collection('Patient').then((result) {
//       List<PatientModel> patients = [];
//       for(DocumentSnapshot patient in result.docs){
//         patients.add(PatientModel.fromSnapshot(patient));
//       }
//       return patients;
//     });
