import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// @Classname route_observe
/// @Date 2023/7/30 9:53
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description TODO
class NewRouteObserver extends RouteObserver<Route<dynamic>> {

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('didPush:route:${route.toString()},previousRoute:${previousRoute.toString()}');
    }
  }

  @override
  void didStopUserGesture() {

  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {

  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('didRemove:route:${route.toString()},previousRoute:${previousRoute.toString()}');
    }
  }

  @override
  void unsubscribe(RouteAware routeAware) {

  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (kDebugMode) {
      print('didReplace:newRoute:${newRoute.toString()},oldRoute:${oldRoute.toString()}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('didPop:route:${route.toString()},previousRoute:${previousRoute.toString()}');
    }
  }

  @override
  void subscribe(RouteAware routeAware, Route route) {

  }
}
