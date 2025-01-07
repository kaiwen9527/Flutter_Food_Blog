import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  bool darkLightMode = false;
  int multiLingual = 2;
  int currentPageIndex = 0;

  // 日夜切換
  void darkLightSwitch() {
    darkLightMode = !darkLightMode;
    notifyListeners();
  }

  // 語言切換
  void langSwitch(value) {
    multiLingual = value;

    notifyListeners();
  }

  // 主頁圖片的進度指示器
  void progressIndicator(int page) {
    currentPageIndex = page;

    notifyListeners();
  }
}
