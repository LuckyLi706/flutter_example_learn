import 'package:flutter/cupertino.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/21 11:12
/// @Description 头部导航栏的测试页面
class TabBarTestPage extends StatefulWidget {
  final int pageIndex;

  const TabBarTestPage({super.key, required this.pageIndex});

  @override
  State<StatefulWidget> createState() {
    return _TabBarTestPageState();
  }
}

class _TabBarTestPageState extends State<TabBarTestPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.pageIndex.toString()),
    );
  }
}
