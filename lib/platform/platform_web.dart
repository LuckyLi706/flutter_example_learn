import 'package:flutter_example_learn/platform/platform_diff.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/24 11:10
/// @Description Web端导入的文件
PlatformDiff createDiffPlatform() => PlatformWeb();

class PlatformWeb implements PlatformDiff {

  ///Web端不支持就写个空实现
  @override
  void backgroundIsolateInit(dynamic token) {}
}
