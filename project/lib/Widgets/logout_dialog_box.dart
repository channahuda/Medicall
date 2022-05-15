import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../View/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogoutDialog {
  static bool loginDialog = false;


  static showLogoutDialog(BuildContext context) {
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
                loginDialog = true;
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
                loginDialog = false;
                Navigator.of(context).pop();
              },
            ),
           ],
        );
      },
    );
    }
  }