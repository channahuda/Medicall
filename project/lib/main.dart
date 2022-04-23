import 'dart:async';
import 'package:medicall/HomePage.dart';
import 'package:medicall/app.dart';

import 'Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff353559),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
//
// class Logo extends StatelessWidget {
//   const Logo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:Container(
//           margin: EdgeInsets.all(30.0),
//           decoration: BoxDecoration(
//               color:Color(0xFFF7E9EB),
//               shape: BoxShape.circle
//           ),
//           child: Image(image: AssetImage('Assets/Medicall (8).png')),
//         ),
//       ),
//     );
//   }
// }
// // class Logo extends StatefulWidget {
// //   const Logo({Key? key}) : super(key: key);
// //
// //   @override
// //   _LogoState createState() => _LogoState();
// // }
//
// class _LogoState extends Logo {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//   }
//
//   startTimer() async{
//     var duration=Duration(seconds:4);
//     return Timer(duration,route);
//   }
//   route(){
//     Navigator.pushReplacement(context,
//     MaterialPageRoute(builder: (context)=> Login()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

//
// class Logo extends StatelessWidget {
//   const Logo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// body: Center(
//   child:Container(
//     margin: EdgeInsets.all(30.0),
//     decoration: BoxDecoration(
//         color:Color(0xFFF7E9EB),
//         shape: BoxShape.circle
//     ),
//   child: Image(image: AssetImage('Assets/Medicall (8).png')),
// ),
// ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            color: Color(0xFFF7E9EB),
            shape: BoxShape.circle,
          ),
          child: const Image(
            image: AssetImage('Assets/Medicall (8).png'),
          ),
        ),
      ),
    );
  }
}
