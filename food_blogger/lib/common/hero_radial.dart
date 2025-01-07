import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

// 方塊的內容樣式 (也可以放置片或圖示等等)
class ContainerBox extends StatelessWidget {
  const ContainerBox({
    super.key,
    this.onLongPress,
    this.onTap,
  });

  final VoidCallback? onLongPress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Image.asset(
          'images/homePage/avatar.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// 飛行時的剪裁動作
class RadialExpansion extends StatelessWidget {
  const RadialExpansion({
    super.key,
    required this.maxRadius,
    this.child,
  });

  final double maxRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // ClipOval 與 RadialExpansion Widget 的邊界相匹配，
    // 當 Hero 飛向新路線時，其邊界會根據 Hero 的邊界而改變，
    // 而 ClipOval 會依照邊界而剪裁成圓形或橢圓。
    return ClipOval(child: child);
  }
}

// 主要創建 Hero 的地方
class RadialExpansionDemo extends StatelessWidget {
  const RadialExpansionDemo({super.key});

  static double kMinRadius = 68.r;
  static double kMaxRadius = 168.r;

  // 自訂的飛行路徑 (飛行過程比較好看一點)
  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  // 目標頁面 (destination route) 的樣式。
  static Widget _buildPage(BuildContext context, String boxName) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        child: SizedBox(
          width: kMaxRadius * 2.0,
          height: kMaxRadius * 2.0,
          child: Hero(
            createRectTween: _createRectTween,
            tag: boxName,
            child: RadialExpansion(
              maxRadius: kMaxRadius,
              child: ContainerBox(
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 初始 Hero (source hero)。
  static Widget _buildHero(BuildContext context, String imageName) {
    return SizedBox(
        width: kMinRadius * 2,
        height: kMinRadius * 2,
        child: Hero(
          createRectTween: _createRectTween,
          tag: imageName,
          child: RadialExpansion(
            maxRadius: kMinRadius,
            child: ContainerBox(
              onLongPress: () {
                Navigator.of(context).push(
                  PageRouteBuilder<void>(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return _buildPage(context, imageName);
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }

  // 初始頁面 (source route)。
  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;

    return Container(
      child: _buildHero(context, 'kai'),
    );
  }
}
