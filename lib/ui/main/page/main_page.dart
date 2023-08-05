import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';

/// @Classname main_dart
/// @Date 2023/7/29 21:29
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 主页
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
        CommonText(S.of(context).widget),
        CommonButton('MaterialApp', () {
          //RouteHelper.push(const MaterialAppPage());
          Navigator.of(context).pushNamed(RouteHelper.materialAppPage);
        }),
        CommonText(S.of(context).route),
        CommonButton(S.of(context).static_dynamic_route, () {
          //RouteHelper.push(const MaterialAppPage());
          Navigator.of(context).pushNamed(RouteHelper.routePage);
        }),
        // CommonButton('动态路由', () {
        //   //RouteHelper.push(const MaterialAppPage());
        //   Navigator.of(context).pushNamed('222', arguments: {'222': '222'});
        // }),
      ],
    );
  }

  @override
  String appBarTitle() {
    return S.of(context).main_page;
  }
}
