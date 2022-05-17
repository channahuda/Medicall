import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicall/Model/patient_model.dart';
import 'package:medicall/View/login.dart';
import 'package:medicall/View/nearest_location.dart';
import 'package:medicall/View/patient_list.dart';

import '../Model/hospital_model.dart';
import '../Model/user_model.dart';
import '../Providers/hospital_location_provider.dart';
import 'network_call.dart';

class FirebaseNetworkCall implements NetworkCall {
  String hospital_collection = "Hospitals";
  String user_collection="Users";
  String patient_collection = "Patients";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _hospitaauth = FirebaseAuth.instance;

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
        hospital.id = doc.id;
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
  void addHospital(HospitalModel hospital, UserModel user) {
    // ospitalModel userModel = UserModel();
    // var hospitalUser = await FirebaseAuth.instance.currentUser;
    CollectionReference HospitalList =
        FirebaseFirestore.instance.collection(hospital_collection);
    HospitalList.doc(hospital.id)
        .set(hospital.toJson())
        //  .then((value) => (hospital.id = value.id),)
        .catchError((error) => CupertinoAlertDialog(
                  title: Text("Failed to register hospital"),
                  content: Text("$error"),
                )
            //print("Failed to add task: $error"),
            );
    CollectionReference UserList =
    FirebaseFirestore.instance.collection(user_collection);
    UserList.doc(user.id).set(user.toJson())
       // .set(user.toJson())
    //  .then((value) => (hospital.id = value.id),)
        .catchError((error) => CupertinoAlertDialog(
      title: Text("Failed to register hospital as a user"),
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

    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection(hospital_collection)
          .doc(firebaseUser.uid)
          .collection(patient_collection)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          PatientModel patient =
              PatientModel.fromJson(doc.data() as Map<String, dynamic>);
          patient.id = doc.id;
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

  void addPatient(PatientModel patient, HospitalModel hospital) {

    CollectionReference PatientList = FirebaseFirestore.instance
        .collection(hospital_collection)
        .doc(hospital.id)
        .collection(patient_collection);
    PatientList.add(patient.toJson())
        .then((value)  {patient.id = value.id;
    Fluttertoast.showToast(msg: "Form has been submitted");
        })
        .catchError(
            (error) => Fluttertoast.showToast(msg: "Failed to submit details")
            //     CupertinoAlertDialog(
            //   title: Text("Failed to add Patient"),
            //   content: Text("$error"),
            // )
            );
    FirebaseFirestore.instance
        .collection(hospital_collection)
        .doc(hospital.id)
        .update({'beds': hospital.beds - 1}).catchError(
            (error) => Fluttertoast.showToast(msg: "Failed to reserve bed"));
  }

  Future<void> deletePatient(PatientModel patient) async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      CollectionReference PatientList = await FirebaseFirestore.instance
          .collection(hospital_collection)
          .doc(firebaseUser.uid)
          .collection(patient_collection);
      PatientList.doc(patient.id).delete().catchError(
          (error) => Fluttertoast.showToast(msg: "Failed to delete user"));
    } else {
      Fluttertoast.showToast(msg: "Failed to delete user");
    }
  }

  // firebase.firestore().collection("users")
  //     .where("name", "==", "Daniel")
  //     .get()
  //     .then(function(querySnapshot) {
  //   querySnapshot.forEach(function(document) {
  //   document.ref.update({ ... });
  //   });
  // });

  void signInHospital(
      String email, String password, BuildContext context) async {
    User users;
    String? errorMessage;

// bool exists=false;
//     FirebaseFirestore.instance
//         .collection(user_collection)
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//
//    querySnapshot.docs.forEach((doc) {
//      UserModel tempUser = UserModel.fromJson(doc.data() as Map<String,dynamic>);
//      if(tempUser.email == email) {
//       exists=true;
//       print("\n");
//       print("\n");
//       print("\n"); print("\n");
//
//       print("THIS EMAIL DOES EXIST WOHOOO");
//      }
//
//    });
//    print("\n");
//    print("\n");
//    print(exists);
//         // HospitalModel hospital =
//         // HospitalModel.fromJson(doc.data() as Map<String, dynamic>);
//         // hospital.id = doc.id;
//         // hospitalList.add(hospital);
//     //  }
//     });


    DocumentSnapshot snapshot = (await FirebaseFirestore.instance.collection(user_collection)
        .where("email", isEqualTo: email).get()).docs.first;
    print("\n");
    print(snapshot.data());
    if(snapshot.exists) {
      if ((snapshot.data()! as Map<String, dynamic>)['isHospital'] as bool) {
        try {
          await _hospitaauth
              .signInWithEmailAndPassword(email: email, password: password)
              .then((uid) =>
          {
            print("\n"),
            print(
                "...................................................... \n"),
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
              errorMessage =
              "Signing in with Email and Password is not enabled.";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          Fluttertoast.showToast(msg: errorMessage);
          print(error.code);
        }
      }
      else
      if ((snapshot.data()! as Map<String, dynamic>)['isHospital'] as bool ==
          false) {
        Fluttertoast.showToast(msg: "Attempt to Login Failed");
      }
    }
     else if(snapshot.data()==null){

       Fluttertoast.showToast(msg: "Account with this email does not exist");
     }


  }

  void signUpHospital(HospitalModel hospital,UserModel user) async {
    String? errorMessage;
    try {
      await _hospitaauth
          .createUserWithEmailAndPassword(
              email: hospital.email, password: hospital.password!)
          .then((value) => {
                hospital.id = value.user?.uid,
                addHospital(hospital,user),
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

  Future<void> signOut(BuildContext context) async {
    // if( ){
    await FirebaseAuth.instance
        .signOut()
        .catchError((error) => Exception('User is null'));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Login(),
      ),
      (route) => false,
    );
    // }
    // else {
    // throw Exception('User is null');
    // }
  }

  void signInParamedic(
      String email, String password, BuildContext context) async {
    String? errorMessage;
    DocumentSnapshot snapshot = (await FirebaseFirestore.instance.collection(user_collection)
        .where("email", isEqualTo: email).get()).docs.first;
    if(snapshot.exists) {
      if ((snapshot.data()! as Map<String, dynamic>)['isHospital'] as bool==false) {
        try {
          await _hospitaauth
              .signInWithEmailAndPassword(email: email, password: password)
              .then((uid) =>
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NearestLocation())),
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
              errorMessage =
              "Signing in with Email and Password is not enabled.";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          Fluttertoast.showToast(msg: errorMessage);
          print(error.code);
        }
      }
      else
      if ((snapshot.data()! as Map<String, dynamic>)['isHospital'] as bool == true) {
        Fluttertoast.showToast(msg: "Attempt to Login Failed");
      }
    }
    else if(snapshot.data()==null){

      Fluttertoast.showToast(msg: "Account with this email does not exist");
    }
  }

  Future<HospitalModel?> fetchHospital() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      final hospital = await FirebaseFirestore.instance
          .collection(hospital_collection)
          .doc(firebaseUser.uid)
          .get();
      final hospitalModel =
      HospitalModel.fromJson(hospital.data() as Map<String, dynamic>);
      return hospitalModel;
      // print(firebaseUser.email);
      // return FirebaseFirestore.instance
      //     .collection(hospital_collection)
      //     .doc(firebaseUser.uid)
      //     .get()
      //     .then((value) {
      //   final hospitalModel =
      //       HospitalModel.fromJson(value.data() as Map<String, dynamic>);
      //   return hospitalModel;
      // }).catchError((e) {
      //   print(e);
      // });
      // //  print();
    } else {
      throw Exception('User is null');
    }
  }

  void updateHospital(String hospitalName, String email, String address,
      String city, String contact, int beds) async {
    //var hospitalUser = await FirebaseAuth.instance.currentUser;
    final firebaseUser = await FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      CollectionReference HospitalList =
          FirebaseFirestore.instance.collection(hospital_collection);
      HospitalList.doc(firebaseUser.uid).update({
        'name': hospitalName,
        'email': email,
        'address': address,
        'beds': beds,
        'city': city,
        'phoneNumber': contact
      }).catchError((error) =>
          Fluttertoast.showToast(msg: "Hospital Could not be updated"));
    } else {
      Fluttertoast.showToast(msg: "Hospital Could not be updated");
    }
  }
}
