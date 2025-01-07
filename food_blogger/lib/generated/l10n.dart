// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `kaiwen`
  String get title {
    return Intl.message(
      'kaiwen',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Traditional Chinese`
  String get zh {
    return Intl.message(
      'Traditional Chinese',
      name: 'zh',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `You have pushed the button this many times: :`
  String get content {
    return Intl.message(
      'You have pushed the button this many times: :',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Kai who likes to eat`
  String get username {
    return Intl.message(
      'Kai who likes to eat',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `People who like to collect food /\nWant to record and share the food I eat /\nMobile phone shooting /\nWhen I have time, I want to go to various places to eat. ~`
  String get introduction {
    return Intl.message(
      'People who like to collect food /\nWant to record and share the food I eat /\nMobile phone shooting /\nWhen I have time, I want to go to various places to eat. ~',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Article : 51`
  String get article {
    return Intl.message(
      'Article : 51',
      name: 'article',
      desc: '',
      args: [],
    );
  }

  /// `Fan : 607`
  String get fan {
    return Intl.message(
      'Fan : 607',
      name: 'fan',
      desc: '',
      args: [],
    );
  }

  /// `Browse : 3652`
  String get browse {
    return Intl.message(
      'Browse : 3652',
      name: 'browse',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Food articles`
  String get foodList {
    return Intl.message(
      'Food articles',
      name: 'foodList',
      desc: '',
      args: [],
    );
  }

  /// `Category list`
  String get classification {
    return Intl.message(
      'Category list',
      name: 'classification',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Add label`
  String get addLabel {
    return Intl.message(
      'Add label',
      name: 'addLabel',
      desc: '',
      args: [],
    );
  }

  /// `Peanut Tofu`
  String get peanutTofu {
    return Intl.message(
      'Peanut Tofu',
      name: 'peanutTofu',
      desc: '',
      args: [],
    );
  }

  /// `Neipu Township`
  String get neipu {
    return Intl.message(
      'Neipu Township',
      name: 'neipu',
      desc: '',
      args: [],
    );
  }

  /// `PeanutTofu $ 30`
  String get peanutTofuPrice {
    return Intl.message(
      'PeanutTofu \$ 30',
      name: 'peanutTofuPrice',
      desc: '',
      args: [],
    );
  }

  /// `comprehensive douhua $ 40`
  String get douhuaPrice {
    return Intl.message(
      'comprehensive douhua \$ 40',
      name: 'douhuaPrice',
      desc: '',
      args: [],
    );
  }

  /// `Pesto Toast Sticks $ 60`
  String get pestoToast {
    return Intl.message(
      'Pesto Toast Sticks \$ 60',
      name: 'pestoToast',
      desc: '',
      args: [],
    );
  }

  /// `Chocolate Pound Cake $ 120`
  String get chocolateCake {
    return Intl.message(
      'Chocolate Pound Cake \$ 120',
      name: 'chocolateCake',
      desc: '',
      args: [],
    );
  }

  /// `Cinnamon rolls $ 90`
  String get cinnamonRolls {
    return Intl.message(
      'Cinnamon rolls \$ 90',
      name: 'cinnamonRolls',
      desc: '',
      args: [],
    );
  }

  /// `Enzyme stinky tofu (large) $ 80`
  String get stinkyTofuPrice {
    return Intl.message(
      'Enzyme stinky tofu (large) \$ 80',
      name: 'stinkyTofuPrice',
      desc: '',
      args: [],
    );
  }

  /// `        Peanut tofu itself is almost a combination of the light flavors of peanuts and tofu. It would be tasteless if eaten alone, so there is soy sauce to add on the side. It tastes quite good after being drizzled with soy sauce, but I think the combination of the two is a bit awkward and not as fusion as I imagined.\nThe difference between tofu pudding and the usual tofu pudding is that it is made with millet, a food unique to Pingtung. This makes the tofu pudding taste richer, and the millet is a good match, so the flavors won’t be different. overall very delicious.`
  String get peanutTofuContent {
    return Intl.message(
      '        Peanut tofu itself is almost a combination of the light flavors of peanuts and tofu. It would be tasteless if eaten alone, so there is soy sauce to add on the side. It tastes quite good after being drizzled with soy sauce, but I think the combination of the two is a bit awkward and not as fusion as I imagined.\nThe difference between tofu pudding and the usual tofu pudding is that it is made with millet, a food unique to Pingtung. This makes the tofu pudding taste richer, and the millet is a good match, so the flavors won’t be different. overall very delicious.',
      name: 'peanutTofuContent',
      desc: '',
      args: [],
    );
  }

  /// `        I think this place is very suitable for friends who don't like drinking but still want to experience the bar atmosphere. Simply order some desserts and coffee and sit here to enjoy. When I sit here with my friends, 2 or 3 hours pass by without me noticing ...`
  String get artCoffeeContent {
    return Intl.message(
      '        I think this place is very suitable for friends who don\'t like drinking but still want to experience the bar atmosphere. Simply order some desserts and coffee and sit here to enjoy. When I sit here with my friends, 2 or 3 hours pass by without me noticing ...',
      name: 'artCoffeeContent',
      desc: '',
      args: [],
    );
  }

  /// `        This enzyme stinky tofu is truly the best in the world. When I first came to this restaurant, I had to wait for quite a while because they fried the food upon order. But after taking a bite, I thought, 'It was worth the wait ~'.\nAlthough the environment is not very beautiful and exquisite, it is at least clean and sanitary. It is comfortable to enjoy the stinky tofu they added. Overall, I think it is great.`
  String get stinkyTofuContent {
    return Intl.message(
      '        This enzyme stinky tofu is truly the best in the world. When I first came to this restaurant, I had to wait for quite a while because they fried the food upon order. But after taking a bite, I thought, \'It was worth the wait ~\'.\nAlthough the environment is not very beautiful and exquisite, it is at least clean and sanitary. It is comfortable to enjoy the stinky tofu they added. Overall, I think it is great.',
      name: 'stinkyTofuContent',
      desc: '',
      args: [],
    );
  }

  /// `No.465, Hexing Road, Neipu Township, Pingtung County 912`
  String get peanutTofuAddress {
    return Intl.message(
      'No.465, Hexing Road, Neipu Township, Pingtung County 912',
      name: 'peanutTofuAddress',
      desc: '',
      args: [],
    );
  }

  /// `No. 12, Rende Road, Pingtung City, Pingtung County 900`
  String get artCoffeeAddress {
    return Intl.message(
      'No. 12, Rende Road, Pingtung City, Pingtung County 900',
      name: 'artCoffeeAddress',
      desc: '',
      args: [],
    );
  }

  /// `No. 86, Wanda Road, Wanhua District, Taipei City 108`
  String get stinkyTofuAddress {
    return Intl.message(
      'No. 86, Wanda Road, Wanhua District, Taipei City 108',
      name: 'stinkyTofuAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address :`
  String get address {
    return Intl.message(
      'Address :',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Art Coffee Deli`
  String get artCoffee {
    return Intl.message(
      'Art Coffee Deli',
      name: 'artCoffee',
      desc: '',
      args: [],
    );
  }

  /// `Pingtung City`
  String get pingtung {
    return Intl.message(
      'Pingtung City',
      name: 'pingtung',
      desc: '',
      args: [],
    );
  }

  /// `Chuyuan Ramen`
  String get ramen {
    return Intl.message(
      'Chuyuan Ramen',
      name: 'ramen',
      desc: '',
      args: [],
    );
  }

  /// `NiNôo Café (NiNoo)`
  String get ninoo {
    return Intl.message(
      'NiNôo Café (NiNoo)',
      name: 'ninoo',
      desc: '',
      args: [],
    );
  }

  /// `Luodong Town`
  String get luodong {
    return Intl.message(
      'Luodong Town',
      name: 'luodong',
      desc: '',
      args: [],
    );
  }

  /// `Nonsense stinky tofu`
  String get stinkTofu {
    return Intl.message(
      'Nonsense stinky tofu',
      name: 'stinkTofu',
      desc: '',
      args: [],
    );
  }

  /// `Wanhua District`
  String get wanhua {
    return Intl.message(
      'Wanhua District',
      name: 'wanhua',
      desc: '',
      args: [],
    );
  }

  /// `Vegetarian Food`
  String get vegetarian {
    return Intl.message(
      'Vegetarian Food',
      name: 'vegetarian',
      desc: '',
      args: [],
    );
  }

  /// `Zuoying District`
  String get zuoying {
    return Intl.message(
      'Zuoying District',
      name: 'zuoying',
      desc: '',
      args: [],
    );
  }

  /// `Wind Volcano Forest`
  String get windVolcano {
    return Intl.message(
      'Wind Volcano Forest',
      name: 'windVolcano',
      desc: '',
      args: [],
    );
  }

  /// `Sanchong District`
  String get sanchong {
    return Intl.message(
      'Sanchong District',
      name: 'sanchong',
      desc: '',
      args: [],
    );
  }

  /// `No more data ...`
  String get noMoreData {
    return Intl.message(
      'No more data ...',
      name: 'noMoreData',
      desc: '',
      args: [],
    );
  }

  /// `Please select the label to classify :`
  String get tagCategorize {
    return Intl.message(
      'Please select the label to classify :',
      name: 'tagCategorize',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit the application to the home screen`
  String get popScope {
    return Intl.message(
      'Press again to exit the application to the home screen',
      name: 'popScope',
      desc: '',
      args: [],
    );
  }

  /// `Tag name cannot be repeated`
  String get noRepeat {
    return Intl.message(
      'Tag name cannot be repeated',
      name: 'noRepeat',
      desc: '',
      args: [],
    );
  }

  /// `Added `
  String get added {
    return Intl.message(
      'Added ',
      name: 'added',
      desc: '',
      args: [],
    );
  }

  /// `Added to `
  String get joined {
    return Intl.message(
      'Added to ',
      name: 'joined',
      desc: '',
      args: [],
    );
  }

  /// `Removed `
  String get removed {
    return Intl.message(
      'Removed ',
      name: 'removed',
      desc: '',
      args: [],
    );
  }

  /// `Please clear all added items first`
  String get clearFirst {
    return Intl.message(
      'Please clear all added items first',
      name: 'clearFirst',
      desc: '',
      args: [],
    );
  }

  /// `This product item has been added to `
  String get alreadyAdded {
    return Intl.message(
      'This product item has been added to ',
      name: 'alreadyAdded',
      desc: '',
      args: [],
    );
  }

  /// `Item removed`
  String get itemRemoved {
    return Intl.message(
      'Item removed',
      name: 'itemRemoved',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
