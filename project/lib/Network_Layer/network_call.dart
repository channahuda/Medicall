import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicall/Model/hospital_model.dart';

import '../Model/hospital_model.dart';

abstract class NetworkCall {
  Future<List<HospitalModel>> getHospital();
//Future<List<PatientModel>> getPatient();
}

class FirebaseNetworkCall implements NetworkCall {
  String hospital_collection = "Hospitals";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<HospitalModel>> getHospital() async =>
      _firestore.collection(hospital_collection).get().then((result) {
        List<HospitalModel> hospitals = [];
        for (DocumentSnapshot hospital in result.docs) {
          hospitals.add(HospitalModel.fromSnapshot(hospital));
          print(hospital.id);
        }
        return hospitals;
      });

// Future<List<PatientModel>> getPatient() async =>
//     _firestore.collection(hospital_collection).get().collection('Patient').then((result) {
//       List<PatientModel> patients = [];
//       for(DocumentSnapshot patient in result.docs){
//         patients.add(PatientModel.fromSnapshot(patient));
//       }
//       return patients;
//     });
}
