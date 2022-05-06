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
          Stack(
        children: [
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
              LogoutDialog.showLogoutDialog(context);
            },
          ),
          // Positioned(
          //   bottom: 5.h,
          //   child: InkWell(
          //     child: Text(
          //       'Logout',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 10.sp,
          //       ),
          //     ),
          //     onTap: () {
          //       LogoutDialog.showLogoutDialog(context);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
