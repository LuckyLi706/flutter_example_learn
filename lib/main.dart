import 'package:flutter/material.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/routes/new_route_observer.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/ui/main/page/main_page.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChangeThemeNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Constants.navigatorGlobalKey,
      scaffoldMessengerKey: Constants.scaffoldMessengerGlobalKey,
      initialRoute: RouteHelper.homePage,
      onGenerateRoute: RouteHelper.onGenerateRoute,
      onUnknownRoute: RouteHelper.unKnownRoute,

      /// onGenerateInitialRoutes 用于对初始化路由做不同页面的场景使用（配合静态路由使用）
      /// 比如启动页只有第一次弹出，后续直接跳到首页
      /// 那就使用initialRoute，靠参数控制，initialRoute会有根路径搜索，如果要打破这种规则，需要使用onGenerateInitialRoutes这个参数
      /// 根据onGenerateInitialRoutes中的initialRoute来动态判断要跳到哪个路由
      onGenerateInitialRoutes: (initialRoute) {
        return [
          MaterialPageRoute(builder: (_) => const MainPage()),
        ];
      },

      ///child相当于当前的页面，可以做一些全局操作
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // Do something when the user taps anywhere in the app
            print('222');
          },
          child: child,
        );
      },

      /// 安卓显示在任务列表中的名字
      title: 'Flutter Demo',
      onGenerateTitle: (context) {
        return 'Flutter Demo';
      },

      /// 安卓显示在任务列表中app bar的颜色
      // color: Colors.yellow,
      theme: Provider.of<ChangeThemeNotifier>(context).themeData,
      darkTheme: ThemeData.dark(),
      navigatorObservers: [NewRouteObserver()],
      // home: const MaterialAppPage(),
    );
  }
}
