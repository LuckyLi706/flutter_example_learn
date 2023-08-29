import 'package:flutter/services.dart';
import 'package:flutter_example_learn/platform/platform_diff.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/24 11:10
/// @Description 非web端导入的文件

PlatformDiff createDiffPlatform() => PlatformNotWeb();

class PlatformNotWeb implements PlatformDiff {
  @override
  void backgroundIsolateInit(dynamic token) {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  }
}
