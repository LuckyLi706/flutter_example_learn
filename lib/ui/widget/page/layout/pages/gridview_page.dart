import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_example_learn/base/base_stateless_page.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/14 16:05
/// @Description GridView
class GridViewPage extends BaseStatelessPage {
  const GridViewPage({super.key});

  @override
  Widget initWidget() {
    return Column(
      children: [
        ///各个方法的加载模式几乎和ListView一样
        const CommonText('GridView'),
        Expanded(
            child: GridView(
          ///SliverGridDelegateWithFixedCrossAxisCount表示每一行的列数是固定的
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            /// 一行有几个元素，会平分，默认宽和高一样，可以通过childAspectRatio属性设置
            crossAxisCount: 9,

            ///主轴方向的间距
            mainAxisSpacing: 20,

            ///次轴方向的间距
            crossAxisSpacing: 20,

            ///：如果你的子元素宽高比例不为1，那么你一定要设置childAspectRatio属性。childWidth/childHeight
            childAspectRatio: 1.5,
          ),
          children: List<Widget>.generate(10, (index) {
            return Container(
              color: Colors.red,
              child: Text('${index}'),
            );
          }),
        )),
        const CommonText('GridView.builder'),
        Expanded(
            child: GridView.builder(
          ///SliverGridDelegateWithFixedCrossAxisCount表示每一行的列数是固定的
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            /// 一行有几个元素，会平分，默认宽和高一样，可以通过childAspectRatio属性设置
            crossAxisCount: 9,

            ///主轴方向的间距
            mainAxisSpacing: 20,

            ///次轴方向的间距
            crossAxisSpacing: 20,

            ///：如果你的子元素宽高比例不为1，那么你一定要设置childAspectRatio属性。childWidth/childHeight
            childAspectRatio: 1.5,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return List<Widget>.generate(10, (index) {
              return Container(
                color: Colors.blue,
                child: Text('${index}'),
              );
            })[index];
          },
        )),
        const CommonText('GridView.extent'),
        Expanded(
          child: GridView.extent(
            /// 子元素在横轴上的最大长度
            maxCrossAxisExtent: 120.0,

            /// 子元素在横轴长度和主轴长度的比例
            childAspectRatio: 2.0,
            children: List<Widget>.generate(10, (index) {
              return Container(
                color: Colors.green,
                child: Text('${index}'),
              );
            }),
          ),
        ),
        const CommonText('GridView.count'),
        Expanded(
          child: GridView.count(
            /// 子元素在横轴长度和主轴长度的比例
            childAspectRatio: 2.0,

            /// 一行的最大个数
            crossAxisCount: 7,
            children: List<Widget>.generate(10, (index) {
              return Container(
                color: Colors.yellow,
                child: Text('${index}'),
              );
            }),
          ),
        ),
      ],
    );
  }
}
