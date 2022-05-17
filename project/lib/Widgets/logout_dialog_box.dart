import 'package:flutter/material.dart';
import 'package:medicall/Providers/hospital_location_provider.dart';
import 'package:provider/provider.dart';
import '../View/login.dart';
//
// class LogoutDialogs extends StatefulWidget {
//   const LogoutDialogs({Key? key}) : super(key: key);
//
//   @override
//   State<LogoutDialogs> createState() => _LogoutDialogsState();
// }
//
// class _LogoutDialogsState extends State<LogoutDialogs> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


class LogoutDialog {
 // bool loginDialog = false;

  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                "YES",
                style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
              ),
              onPressed: () {
               // loginDialog = true;
               context.read<HospitalLocationProvider>().signOut(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Login(),
                  ),
                      (route) => false,
                );
              },
            ),
            FlatButton(
              child: const Text(
                "NO",
                style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
              ),
              onPressed: () {
              //  loginDialog = false;
                Navigator.of(context).pop();
              },
            ),
           ],
        );
      },
    );
    }
  }