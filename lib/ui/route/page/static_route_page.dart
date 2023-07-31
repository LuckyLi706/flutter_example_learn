import 'package:flutter/cupertino.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';

/// @Classname static_route
/// @Date 2023/7/30 23:04
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description TODO
class StaticRoutePage extends StatefulWidget {
  const StaticRoutePage({super.key});

  @override
  State<StaticRoutePage> createState() {
    return _StaticRoutePageState();
  }
}

class _StaticRoutePageState extends BasePageState<StaticRoutePage> {
  @override
  Widget initWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonButton('pushNamed', () {
          Navigator.pushNamed(context, RouteHelper.staticRouteTestPage,
              arguments: 0);
        }),
        CommonButton('pushReplacementNamed', () {
          Navigator.pushReplacementNamed(
              context, RouteHelper.staticRouteTestPage,
              arguments: 1);
        }),
        CommonButton('pushNamedAndRemoveUntil', () {
          /// pushNamedAndRemoveUntil
          /// 1. 如果给predicate参数传递一个方法，方法的返回值是false，那么删除新页面之前的所有路由。
          /// 2. 如果给predicate参数传递一个方法，方法的返回值为true，那么新页面之前的路由保持不变。
          /// 3. 如果给predicate参数传递的是ModalRoute.withName指定的一个命名路由名称，那么新页面和该指定的路由名称之间的路由全部删除。
          Navigator.pushNamedAndRemoveUntil(
              context,
              RouteHelper.staticRouteTestPage,

              /// 当前的跳转到新路由，并且会让主页路由和新路由之间的路由都删除
              ModalRoute.withName(RouteHelper.homePage),
              arguments: 2);
        }),

        /// popAndPushNamed与pushReplacementNamed效果一致，调用了popAndPushNamed方法，转换页面就有了动画效果，先pop当前页面，然后再push
        CommonButton('popAndPushNamed', () {
          Navigator.popAndPushNamed(context, RouteHelper.staticRouteTestPage,
              arguments: 3);
        }),
        CommonButton('pop返回数据', () async {
          dynamic result = await Navigator.pushNamed(
              context, RouteHelper.staticRouteTestPage,
              arguments: 4);
          print(result);
        }),
      ],
    );
  }

  @override
  String appBarTitle() {
    return '静态路由';
  }
}
