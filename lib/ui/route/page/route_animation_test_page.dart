import 'package:flutter/widgets.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/15 17:39
/// @Description  路由动画
class RouteAnimationTestPage extends StatefulWidget {
  const RouteAnimationTestPage({super.key});

  @override
  State<RouteAnimationTestPage> createState() {
    return _RouteAnimPageState();
  }
}

class _RouteAnimPageState extends BasePageState<RouteAnimationTestPage> {
  @override
  Widget initWidget() {
    return Container();
  }

  @override
  String appBarTitle() {
    return '路由动画测试页面';
  }
}
