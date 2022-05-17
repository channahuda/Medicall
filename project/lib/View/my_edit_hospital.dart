// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medicall/Providers/edit_hospital_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:medicall/Widgets/exit_bottom_sheet.dart';
//
// class MyEditHospital extends StatefulWidget {
//   const MyEditHospital({Key? key}) : super(key: key);
//
//   @override
//   State<MyEditHospital> createState() => _MyEditHospitalState();
// }
//
// class _MyEditHospitalState extends State<MyEditHospital> {
//   TextEditingController hospitalname = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<EditHospitalProvider>().editHospital();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isLoading = context.watch<EditHospitalProvider>().isLoading;
//     return WillPopScope(
//
//       child: Scaffold(
//         body: isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   Text('Hello'),
//                   MyInputWidget(
//                       label: "Hospital Name",
//                       // initval: hospitalname,
//                       initval: context
//                           .watch<EditHospitalProvider>()
//                           .hospitalmodel
//                           ?.name ?? '',
//                       cont: hospitalname),
//                 ],
//               ),
//       ),
//     );
//   }
//
//   Widget inputFile({label, initval, cont}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 15.sp,
//               fontWeight: FontWeight.w400,
//               color: Colors.black),
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         TextFormField(
//           initialValue: initval.toString(),
//           controller: cont,
//           // onChanged: (changedval)  {
//           //   cont = TextEditingController(text:changedval);
//           // },
//           // controller: cont,
//           // validator: (value) {
//           //   if (value == null || value.isEmpty) {
//           //     return 'This field is required';
//           //   } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//           //       .hasMatch(value) &&
//           //       cont == email) {
//           //     return ("Please Enter a valid email");
//           //   }
//           //   return null;
//           // },
//           obscureText: false,
//           decoration: InputDecoration(
//             contentPadding:
//                 REdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: new BorderRadius.circular(10.r),
//                 borderSide: BorderSide(color: Colors.black26)),
//             border: OutlineInputBorder(
//                 borderRadius: new BorderRadius.circular(10.r),
//                 borderSide: BorderSide(color: Colors.black45)),
//           ),
//         ),
//         SizedBox(height: 10.h),
//       ],
//     );
//   }
// }
//
// class MyInputWidget extends StatelessWidget {
//   final String initval;
//   final TextEditingController cont;
//   final String label;
//   const MyInputWidget({
//     Key? key,
//     required this.initval,
//     required this.cont,
//     required this.label,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 15.sp,
//               fontWeight: FontWeight.w400,
//               color: Colors.black),
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         TextFormField(
//           // initialValue: initval.toString(),
//           controller: cont..text = initval,
//           // onChanged: (changedval)  {
//           //   cont = TextEditingController(text:changedval);
//           // },
//           // controller: cont,
//           // validator: (value) {
//           //   if (value == null || value.isEmpty) {
//           //     return 'This field is required';
//           //   } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//           //       .hasMatch(value) &&
//           //       cont == email) {
//           //     return ("Please Enter a valid email");
//           //   }
//           //   return null;
//           // },
//           obscureText: false,
//           decoration: InputDecoration(
//             contentPadding:
//                 REdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: new BorderRadius.circular(10.r),
//                 borderSide: BorderSide(color: Colors.black26)),
//             border: OutlineInputBorder(
//                 borderRadius: new BorderRadius.circular(10.r),
//                 borderSide: BorderSide(color: Colors.black45)),
//           ),
//         ),
//         SizedBox(height: 10.h),
//       ],
//     );
//   }
// }
