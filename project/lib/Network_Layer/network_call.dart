import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicall/Entities/hospital.dart';
import 'package:medicall/Model/hospital_model.dart';

import '../Model/hospital_model.dart';

abstract class NetworkCall {
  Future<List<HospitalModel>> getHospitals();
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
