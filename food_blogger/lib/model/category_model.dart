import 'package:flutter/material.dart';
// import 'package:food_blogger/model/singlefood_model.dart';
// import 'package:provider/provider.dart';

class CategoryModel extends ChangeNotifier {
  final labelController = TextEditingController();

  // late List<Tab> myTabs = <Tab>[];

  late Map<String, Tab> myTabs = {}; // TabBar 的主題名稱

  // List<String> classification = [];

  Map<String, Widget> classificationText = {}; // TabBar 的介面

  List<String> isThisElement = []; // 儲存 Tab 名稱

  // 新增頁面時先替代的
  List<Widget> foodName = [];

  // 移除標籤
  void removeLabel(String label) {
    isThisElement.remove(label);

    notifyListeners();
  }

  // 新增 TabBar 標籤
  void addLabel(BuildContext context) {
    // 新增顯示 TabBar 的標題文字
    myTabs.addAll({
      labelController.text: Tab(
        text: labelController.text,
      ),
    });

    // 為了判斷 Tab 裡是否有相同名稱的元素
    isThisElement.add(labelController.text);

    // 新增 TabBarView 的頁面
    classificationText.addAll({
      labelController.text: Column(
        children: foodName,
      )
    });

    notifyListeners();
  }
}
