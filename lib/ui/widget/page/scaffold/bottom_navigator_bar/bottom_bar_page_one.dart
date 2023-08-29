import 'package:flutter/material.dart';

import 'bottom_bar_page_test.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/28 10:43
/// @Description
class BottomBarPageOne extends StatefulWidget {
  const BottomBarPageOne({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomBarPageOneState();
  }
}

class _BottomBarPageOneState extends State<BottomBarPageOne> {
  int currentPage = 1;
  List<Widget> pageList = const [
    BottomBarTestPage(
      isShow: false,
      index: 1,
    ),
    BottomBarTestPage(
      isShow: false,
      index: 2,
    ),
    BottomBarTestPage(
      isShow: false,
      index: 3,
    ),
    BottomBarTestPage(
      isShow: false,
      index: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('自定义'),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.cyan.shade400,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: currentPage == 1 ? Colors.red : Colors.white54,
              ),
              onPressed: () {
                currentPage = 1;
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: currentPage == 2 ? Colors.red : Colors.white54,
              ),
              onPressed: () {
                currentPage = 2;
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.print,
                color: currentPage == 3 ? Colors.red : Colors.white54,
              ),
              onPressed: () {
                currentPage = 3;
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.people,
                color: currentPage == 4 ? Colors.red : Colors.white54,
              ),
              onPressed: () {
                currentPage = 4;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      body: pageList[currentPage - 1],
    );
  }
}
