

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicall/Model/patient_model.dart';
import 'package:medicall/View/patient_list.dart';

import '../Model/hospital_model.dart';
import '../Providers/hospital_location_provider.dart';
import 'network_call.dart';

class FirebaseNetworkCall implements NetworkCall {
  String hospital_collection = "Hospitals";
  String patient_collection= "Patients";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _hospitaauth =FirebaseAuth.instance;


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
  // Firestore.instance
  //     .collection('users')
  //     .document(firebaseUser.uid)
  //     .setData({'email': user.email, 'uid': user.uid})
  //     .then((value) => Navigator.push(
  // context, MaterialPageRoute(builder: (context) => Home())))
  //     .catchError((e) {
  // print(e);
  // });
  void addHospital(HospitalModel hospital,) {

    // ospitalModel userModel = UserModel();
    // var hospitalUser = await FirebaseAuth.instance.currentUser;
    CollectionReference HospitalList =
        FirebaseFirestore.instance.collection(hospital_collection);
        HospitalList.doc(hospital.id).set(hospital.toJson())
      //  .then((value) => (hospital.id = value.id),)
        .catchError(
          (error) => CupertinoAlertDialog(
            title: Text("Failed to register hospital"),
            content: Text("$error"),
          )
              //print("Failed to add task: $error"),
        );

    print("\n");
    print("\n");
    print("INSIDE FIREBASE NETWORK CALL ADDHOSPITAL \n");
    print("hospital id      ");
    print(hospital.id);
    print("\n");



    Fluttertoast.showToast(msg: "Hospital added successfully ");

  }

  // final databaseReference = Firestore.instance;
  // databaseReference.collection('main collection name').document( unique id).
  // collection('string name').document().setData(); // your answer missing **.document()**  before setData

  Future<List<PatientModel>> getPatients() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    List<PatientModel> patientList = [];

    if(firebaseUser != null ){
      await FirebaseFirestore.instance
            .collection(hospital_collection)
            .doc(firebaseUser.uid).collection(patient_collection).get().
            then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
                  PatientModel patient =
                  PatientModel.fromJson(doc.data() as Map<String, dynamic>);
                  patient.id=doc.id;
                  patientList.add(patient);

                }
  });
 }

    print("\n");
    print("INSIDE get PATIENT  IN  firebase network call \n");
    print(patientList);
    print("\n");
    print("\n");

    return patientList;
  }


  void addPatient(PatientModel patient,HospitalModel hospital) {

    CollectionReference PatientList =
    FirebaseFirestore.instance.collection(hospital_collection).doc(hospital.id).collection(patient_collection);
    PatientList.add(patient.toJson())
        .then((value) => (patient.id = value.id))
        .catchError(
          (error) =>
              Fluttertoast.showToast(msg: "Failed to submit details")
          //     CupertinoAlertDialog(
          //   title: Text("Failed to add Patient"),
          //   content: Text("$error"),
          // )
    );
    FirebaseFirestore.instance.collection(hospital_collection).doc(hospital.id)
        .update({'beds' : hospital.beds-1})  .catchError(
            (error) =>
            Fluttertoast.showToast(msg: "Failed to reserve bed"));
  }

  Future<void> deletePatient(PatientModel patient) async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if(firebaseUser != null) {
      CollectionReference PatientList =
      await FirebaseFirestore.instance.collection(hospital_collection).doc(
          firebaseUser.uid).collection(patient_collection);
      PatientList.doc(patient.id).delete().catchError((error) =>
          Fluttertoast.showToast(msg: "Failed to delete user"));
    }
    else {
      Fluttertoast.showToast(msg: "Failed to delete user");
    }
  }




  void signIn(String email, String password,BuildContext context) async {
    String? errorMessage;

    try {
     await _hospitaauth
    .signInWithEmailAndPassword(email: email, password: password)
    .then((uid) => {
      print("\n"),
       print("...................................................... \n"),
      print("INSIDE SIGNIN OF FIREBASE NETWORK CALL"),
      print(uid),
       print("\n"),
       print(uid.user?.uid),
       print("\n"),
     Navigator.of(context).pushReplacement(
     MaterialPageRoute(builder: (context) => PatientList())),
     Fluttertoast.showToast(msg: "Login Successful"),

});

    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
      print(error.code);
    }

  }

  void signUp(HospitalModel hospital ) async {
    String? errorMessage;
    try {
    await _hospitaauth
          .createUserWithEmailAndPassword(email: hospital.email, password: hospital.password!)
          .then((value) => {
            hospital.id=value.user?.uid,
            addHospital(hospital),

          })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });

    print("\n");
    print("\n");
    print("INSIDE FIREBASE NETWORK CALL signup \n");
    print("hospital id      ");
    print(hospital.id);
    print("\n");
    }
    on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
      print(error.code);
    }

  }


  // Future<PatientModel?> fetchPatient() async {
  //   late PatientModel patientModel;
  //   final firebaseUser = await FirebaseAuth.instance.currentUser;
  //   if (firebaseUser != null) {
  //
  //     await FirebaseFirestore.instance
  //         .collection(hospital_collection)
  //         .doc(firebaseUser.uid).collection(patient_collection)
  //        .get().then((value) =>
  //        patientModel=PatientModel.fromJson(value.data() as Map<String, dynamic> ))
  //         .catchError((e) {
  //       print(e);
  //     });
  //    return patientModel;
  //  //    await FirebaseFirestore.instance
  //  //        .collection(hospital_collection)
  //  //        .doc(firebaseUser.uid).collection(patient_collection).get().
  //  //    then((QuerySnapshot querySnapshot) {
  //  //      for (var doc in querySnapshot.docs) {
  //  //        PatientModel patient =
  //  //        PatientModel.fromJson(doc.data() as Map<String, dynamic>);
  //  //        patient.id=doc.id;
  //  //        patientList.add(patient);
  //  //
  //  //      }
  //  //    });
  //   }
  //   else {
  //     print("\n");
  //     print("\n");
  //     print("............................................................ \n");
  //     print("\n");
  //     print(" error INSIDE FIREBASE NETWORK CALL METHOD FETCHHOSPITAL");
  //   }
  // }

  Future<HospitalModel> fetchHospital() async {

    late HospitalModel hospitalModel;
    final firebaseUser = await FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        print(firebaseUser.email);
        await FirebaseFirestore.instance
            .collection(hospital_collection)
            .doc(firebaseUser.uid)
            .get().then((value) =>
        hospitalModel =
            HospitalModel.fromJson(value.data() as Map<String, dynamic>))
            .catchError((e) {
          print(e);
        });
        return hospitalModel;
        //  print();
      }
      else {
        throw Exception('User is null');


    }
  }

  // void updateHospital(String hospitalName,String email, String address, String city, String contact, int beds) async{
  //    //var hospitalUser = await FirebaseAuth.instance.currentUser;
  //   CollectionReference HospitalList =
  //   FirebaseFirestore.instance.collection(hospital_collection);
  //   HospitalList.doc(hospitalModel.id).update(hospitalModel.toJson())
  //       .catchError(
  //           (error) =>  Fluttertoast.showToast(msg: "Hospital Could not be updated")
  //
  //   );
  //
  //
  // }

}
