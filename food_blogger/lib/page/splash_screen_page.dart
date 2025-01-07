import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<StatefulWidget>
    with TickerProviderStateMixin {
  bool startAnimation = false;

  late Animation<Color?> iconAnimation;
  late Animation<Color?> textAnimation;
  late Animation<double> iconSize;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // icon 縮放過程
    iconSize = Tween(begin: 36.0, end: 128.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    iconAnimation =
        ColorTween(begin: Colors.orange[200], end: Colors.brown[300])
            .animate(controller)
          ..addListener(() {
            setState(() {});
          });

    // 文字顏色過渡過程
    textAnimation = ColorTween(begin: Colors.white, end: Colors.blueGrey[600])
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Image.asset(
            'images/homePage/backGroundImage.png',
            fit: BoxFit.fill,
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 以下的所有動畫是一起跑的
          // 不會誰先誰後的
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: 20.h,
                width: startAnimation ? 0.55.sw : 0,
                color:
                    startAnimation ? Colors.blueGrey[300] : Colors.indigo[200],
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            AnimatedOpacity(
              opacity: startAnimation ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: AnimatedContainer(
                duration: const Duration(seconds: 4),
                width: startAnimation ? 250.w : 0.0,
                child: Icon(
                  Icons.fastfood,
                  color: iconAnimation.value,
                  size: iconSize.value,
                ),
                onEnd: () {
                  // 當動畫跑完後自動跳至主頁
                  Navigator.of(context).pushNamed('home_page');
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            AnimatedOpacity(
              opacity: startAnimation ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              child: Text(
                'Food Sharing World',
                style: TextStyle(fontSize: 24.sp, color: textAnimation.value),
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: 20.h,
                width: startAnimation ? 0.55.sw : 0,
                color:
                    startAnimation ? Colors.indigo[200] : Colors.blueGrey[300],
              ),
            )
          ],
        ))
      ],
    ));
  }
}
