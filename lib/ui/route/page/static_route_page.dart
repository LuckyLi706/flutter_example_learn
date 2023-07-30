import 'package:flutter/cupertino.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';

/// @Classname static_route
/// @Date 2023/7/30 23:04
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description TODO
class StaticRoutePage extends StatefulWidget {
  const StaticRoutePage({super.key});

  @override
  State<StaticRoutePage> createState() {
    return _StaticRoutePageState();
  }
}

class _StaticRoutePageState extends BasePageState<StaticRoutePage> {
  @override
  Widget initWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [CommonButton('pushNamed', () {})],
    );
  }

  @override
  String appBarTitle() {
    return '静态路由';
  }
}
