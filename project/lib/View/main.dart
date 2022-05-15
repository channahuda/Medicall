// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:medicall/Providers/hospital_location_provider.dart';
// import 'package:medicall/Providers/hospital_register_provider.dart';
// import 'package:medicall/Providers/patient_form_provider.dart';
// import 'package:medicall/View/home_page.dart';
//
// import 'login.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'edit_hospital.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => HospitalLocationProvider()),
//         ChangeNotifierProvider(create: (_) => HospitalRegisterProvider()),
//         ChangeNotifierProvider(create: (_) => PatientFormProvider()),
//
//         /// ChangeNotifierProvider(create: (_) => CounterProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           primary: const Color(0xff353559),
//         ),
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//   }
//
//   startTimer() async {
//     var duration = const Duration(seconds: 3);
//     return Timer(duration, route);
//   }
//
//   route() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const Login(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF8F8F8),
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.all(30.0),
//           decoration: const BoxDecoration(
//             color: Color(0xFFF7E9EB),
//             shape: BoxShape.circle,
//           ),
//           child: const Image(
//             image: AssetImage('Assets/Medicall (8).png'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:medicall/Providers/edit_hospital_provider.dart';
import 'package:medicall/Providers/hospital_location_provider.dart';
import 'package:medicall/Providers/hospital_login_provider.dart';
import 'package:medicall/Providers/hospital_register_provider.dart';
import 'package:medicall/Providers/patient_form_provider.dart';
import 'package:medicall/View/home_page.dart';
import 'package:medicall/View/patient_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/patient_list_provider.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_hospital.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HospitalLocationProvider()),
        ChangeNotifierProvider(create: (_) => HospitalRegisterProvider()),
        ChangeNotifierProvider(create: (_) => PatientFormProvider()),
        ChangeNotifierProvider(create: (_) => HospitalLoginProvider()),
        ChangeNotifierProvider(create: (_) => EditHospitalProvider()),
        ChangeNotifierProvider(create: (_) => PatientListProvider()),

  /// ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    check_if_already_login();


  }
  late SharedPreferences logindata;
  late bool newuser;
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => PatientList()));
    }
  }
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
    //..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
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
      ),
    );
  }
}
