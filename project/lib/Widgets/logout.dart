import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logout_dialog_box.dart';

class Logout extends StatefulWidget {
  //String type;
  const Logout({ Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) => IconButton(
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          LogoutDialog logout = LogoutDialog();
          logout.showLogoutDialog(context);
        },
      ),
    );
  }
}
