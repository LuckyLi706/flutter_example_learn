import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @Classname base_state
/// @Date 2023/7/30 10:03
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 提供一个状态类的基类
abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
        appBar: isNeedAppBar() ? appBar() : null,
        body: isNeedBasicWidget()
            ? SizedBox(
                width: MediaQuery.of(context).size.width, child: initWidget())
            : initWidget());
  }

  ///初始化数据
  void initData() {}

  ///初始化Widget
  @protected
  Widget initWidget();

  ///是否需要基础组件
  bool isNeedBasicWidget() {
    return true;
  }

  ///是否需要appBar 默认需要
  bool isNeedAppBar() {
    return true;
  }

  ///可以实现该方法来自定义appBar
  PreferredSizeWidget? appBar() {
    return AppBar(
      leading: appLeft(),
      automaticallyImplyLeading: appLeft() == null,
      elevation: 0,
      title: Text(appBarTitle()),
    );
  }

  ///appBar的颜色
  String appBarTitle() {
    return '';
  }

  ///返回
  Widget? appLeft() {
    return null;
  }
}
