import 'package:flutter/material.dart';
import 'bottom_navigator_bar/bottom_bar_page_test.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/23 17:43
/// @Description 底部导航栏
class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() {
    return _BottomNavigationBarPageState();
  }
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 1;
  List<Widget> listWidget = const [
    BottomBarTestPage(
      index: 1,
    ),
    BottomBarTestPage(
      index: 2,
    ),
    BottomBarTestPage(
      index: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.ac_unit),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: '首页',
              icon: Icon(Icons.home),

              ///设置单个选中的图标颜色
              // activeIcon: Icon(
              //   Icons.home,
              //   color: Colors.red,
              // ),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(label: '书籍', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: '我的', icon: Icon(Icons.perm_identity)),
        ],

        ///点击事件，index对于tab
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        ///导航栏类型，当底部导航页面超过三个时，必须要添加type属性（BottomNavigationBarType.fixed），否则的话底部导航会全白，看不到效果
        //type: BottomNavigationBarType.fixed,

        ///当前选中的item
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,

        ///BarItem选中时颜色，和selectedItemColor不可同时存在
        //fixedColor: Colors.pink,

        ///整个底部导航栏的背景色
        //backgroundColor: Colors.grey,

        ///图标大小，默认为24
        ///iconSize: 18,

        ///BarItem选中时颜色，和fixedColor不可同时存在，是图标和文字的颜色
        selectedItemColor: Colors.yellow,

        ///BarItem未选中时颜色
        //unselectedItemColor: Colors.red,

        ///主要用于设置icon颜色,作用优先于unselectedItemColor
        // unselectedIconTheme: IconThemeData(color: Colors.orange),
        ///主要用于设置icon颜色,作用优先于selectedItemColor
        // selectedIconTheme: IconThemeData(color: Colors.cyanAccent),

        //mouseCursor: MouseCursor.defer,

        ///展示的模式
        /// spread 平分展示（默认）
        /// centered 居中模式
        /// linear 和spread的区别就是图标和文字是水平的。
        //landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      ),
      body: listWidget[currentIndex],
    );
  }
}
