import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';

/// @Classname main_dart
/// @Date 2023/7/29 21:29
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description TODO
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BasePageState<MainPage> {
  @override
  Widget initWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CommonText('Widget'),
        CommonButton('MaterialApp', () {
          //RouteHelper.push(const MaterialAppPage());
          Navigator.of(context).pushNamed(RouteHelper.materialAppPage);
        }),
        const CommonText('Route'),
        CommonButton('静态路由', () {
          //RouteHelper.push(const MaterialAppPage());
          Navigator.of(context).pushNamed(RouteHelper.staticRoutePage);
        }),
        CommonButton('动态路由', () {
          //RouteHelper.push(const MaterialAppPage());
          Navigator.of(context).pushNamed('222', arguments: {'222': '222'});
        }),
      ],
    );
  }

  @override
  String appBarTitle() {
    return '主页';
  }
}
