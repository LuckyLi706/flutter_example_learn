import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_stateless_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/11 15:36
/// @Description Wrap 流式布局
class WrapPage extends BaseStatelessPage {
  const WrapPage({super.key});

  @override
  Widget initWidget() {
    return Wrap(
      ///布局方式,设定主轴方向
      ///Axis.vertical 子控件垂直排列（尽可能多的占用垂直方向的空间，无论子Widget有多少，占用的高度等于最大高度，宽度取决于子Widget的高度之和）
      ///Axis.horizontal 子控件水平排列（尽可能多的占用水平方向的空间，无论子Widget有多少，占用的宽度等于最大宽度，高度取决于子Widget的高度之和）
      direction: Axis.vertical,

      ///主轴的排列方式
      alignment: WrapAlignment.center,

      ///次轴整体的排列方式
      ///如果主轴是垂直，除非给Wrap外面加个宽度限制，不然次轴的设置无效
      ///如果主轴是水平，除非给Wrap外面加个高度限制，不然次轴的设置无效
      runAlignment: WrapAlignment.spaceEvenly,

      ///次轴子控件的排列方式
      ///如果主轴是垂直，取决于次轴子控件的宽度，用当前排列方式子控件排列，比如当前次轴子Widget就会尾部对齐
      ///如果主轴是水平，取决于次轴子控件的高度，用当前排列方式子控件排列，比如当前次轴子Widget就会尾部对齐
      crossAxisAlignment: WrapCrossAlignment.end,

      /// 主轴方向间距,每个子空间的间距
      spacing: 8.0,

      ///不明白含义
      ///clipBehavior: Clip.hardEdge,

      /// 纵轴方向间距,
      runSpacing: 4.0,
      children: [
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.blue,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.yellow,
        ),
        Container(
          width: 60,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.green,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.pink,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.pink,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.pink,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.pink,
        ),
      ],
    );
  }

  @override
  String appBarTitle() {
    return 'Wrap';
  }
}
