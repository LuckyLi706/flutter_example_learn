import 'package:flutter/cupertino.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Classname common_text
/// @Date 2023/7/30 11:52
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description TODO
class CommonText extends StatelessWidget {
  final String text;

  const CommonText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth(),
      margin: const EdgeInsets.all(5),
      child: Text(text),
    );
  }
}
