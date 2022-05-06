

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitDialog extends StatefulWidget {
  const SubmitDialog({Key? key}) : super(key: key);

  @override
  State<SubmitDialog> createState() => _SubmitDialogState();
}

class _SubmitDialogState extends State<SubmitDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: REdgeInsets.fromLTRB(50, 30, 50, 30),
      content: Text(
        'Form Has Been Submitted',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
