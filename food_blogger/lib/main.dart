import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/model/category_model.dart';
import 'package:food_blogger/model/home_model.dart';
import 'package:food_blogger/common/routing_table.dart';
import 'package:food_blogger/common/theme_data.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/model/singlefood_model.dart';
import 'package:food_blogger/page/splash_screen_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModel>(
          create: (context) => HomeModel(),
        ),
        ChangeNotifierProvider<CategoryModel>(
          create: (context) => CategoryModel(),
        ),
        ChangeNotifierProvider<SinglefoodModel>(
          create: (context) => SinglefoodModel(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(340, 1200),
          builder: (context, child) => MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                // 日夜模式切換
                theme: AppThemeData.lightMode,
                darkTheme: AppThemeData.darkMode,
                themeMode: context.watch<HomeModel>().darkLightMode
                    ? ThemeMode.dark
                    : ThemeMode.light,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  S.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                // 語言切換
                locale: context.watch<HomeModel>().multiLingual == 1
                    ? const Locale('en')
                    : const Locale('zh'),
                routes: routesTable,
                home: const SplashScreenPage(), // 進 App 時先進入開場動畫頁面
              )),
    );
  }
}
