import 'package:flutter/material.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/routes/new_route_observer.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/ui/main/page/main_page.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_locale_notifier.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_theme_notifier.dart';
import 'package:flutter_example_learn/util/platform_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPlatform();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChangeThemeNotifier()),
      ChangeNotifierProvider(create: (_) => ChangeLocaleNotifier()),
    ],
    child: const MyApp(),
  ));
}

///初始化平台配置
Future<void> _initPlatform() async {
  if (PlatformUtil.isPC()) {
    // Must add this line.
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      skipTaskbar: false,

      ///屏幕大小
      center: true,

      ///居中
      titleBarStyle: TitleBarStyle.hidden,

      ///隐藏顶部的titleBar
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
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

      ///监听路由的动作
      navigatorObservers: [NewRouteObserver()],

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

      /// 安卓显示在任务列表中的名字（多语言不需要用这个）
      ///title: Constants.title,
      onGenerateTitle: (context) {
        ///国家化时候的回调，内容和上面的title一样
        return S.of(context).app_title;
      },

      /// 安卓显示在任务列表中app bar的颜色
      // color: Colors.yellow,
      theme: Provider.of<ChangeThemeNotifier>(context).themeData,

      ///国际化
      locale: Provider.of<ChangeLocaleNotifier>(context).locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,

      ///localeResolutionCallback 负责在 App 启动和用户改变设备语言的时候确定语言环境。
      localeResolutionCallback: (locale, supportedLocales) {
        // 如果语言是英语
        if (locale?.languageCode == 'en') {
          //注意大小写，返回美国英语
          return const Locale('en', 'US');
        } else {
          return locale;
        }
      },
      // home: const MaterialAppPage(),
    );
  }
}
