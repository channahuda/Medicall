import 'package:flutter/material.dart';

import 'dropdown.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController bp = TextEditingController();
  TextEditingController oxygen = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController symptom = TextEditingController();
  TextEditingController treatment = TextEditingController();

  @override
  Widget build(BuildContext context) => Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Patient Name',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff353559),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(
                    flex: 7,
                  ),
                  Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff353559),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(
                    flex: 12,
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffdab9f).withOpacity(0.02),
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    width: 175,
                    height: 40,
                    child: TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 10, 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffdab9f).withOpacity(0.02),
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    width: 175,
                    height: 40,
                    child: TextFormField(
                      controller: age,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 230, 10),
              child: Text(
                "Emergency Type",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff353559),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: SizedBox(
                height: 45,
                // height: 30,
                child: dropdown(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 235, 10),
              child: Text(
                'Vital Statistics',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff353559),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    color: const Color(0xfffdab9f).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                      color: const Color(0xfffdab9f).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 6, 1, 8),
                        child: Image.asset(
                          'Assets/blood.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 1, 10),
                        child: Text(
                          'Blood Pressure',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff353559),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child:
                        Container(
                          height: 33,
                          decoration: BoxDecoration(
                        //    color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            controller: bp,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    color: const Color(0xfffdab9f).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                      color: const Color(0xfffdab9f).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 6, 1, 8),
                        child: Image.asset(
                          'Assets/oxygen.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 1, 10),
                        child: Text(
                          'Oxygen Level',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff353559),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Container(
                          height: 33,
                          decoration: BoxDecoration(
                            //color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            controller: oxygen,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    color: const Color(0xfffdab9f).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                      color: const Color(0xfffdab9f).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 6, 1, 8),
                        child: Image.asset(
                          'Assets/heart.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 1, 10),
                        child: Text(
                          'Heart Rate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff353559),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Container(
                          height: 33,
                          decoration: BoxDecoration(
                            //color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            controller: rate,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 200, 10),
              child: Text(
                "Patient's Symptoms",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff353559),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              //child: SizedBox(
              // height: 45,
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                controller: symptom,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              //  ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       contentPadding:
            //       const EdgeInsets.symmetric(vertical: 20.0),
            //     ),
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return 'Field Required';
            //       }
            //       return null;
            //     },
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 140, 10),
              child: Text(
                "Emergency Treatment Given",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff353559),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
              //child: SizedBox(
                //height: 45,
                child: TextFormField(
                  style: const TextStyle(fontSize: 18),
                  controller: treatment,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              //),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        contentPadding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                        content: Text(
                          'Form Has Been Submitted',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                    name.clear();
                    age.clear();
                    type.clear();
                    bp.clear();
                    oxygen.clear();
                    rate.clear();
                    symptom.clear();
                    treatment.clear();
                    //Navigator.pop(context);
                  } else {
                    return null;
                  }
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff353559),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            // Padding(
            //     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),

        //   ),
      );
}
