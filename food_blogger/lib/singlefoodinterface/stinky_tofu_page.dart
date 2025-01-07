import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/model/home_model.dart';
import 'package:food_blogger/model/singlefood_model.dart';
import 'package:provider/provider.dart';

class StinkyTofuPage extends StatelessWidget {
  const StinkyTofuPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Image> images = [
      Image.asset(
        'images/singleFood/nonsense/stinkyTofu.jpg',
      ),
      Image.asset(
        'images/singleFood/nonsense/environment.jpg',
      ),
    ];

    var singleFoodModel = context.watch<SinglefoodModel>();
    var homePage = context.watch<HomeModel>();

    return Scaffold(
        body: Stack(
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
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 35.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.grey.withAlpha(150),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.logout,
                          )),
                    ),
                    Text(
                      S.of(context).stinkTofu,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 30.w,
                    )
                    // AnimatedSwitcher(
                    //   duration: const Duration(milliseconds: 200),
                    //   transitionBuilder: (child, animation) {
                    //     return ScaleTransition(scale: animation, child: child);
                    //   },
                    //   child: IconButton(
                    //     key: ValueKey(singleFoodModel.actionIcon),
                    //     iconSize: 32,
                    //     onPressed: () {
                    //       singleFoodModel.addToCategory(context);
                    //     },
                    //     icon: Icon(
                    //       singleFoodModel.noCategorize
                    //           ? Icons.add_circle
                    //           : Icons.add_circle_outline_rounded,
                    //       color: Colors.red[300],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                // 照片
                SizedBox(
                  height: 320.h,
                  child: Stack(
                    children: [
                      PageView.builder(
                          itemCount: images.length,
                          allowImplicitScrolling: true,
                          controller: PageController(
                              initialPage: singleFoodModel.currentPageIndex),
                          onPageChanged: (page) {
                            singleFoodModel.progressIndicator(page);
                          },
                          itemBuilder: (context, index) {
                            return images[index];
                          }),
                      Positioned(
                        bottom: 20.h,
                        left: 0,
                        right: 0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(images.length, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: singleFoodModel.currentPageIndex ==
                                            index
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey),
                              );
                            })),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                // 心得內容
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    S.of(context).stinkyTofuContent,
                    style: TextStyle(fontSize: 13.sp, height: 1.8),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(),
                // 食物的名稱與價位
                ListTile(
                  leading: Icon(
                    Icons.keyboard_double_arrow_right,
                    size: 20,
                    color: Colors.deepPurpleAccent[100],
                  ),
                  title: Text(
                    S.of(context).stinkyTofuPrice,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 13.sp),
                  ),
                ),
                const Divider(),
                // 地址
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      margin: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          color: Colors.grey[300]!.withAlpha(150),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        S.of(context).address,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Theme.of(context).iconTheme.color
                            // color: Colors.grey
                            ),
                      ),
                    )),
                ListTile(
                  leading: const Icon(
                    Icons.location_on_outlined,
                    size: 24,
                  ),
                  title: Text(
                    S.of(context).stinkyTofuAddress,
                    // '108 台北市萬華區萬大路 86 號',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
