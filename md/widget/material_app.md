# MaterialApp

```dart
const MaterialApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    Map<String, WidgetBuilder> this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    List<NavigatorObserver> this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    @Deprecated(
      'Remove this parameter as it is now ignored. '
      'MaterialApp never introduces its own MediaQuery; the View widget takes care of that. '
      'This feature was deprecated after v3.7.0-29.0.pre.'
    )
    this.useInheritedMediaQuery = false,
  })
```

## navigatorKey

`navigatorKey` 相当于 `Navigator.of(context)` ，如果应用程序想实现无 `context` 跳转，那么可以通过设置该`key`, 通过 `navigatorKey.currentState.overlay.context` 获取全局`context`。

```dart
///定义
static final GlobalKey<NavigatorState> navigatorGlobalKey = GlobalKey();

///使用
navigatorKey:navigatorGlobalKey
    
///获取屏幕长宽
///屏幕的高度
static double screenHeight() {
    return MediaQuery.of(Constants.navigatorGlobalKey.currentContext!)
        .size
        .height;
}

///屏幕的宽度
static double screenWidth() {
    return MediaQuery.of(Constants.navigatorGlobalKey.currentContext!)
        .size
        .width;
}
```

## scaffoldMessengerKey

scaffoldMessengerKey 主要是管理后代的 Scaffolds，可以实现无 context 调用 snack bars。（暂时未用到）

```dart
///定义
static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerGlobalKey =
      GlobalKey();

///使用
scaffoldMessengerKey: Constants.scaffoldMessengerGlobalKey,
```

## home

设置第一个显示的页面，如果和initialRoute同时使用，如果initialRoute是'/'，则只显示home，如果initialRoute不是'/'，则会先显示home，然后显示'/'，不推荐同时使用。

## routes

静态路由表，静态路由使用。可以单独使用，单独使用的时候必须有'/'路径，一般配合initialRoute使用。

```dart
///定义
static const String homePage = '/';
static const String materialAppPage = '/materialApp';
static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const MainPage(),
    materialAppPage: (context) => const MaterialAppPage(),
};

///使用
routes: RouteHelper.routes
```

## initialRoute

+ [官网解释](https://api.flutter.dev/flutter/material/MaterialApp/initialRoute.html)

如果你只使用了initialRoute参数，并且静态路由表中没有'/'路径，会报错。如果有'/'路径，但是initialRoute配置的不是'/'路径，那么将会先执行'/'路径的路由，然后再执行当前initialRoute的路由，可以配合onGenerateInitialRoutes参数改变默认路由。

## onGenerateRoute

监听和拦截静态路由，也可以处理没找到静态路由的情况

```dart
///定义
static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    ///可以通过settings里面的name属性来获取到静态路由的key,然后进行不同操作
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (name == null || routes[name] == null) {
          //name = notFoundPath;
        }
        Widget widget = routes[name!]!(context);
        return widget;
      },
    );
  }

///使用
onGenerateRoute: onGenerateRoute
```

## onGenerateInitialRoutes

用于拦截静态路由的初始化路由。

```dart
onGenerateInitialRoutes: (initialRoute) {
   ///可以根据initialRoute参数的路由名字来拦截来打破一定会进入'/'路由的问题
   return [
          MaterialPageRoute(builder: (_) => const MainPage()),
        ];
},
```

## onUnknownRoute

找不到路由的回调，如果在onGenerateRoute中处理了并且不返回null，则其不会回调。

```dart
///拦截静态注册表
static Route? onGenerateRoute<T extends Object>(RouteSettings settings) {
    if (settings.name == null || routes[settings.name] == null) {
      return null;   ///对其中不存在的路由没有处理，直接返回null，则会回调onUnknownRoute方法
    }
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
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

///使用
onUnknownRoute: unKnownRoute
```

## navigatorObservers

监听路由的
