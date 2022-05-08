

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicall/Model/patient_model.dart';

import '../Model/hospital_model.dart';
import '../Providers/hospital_location_provider.dart';
import 'network_call.dart';

class FirebaseNetworkCall implements NetworkCall {
  String hospital_collection = "Hospitals";
  String patient_collection= "Patients";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Future<List<HospitalModel>> getHospitals() async {

    List<HospitalModel> hospitalList = [];

    FirebaseFirestore.instance
        .collection('Hospitals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        HospitalModel hospital =
            HospitalModel.fromJson(doc.data() as Map<String, dynamic>);
        hospital.id=doc.id;
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
          (error) => CupertinoAlertDialog(
            title: Text("Failed to register hospital"),
            content: Text("$error"),
          )
              //print("Failed to add task: $error"),
        );
  }

  // final databaseReference = Firestore.instance;
  // databaseReference.collection('main collection name').document( unique id).
  // collection('string name').document().setData(); // your answer missing **.document()**  before setData



  void addPatient(PatientModel patient,HospitalModel hospital) {

    CollectionReference PatientList =
    FirebaseFirestore.instance.collection(hospital_collection).doc(hospital.id).collection(patient_collection);
    PatientList.add(patient.toJson())
        .then((value) => (patient.id = value.id))
        .catchError(
          (error) => CupertinoAlertDialog(
            title: Text("Failed to add Patient"),
            content: Text("$error"),
          )
    );

    // final PatientList = FirebaseFirestore.instance;
    // PatientList.collection(hospital_collection).
    // doc(hospital.id).collection(patient_collection);
    // PatientList.add(patient.toJson())
    //     .then((value) => (patient.id = value.id))
    //     .catchError(
    //       (error) => print("Failed to add task: $error"),
    // );
  }

}
//
// tasksList.add(task);
// CollectionReference tasklist =
// FirebaseFirestore.instance.collection('tasks');
// tasklist
//     .add(task.toJson())
// .then((value) => (task.id = value.id))
// .catchError(
// (error) => print("Failed to add task: $error"),
// );
//
// (QuerySnapshot querySnapshot) {
// querySnapshot.docs.forEach(
// (doc) {
// Task newtask = Task.fromJson(doc.data() as Map<String, dynamic>);
// newtask.id = doc.id;
// // print(newtask.id);
// tasksList.add(newtask);
// //Task.fromJson(doc.data() as Map<String, dynamic>));
// firstButton = false;
// secondButton = true;
// },
