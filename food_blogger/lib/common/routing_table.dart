import 'package:flutter/material.dart';
import 'package:food_blogger/page/articles_list_page.dart';
import 'package:food_blogger/page/category_list_page.dart';
import 'package:food_blogger/page/home_page.dart';
import 'package:food_blogger/singlefoodinterface/art_coffee_page.dart';
import 'package:food_blogger/singlefoodinterface/peanut_tofu_page.dart';
import 'package:food_blogger/singlefoodinterface/stinky_tofu_page.dart';

Map<String, WidgetBuilder> routesTable = {
  "home_page": (context) => const HomePage(),
  "food_list_page": (context) => const FoodArticlesList(),
  "category_page": (context) => const CategoryListPage(),

  // 單一美食界面
  "peanut_tofu_page": (context) => const PeanutTofuPage(),
  "art_coffee_page": (context) => const ArtCoffeePage(),
  "sinkty_tofu_page": (context) => const StinkyTofuPage(),
};
