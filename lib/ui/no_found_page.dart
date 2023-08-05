import 'package:flutter/cupertino.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';

/// @Classname no_found_page
/// @Date 2023/7/30 23:13
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 路由找不到的时候调用的页面
class NoFoundPage extends StatefulWidget {
  const NoFoundPage({super.key});

  @override
  State<NoFoundPage> createState() {
    return _NoFoundPageState();
  }
}

class _NoFoundPageState extends BasePageState<NoFoundPage> {
  @override
  Widget initWidget() {
    return const Center(
      child: CommonText('找不到页面啦！！！！'),
    );
  }

  @override
  String appBarTitle() {
    return '404页面';
  }
}
