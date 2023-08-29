import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/util/platform_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/14 18:38
/// @Description 吐司工具类
class ToastUtil {
  static Future<bool?> showToast(String message) async {
    ///针对pc端没找到合适的库
    if (PlatformUtil.isPC()) {
      BotToast.showText(text: message);
      return true;
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
