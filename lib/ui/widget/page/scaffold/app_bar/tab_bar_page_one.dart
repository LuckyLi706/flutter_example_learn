import 'package:flutter/material.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/app_bar/tab_bar_test_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/21 11:07
/// @Description 实现顶部导航栏（直接在AppBar上）
class TabBarPageOne extends StatefulWidget {
  const TabBarPageOne({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPageOne> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const TabBar(
              tabs: <Widget>[
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
            ),
          ),
          body: const TabBarView(
            children: [
              TabBarTestPage(pageIndex: 1),
              TabBarTestPage(pageIndex: 2),
              TabBarTestPage(pageIndex: 3),
            ],
          ),
        ));
  }
}
