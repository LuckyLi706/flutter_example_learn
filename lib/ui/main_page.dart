import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/ui/open_library/pages/permission_page.dart';
import 'package:flutter_example_learn/ui/open_library/pages/provider_page.dart';
import 'package:flutter_example_learn/ui/other/pages/Isolate_page.dart';
import 'package:flutter_example_learn/ui/other/pages/future_and_stream_page.dart';
import 'package:flutter_example_learn/ui/widget/page/layout/pages/layout_page.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold_page.dart';
import 'package:flutter_example_learn/util/route_util.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(S
              .of(context)
              .widget),
          CommonButton('MaterialApp', () {
            //RouteHelper.push(const MaterialAppPage());
            Navigator.of(context).pushNamed(RouteHelper.materialAppPage);
          }),
          CommonButton('Scaffold', () {
            //RouteHelper.push(const MaterialAppPage());
            Navigator.of(context).push(MaterialPageRoute(builder: (route) => const ScaffoldPage()));
          }),
          CommonButton(S
              .of(context)
              .layout, () {
            RouteHelper.push(const LayoutPage());
          }),
          CommonText(S
              .of(context)
              .route),
          CommonButton(S
              .of(context)
              .static_dynamic_route, () {
            //RouteHelper.push(const MaterialAppPage());
            Navigator.of(context).pushNamed(RouteHelper.routePage);
          }),
          CommonButton(S
              .of(context)
              .route_animation, () {
            //RouteHelper.push(const MaterialAppPage());
            Navigator.of(context).pushNamed(RouteHelper.routeAnimPage);
          }),
          CommonText(S
              .of(context)
              .open_source_library),
          CommonButton('Permission_Handler', () {
            //RouteHelper.push(const MaterialAppPage());
            RouteUtil.push(const PermissionPage());
          }),
          CommonButton('Provider', () {
            //RouteHelper.push(const MaterialAppPage());
            RouteUtil.push(const ProviderPage());
          }),
          CommonText(S
              .of(context)
              .other),
          CommonButton(
            S
                .of(context)
                .multi_thread,
                () {
              Navigator.of(context).push(MaterialPageRoute(builder: (route) {
                return const IsolatePage();
              }));
            },
          ),
          CommonButton(S
              .of(context)
              .future_and_stream, () {
            RouteUtil.push(const FutureStreamPage());
          }),
        ],
      ),
    );
  }

  @override
  String appBarTitle() {
    return S
        .of(context)
        .main_page;
  }
}
