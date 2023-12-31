import 'package:flutter/material.dart';
import 'package:flutter_example_learn/common/widget/common_pc_bar.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/ui/main_page.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_theme_notifier.dart';
import 'package:flutter_example_learn/util/platform_util.dart';
import 'package:flutter_example_learn/util/screen_util.dart';
import 'package:provider/provider.dart';

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
        key: T is MainPage ? Constants.overlayKey : null,
        appBar: PlatformUtil.isPC()
            ? _pcBarWidget()
            : isNeedAppBar()
                ? appBar()
                : null,
        body: isNeedBasicWidget()
            ? SizedBox(width: MediaQuery.of(context).size.width, child: initWidget())
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

  ///pc端使用titleBar+appBar
  PreferredSizeWidget _pcBarWidget() {
    return PreferredSize(
        preferredSize: Size.fromHeight(kWindowCaptionHeight + ScreenUtil.appBarHeight()),
        child: Column(
          children: [
            CommonPCTitleBar(
              title: Text(S.of(context).app_title),
              backgroundColor: Provider.of<ChangeThemeNotifier>(context).themeData.colorScheme.primary,
            ),
            AppBar(
              leading: appLeft(),
              automaticallyImplyLeading: appLeft() == null,
              elevation: 0,
              title: Text(appBarTitle()),
            )
          ],
        ));
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
