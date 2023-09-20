import 'package:flutter/material.dart';
import 'package:flutter_example_learn/constants.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/19 14:11
/// @Description
class OverlayToast {
  /// late OverlayEntry overlayEntry;

  static Future<void> showToast(String message) {
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Container(
        width: ScreenUtil.screenWidth(),
        height: 200,
        color: Colors.transparent,
        child: Text(message),
      );
    });

    Overlay.of(Constants.overlayKey.currentState!.context).insert(overlayEntry);

    return Future.delayed(const Duration(seconds: 1), () {
      overlayEntry.remove();
    });
  }
}
