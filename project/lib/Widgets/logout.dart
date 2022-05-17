import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logout_dialog_box.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context) =>
          //remove stack when it is final that text is not needed
          IconButton(
            // icon: Image.asset(
            //   'Assets/logout.png',
            //   height: 30.h,
            // ),
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              LogoutDialog logout=new LogoutDialog();
              logout.showLogoutDialog(context);
              //LogoutDialog.showLogoutDialog(context);
            },
          ),
    );
  }
}
