import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/app_bar_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/15 18:24
/// @Description  Scaffold详情
class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldPage();
  }
}

class _ScaffoldPage extends State<ScaffoldPage> {
  final String name = 'Scaffold';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///顶部的appbar
        appBar: AppBar(title: Text(name)),

        ///内容
        body: Column(
          children: [
            CommonButton('AppBar', () {
              Navigator.of(context).push(MaterialPageRoute(builder: (route) {
                return const AppBarPage();
              }));
            })
          ],
        ),

        ///展示悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),

        ///悬浮按钮展示的位置，FloatingActionButtonLocation是个抽象类，可以具体实现去做处理，StandardFabLocation实现了
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        ///悬浮按钮移动的动画，没具体研究
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

        ///在底部呈现一组button，显示于[bottomNavigationBar]之上，[body]之下
        persistentFooterButtons: [
          TextButton(onPressed: () {}, child: const Text('2')),
          TextButton(onPressed: () {}, child: const Text('2')),
          TextButton(onPressed: () {}, child: const Text('2')),
        ],

        ///一组button所处的位置，默认在右下角
        persistentFooterAlignment: AlignmentDirectional.center,

        ///左边侧滑栏
        //  drawer: const Drawer(),

        ///左边侧边栏改变的回调
        ///  onDrawerChanged: (onChange) {},

        ///右边侧边栏
        ///  endDrawer: const Drawer(),

        ///右边侧边栏改变的回调
        /// onEndDrawerChanged: (onChange) {},

        ///底部的导航栏
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: '添加'),
            BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: '闹钟')
          ],
        ),

        ///BottomSheet 作为组件直接使用的时候比较少,可以理解为展示在屏幕下方的一个组件
        ///持久在body下方，底部控件上方的控件
        // bottomSheet: BottomSheet(
        //   onClosing: () {
        //     print("closed");
        //   },
        //   builder: (context) {
        //     return Container(
        //       height: 300,
        //       color: Colors.yellow,
        //       alignment: Alignment.centerLeft,
        //       child: const Text("BottomSheet In Scaffold"),
        //     );
        //   },
        // ),

        ///内容的背景色，对于themeData的scaffoldBackgroundColor属性
        backgroundColor: Colors.white,

        ///默认为true，会重新绘制布局，将输入框顶上去，false的时候不会重新绘制，直接覆盖在页面上
        resizeToAvoidBottomInset: true,

        ///没明白这个熟悉的作用，默认为true，false的时候appbar和statusbar一样高
        primary: true,

        ///拖动行为方式，与  `drawer `配合使用，用于打开和关闭抽屉的拖动行为将在检测到拖动手势时开始。
        ///如果设置为 DragStartBehavior.down，它将在首次检测到 down 事件时开始。
        ///当拖动返回时会使用 `DragStartBehavior.down` 是有很明显的卡顿，建议使用 `DragStartBehavior.start`
        drawerDragStartBehavior: DragStartBehavior.start,

        ///控制body底部的可显示范围是否在bottomNavigationBar和persistentFooterButtons之上，
        ///如果设置为True则会直接显示到屏幕的底部，而不是bottomNavigationBar和persistentFooterButtons的上面。
        extendBody: false,

        ///更上面的类似，这个是控制是否是从屏幕顶部开始显示，而不是从AppBar下面开始显示。
        extendBodyBehindAppBar: false,

        ///	侧滑栏拉出来时，用来遮盖主页面的颜色
        drawerScrimColor: Colors.grey,

        ///侧滑栏拉出来的宽度
        drawerEdgeDragWidth: 20,

        ///左侧侧滑栏是否可以滑动
        drawerEnableOpenDragGesture: true,

        ///右侧侧滑栏是否可以滑动
        endDrawerEnableOpenDragGesture: true);
  }
}
