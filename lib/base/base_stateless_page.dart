import 'package:flutter/material.dart';
import 'package:flutter_example_learn/common/widget/common_pc_bar.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_theme_notifier.dart';
import 'package:flutter_example_learn/util/platform_util.dart';
import 'package:flutter_example_learn/util/screen_util.dart';
import 'package:provider/provider.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/11 15:38
/// @Description
abstract class BaseStatelessPage extends StatelessWidget {
  const BaseStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
        appBar: PlatformUtil.isPC()
            ? _pcBarWidget()
            : isNeedAppBar()
                ? appBar()
                : null,
        body: isNeedBasicWidget()
            ? SizedBox(width: ScreenUtil.screenWidth(), height: ScreenUtil.screenHeight(), child: initWidget())
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
              title: Text(S.of(Constants.navigatorGlobalKey.currentContext!).app_title),
              backgroundColor: Provider.of<ChangeThemeNotifier>(Constants.navigatorGlobalKey.currentContext!)
                  .themeData
                  .colorScheme
                  .primary,
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
