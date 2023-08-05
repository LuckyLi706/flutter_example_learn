import 'dart:io';

/// @Classname platform_util
/// @Date 2023/8/5 13:06
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 平台工具类
class PlatformUtil {
  static bool isPC() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
