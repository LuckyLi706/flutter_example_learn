import 'package:flutter/material.dart';
import 'package:flutter_example_learn/anim/route_anim.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/ui/route/page/route_animation_test_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/15 17:11
/// @Description
class RouteAnimationPage extends StatefulWidget {
  const RouteAnimationPage({super.key});

  @override
  State<RouteAnimationPage> createState() {
    return _RouteAnimationPageState();
  }
}

class _RouteAnimationPageState extends BasePageState<RouteAnimationPage> {
  @override
  Widget initWidget() {
    return Column(
      children: [
        CommonButton('滑动动画', () {
          Navigator.of(context).pushNamed(RouteHelper.routeAnimTestPage);
        }),
        CommonButton('缩放动画', () {
          Navigator.of(context)
              .push(ScaleRoute(page: const RouteAnimationTestPage()));
        }),
        CommonButton('旋转动画', () {
          Navigator.of(context)
              .push(RotationRoute(page: const RouteAnimationTestPage()));
        }),
        CommonButton('渐变动画', () {
          Navigator.of(context).push(FadeRoute(builder: (BuildContext context) {
            return const RouteAnimationTestPage();
          }));
        })
      ],
    );
  }

  @override
  String appBarTitle() {
    return S.of(context).route_animation;
  }
}
