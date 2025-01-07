import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightMode = ThemeData(
    primaryColor: Colors.blueGrey, // 替代內容文字顏色
    cardColor: Colors.blueGrey[300], // 替代提示框的背景顏色
    iconTheme: const IconThemeData(color: Colors.black), // icon 顏色
    dialogBackgroundColor: Colors.purple[50],
    disabledColor: Colors.purple[50], // 替代日夜切換的浮動按鈕背景顏色

    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        onSurface: Colors.blueGrey, // 替代滑至頂部按鈕顏色
        onSecondary: Colors.grey, // 替代物件邊框顏色
        onTertiary: Colors.black, // 替代滑至頂部的 Icon 顏色
        seedColor: Colors.deepPurpleAccent,
        inversePrimary: Colors.deepPurple[200]),
    useMaterial3: true,
  );

  static ThemeData darkMode = ThemeData(
    primaryColor: Colors.white, // 替代內容文字顏色
    scaffoldBackgroundColor: Colors.blueGrey,
    cardColor: Colors.white, // 替代提示框的背景顏色
    iconTheme: const IconThemeData(color: Colors.white), // icon 顏色
    dialogBackgroundColor: Colors.brown[400],
    appBarTheme: const AppBarTheme(color: Colors.black54),
    disabledColor: Colors.grey, // 替代日夜切換的浮動按鈕背景顏色

    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        onSecondary: Colors.white, // 替代物件邊框顏色
        onSurface: Colors.white, // 替代滑至頂部按鈕顏色
        onTertiary: Colors.white, // 替代滑至頂部的 Icon 顏色
        seedColor: Colors.white,
        inversePrimary: Colors.white),
  );
}
