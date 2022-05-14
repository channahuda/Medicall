// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:medicall/Model/hospital_model.dart';
// //
// // class HospitalLoginAuth{
// //  // User user = FirebaseAuth.instance.currentUser;
// //   final FirebaseAuth _hospitalauth;
// //   HospitalLoginAuth(this._hospitalauth);
// //   //List‹HospitalModel> get authStateChanges => _hospitalauth.idTokenChanges();
// //
// //   Future<String> login(String email, String password) async {
// //     try{
// //       await _hospitalauth.signInWithEmailAndPassword(email: email, password: password);
// //       return "Logged In..................................................................................";
// //     } catch(e) {
// //       return "ERROR";
// //     }
// //   }
// //
// //   // Future<String> signUp(String email, String password) async {
// //   //   try{
// //   //     await _hospitalauth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
// //   //       User user = FirebaseAuth.instance.currentUser;
// //   //
// //   //       await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
// //   //         'uid': user.uid,
// //   //         'email': email,
// //   //         'password': password,
// //   //       });
// //   //     });
// //   //     return "Signed Up";
// //   //   } catch(e) {
// //   //     return "Sign Up Error";
// //   //   }
// //   // }
// //
// //
// // }
//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:medicall/View/patient_list.dart';
//
// class HospitalLoginAuth{
//
//   final _hospitaauth =FirebaseAuth.instance;
//
//   void signIn(String email, String password,BuildContext context) async {
//      String? errorMessage;
//
//       try {
//         await _hospitaauth
//             .signInWithEmailAndPassword(email: email, password: password)
//             .then((uid) => {
//           Fluttertoast.showToast(msg: "Login Successful"),
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => PatientList())),
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage);
//         print(error.code);
//       }
//
//   }
//
//   void signUp(String email, String password) async {
//     String? errorMessage;
//       try {
//         await _hospitaauth
//             .createUserWithEmailAndPassword(email: email, password: password)
//             .then((value) => {postDetailsToFirestore()})
//             .catchError((e) {
//           Fluttertoast.showToast(msg: e!.message);
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//
//   }
//
// }
