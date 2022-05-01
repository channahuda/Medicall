import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/hospital_model.dart';
import 'network_call.dart';

class FirebaseNetworkCall implements NetworkCall {
  String hospital_collection = "Hospitals";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<HospitalModel>> getHospitals() async {
    List<HospitalModel> hospitalList = [];
    FirebaseFirestore.instance
        .collection('Hospitals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {

        //print('hahahahaahhahahahahahahahahahahah.......................................................................................');
        HospitalModel hospital =
            HospitalModel.fromJson(doc.data() as Map<String, dynamic>);
        print("hospital");
        print(hospital);
        print(
            '...........................................................................................................................................................................................................................................');
        print(hospital.name);
        print("\n");
        print("\n");
        print("\n");
        print("\n");
        print("\n");
        print("\n");
        print("\n");
        print("\n");
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
}
