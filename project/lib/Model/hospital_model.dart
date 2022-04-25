import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalModel {
  static const ID = "id";
  static const NAME = "name";
  static const PHONENUMBER = "phoneNumber";
  static const BEDS = "beds";
  static const ADDRESS = "address";
  static const LAT = "lat";
  static const LNG = "lng";
  static const CITY = "city";
  static const EMAIL = "email";

  late String _name;
  late String _id;
  late String _phoneNumber;
  late int _beds;
  late String _address;
  late double _lat;
  late double _lng;
  late String _city;
  late String _email;

  //  getters
  String get id => _id;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  int get beds => _beds;
  double get lat => _lat;
  double get lng => _lng;
  String get address => _address;
  String get city => _city;
  String get email => _email;



  HospitalModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.get(ID);
    _name = snapshot.get(NAME);
    _phoneNumber = snapshot.get(PHONENUMBER);
    _beds = snapshot.get(BEDS);
    _address= snapshot.get(ADDRESS);
    _lat= snapshot.get(LAT);
    _lng= snapshot.get(LNG);
    _city= snapshot.get(CITY);
    _email= snapshot.get(EMAIL);
  }
}