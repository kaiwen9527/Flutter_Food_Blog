import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/common/snack_bar.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/model/category_model.dart';
import 'package:food_blogger/model/home_model.dart';
import 'package:food_blogger/model/singlefood_model.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryModel = context.watch<CategoryModel>();
    var singleModel = context.watch<SinglefoodModel>();
    var homePage = context.watch<HomeModel>();

    return DefaultTabController(
      initialIndex: 0,
      length: categoryModel.myTabs.length,
      child: Scaffold(
          appBar: AppBar(
            actions: [
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
              SizedBox(
                width: 110.w,
              ),
              TextField(
                controller: categoryModel.labelController,
                decoration: InputDecoration(
                    constraints:
                        BoxConstraints(maxHeight: 60.h, maxWidth: 150.w),
                    prefixIcon: IconButton(
                        onPressed: () {
                          // Tab 的 title 重複的話會報錯
                          if (categoryModel.isThisElement
                              .contains(categoryModel.labelController.text)) {
                            showSnackBar(S.of(context).noRepeat);
                          } else {
                            categoryModel.addLabel(context);
                            singleModel.addText(
                                categoryModel.labelController.text, context);
                            showSnackBar(
                                '${S.of(context).added} ${categoryModel.labelController.text}');
                          }
                        },
                        icon: const Icon(Icons.new_label_outlined)),
                    hintText: S.of(context).addLabel,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r))),
              ),
              SizedBox(
                width: 30.w,
              ),
            ],
            toolbarHeight: 70.h,
            automaticallyImplyLeading: false,
            // 每更新一次 (新增或刪除) 就會重新生成一遍
            bottom: TabBar(
              tabs: [
                ...categoryModel.myTabs.keys.map((label) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        label,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      IconButton(
                          onPressed: () {
                            // 不為空的列表就無法刪除標籤，要先將所有品項清除
                            if (singleModel.childernWidget[label] == null) {
                              // print('刪除標籤');
                              categoryModel.myTabs.remove(label);
                              // 這裡要至少有一個使用到 setState 的
                              // 這樣畫面上才能直接更新 (不然就要手動更新)
                              categoryModel.removeLabel(label);
                              singleModel.noCategorize = false;
                              categoryModel.classificationText.remove(label);
                              singleModel.labels.remove(label);
                              showSnackBar('${S.of(context).removed} $label');
                            } else {
                              showSnackBar(S.of(context).clearFirst);
                            }
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 16,
                          ))
                    ],
                  );
                })
              ],
              isScrollable: true,
            ),
          ),
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
              TabBarView(
                  children: categoryModel.classificationText.values.toList()),
            ],
          )),
    );
  }
}
