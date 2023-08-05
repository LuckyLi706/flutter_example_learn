import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/7/31 9:50
/// @Description 路由测试页面
class RouteTestPage extends StatefulWidget {
  final int? index; //动态注册传过来

  const RouteTestPage({super.key, this.index});

  @override
  State<RouteTestPage> createState() {
    return _RouteTestPageState();
  }
}

class _RouteTestPageState extends BasePageState<RouteTestPage> {
  @override
  Widget initWidget() {
    return SizedBox(
      width: ScreenUtil.screenWidth(),
      height: ScreenUtil.screenHeight(),
      child: Center(
        child: Column(
          children: [
            CommonButton('测试pop', () {
              Navigator.pop(context, '我是从上个页面返回给你的');
            }),
            CommonButton('测试popUtil到主页面', () {
              Navigator.popUntil(
                  context, ModalRoute.withName(RouteHelper.homePage));
            }),
            CommonText(_getText())
          ],
        ),
      ),
    );
  }

  @override
  bool isNeedBasicWidget() {
    return false;
  }

  @override
  String appBarTitle() {
    if (widget.index == null) {
      return '静态路由测试页面';
    }
    return '动态路由测试页面';
  }

  // @override
  // Widget? appLeft() {
  //   int? index = ModalRoute.of(context)?.settings.arguments as int?;
  //   if (index != null && index == 4) {
  //     return InkWell(
  //       child: const Icon(Icons.chevron_left_rounded),
  //       onTap: () {
  //         Navigator.pop(context, '我是从上个页面返回给你的');
  //       },
  //     );
  //   }
  //   return null;
  // }

  ///获取参数
  String _getText() {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    if (index == null && widget.index == null) {
      return '';
    } else if (index == 0) {
      return '我是使用pushName传过来的值,我是默认模式';
    } else if (index == 1) {
      return '我是使用pushReplacementNamed传过来的值,我会把上个页面给替换掉';
    } else if (index == 2) {
      return '我是使用pushNamedAndRemoveUntil传过来的值,我可以让之前多个页面退出，直到某个页面为止';
    } else if (index == 3) {
      return '我是使用popAndPushNamed传过来的值,效果和pushReplacementNamed一致，但是我有pop和push的动作';
    } else if (index == 4) {
      return '我是来测试pop的';
    } else if (widget.index == 5) {
      return '我是使用push传过来的值,我是默认模式';
    } else if (widget.index == 6) {
      return '我是使用pushReplacement传过来的值,我会把上个页面给替换掉';
    } else if (widget.index == 7) {
      return '我是使用pushAndRemoveUntil传过来的值,我可以让之前多个页面退出，直到某个页面为止';
    }
    return '';
  }
}
