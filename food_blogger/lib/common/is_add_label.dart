import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/common/snack_bar.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/model/category_model.dart';
import 'package:food_blogger/model/singlefood_model.dart';
import 'package:food_blogger/page/articles_list_page.dart';
import 'package:provider/provider.dart';

// 這裡為每個加入標籤後的食物品項樣式
class IsAddLabel extends StatelessWidget {
  const IsAddLabel({super.key});

  @override
  Widget build(BuildContext context) {
    var singleModel = context.watch<SinglefoodModel>();
    var categoryModel = context.watch<CategoryModel>();

    // 這邊的刪除鈕需要去掉的有兩個
    // 1. 加入後圖示的變化
    // 2. classificationText 的 value (labelItems 的內容)
    // (目前先寫死 foodLocations[0].name)
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 30.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.r),
              child: Stack(
                children: [
                  Image.asset(foodLocations[0].imageUrl),
                  // 移除品項的地方
                  Positioned(
                      top: 15.h,
                      right: 15.w,
                      child: IconButton(
                          onPressed: () {
                            singleModel.noCategorize = false;
                            singleModel.removeItems();
                            singleModel.childernWidget
                                .remove(singleModel.newLabel);

                            // 當新增到新的標籤時，舊標籤的地方就將食物品項刪除
                            // 並更新舊標籤的所有食物品項
                            // (map 就是為了更新)
                            categoryModel
                                    .classificationText[singleModel.newLabel] =
                                Column(
                              children: [
                                ...singleModel.labelItems.map((food) {
                                  return food;
                                })
                              ],
                            );
                            showSnackBar(S.of(context).itemRemoved);
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.redAccent,
                            size: 32,
                          ))),
                  Positioned(
                    left: 20.w,
                    bottom: 30.h,
                    child: Text(
                      foodLocations[0].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

// 加入到新標籤後更新所有的食物品項
class ColumnItems extends StatelessWidget {
  const ColumnItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var singleModel = context.watch<SinglefoodModel>();

    return SingleChildScrollView(
      child: Column(children: [
        ...singleModel.labelItems.map((food) {
          return food;
        })
      ]),
    );
  }
}
