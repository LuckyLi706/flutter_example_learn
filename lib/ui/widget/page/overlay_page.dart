import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/generated/intl/messages_en.dart';
import 'package:flutter_example_learn/widget/overlay_toast.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/19 11:14
/// @Description Overlay
class OverlayPage extends StatefulWidget {
  const OverlayPage({super.key});

  @override
  State<OverlayPage> createState() {
    return _OverlayPageState();
  }
}

class _OverlayPageState extends BasePageState<OverlayPage> {
  @override
  Widget initWidget() {
    return Column(
      children: [
        CommonButton('OverlayToast', () {
          OverlayToast.showToast('我是个OverlayToast');
        })
      ],
    );
  }

  @override
  String appBarTitle() {
    return 'Overlay';
  }
}
