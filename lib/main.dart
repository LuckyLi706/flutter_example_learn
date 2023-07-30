import 'package:flutter/material.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/routes/new_route_observer.dart';
import 'package:flutter_example_learn/routes/route_helper.dart';
import 'package:flutter_example_learn/ui/main/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Constants.navigatorGlobalKey,
      scaffoldMessengerKey: Constants.scaffoldMessengerGlobalKey,
      title: 'Flutter Demo',
      initialRoute: RouteHelper.homePage,
      onGenerateRoute: RouteHelper.onGenerateRoute,
      onUnknownRoute: RouteHelper.unKnownRoute,
      onGenerateInitialRoutes: (initialRoute) {
        return [
          //MaterialPageRoute(builder: (_) => const MaterialAppPage()),
          MaterialPageRoute(builder: (_) => const MainPage()),
        ];
      },
      navigatorObservers: [NewRouteObserver()],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MaterialAppPage(),
    );
  }
}
