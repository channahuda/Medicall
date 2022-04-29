import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:medicall/Entities/patient.dart';

class PatientProvider extends ChangeNotifier{
  List<Patient> _patients = [];

  int get patientCount {
    return _patients.length;
  }

  UnmodifiableListView<Patient> get unmodpatient {
    return UnmodifiableListView(_patients);
  }

  List<Patient> get patients{
    return _patients;
  }

  void addPatient(Patient patient) {
   // FirebaseApi.createPatient(patient);
    _patients.add(patient);
    notifyListeners();
  }
  void removePatient(Patient patient) {
    //FirebaseApi.deletePatient(patient);
    notifyListeners();
  }

}