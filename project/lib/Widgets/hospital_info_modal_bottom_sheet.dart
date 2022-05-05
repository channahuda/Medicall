import 'package:flutter/material.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Providers/hospital_location_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../View/patient_form.dart';

class DisplayHospitalInfo extends StatefulWidget {
  HospitalModel hospitalSelected;

  DisplayHospitalInfo({required this.hospitalSelected, Key? key})
      : super(key: key);

  @override
  State<DisplayHospitalInfo> createState() => _DisplayHospitalInfoState();
}

class _DisplayHospitalInfoState extends State<DisplayHospitalInfo> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
          child: Text(
            widget.hospitalSelected.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xff353559),
              fontSize: 22,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 1, 0, 1),
          tileColor: const Color(0xffF8F8F8),
          leading: Image.asset(
            'Assets/phone-68-64.png',
            height: 20,
          ),
          title: Text(
            widget.hospitalSelected.phoneNumber,
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 1, 0, 1),
          tileColor: const Color(0xffF8F8F8),
          leading: Image.asset(
            'Assets/icons8-sleeping-in-bed-64.png',
            height: 20,
          ),
          title: Text(
            '${widget.hospitalSelected.beds}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 1, 0, 1),
          //horizontalTitleGap: 30.0,
          tileColor: const Color(0xffF8F8F8),
          leading: Image.asset(
            'Assets/icons8-map-pin-64.png',
            height: 20,
          ),
          title: Text(
            widget.hospitalSelected.address,
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 1, 0, 1),
          //horizontalTitleGap: 30.0,
          tileColor: const Color(0xffF8F8F8),
          leading: Image.asset(
            'Assets/email-5-64.png',
            height: 20,
          ),
          title: Text(
            widget.hospitalSelected.email,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          children: [
            Spacer(),
            ElevatedButton(
              child: const Text('Directions'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff353559),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientForm(),
                  ),
                );
              },
            ),
            Spacer(),
            ElevatedButton(
              child: const Text('Patient Form'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff353559),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientForm(),
                  ),
                );
              },
            ),
            Spacer()
          ],
        ),
        SizedBox(
          height: 60,
        ),
        //Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
      ],
    );
  }
}
