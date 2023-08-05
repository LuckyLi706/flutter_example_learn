import 'package:flutter/material.dart';
import 'package:flutter_example_learn/constants.dart';

/// @Classname bar_util
/// @Date 2023/7/29 22:04
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 和屏幕相关的工具类
class ScreenUtil {
  ///状态栏的高度
  static double statusBarHeight() {
    return MediaQuery.of(Constants.navigatorGlobalKey.currentContext!)
        .padding
        .top;
  }

  /// appBar的高度
  static double appBarHeight() {
    return kToolbarHeight;
  }

  ///屏幕的高度
  static double screenHeight() {
    return MediaQuery.of(Constants.navigatorGlobalKey.currentContext!)
        .size
        .height;
  }

  ///屏幕的宽度
  static double screenWidth() {
    return MediaQuery.of(Constants.navigatorGlobalKey.currentContext!)
        .size
        .width;
  }
}
