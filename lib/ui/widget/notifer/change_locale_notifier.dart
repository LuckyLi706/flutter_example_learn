
import 'package:flutter/material.dart';

/// @Classname change_locale_notifier
/// @Date 2023/8/5 21:24
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 语言切换
class ChangeLocaleNotifier extends ChangeNotifier {
  Locale _locale = const Locale('zh', 'CN');

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
