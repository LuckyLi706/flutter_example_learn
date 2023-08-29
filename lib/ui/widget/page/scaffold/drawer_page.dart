import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/29 14:23
/// @Description  侧滑栏
class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() {
    return _DrawerPageState();
  }
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drawer'),
          leading: GestureDetector(
            child: const Icon(Icons.backspace),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        drawer: drawerWidget(),

        ///设置可拖拽区域宽度，在区域内才能拖拽出抽屉，设置0让其不支持拖拽
        drawerEdgeDragWidth: 20,

        ///拖拽的行为
        drawerDragStartBehavior: DragStartBehavior.start,

        ///左边侧滑栏是否可以滑动
        drawerEnableOpenDragGesture: false,
        body: Builder(builder: (context) {
          return Column(
            children: [
              CommonButton('打开左边', () {
                Scaffold.of(context).openDrawer();
              }),
              CommonButton('关闭左边', () {
                Scaffold.of(context).closeDrawer();
              }),
              CommonButton('打开右边', () {
                Scaffold.of(context).openEndDrawer();
              }),
              CommonButton('关闭右边', () {
                Scaffold.of(context).closeEndDrawer();
              })
            ],
          );
        }));
  }

  ///可以自己随意定制侧滑（可以不借助Drawer类和DrawerHeader）
  Widget drawerWidget() {
    return Drawer(
      width: 600,
      child: Column(
        children: [
          DrawerHeader(
              child: Container(
            color: Colors.red,
          )),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
