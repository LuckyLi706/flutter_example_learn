import 'package:flutter/cupertino.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';

/// @Classname material_app_page
/// @Date 2023/7/30 10:26
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description TODO
class MaterialAppPage extends StatefulWidget {
  const MaterialAppPage({super.key});

  @override
  State<MaterialAppPage> createState() {
    return _MaterialAppPage();
  }
}

class _MaterialAppPage extends BasePageState<MaterialAppPage> {
  @override
  Widget initWidget() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [CommonText(ModalRoute.of(context)!.settings.arguments.toString())],
    );
  }

  @override
  String appBarTitle() {
    return 'MaterialApp';
  }
}
