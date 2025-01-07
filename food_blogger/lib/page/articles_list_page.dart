import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_blogger/generated/l10n.dart';
import 'package:food_blogger/model/home_model.dart';
import 'package:provider/provider.dart';

class FoodArticlesList extends StatefulWidget {
  const FoodArticlesList({super.key});

  @override
  State<StatefulWidget> createState() => _FoodArticlesListState();
}

class _FoodArticlesListState extends State<StatefulWidget> {
  ScrollController toTopController = ScrollController();

  // 上拉加載
  late EasyRefreshController _controller;
  bool showNoData = false;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(controlFinishLoad: true);
    toTopController.addListener(() async {
      // 當滾動到最底下時觸發
      if (toTopController.position.pixels ==
          toTopController.position.maxScrollExtent) {
        await Future.delayed(const Duration(milliseconds: 500)).then((v) {
          setState(() {
            showNoData = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
    toTopController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homePage = context.watch<HomeModel>();

    Future onRefresh() async {
      await Future.delayed(const Duration(seconds: 2));
    }

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
          // 建立一個清單來保存視差的項目 (就是每篇文章的封面樣式)
          Scrollbar(
            child: SingleChildScrollView(
              controller: toTopController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, top: 40.h, bottom: 10.h),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.grey.withAlpha(150),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.r),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                              width: 35.w,
                              height: 35.w,
                              child: const Icon(Icons.logout),
                            ),
                          ),
                        ),
                      )),
                  for (final location in foodLocations)
                    FoodLocationListItem(
                      id: location.id,
                      imageUrl: location.imageUrl,
                      name: location.name,
                      country: location.place,
                    ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Visibility(
                      visible: showNoData,
                      child: FutureBuilder(
                        future: onRefresh(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 80.w),
                              leading: const Icon(Icons.no_sim_outlined),
                              title: Text(
                                S.of(context).noMoreData,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // 滾至頂部
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
        onPressed: () {
          toTopController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
        },
        child: Icon(
          Icons.vertical_align_top_rounded,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// (每個食物品項的樣式)

class FoodLocation {
  const FoodLocation({
    required this.name,
    required this.place,
    required this.imageUrl,
    required this.id,
  });

  final String name;
  final String place;
  final String imageUrl;
  final int id;
}

List<FoodLocation> foodLocations = [
  const FoodLocation(
    id: 1,
    name: 'Peanut Tofu',
    place: 'Neipu Township',
    imageUrl: 'images/singleFood/laiPeanutTofu/peanutTofu.jpg',
  ),
  const FoodLocation(
    id: 2,
    name: 'Art Coffee Deli',
    place: 'Pingtung City',
    imageUrl: 'images/singleFood/artCoffeeDeli/cafeSnacks.jpg',
  ),
  const FoodLocation(
    id: 3,
    name: 'Chuyuan Ramen',
    place: 'Sanchong District',
    imageUrl: 'images/singleFood/chuyuanRamen/pulledNoodle.jpg',
  ),
  const FoodLocation(
    id: 4,
    name: 'NiNôo Café (NiNoo)',
    place: 'Luodong Town',
    imageUrl: 'images/singleFood/niNoo/basqueCake.jpg',
  ),
  const FoodLocation(
    id: 5,
    name: 'Nonsense stinky tofu',
    place: 'Wanhua District',
    imageUrl: 'images/singleFood/nonsense/stinkyTofu.jpg',
  ),
  const FoodLocation(
    id: 6,
    name: 'Vegetarian Food',
    place: 'Zuoying District',
    imageUrl: 'images/singleFood/vegetarian/classicVegetarian.jpg',
  ),
  const FoodLocation(
    id: 7,
    name: 'Wind Volcano Forest',
    place: 'Sanchong District',
    imageUrl: 'images/singleFood/windVolcanoForest/complexCatering.jpg',
  ),
];

// 顯示帶有文字和靜態圖片的清單項目 (每一個項目外觀的部分)
@immutable
class FoodLocationListItem extends StatefulWidget {
  FoodLocationListItem({
    super.key,
    required this.imageUrl, // 圖片網址
    required this.name, // 食物名稱
    required this.country, // 地點
    required this.id,
  });

  final String imageUrl;
  final String name;
  final String country;
  final int id;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  State<StatefulWidget> createState() => _FoodLocationListItemState();
}

class _FoodLocationListItemState extends State<FoodLocationListItem> {
  late Future _initializePictureFuture;

  Future _initLoading() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();

    _initializePictureFuture = _initLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 18.h),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: InkWell(
              onTap: () {
                print(widget.name);
                // (目前只寫三個食物品項的介面)
                if (widget.id == 1) {
                  Navigator.of(context).pushNamed('peanut_tofu_page');
                } else if (widget.id == 2) {
                  Navigator.of(context).pushNamed('art_coffee_page');
                } else if (widget.id == 5) {
                  Navigator.of(context).pushNamed('sinkty_tofu_page');
                }
              },
              child: Stack(
                children: [
                  Center(
                    child: FutureBuilder(
                      future: _initializePictureFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return _buildParallaxBackground(context);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  _buildGradient(),
                  _buildTitleAndSubtitle(),
                ],
              ),
            )),
      ),
    );
  }

  // 圖片
  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: widget._backgroundImageKey,
      ),
      children: <Widget>[
        Image.asset(
          widget.imageUrl,
          key: widget._backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  // 每個方塊的前景 (有點漸層的效果)
  Widget _buildGradient() {
    // fill 為直接置中
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  // 每個項目的文字部分
  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.country,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

// FlowDelegate 為控制流程 (flow) 佈局外觀的委託
class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  // 對於子 Widget 的限制大小
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      // 而圖片的寬度需與 Flow Widget 的寬度完全一致。
      width: constraints.maxWidth,
    );
  }

  // 覆蓋來繪製流 (Flow) 的子 Widget
  // 這邊計算列表項目在其祖先 (原本的) Scrollable 中的像素位置
  // (主要就是這段來產生滑動圖片的視覺差的)
  @override
  void paintChildren(FlowPaintingContext context) {
    // 計算此列表項在視窗內的位置
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // 決定此清單項目在可捲動區域內的百分比位置
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // 根據滾動百分比計算背景的垂直對齊方式
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // 將背景對齊轉換為像素偏移，以便進行繪畫
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // 開始繪製背景
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  // 回傳是與否來決定應該要不要重畫 (Repaint)
  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
