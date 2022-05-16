import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicall/Model/hospital_model.dart';
import 'package:medicall/Providers/edit_hospital_provider.dart';
import 'package:medicall/View/Login.dart';
import 'package:medicall/View/edit_form.dart';
import 'package:medicall/View/patient_details.dart';
import 'package:medicall/View/patient_list.dart';
import 'package:medicall/Widgets/delete_dialog.dart';
import 'package:provider/provider.dart';
import '../Widgets/footer.dart';

class EditHospital extends StatefulWidget {
  const EditHospital({Key? key}) : super(key: key);

  @override
  _EditHospitalState createState() => _EditHospitalState();
}

class _EditHospitalState extends State<EditHospital> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController hospitalname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController contact = TextEditingController();
   TextEditingController beds = TextEditingController();
  late EditHospitalProvider hospitalProvider;

  List<Marker> mark = [];

//  late bool changed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<EditHospitalProvider>().editHospital();
  }

  @override
  Widget build(BuildContext context) {
    hospitalProvider = Provider.of<EditHospitalProvider>(context);
    // String  hospitalname=hospitalProvider.hospitalmodel.name;
    // String  email=hospitalProvider.hospitalmodel.email;
    //  String address=hospitalProvider.hospitalmodel.address;
    //  String city=hospitalProvider.hospitalmodel.city;
    //  String contact= hospitalProvider.hospitalmodel.phoneNumber;
    // int beds= hospitalProvider.hospitalmodel.beds;


    //   changed= context.read<EditHospitalProvider>().ischanged;

    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              //because overflow occurs when keyboard pops up
              backgroundColor: Color(0xffF8F8F8),
              appBar: AppBar(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  backgroundColor: const Color(0xFF353559),
                  centerTitle: true,
                  title: Text(
                    'Edit Hospital Details',
                    style: TextStyle(fontSize: 22.sp, color: Colors.white),
                  ),
                  actions: <Widget>[
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete_outline_outlined),
                          onPressed: () {
                            DeleteDialog.showDeleteDialog(context);
                          },
                        ),
                        Positioned(
                          bottom: 5.h,
                          child: InkWell(
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                            onTap: () {
                              DeleteDialog.showDeleteDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
              body: context.read<EditHospitalProvider>().isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                                child: Form(
                              key: _formkey,
                              child: Column(children: <Widget>[
                                //EditForm(),
                                Column(children: <Widget>[
                                  SizedBox(height: 15.h),
                                  Padding(
                                    padding:
                                        REdgeInsets.symmetric(horizontal: 40.w),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[

                                          inputFile(
                                              label: "Hospital Name",
                                           // initval: hospitalname,
                                             initval: hospitalProvider
                                                 .hospitalmodel.name,
                                             cont: hospitalname
                                          ),
                                          inputFile(
                                              label: "Email",
                                              initval: hospitalProvider
                                                  .hospitalmodel.email,
                                              cont: email),
                                          // inputFile(label: "Password", obscureText: true, cont: password),
                                          // inputFile(label: "Confirm Password", obscureText: true, cont: password),
                                          inputFile(
                                              label: "Address",
                                              initval: hospitalProvider
                                                  .hospitalmodel.address,
                                              cont: address
                                          ),
                                          inputFile(
                                              label: "City",
                                              initval: hospitalProvider
                                                  .hospitalmodel.city,
                                              cont: city
                                          ),
                                          // inputFileNumber(
                                          //     label: "Contact Number",
                                          //     initval: hospitalProvider
                                          //         .hospitalmodel.phoneNumber,
                                          //     cont: contact
                                          // ),
                                          // inputFileNumber(
                                          //     label:
                                          //         "Number of Beds in Hospital",
                                          //     initval: hospitalProvider
                                          //         .hospitalmodel.beds,
                                          //    cont: beds
                                          // ),
                                          // Text(
                                          //   'Mark Location on Map',
                                          //   style: TextStyle(
                                          //       fontSize: 15.sp,
                                          //       fontWeight: FontWeight.w400,
                                          //       color: Colors.black),
                                          // ),
                                        ]),
                                  )
                                ]),
                                // Stack(children: <Widget>[
                                //   Container(
                                //     height: 320.h,
                                //     width: 295.w,
                                //     margin: REdgeInsets.all(20.0),
                                //     decoration: BoxDecoration(
                                //       border: Border.all(color: Colors.black26),
                                //       borderRadius: BorderRadius.circular(10.r),
                                //     ),
                                //     child: GoogleMap(
                                //       initialCameraPosition:
                                //           const CameraPosition(
                                //         target: LatLng(
                                //           24.93204434172861,
                                //           67.0517612033904,
                                //         ),
                                //         zoom: 16,
                                //       ),
                                //       mapType: MapType.normal,
                                //       onTap: (LatLng latLng) {
                                //         Marker newmark = Marker(
                                //           markerId: MarkerId('Places Name'),
                                //           infoWindow: const InfoWindow(
                                //               title: 'Hospital Name'),
                                //           icon: BitmapDescriptor
                                //               .defaultMarkerWithHue(
                                //                   BitmapDescriptor.hueRed),
                                //           position: LatLng(latLng.latitude,
                                //               latLng.longitude),
                                //         );
                                //         mark.add(newmark);
                                //         setState(() {});
                                //       },
                                //       markers: mark.map((e) => e).toSet(),
                                //     ),
                                //   ),
                                // ]),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      bool remove = false;
                                      remove = await showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text('Save Changes'),
                                                content: Text(
                                                    "Are you sure you want to save changes?"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                        print("\n");
                                                        print(" hospital name    ");
                                                        print( hospitalname.text);
                                                        print(" hospital name in provider: ");
                                                            print(hospitalProvider.hospitalmodel.name);
                                                        print("\n");
                                                        print("\n");
                                                        hospitalProvider.updateHospital(
                                                       //   hospitalname, email, address, city, contact,beds
                                                            (hospitalname.text == "") ? hospitalProvider.hospitalmodel.name : hospitalname.text,
                                                            (email.text == "") ? hospitalProvider.hospitalmodel.email : email.text,
                                                            (address.text == "") ? hospitalProvider.hospitalmodel.address : address.text
                                                            ,(city.text  == "") ? hospitalProvider.hospitalmodel.city : city.text
                                                          ,(contact.text  == "") ? hospitalProvider.hospitalmodel.phoneNumber : contact.text ,
                                                            (beds.text == "") ? hospitalProvider.hospitalmodel.beds : int.parse(beds.text),

                                                           );

                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            PatientList()));
                                                      },
                                                      child: Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .lightBlue),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(false);
                                                      },
                                                      child: Text('No',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .lightBlue))),
                                                ],
                                              ));
                                      //setState(() {});
                                    }
                                  },
                                  child: Text('Save Changes'),
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff353559),
                                      padding: REdgeInsets.symmetric(
                                          horizontal: 80.w, vertical: 15.h),
                                      textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.r),
                                      )),
                                ),
                                SizedBox(height: 100.h),
                              ]),
                            )),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom))
                        ]),
              //resizeToAvoidBottomInset: false,
              bottomSheet: footer(),
            ),
          );
        });
  }

  Widget inputFile({label, initval,cont}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(

          initialValue: initval.toString(),
          //write something here
          onChanged: (changedval)  {
         //   initval = changedval;
            cont = TextEditingController(text:changedval);
          // cont = changedval;
          },
         // controller: cont,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value) &&
                cont == email) {
              return ("Please Enter a valid email");
            }

            return null;
          },
          //setState(() => cont = changedval),
          obscureText: false,
          decoration: InputDecoration(
            contentPadding:
                REdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
            enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.black26)),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.black45)),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
  //
  // Widget inputFileNumber({label, cont, initval}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text(
  //         label,
  //         style: TextStyle(
  //             fontSize: 15.sp,
  //             fontWeight: FontWeight.w400,
  //             color: Colors.black),
  //       ),
  //       SizedBox(
  //         height: 5.h,
  //       ),
  //       TextFormField(
  //         keyboardType: TextInputType.number,
  //         inputFormatters: <TextInputFormatter>[
  //           FilteringTextInputFormatter.digitsOnly
  //         ],
  //         initialValue: initval.toString(),
  //         onChanged: (changedval) => setState(() {
  //           initval = changedval;
  //         }),
  //         validator: (value) {
  //           if (value == null || value.isEmpty) {
  //             return 'This field is required';
  //           }
  //           if (cont == contact && contact.text.length != 11) {
  //             print(contact.text);
  //             return "Invalid Contact Number";
  //           }
  //
  //           return null;
  //         },
  //         obscureText: false,
  //         decoration: InputDecoration(
  //           contentPadding:
  //               REdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: new BorderRadius.circular(10.r),
  //               borderSide: BorderSide(color: Colors.black26)),
  //           border: OutlineInputBorder(
  //               borderRadius: new BorderRadius.circular(10.r),
  //               borderSide: BorderSide(color: Colors.black45)),
  //         ),
  //       ),
  //       SizedBox(height: 10.h),
  //     ],
  //   );
  // }
}
