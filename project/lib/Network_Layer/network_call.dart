import 'package:flutter/cupertino.dart';
import '../Model/hospital_model.dart';
import '../Model/patient_model.dart';

abstract class NetworkCall {
  Future<List<HospitalModel>> getHospitals();
  void addHospital(HospitalModel hospital);
  Future<List<PatientModel>> getPatients();
  void addPatient(PatientModel patient, HospitalModel hospital);
  Future<void> deletePatient(PatientModel patient);
  void signIn(String email, String password, BuildContext context);
  void signUp(HospitalModel hospital);
  Future<HospitalModel> fetchHospital();
}
