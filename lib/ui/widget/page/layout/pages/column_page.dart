import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_stateless_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/11 15:36
/// @Description Column
class ColumnPage extends BaseStatelessPage {
  const ColumnPage({super.key});

  @override
  Widget initWidget() {
    ///垂直布局
    ///组件会按照垂直方向排列
    return Column(
      ///mainAxisAlignment 垂直方向子控件的位置
      ///start 默认模式 起始位置在开始位置,每个子控件相连
      ///spaceBetween   将主轴空白位置进行均分，排列子元素，手尾没有空隙
      ///spaceAround  将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半
      ///spaceEvenly  将主轴空白区域均分，使各个子控件间距相等
      ///center  起始位置在中间位置,每个子控件相连
      ///end   起始位置在结束位置,每个子控件相连
      mainAxisAlignment: MainAxisAlignment.start,

      ///crossAxisAlignment 水平方向子控件的位置
      ///start 控件横向在开始位置
      ///center 默认模式 控件横向在中间位置
      ///end   控件横向在结束位置
      ///stretch   使子控件填满交叉轴
      ///baseline  将子控件放在交叉轴的上，并且与基线相匹配,需要配合textBaseline属性使用（不常用）
      crossAxisAlignment: CrossAxisAlignment.center,

      ///表示Column在主轴(垂直)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用垂直方向的空间，
      ///此时无论子 widgets 实际占用多少垂直空间，Column的高度始终等于垂直方向的最大宽度；
      ///而MainAxisSize.min表示尽可能少的占用垂直空间，当子组件没有占满垂直剩余空间，则Row的实际宽度等于所有子组件占用的垂直空间；
      mainAxisSize: MainAxisSize.min,

      ///表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
      ///默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。
      ///一般使用默认
      textDirection: TextDirection.ltr,

      ///表示（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
      ///VerticalDirection.up 子控件上下颠倒
      verticalDirection: VerticalDirection.down,

      ///不明白这个属性
      ///textBaseline: TextBaseline.alphabetic,
      children: [
        Container(
          color: Colors.red,
          height: 100,
        ),
        const SizedBox(
          height: 100,
          child: Text('1'),
        ),
        const Text('1'),
        const Text('2'),
        const Text('3'),
      ],
    );
  }

  @override
  bool isNeedBasicWidget() {
    return false;
  }

  @override
  String appBarTitle() {
    return 'Column';
  }
}
