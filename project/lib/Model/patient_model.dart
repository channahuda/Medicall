import 'package:flutter/foundation.dart';

enum Gender { male, female, other }
enum EmergencyType { male, female, other }

void validateDescribeEnum() {
  assert(Gender.male.toString() == 'Gender.male');
  assert(describeEnum(Gender.male) == 'Male');
  assert(Gender.male.name == 'Male');
  assert(Gender.female.toString() == 'Gender.female');
  assert(describeEnum(Gender.female) == 'Female');
  assert(Gender.female.name == 'Female');
  assert(Gender.other.toString() == 'Gender.other');
  assert(describeEnum(Gender.other) == 'Other');
  assert(Gender.other.name == 'Other');
//  assert(EmergencyType)
}

class PatientModel {
  String? id;
  String? name;
  String gender;
 // late Gender gender;
  int? age;
  String emergencyType;
 // late EmergencyType emergencyType;
  late double bloodPressure;
  late double oxygenLevel;
  late double heartRate;
  String? patientSymptoms;
  String? emergencyTreatmentGiven;

  PatientModel(
      {this.name,
      this.id,
      required this.gender,
      this.age,
      required this.emergencyType,
      required this.bloodPressure,
      required this.oxygenLevel,
      required this.heartRate,
      this.patientSymptoms,
      this.emergencyTreatmentGiven});

  static PatientModel fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name'] as String?,
    //  id: json['id'] as String?,
      gender: json['gender'] as String,
      //gender: json['gender'] as Gender,
      age: json['age'] as int?,
      emergencyType: json['emergencyType'] as String,

      //emergencyType: json['emergencyType'] as EmergencyType,
      bloodPressure: json['bloodPressure'] as double,
      oxygenLevel: json['oxygenLevel'] as double,
      heartRate: json['heartRate'] as double,
      patientSymptoms: json['patientSymptoms'] as String?,
      emergencyTreatmentGiven: json['emergencyTreatmentGiven'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
  //  data['id'] = id;
    data['gender'] = gender;
    data['age'] = age;
    data['emergencyType'] = emergencyType;
    data['bloodPressure'] = bloodPressure;
    data['oxygenLevel'] = oxygenLevel;
    data['heartRate'] = heartRate;
    data['patientSymptoms'] = patientSymptoms;
    data['emergencyTreatementGiven'] = emergencyTreatmentGiven;
    return data;
  }
}
