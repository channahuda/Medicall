import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {

  String dropdownValue = 'Road Accident';
  List<String> cases = ['Road Accident', 'Heart Attack/Chest Pain', 'Burn Victim', 'Fractured Bones', 'Gun Shot', 'Abdominal Pain','Suicide Attempt', 'Allergic Reaction'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffdab9f).withOpacity(0.02),
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      height: 50,
      width: 365,
      child: Padding(padding: EdgeInsets.only(left: 10),
        child: DropdownButton(
          value: dropdownValue,
          hint: SizedBox(width: 320,),
          icon: Icon(Icons.arrow_drop_down, color: Color(0xff353559),),
          //elevation: 200,

          style: const TextStyle(color: Color(0xff353559), fontSize: 18),

          items: cases.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
