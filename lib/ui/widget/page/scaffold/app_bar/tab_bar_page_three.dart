import 'package:flutter/material.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/app_bar/tab_bar_test_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/21 11:07
/// @Description 实现顶部导航栏（直接在AppBar上）
class TabBarPageThree extends StatefulWidget {
  const TabBarPageThree({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPageThree> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //指定tabbar个数
      length: 10,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              '发现',
              style: TextStyle(fontSize: 22, color: Color(0xff000000)),
            ),
            automaticallyImplyLeading: true,
            centerTitle: true,
            backgroundColor: const Color(0xffffffff),
            iconTheme: const IconThemeData(color: Colors.blue),
            elevation: 0,
            bottom: const TabBar(
              ///文字字体颜色
              labelColor: Color(0xff000000),
              //文字颜色
              labelStyle: TextStyle(fontSize: 19),

              ///未选择的文字字体颜色
              unselectedLabelColor: Color(0xff0000aa),

              ///未选择的文字样式，这个会导致字体抖动
              unselectedLabelStyle: TextStyle(fontSize: 13),

              ///指示器颜色
              indicatorColor: Color(0xff00BF00),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,

              ///是否支持滑动，默认为false，false的时候横向会占满屏幕
              isScrollable: false,

              tabs: <Widget>[
                Tab(
                  text: '推荐',
                ),
                Tab(
                  text: '丽人',
                ),
                Tab(
                  text: '旅行',
                ),
                Tab(
                  text: '电影',
                ),
                Tab(
                  text: '结婚',
                ),
                Tab(
                  text: '购物',
                ),
                Tab(
                  text: '教培',
                ),
                Tab(
                  text: '家装',
                ),
                Tab(
                  text: '亲子',
                ),
                Tab(
                  text: '亲子',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              TabBarTestPage(pageIndex: 1),
              TabBarTestPage(pageIndex: 2),
              TabBarTestPage(pageIndex: 3),
              TabBarTestPage(pageIndex: 4),
              TabBarTestPage(pageIndex: 5),
              TabBarTestPage(pageIndex: 6),
              TabBarTestPage(pageIndex: 7),
              TabBarTestPage(pageIndex: 8),
              TabBarTestPage(pageIndex: 9),
              TabBarTestPage(pageIndex: 10),
            ],
          )),
    );
  }
}
