import 'package:flutter/material.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/6 19:27
/// @Description
class ProviderNotifier  {
  String _text = '';

  String get text => _text;

  set text(String value) {
    _text = value;
   /// notifyListeners();
  }
}
