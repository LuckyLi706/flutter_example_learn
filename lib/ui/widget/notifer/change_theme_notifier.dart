import 'package:flutter/material.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/3 10:48
/// @Description 主题切换
class ChangeThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData(

      ///配置主题一般可以使用colorScheme参数，primaryColor不生效,也可以使用primarySwatch单独配置主题颜色
      ///colorScheme是多个颜色的集合，主题和次主题颜色等
      colorScheme: const ColorScheme.light(
        /// primary会影响appbar的颜色
        primary: Colors.blue,

        /// onPrimary会影响appbar的title字体颜色
        onPrimary: Colors.white,
      ),

      /// 设置页面背景色
      scaffoldBackgroundColor: Colors.white);

  ///ThemeData 可以设置各种各样的样式和主题，比如按钮样式，弹窗样式，以及其他组件的样式
  ///可以通过Theme.of(context).    来获取全局的样式
  ThemeData get themeData => _themeData;

  set themeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }
}
