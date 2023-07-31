import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/7/31 9:50
/// @Description
class StaticRouteTestPage extends StatefulWidget {
  const StaticRouteTestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StaticRouteTestPageState();
  }
}

class _StaticRouteTestPageState extends BasePageState<StaticRouteTestPage> {
  @override
  Widget initWidget() {
    return SizedBox(
      width: ScreenUtil.screenWidth(),
      height: ScreenUtil.screenHeight(),
      child: Center(
        child: Text(_getText()),
      ),
    );
  }

  @override
  bool isNeedBasicWidget() {
    return false;
  }

  @override
  String appBarTitle() {
    return '静态路由测试页面';
  }

  @override
  Widget? appLeft() {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    if (index != null && index == 4) {
      return InkWell(
        child: const Icon(Icons.chevron_left_rounded),
        onTap: () {
          Navigator.pop(context, '我是从上个页面返回给你的');
        },
      );
    }
    return null;
  }

  ///获取参数
  String _getText() {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    if (index == null) {
      return '';
    } else if (index == 0) {
      return '我是使用pushName传过来的值,我是默认模式';
    } else if (index == 1) {
      return '我是使用pushReplacementNamed传过来的值,我会把上个页面给替换掉';
    } else if (index == 2) {
      return '我是使用pushNamedAndRemoveUntil传过来的值,我可以让之前多个页面退出，直到某个页面为止';
    } else if (index == 3) {
      return '我是使用popAndPushNamed传过来的值,效果和pushReplacementNamed一致';
    } else if (index == 4) {
      return '我是来测试pop的';
    }
    return '';
  }
}
