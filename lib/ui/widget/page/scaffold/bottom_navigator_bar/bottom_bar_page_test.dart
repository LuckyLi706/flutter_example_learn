import 'package:flutter/material.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/bottom_navigator_bar/bottom_bar_page_one.dart';
import 'package:flutter_example_learn/util/route_util.dart';

import 'bottom_bar_page_two.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/28 10:43
/// @Description  底部导航栏的页面测试页
class BottomBarTestPage extends StatefulWidget {
  final int index;
  final bool? isShow;

  const BottomBarTestPage({required this.index, this.isShow = true, super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomBarPageState();
  }
}

class _BottomBarPageState extends State<BottomBarTestPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('${widget.index}'),
        ),
        Visibility(
          visible: widget.isShow!,
          child: Column(
            children: [
              CommonButton('自定义底部导航栏', () {
                RouteUtil.push(const BottomBarPageOne());
              }),
              CommonButton('搭配PageView', () {
                RouteUtil.push(const BottomBarPageTwo());
              })
            ],
          ),
        )
      ],
    );
  }
}
