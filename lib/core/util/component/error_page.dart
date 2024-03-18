import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.red.shade700,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
