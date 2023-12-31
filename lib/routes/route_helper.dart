import 'package:flutter/material.dart';
import 'package:flutter_example_learn/anim/route_anim.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/ui/main_page.dart';
import 'package:flutter_example_learn/ui/no_found_page.dart';
import 'package:flutter_example_learn/ui/route/page/route_animation_page.dart';
import 'package:flutter_example_learn/ui/route/page/route_animation_test_page.dart';
import 'package:flutter_example_learn/ui/route/page/route_page.dart';
import 'package:flutter_example_learn/ui/route/page/route_test_page.dart';
import 'package:flutter_example_learn/ui/widget/page/material_app_page.dart';

/// @Classname route_helper
/// @Date 2023/7/30 10:19
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 路由相关的帮助类
class RouteHelper {
  ///主页
  static const String homePage = '/';

  ///materialApp页面
  static const String materialAppPage = '/materialApp';

  ///路由页面
  static const String routePage = '/route';

  ///路由动画页面
  static const String routeAnimPage = '/routeAnim';

  ///路由动画测试页面
  static const String routeAnimTestPage = '/routeTestAnim';

  ///静态路由页面
  static const String staticRoutePage = '/staticRoute';

  ///静态路由测试页面
  static const String staticRouteTestPage = '/staticRoute/test';

  ///动态路由页面
  static const String dynamicRoutePage = '/dynamicRoute';

  ///404页面
  static const String noFoundPage = '/noFound';

  ///静态路由注册表
  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const MainPage(),
    materialAppPage: (context) => const MaterialAppPage(),
    routePage: (context) => const RoutePage(),
    routeAnimPage: (context) => const RouteAnimationPage(),
    routeAnimTestPage: (context) => const RouteAnimationTestPage(),
    staticRouteTestPage: (context) => const RouteTestPage(),
    noFoundPage: (context) => const NoFoundPage()
  };

  ///拦截静态注册表
  static Route? onGenerateRoute<T extends Object>(RouteSettings settings) {
    // return ScaleRoute(page: routes[settings.name!]!(Constants.navigatorGlobalKey.currentContext!),settings: settings);
    if (settings.name == null || routes[settings.name] == null) {
      return null;
    }
    if (settings.name == routeAnimTestPage) {
      return SlideRightRoute(page: const RouteAnimationTestPage());
    }
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (name == null || routes[name] == null) {
          //name = noFoundPage;
        }
        Widget widget = routes[name]!(context);
        return widget;
      },
    );
  }

  ///如果onGenerateRoute不对找不到的路由做处理，就会回调该方法。如果onGenerateRoute处理了，就不回掉该方法
  static Route unKnownRoute<T extends Object>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        return routes[noFoundPage]!(context);
      },
    );
  }

  static void push(Widget route) {
    Navigator.push(
      Constants.navigatorGlobalKey.currentContext!,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
