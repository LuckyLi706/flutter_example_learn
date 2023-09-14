import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_stateless_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/12 10:59
/// @Description  Stack
class StackPage extends BaseStatelessPage {
  const StackPage({super.key});

  @override
  String appBarTitle() {
    return 'Stack';
  }

  @override
  Widget initWidget() {
    return UnconstrainedBox(
      alignment: Alignment.topLeft,
      child: Container(
        width: 350,
        height: 350,
        color: Colors.black,
        child: Stack(
          ///如何确定没有使用 Position 包裹的子组件的大小，
          ///StackFit.loose：子组件宽松取值，可以从 min 到 max。使用该属性那整个Stack的大小会受到非Position包裹子组件的影响，同时受到外层的布局约束，Position里面大小不会使整个Stack变大
          ///StackFit.expand：子组件的大小和父组件一样大  使用此属性，除了Position包裹的都会铺满整个区域，在Position里面去设置组件子组件大小
          ///StackFit.passthrough：不改变子组件约束条件
          fit: StackFit.loose,

          ///如果不设置Stack的宽高限制，alignment不起作用,Stack是依据子组件的宽高来限制当前的宽高
          ///必须在外部设置Stack的宽高限制，然后alignment才起作用，只会对非Position的子组件起作用
          alignment: Alignment.center,

          ///使用可以是超过边界的进行分割
          clipBehavior: Clip.none,
          children: [
            ///单独使用这个Position，使用StackFit.expand属性，Stack会占满外层Container的大小
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.pink,
              ),
            ),

            ///Alignment(0, 0) 该属性分为 x 轴跟 y轴，范围值都是 -1到 1 之间；
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),

            ///使用StackFit.expand属性这个会撑满，其他都看不到了
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  @override
  bool isNeedBasicWidget() {
    return true;
  }
}
