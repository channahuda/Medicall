import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicall/Entities/hospital.dart';
import 'package:medicall/Model/hospital_model.dart';

import '../Model/hospital_model.dart';
import '../Model/patient_model.dart';

abstract class NetworkCall {
  Future<List<HospitalModel>> getHospitals();
  void addHospital(HospitalModel hospital);
  Future<List<PatientModel>> getPatients();
  void addPatient(PatientModel patient, HospitalModel hospital);
  Future<void> deletePatient(PatientModel patient);
  void signInHospital(String email, String password, BuildContext context);
  void signUpHospital(HospitalModel hospital);
  Future<HospitalModel> fetchHospital();

//Future<List<PatientModel>> getPatient();
}


// Future<List<PatientModel>> getPatient() async =>
//     _firestore.collection(hospital_collection).get().collection('Patient').then((result) {
//       List<PatientModel> patients = [];
//       for(DocumentSnapshot patient in result.docs){
//         patients.add(PatientModel.fromSnapshot(patient));
//       }
//       return patients;
//     });
