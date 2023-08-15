import 'package:flutter/material.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/15 17:43
/// @Description 动画

///滑动动画
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          ///构建对应的page
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,

          ///构建动画
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

///缩放动画
class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

///旋转过渡
class RotationRoute extends PageRouteBuilder {
  final Widget page;

  RotationRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
        );
}

///通过PageRoute来实现自定义动画
///无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，它们都继承自PageRoute类，
///而PageRouteBuilder其实只是PageRoute的一个包装，我们可以直接继承PageRoute类来实现自定义路由。
class FadeRoute extends PageRoute {
  FadeRoute(
      {required this.builder,
      this.transitionDuration = const Duration(microseconds: 300),
      this.maintainState = true,
      this.barrierColor,
      this.barrierLabel});

  final WidgetBuilder builder;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  final Duration transitionDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: builder(context));
  }
}
