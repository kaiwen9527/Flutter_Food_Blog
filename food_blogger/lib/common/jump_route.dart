// 將跳轉路由時的進度等待對話框單獨寫一個檔

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/main.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

BuildContext globalContext = MyApp.navigatorKey.currentState!.overlay!.context;

ProgressDialog pr = ProgressDialog(globalContext);

// 將要跳的路由名稱帶進來即可
void progressDialog(String pushName) {
  pr.style(
    message: S.of(globalContext).loading,
    borderRadius: 80.r,
    messageTextStyle: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16.sp, color: Colors.blueGrey),
  );

  pr.show();
  Future.delayed(const Duration(seconds: 1)).then((v) {
    pr.hide().whenComplete(() {
      // ignore: use_build_context_synchronously
      Navigator.of(globalContext).pushNamed(pushName);
    });
  });
}
