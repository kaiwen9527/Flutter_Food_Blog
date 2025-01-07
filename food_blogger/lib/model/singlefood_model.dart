import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/common/is_add_label.dart';
import 'package:food_blogger/common/snack_bar.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/main.dart';
import 'package:food_blogger/model/category_model.dart';
import 'package:provider/provider.dart';

class SinglefoodModel extends ChangeNotifier {
  BuildContext globalContext =
      MyApp.navigatorKey.currentState!.overlay!.context;

  int currentPageIndex = 0;

  IconData actionIcon = Icons.add_circle_outline_rounded;

  // 點選哪個食物品項後會改成那個的名稱
  int isSelectFood = 0;

  // 判斷是否有加入分類
  bool noCategorize = false;

  // List<Widget> labels = [];

  // 將新增的標籤 Widget 儲存到此
  // (對話框顯示的標籤)
  late Map<String, Widget> labels = {};

  // 食物品項
  late Widget text = const IsAddLabel();

  // 儲存加入標籤的食物品名
  List<Widget> labelItems = [];

  // 為了能在外部取得 label 的資料
  String newLabel = '';

  // 讓每個 Column 的 children 都有一個 key 可來辨識
  late Map<String, List> childernWidget = {};

  void addItems() {
    labelItems.add(text);
    // print('目前此類別裡有的食物品項 : $labelItems');

    notifyListeners();
  }

  void removeItems() {
    labelItems.remove(text);
    // print('目前此類別裡有的食物品項 : $labelItems');

    notifyListeners();
  }

  // 當標籤被新增時儲存至 labels (對話框裡的 List)
  void addText(String label, BuildContext context) {
    var categoryModel = context.read<CategoryModel>();

    // 新增對話框裡每一個可選擇的標籤
    labels.addAll({
      label: TextButton(
          onPressed: () {
            // 如果不是用全局的 context，返回會報錯
            // 因為 context 的位置不同，然後主要是另一邊的 context 目前是停用狀態
            // (如果是用 CategoryListPage 那邊的 context 的話)
            Navigator.of(globalContext).pop();

            // 加入分類後會改變 Icon 樣式
            noCategorize = true;

            // 將食物品項加進某個標籤類別
            // 判斷有無某個食物品項
            // 而當已加入的品項會告知目前已經加入到哪個標籤了
            if (labelItems.contains(text) == false) {
              categoryModel.classificationText[label] = const ColumnItems();
              newLabel = label;
              addItems();
              childernWidget = {newLabel: labelItems}; // 需判斷目前標籤裡有哪些品項
              showSnackBar('${S.of(globalContext).joined}$label');
            } else if (label == newLabel) {
              showSnackBar(S.of(globalContext).added);
            } else {
              showSnackBar('${S.of(globalContext).alreadyAdded} $newLabel');
            }

            notifyListeners();
          },
          child: Text(label))
    });
    // }

    notifyListeners();
  }

  // 單一品項照片的進度指示器
  // (需跟主頁的區別，不然會顯示一樣的進度)
  void progressIndicator(int page) {
    currentPageIndex = page;

    notifyListeners();
  }

  // 顯示可選擇標籤對話框的圖示
  // 並判斷有加入或取消加入時的圖示顯示
  void addToCategory(BuildContext context) {
    if (actionIcon == Icons.add_circle_outline_rounded) {
      _showSimpleDialog(context);
    } else {
      actionIcon = Icons.add_circle_outline_rounded;
    }

    notifyListeners();
  }

  // 選擇某個標籤後就會直接加入分類，然後退出對話框
  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(
            child: Text(
              S.of(context).tagCategorize,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 14.sp),
            ),
          ),
          children: labels.values.toList(),
        );
      },
    );
  }
}
