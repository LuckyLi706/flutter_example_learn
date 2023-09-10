import 'package:flutter/material.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/6 19:27
/// @Description Selector的model
class ProviderSelectorModel extends ChangeNotifier {
  List<SingleModel> _singleModel = List.generate(5, (index) => SingleModel('SingleModel$index', false));

  List<SingleModel> get singleModel => _singleModel;

  set singleModel(List<SingleModel> value) {
    _singleModel = value;
    notifyListeners();
  }

  void updateSingle(int index) {
    _singleModel[index] = SingleModel(_singleModel[index].name, !_singleModel[index].isCheck);
    notifyListeners();
  }
}

class SingleModel {
  String name;
  bool isCheck;

  SingleModel(this.name, this.isCheck);
}
