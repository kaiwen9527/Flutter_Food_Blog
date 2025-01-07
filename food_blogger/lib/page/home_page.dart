import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/common/hero_radial.dart';
import 'package:food_blogger/common/jump_route.dart';
import 'package:food_blogger/common/snack_bar.dart';
import 'package:food_blogger/model/home_model.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homePage = context.watch<HomeModel>();

    DateTime? currentBackPressTime;

    // 退出主畫面時攔截
    bool closeOnConfirm(BuildContext context) {
      DateTime now = DateTime.now();

      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 4)) {
        currentBackPressTime = now;
        showSnackBar(S.of(context).popScope);
        return false;
      }
      return true;
    }

    List<Widget> images = [
      InkWell(
        onTap: () {
          progressDialog('peanut_tofu_page');
        },
        child: Image.asset(
          'images/singleFood/laiPeanutTofu/peanutTofu.jpg',
          fit: BoxFit.contain,
        ),
      ),
      InkWell(
        onTap: () {
          progressDialog('art_coffee_page');
        },
        child: Image.asset(
          'images/singleFood/artCoffeeDeli/cafeSnacks.jpg',
          fit: BoxFit.contain,
        ),
      ),
      InkWell(
        onTap: () {
          progressDialog('sinkty_tofu_page');
        },
        child: Image.asset(
          'images/singleFood/nonsense/stinkyTofu.jpg',
          fit: BoxFit.contain,
        ),
      ),
    ];

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (closeOnConfirm(context)) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          body: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Image.asset(
                      homePage.darkLightMode
                          ? 'images/homePage/backgroundImageDark.png'
                          : 'images/homePage/backGroundImage.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40.h,
                        ),
                        // 語言切換
                        Align(
                          alignment: const Alignment(0.9, 0),
                          child: PopupMenuButton(
                            icon: const Icon(Icons.language),
                            iconSize: 36,
                            tooltip: S.of(context).language,
                            itemBuilder: (context) => <PopupMenuItem<int>>[
                              PopupMenuItem<int>(
                                  value: 1, child: Text(S.of(context).en)),
                              PopupMenuItem<int>(
                                  value: 2, child: Text(S.of(context).zh)),
                            ],
                            onSelected: (value) {
                              homePage.langSwitch(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 35.w,
                            right: 30.w,
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CircleAvatar(
                                    radius: 68.r,
                                    child: const RadialExpansionDemo(),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Text(
                                    S.of(context).username,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.double,
                                        height: 1,
                                        decorationColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              // 自介
                              Align(
                                alignment: const Alignment(-0.8, 0),
                                child: Text(
                                  S.of(context).introduction,
                                  style: TextStyle(
                                      height: 1.8,
                                      fontSize: 14.sp,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                children: <Widget>[
                                  // '文章
                                  Expanded(
                                      child: Align(
                                    alignment: const Alignment(-0.4, 0),
                                    child: Text(
                                      S.of(context).article,
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp),
                                    ),
                                  )),
                                  // '粉絲
                                  Expanded(
                                      child: Align(
                                    alignment: const Alignment(-0.5, 0),
                                    child: Text(S.of(context).fan,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp)),
                                  )),
                                  // '瀏覽
                                  Expanded(
                                      child: Align(
                                    alignment: const Alignment(-0.4, 0),
                                    child: Text(S.of(context).browse,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp)),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 80.h,
                              ),
                              // '美食文章',
                              Material(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(50.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50.r),
                                  onTap: () {
                                    progressDialog('food_list_page');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 250.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Text(
                                      S.of(context).foodList,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              // 分類列表
                              Material(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(50.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50.r),
                                  onTap: () {
                                    progressDialog('category_page');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 250.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Text(
                                      S.of(context).classification,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80.h,
                              ),
                              // 輪播圖片
                              SizedBox(
                                width: 0.7.sw,
                                height: 250.h,
                                child: Stack(
                                  children: [
                                    PageView.builder(
                                        itemCount: images.length,
                                        allowImplicitScrolling: true,
                                        controller: PageController(
                                            initialPage:
                                                homePage.currentPageIndex),
                                        onPageChanged: (page) {
                                          homePage.progressIndicator(page);
                                        },
                                        itemBuilder: (context, index) {
                                          return images[index];
                                        }),
                                    Positioned(
                                      bottom: 10.h,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(images.length,
                                              (index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3.w),
                                              width: 10.w,
                                              height: 10.h,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: homePage
                                                              .currentPageIndex ==
                                                          index
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.grey),
                                            );
                                          })),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).disabledColor,
            onPressed: homePage.darkLightSwitch,
            child: homePage.darkLightMode
                ? const Icon(
                    Icons.light_mode,
                    color: Colors.deepOrange,
                  )
                : Icon(
                    Icons.dark_mode,
                    color: Colors.grey[700],
                  ),
          ),
        ));
  }
}
