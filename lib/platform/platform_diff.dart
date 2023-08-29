import 'platform_not_web.dart' if (dart.library.html) 'platform_web.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/24 12:02
/// @Description 平台差异化接口（针对web和非web平台做区分）
abstract class PlatformDiff {
  factory PlatformDiff() => createDiffPlatform();

  void backgroundIsolateInit(dynamic token);
}
