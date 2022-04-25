import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Entities/LogoutDialog.dart';

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
      builder: (BuildContext context) => Stack(
        children: [
          IconButton(
            icon: Image.asset(
              'Assets/logout.png',
              height: 30.h,
            ),
            onPressed: () {
              LogoutDialog.showLogoutDialog(context);
            },
          ),
          Positioned(
            bottom: 5.h,
            child: InkWell(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                ),
              ),
              onTap: () {
                LogoutDialog.showLogoutDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
