import 'package:flutter/material.dart';
import '../View/Login.dart';

class LogoutDialog {
  static showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('Alert Dialog Title Text.'),
          content: Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "YES",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
              ),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Login(),
                //   ),
                // );
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
              child: Text(
                "NO",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
              ),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
