import 'package:flutter/material.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Classname common_button
/// @Date 2023/7/30 11:38
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 自定义按钮
class CommonButton extends StatelessWidget {
  ///文本
  final String text;

  ///点击事件
  final Function onTap;

  ///按钮宽度
  final double buttonWidth;

  final Color backgroundColor;

  final double radius;

  const CommonButton(this.text, this.onTap,
      {super.key,
      this.buttonWidth = 0,
      this.backgroundColor = Colors.red,
      this.radius = 5});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      //INK可以实现装饰容器
      child: Ink(
        //用ink圆角矩形
        decoration: BoxDecoration(
          //背景
          color: backgroundColor,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          //设置四周边框
          //border: Border.all(width: 1, color: Colors.red),
        ),
        child: InkWell(
            //圆角设置,给水波纹也设置同样的圆角
            //如果这里不设置就会出现矩形的水波纹效果
            borderRadius: BorderRadius.circular(radius),
            //设置点击事件回调
            onTap: () {
              onTap();
            },
            child: Container(
              //设置 child 居中
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              width: buttonWidth == 0 ? ScreenUtil.screenWidth() : buttonWidth,
              child: Text(text),
            )),
      ),
    );
  }
}
