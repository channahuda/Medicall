import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicall/Entities/Hospital.dart';

import '../Network_Layer/network_call.dart';

class HospitalModel {
  //FirebaseNetworkCall networkCall = GetIt.I<FirebaseNetworkCall>();

  //FirebaseNetworkCall _hospitalServices = FirebaseNetworkCall();

  // static const ID = "id";
  // static const NAME = "name";
  // static const PHONENUMBER = "phoneNumber";
  // static const BEDS = "beds";
  // static const ADDRESS = "address";
  // static const LAT = "lat";
  // static const LNG = "lng";
  // static const CITY = "city";
  // static const EMAIL = "email";

  // This hospital model is for the paramedic map screen

  // late var response;
  //
  // // HospitalModel(
  // //     {this.response }) {}
  //
  // //  getters
  // String get id => _id;
  //
  // String get name => _name;
  //
  // String get phoneNumber => _phoneNumber;
  //
  // int get beds => _beds;
  //
  // double get lat => _lat;
  //
  // double get lng => _lng;
  //
  // String get address => _address;
  //
  // String get city => _city;
  //
  // String get email => _email;
  //
  // HospitalModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   _id = snapshot.get(ID);
  //   _name = snapshot.get(NAME);
  //   _phoneNumber = snapshot.get(PHONENUMBER);
  //   _beds = snapshot.get(BEDS);
  //   _address = snapshot.get(ADDRESS);
  //   _lat = snapshot.get(LAT);
  //   _lng = snapshot.get(LNG);
  //   _city = snapshot.get(CITY);
  //   _email = snapshot.get(EMAIL);
  // }

//   Map<String, dynamic> toJson() {
//     FirebaseNetworkCall.getHospitals();
//     // final Map<String, dynamic> data = {};
//     // data['title'] = title;
//     // if (description?.isEmpty ?? false) {
//     //   data['description'] = description;
//     // }
//     // data['date'] = date;
//     // data['datedone'] = datedone;
//     // data['dueDatePassed'] = dueDatePassed;
//     // data['done'] = done;
//
// //    return data;
//   }

  late String name;
  late String? id;
  late String phoneNumber;
  late int beds;
  late String address;
  late double lat;
  late double lng;
  late String city;
  late String email;

  // HospitalModel(
  //     {required this.name,
  //     this.id,
  //     required this.lat,
  //     required this.lng,
  //     required this.city,
  //     required this.email,
  //     required this.address,
  //     required this.beds,
  //     required this.phoneNumber});

  static Hospital fromJson(Map<String, dynamic> json) => Hospital(
      name: json['name'] as String,
      id: json['id'] as String? ?? "",
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      city: json['city'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      beds: json['beds'] as int,
      phoneNumber: json['phoneNumber'] as String);

  //Map<String, dynamic>
  Hospital toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['id'] = id;
    data['lat'] = lat;
    data['city'] = city;
    data['email'] = email;
    data['address'] = address;
    data['beds'] = beds;
    data['phoneNumber'] = phoneNumber;
    return Hospital(
        name: name,
        id: id,
        lat: lat,
        lng: lng,
        city: city,
        email: email,
        address: address,
        beds: beds,
        phoneNumber: phoneNumber);
  }
}
