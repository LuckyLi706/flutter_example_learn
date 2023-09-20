import 'package:flutter/material.dart';
import 'package:flutter_example_learn/ui/main_page.dart';

/// @Classname constants
/// @Date 2023/7/29 22:13
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 常量
class Constants {
  ///用于全局的上下文
  static final GlobalKey<NavigatorState> navigatorGlobalKey = GlobalKey();

  ///如果我们要使用一个全局的 context 用于操作 overlay ，那么就要求这个全局的 context 需要拥有一个父节点。
  static final GlobalKey<MainPageState> overlayKey = GlobalKey();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerGlobalKey = GlobalKey();
}
