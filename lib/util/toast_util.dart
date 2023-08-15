import 'package:flutter/material.dart';
import 'package:flutter_example_learn/util/platform_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/14 18:38
/// @Description 吐司工具类
class ToastUtil {
  static Future<bool?> showToast(String message) async {
    if (PlatformUtil.isPC()) {
      return null;
    }
    return await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
