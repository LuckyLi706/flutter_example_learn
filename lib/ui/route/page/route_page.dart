import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/ui/route/page/route_test_page.dart';

/// @Classname static_route
/// @Date 2023/7/30 23:04
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 静态路由和动态路由页面
class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() {
    return _RoutePageState();
  }
}

class _RoutePageState extends BasePageState<RoutePage> {
  @override
  Widget initWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonText(S.of(context).static_route),
        CommonButton('pushNamed', () async {
          result = await Navigator.pushNamed(
              context, RouteHelper.staticRouteTestPage,
              arguments: 0);
          setState(() {});
        }),
        CommonButton('pushReplacementNamed', () async {
          result = await Navigator.pushReplacementNamed(
              context, RouteHelper.staticRouteTestPage,
              arguments: 1);
          setState(() {});
        }),
        CommonButton('pushNamedAndRemoveUntil', () async {
          /// pushNamedAndRemoveUntil
          /// 1. 如果给predicate参数传递一个方法，方法的返回值是false，那么删除新页面之前的所有路由。
          /// 2. 如果给predicate参数传递一个方法，方法的返回值为true，那么新页面之前的路由保持不变。
          /// 3. 如果给predicate参数传递的是ModalRoute.withName指定的一个命名路由名称，那么新页面和该指定的路由名称之间的路由全部删除。
          result = await Navigator.pushNamedAndRemoveUntil(
              context,
              RouteHelper.staticRouteTestPage,

              /// 当前的跳转到新路由，并且会让主页路由和新路由之间的路由都删除
              ModalRoute.withName(RouteHelper.homePage),
              arguments: 2);
          setState(() {});
        }),

        /// popAndPushNamed与pushReplacementNamed效果一致，调用了popAndPushNamed方法，转换页面就有了动画效果，先pop当前页面，然后再push
        CommonButton('popAndPushNamed', () async {
          result = await Navigator.popAndPushNamed(
              context, RouteHelper.staticRouteTestPage,
              arguments: 3);
          setState(() {});
        }),
        CommonText(S.of(context).dynamic_route),
        CommonButton('push', () async {
          result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const RouteTestPage(
              index: 5,
            );
          }));
          setState(() {});
        }),
        CommonButton('pushReplacement', () async {
          result = await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const RouteTestPage(
              index: 6,
            );
          }));
          setState(() {});
        }),
        CommonButton('pushAndRemoveUntil', () async {
          result = await Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return const RouteTestPage(
              index: 7,
            );

            /// 如果当前的都是动态注册的路由，需要再在路由的setting里面去配置对应的名字
          }), ModalRoute.withName(RouteHelper.homePage));
          setState(() {});
        }),
        Visibility(
          visible: result != null,
          child: Text('返回结果$result'),
        ),
      ],
    );
  }

  dynamic result;

  @override
  String appBarTitle() {
    return S.of(context).static_dynamic_route;
  }
}
