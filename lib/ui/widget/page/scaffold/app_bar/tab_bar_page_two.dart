import 'package:flutter/material.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/app_bar/tab_bar_test_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/21 11:07
/// @Description 实现顶部导航栏（直接在AppBar上）
class TabBarPageTwo extends StatefulWidget {
  const TabBarPageTwo({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPageTwo>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: const <Widget>[
            Tab(
              text: 'PageA',
            ),
            Tab(
              text: 'PageB',
            ),
            Tab(
              text: 'PageC',
            ),
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          TabBarTestPage(pageIndex: 1),
          TabBarTestPage(pageIndex: 2),
          TabBarTestPage(pageIndex: 3),
        ],
      ),
    );
  }
}
