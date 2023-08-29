import 'package:flutter/material.dart';
import 'package:flutter_example_learn/constants.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/28 11:14
/// @Description  路由工具类
class RouteUtil {
  static void push(Widget widget) {
    Navigator.of(Constants.navigatorGlobalKey.currentContext!)
        .push(MaterialPageRoute(builder: (route) {
      return widget;
    }));
  }
}
