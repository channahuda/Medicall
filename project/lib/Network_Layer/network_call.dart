import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicall/Entities/Hospital.dart';
import 'package:medicall/Model/hospital_model.dart';

import '../Model/hospital_model.dart';

abstract class NetworkCall {
  Future<List<Hospital>> getHospitals();
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

  Future<List<Hospital>> getHospitals() async {
    List<Hospital> hospitalList = [];
    FirebaseFirestore.instance
        .collection(hospital_collection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Hospital hospital =
            HospitalModel.fromJson(doc.data() as Map<String, dynamic>);
        hospitalList.add(hospital);
      }
    });
    return hospitalList;
  }
}

// Future<List<PatientModel>> getPatient() async =>
//     _firestore.collection(hospital_collection).get().collection('Patient').then((result) {
//       List<PatientModel> patients = [];
//       for(DocumentSnapshot patient in result.docs){
//         patients.add(PatientModel.fromSnapshot(patient));
//       }
//       return patients;
//     });
