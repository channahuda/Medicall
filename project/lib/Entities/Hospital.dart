
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';

class Hospital {
   String name;
   String id;
   String phoneNumber;
   int beds;
   String address;
   double lat;
   double lng;
   String city;
   String email;


  Hospital(
      {required this.name,
        required this.id,
        required this.lat,
        required this.lng,
        required this.city,
        required this.email,
        required this.address,
        required this.beds,
        required this.phoneNumber});
}

//remove this code
List<Hospital> hospitalList = [

  Hospital(name: 'Arif Shah Hospital', id: '1', lat: 24.867062948062657 , lng: 67.02368465935285,
      address: 'Plot R 279, Federal B Area, Dastagir Block 9, Gulberg Town, Karachi', beds: 7,
      phoneNumber: '0123-4567890',email: 'arif@gmail.com', city: 'Karachi'),
  Hospital(name: 'Ziauddin Hospital', id: '2', lat: 24.93451932622263, lng: 67.10215336661044,
      address: 'Plot H-234,  Gulshan Iqbal, Karachi', beds: 17,
      phoneNumber: '0223-4597890',email: 'zia@gmail.com', city: 'Karachi'),

 ];

