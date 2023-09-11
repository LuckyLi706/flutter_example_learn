import 'package:flutter/material.dart';

/// @Classname proxy_provider_model
/// @Date 2023/9/10 19:40
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description ProxyProvider的model

class ProxyProviderModel extends ChangeNotifier {
  String _name = 'hello';

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }
}

class ProxyProviderNewModel {
  String name;

  ProxyProviderNewModel(this.name);

  String printStr() {
    return name;
  }
}

class ProxyNotifierProviderNewModel extends ChangeNotifier {
  String _name = '';

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String printStr() {
    return name;
  }
}
