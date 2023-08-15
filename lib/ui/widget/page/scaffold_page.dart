import 'package:flutter/material.dart';

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
      body: Center(
        child: Text(
          name,
        ),
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
        TextButton(onPressed: () {}, child: Text('2')),
        TextButton(onPressed: () {}, child: Text('2')),
        TextButton(onPressed: () {}, child: Text('2')),
      ],

      ///一组button所处的位置，默认在右下角
      persistentFooterAlignment: AlignmentDirectional.center,

      ///左边侧滑栏
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('R'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      ///右边侧划栏
      endDrawer: Drawer(),
    );
  }
}
