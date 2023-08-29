import 'package:flutter/material.dart';

import 'bottom_bar_page_test.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/28 10:43
/// @Description
class BottomBarPageTwo extends StatefulWidget {
  const BottomBarPageTwo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomBarPageTwoState();
  }
}

class _BottomBarPageTwoState extends State<BottomBarPageTwo> {
  final PageController pageController = PageController();
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搭配PageView'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutQuart);
            //你也可以选择你想要的动画方式和时间
            setState(() {
              currentPage = index;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: '书籍', icon: Icon(Icons.book)),
            BottomNavigationBarItem(
                label: '我的', icon: Icon(Icons.perm_identity)),
          ]),
      body: PageView(
        physics: const ClampingScrollPhysics(),
        controller: pageController,
        onPageChanged: (int index) {
          currentPage = index;
          setState(() {});
        },
        children: pageList,
      ),
    );
  }
}
