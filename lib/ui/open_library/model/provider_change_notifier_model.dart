import 'package:flutter/material.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/6 19:27
/// @Description ChangeNotifierProvider的model
class ProviderChangeNotifierModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  set count(int value) {
    _count++;
    notifyListeners();
  }
}
