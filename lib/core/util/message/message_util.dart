import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/main.dart';

class MessageUtil {
  static final MessageUtil _main = MessageUtil._internal();
  factory MessageUtil() {
    return _main;
  }

  MessageUtil._internal();

  Future<void> showMessage(
      double marinBottom, String message, String label, int status) async {
    scaffolMsgKeyGlobal.currentState!.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        backgroundColor: status == 1 ? Colors.green : Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        content: Container(
          width: 100.w,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Gap(14),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        )));
  }
}
