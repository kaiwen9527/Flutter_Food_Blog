// 將提示訊息單獨寫成一個檔，這樣要使用時直接呼叫就好

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/main.dart';

BuildContext globalContext = MyApp.navigatorKey.currentState!.overlay!.context;

// 將要提示的訊息內容帶進來即可
void showSnackBar(String message) {
  ScaffoldMessenger.of(globalContext).removeCurrentSnackBar();
  ScaffoldMessenger.of(globalContext).showSnackBar(SnackBar(
    content: Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    duration: const Duration(seconds: 4),
    backgroundColor: Theme.of(globalContext).cardColor,
    behavior: SnackBarBehavior.floating,
    elevation: 30,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    width: 250.w,
  ));
}
