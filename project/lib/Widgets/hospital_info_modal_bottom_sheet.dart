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
    print("....................................INSIDE BOTTOM SHEET...............................................");
    print("\n");
    print("\n");
    print(widget.hospitalSelected.id);
    print(widget.hospitalSelected.name);
    print("\n");
    print("\n");
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(
              widget.hospitalSelected.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: const Color(0xff353559),
                fontSize: 22,
              ),
            ),
            ]
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
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
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
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
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
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
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
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
            SizedBox(
              height:40,
              width: 150,
              child: ElevatedButton(
                child: const Text('Directions'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff353559),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  context.read<HospitalLocationProvider>().launchmap(
                      widget.hospitalSelected.lat, widget.hospitalSelected.lng);


                },
              ),
            ),
            Spacer(),
            SizedBox(
              height:40,
              width: 150,
              child: ElevatedButton(
                child: const Text('Patient Form'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff353559),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  PatientForm(hospitalModel: widget.hospitalSelected,),
                    ),
                  );
                },
              ),
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
